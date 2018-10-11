package jdbc;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;


// DB 커넥션 풀을 준비하기 위한 컨텍스트 리스터 클래스

public class DBCPInitListener implements ServletContextListener {

	// 시작할 때 DB 커넥션 풀을 셋팅하도록 해보자
	// ServletContextListener 의 contextInitialized는 어플리케이션이 실행될 때
	// DB를 셋팅하기 위한 메소드이다
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		//서블릿 컨텍스트를 받고
		ServletContext sc = sce.getServletContext();
		
		// 서블릿 컨텍스를 통해서 init 파라미터를 받음(DB정보가 있는 properties)
		
		// web.xml에 init파라미터로 프로퍼티의 파일을 읽어옴
		// String poolConfigFile = sc.getInitParameter("poolConfigFile");
		// 이렇게만 하게 될 경우
		// /WEB-INF/dbConfig/db.properties 파일 위치만까지 받아옴
		
		// 하지만 파일주소로 파일을 읽어야함. 즉 실제 시스템상 주소를 받아야 함
		String configFile = sc.getInitParameter("poolConfigFile");
		String poolConfigFile = sc.getRealPath(sc.getInitParameter("poolConfigFile"));
		
		// 파일주소로 프로퍼티스 객체에 파일에 있는 데이터를 넣을 것임
		Properties prop =  new Properties();
//		System.out.println("configFile 주소 : " + configFile);
//		System.out.println("poolConfigFile 주소 : " + poolConfigFile);
				
		try {
			// db.properties에 적어논 아이들의 key값을 읽어올 수 있도록 셋팅한다 
			prop.load(new FileReader(poolConfigFile));
			
		} catch (FileNotFoundException e) {
			
			// 파일을 찾는데 발생한 익셉션
			// 다른 곳에서 처리
			throw new RuntimeException("Not Found poolConfigFile", e);
			
		} catch (IOException e) {
			
			// 파일을 읽는데 발생한 익셉션
			// 다른 곳에서 처리
			throw new RuntimeException("Fail To Read poolConfigFile", e);
		}
		
		
		
		// 메소드명 먼저 적고 메소드 생성방식
		
		// JDBC드라이버 로드
		loadJDBCDriver(prop);
		
		// 커넥션 풀 초기화
		initConnectionPool(prop);
		
	}

	
	
	// JDBC드라이버 로드
	private void loadJDBCDriver(Properties prop) {
		
		String driveClass = prop.getProperty("jdbcDriver"); // com.mysql.cj.jdbc.Driver
		
		try {
			Class.forName(driveClass);
			
		} catch (ClassNotFoundException e) {
		
			throw new RuntimeException("Fail To Load JDBC Driver", e);
			
		}
		
	}
	
	
	
	
	
	
	// 커넥션 풀 초기화
	private void initConnectionPool(Properties prop) {
		
		try {
		
		// DB접속 정보를 String 으로 받아봄
		// 유지보수를 쉽게하기 위해서
		String connectionUri = prop.getProperty("jdbcUri"); // jdbc:mysql://localhost:3306/rentproject?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=utf8
		String user = prop.getProperty("dbUser"); // root
		String password = prop.getProperty("dbPwd"); // mysql
		


		String poolingDriver = prop.getProperty("poolingDriver"); // org.apache.commons.dbcp2.PoolingDriver
		String poolName = prop.getProperty("poolName"); // rentproject
		
	
		
		// DB 접속정보를 인자로 넣고 커넥션을 만들어주는 커넥션 팩토리 객체를 생성
		ConnectionFactory connFactory = new DriverManagerConnectionFactory(connectionUri, user, password);
		
		
		// 풀에서 쓸수있는 커넥션을 만들어주는 팩토리에 커넥션 팩토리를 넣고 생성!
		PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connFactory, null);
		
		// 커넥션이 유효한지 체크하기 위한 쿼리를 지정
		// getProperty 첫번째 인자는 우리가 받아올 인자 파일에 정의되어 있는 값,
		// 두번째 인자는 없을 시 기본값으로 해줄 값
		poolableConnectionFactory.setValidationQuery(prop.getProperty("validationQuery", "select 1"));

		
		
		// 커넥션 풀의 설정 정보를 생성
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig<>();
		
		// 커넥션 풀의 설정 정보를 가지고 검사주기 세팅 = 5분
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
				
		// 풀에 보관된 커넥션이 유효한지 검사여부
		poolConfig.setTestWhileIdle(true);
				
		// 커넥션 최소 개수
		poolConfig.setMinIdle(Integer.parseInt(prop.getProperty("minIdle", "5")));
				
		// 커넥션 최대 개수
		poolConfig.setMaxIdle(Integer.parseInt(prop.getProperty("maxTotal", "50")));
		

		

		// 커넥션 풀 생성시 팩토리와 커넥션 설정을 받음
		GenericObjectPool<PoolableConnection> pool = new GenericObjectPool<>(poolableConnectionFactory, poolConfig);
		

		// poolableConnectionFactory에 생성한 커넥션 풀을 연결
		poolableConnectionFactory.setPool(pool);
		
		// 풀링 드라이버를 로드
		Class.forName(poolingDriver); // org.apache.commons.dbcp2.PoolingDriver
		PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
		
		
		// 생성한 커넥션 풀을 커넥션 풀 드라이버에 등록
		driver.registerPool(poolName, pool); // poolName = koitt
		
		}catch(ClassNotFoundException e) {
			
			throw new RuntimeException("Not Found poolingDriver Class", e);
			
		} catch (SQLException e) {
			
			throw new RuntimeException("Can not get Driver poolingDriver", e);
		}
		
	}













	@Override
	public void contextDestroyed(ServletContextEvent sce) {}
	
}

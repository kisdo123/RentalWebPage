package join;

import java.sql.Connection;
import java.sql.SQLException;

import main.exception.DuplicationException;
import jdbc.ConnectionProvider;
import dao.UserDao;
import join.User;

// 회원가입 처리하는 서비스
public class JoinService {

	// 싱글톤 패턴
	private static JoinService instance = new JoinService();

	public static JoinService getInstance() {
		return instance;
	}

	private JoinService() {
	}

	// 회원가입하는 로직을 구현

	// 입력되는 Form에 있는 데이터가 잘 들어왔는지 무결성 체크도 해야함
	// 그래서 Form에서 입력받은 데이터는 user가 아니라 joinRequest라는 객체로 받아서 처리할 예정
	public void join(JoinRequest joinReq) {
		
		UserDao userDao = UserDao.getInstance();
		
		try(Connection conn = ConnectionProvider.getConnection()){
			
			// 트랜잭션 처리로 로그인 아이디가 중복이 있는지 없는지 확인하여
			// 없으면 삽입, 있으면 예외를 발생시킴
			
			// 처음엔 트랜잭션을 막아놓고
			conn.setAutoCommit(false);
			
			try {
				
				User user = userDao.selectByLoginId(conn, joinReq.getId());
					
				if(user != null) {
					
					conn.rollback();
					
					throw new DuplicationException("아이디 중복");
					
				}
				
				// userDao의 쿼리문을 통해 DB에 회원정보를 insert하는 메소드를 실행한다
				userDao.insert(conn, 
						new User(
						joinReq.getName(),
						joinReq.getId(),
						joinReq.getPw(),
						joinReq.getPhone(),
						joinReq.getTeam(),
						joinReq.getBirth()
						));
					
				conn.commit();
					
				} catch (SQLException e) {
			
				conn.rollback();
				throw new RuntimeException(e);
				}
	
		}catch (SQLException e) {
			throw new RuntimeException(e);
			}
		}
	}


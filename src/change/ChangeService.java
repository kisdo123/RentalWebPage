package change;

import java.sql.Connection;
import java.sql.SQLException;

import dao.UserDao;
import jdbc.ConnectionProvider;
import join.User;
import main.exception.InvalidPasswordException;
import main.exception.UserNotFoundException;



public class ChangeService {

	// 비밀번호 및 회원정보를 변경하기 위한 비지니스 로직을 수행
	// 로그인 아이디, 현재 비번, 새 비번을 인자로 받고
	// 그것을 통해서 비번이 제대로 되었는지, 현재 있는 사용자인지 확인하고 
	// 로직을 수행한다 
	// 그외에 이름, 소속, 연락처도 받는다
	private static ChangeService instance = new ChangeService();
	
	public static ChangeService getInstance() {
		return instance;
	}
	
	private ChangeService() {}
	
	
	
	
	
	
	
	public void ChangeUserInfo(String id, String oldPw, String newPw, String name, String phone, String team) {
		
		UserDao userDao = UserDao.getInstance();
		
		try(Connection conn = ConnectionProvider.getConnection()){
			
			// user 객체를 받아오고
			// user 객체와 입력받은 비밀번호를 비교
			// 정상이면 update
			// 아니면 예외를 날리고 롤백		
			try {
			
				// 처음엔 트랜잭션을 막아놈
				conn.setAutoCommit(false);
			
				// user객체를 받아오고
				// 여기서 loginId는 AuthUser객체의 loginId
				User user = userDao.selectByLoginId(conn, id);
				
				// 없는 유저라면
				if(user == null) {
					
					// 예외처리를 던져줌
					throw new UserNotFoundException("유저가 존재하지 않습니다");
				}
				
				// 잘못된 비밀번호를 입력했다면
				if(!user.matchPassword(oldPw)) {
					
					// 예외처리를 던져줌
					throw new InvalidPasswordException("잘못된 비밀번호입니다");
					
				}
				
				
				
				// 정상적으로 비밀번호가 입력 되었다면
				// 업데이트에 보낼 객체의 비밀번호를 새로 넣어줌
				user.setPw(newPw);
				user.setName(name);
				user.setPhone(phone);
				user.setTeam(team);
				userDao.updateUserInfo(conn, user);
				conn.commit();
				
				
			// 이 트라이는 트랜잭션에 관한 예외처리
			}catch (SQLException e) {
				
				// 문제 발생시 롤백시킴
				conn.rollback();
				throw new RuntimeException(e);
				
			}
			
		// 이 트라이 캐치는 맨 위에 Connection부분에 대한 예외부분
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}
	}
		
		
		
}
	
	
	


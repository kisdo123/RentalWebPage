package login;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDao;
import jdbc.ConnectionProvider;
import join.User;
import main.exception.LoginFailException;


//사용자로부터 입력받은 데이터를 통해
//정보가 정확한지 또는 사용자가 존재하는지 확인!
public class LoginService {

	private static LoginService instance = new LoginService();
	
	public static LoginService getInstance() {
		return instance;
	}
	
	private LoginService() {}
	
	
	
	
	
	// 성공시 LoginUser객체를 반환시켜주는 메소드
	public LoginUser login(String id, String pw) throws SQLException {
		
		UserDao userDao = UserDao.getInstance();
		
		try(Connection conn = ConnectionProvider.getConnection()){
			
			// loginId를 통해 객체를 select해서 가져옴 (selectByLoginId메소드 사용)
			// 객체가 없다면 없는 사용자라고 알려주고 예외를 날림
			// 객체가 있다면 비밀번호를 비교
			User user = userDao.selectByLoginId(conn, id);
			
			
			// 사용자가 없다면(DB에서 loginId가 없을 때)
			if(user == null) {
				
				// 로그인했을 때 아이디가 존재하지 않으면 콘솔 창에 출력되는 부분
				throw new LoginFailException("없는 사용자");
				
			}
			
			
			// 비밀번호랑 아이디가 맞는지 확인
			// DB에서 받은 비밀번호와 입력받은 비밀번호와 같은지 비교
			if(!user.matchPassword(pw)) {
				
				// 로그인했을 때 비밀번호가 맞지 않으면 콘솔 창에 출력되는 부분
				throw new LoginFailException("비밀번호가 틀림");
			}
			

				
			// 사용자 인증 완료되었으니 auth객체를 반환
			return new LoginUser(
					user.getUserId(),
					user.getId(),
					user.getName(),
					user.getPw(),
					user.getPhone(),
					user.getTeam(),
					user.getBirth()
					);
		}
		
	}
}

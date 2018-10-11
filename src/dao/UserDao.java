package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import jdbc.ConnectionProvider;
import join.User;

public class UserDao {

	// 싱글톤 패턴
		private static UserDao instance = new UserDao();
		
		public static UserDao getInstance() {
			return instance;
		}
		
		private UserDao() {}
	
		
		
	// 회원 가입시 필요한 쿼리 메소드를 작성
	// insert(등록용), select(중복 확인용)
		
	// 반환값 없이
	public void insert(Connection conn, User user) throws SQLException {
			
		String sql = "INSERT INTO rentproject.user(name, id, pw, phone, team, birth) VALUES(?,?,?,?,?,?)";
			
		try(PreparedStatement pst = conn.prepareStatement(sql)){

			pst.setString(1, user.getName()); // 회원 이름
			pst.setString(2, user.getId()); // 회원 아이디
			pst.setString(3, user.getPw()); // 비밀번호
			pst.setString(4, user.getPhone()); // 전화번호
			pst.setString(5, user.getTeam()); // 소속
			pst.setString(6, user.getBirth()); // 생년월일
			
			pst.executeUpdate();
		}
	}
	

	
	// 로그인 아이디가 중복인가를 확인하려면
	// 당연히 loginId 값이 전달되어야함
		
	// 역할 : loginId를 넣고 user객체를 반환
	// 즉, 중복인지 확인하기 위해서 데이터베이스에서 정보를 꺼내오는 역할
	public User selectByLoginId(Connection conn, String id) throws SQLException {
			
		String sql = "SELECT * FROM rentproject.user WHERE id = ?";
			
		try(PreparedStatement pst = conn.prepareStatement(sql)){
				
			pst.setString(1, id);
			User user = null;
				
			// 결과값을 받아와야 함! ResultSet에 받음
			// 그 아이 역시 마찬가지로 close를 해줘야함
			try(ResultSet rs = pst.executeQuery()){
					
				if(rs.next()) {
						
					user = new User(
						rs.getInt("userId"),
						rs.getString("name"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getString("phone"),
						rs.getString("team"),
						rs.getString("birth"),
						rs.getTimestamp("jdate").toLocalDateTime()
						);
	
				}
			
			return user;
			}
		}
	}
	
	
	
	
	// 아이디 중복 체크를 위한 SQL
	public boolean confirmId(String id) throws SQLException {
		
		boolean result = false;
		Connection conn = ConnectionProvider.getConnection();
		
		String sql = "SELECT * FROM rentproject.user WHERE id = ?";
		
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			
			pst.setString(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		}
		
		return result;
	}
	
	
	
	
	
	
	
	// 사용자 정보 수정 (쪼개야함)
	public void updateUserInfo(Connection conn, User user) throws SQLException {
			
		String sql = "UPDATE rentproject.user SET name = ?, pw = ?, phone = ?, team = ? WHERE userId = ?";
			
		try(PreparedStatement pst = conn.prepareStatement(sql)){
				
			pst.setString(1, user.getName());
			pst.setString(2, user.getPw());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getTeam());
			pst.setInt(5, user.getUserId());
				
			pst.executeUpdate();
		}
	}
		
	
	

	
}

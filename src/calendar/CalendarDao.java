package calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CalendarDao {

	private static CalendarDao instance = new CalendarDao();
	
	public static CalendarDao getInstance() {
		return instance;
	}
	
	private CalendarDao() {}

	//insertquery 작성
	public void insert(Connection conn, int userId, int roomId, String rentDate, String rentTime) throws SQLException {
		String sql = "insert into rent(userId, roomId, rentDate, rentTime) values(?, ?, ?, ?)";			
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			pst.setInt(1, userId);
			pst.setInt(2, roomId);
			pst.setString(3, rentDate);
			pst.setString(4, rentTime);
			pst.executeUpdate();
		}
	}
	
	//select 쿼리 rent,room,user테이블 join
	public RentInquiry select(Connection conn, int userId) throws SQLException {
			String sql ="select rent.rentId, rent.userId, user.name, rent.roomId, room.roomName, rent.rentDate, rent.rentTime from rent, room, user where rent.roomId = room.roomId and rent.userId = user.userId and rent.userId = ?";
					    
			try(PreparedStatement pst = conn.prepareStatement(sql)){
				pst.setInt(1, userId);
				try(ResultSet rs = pst.executeQuery()){
					RentInquiry rentInquiry = null;
					if(rs.next()) {
						rentInquiry = rentInquiryElement(rs);
					}
					return rentInquiry;
				}
			}
		}
	
	//delete쿼리
	public int delete(Connection conn, int userId) throws SQLException{
		String sql = "delete from rent where userId = ? ";
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			pst.setInt(1, userId);
			return pst.executeUpdate();
		}
	}
	
	//RentInquiry 객체에 데이터 삽입
	private RentInquiry rentInquiryElement(ResultSet rs) throws SQLException{
		RentInquiry rentInquiry = new RentInquiry(rs.getInt("rentId"), rs.getInt("userId"), rs.getString("name"), rs.getInt("roomId"), rs.getString("roomName"), rs.getString("rentDate"), rs.getString("rentTime"));
		return rentInquiry;
	}
}

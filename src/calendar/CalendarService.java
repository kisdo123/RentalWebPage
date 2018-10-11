package calendar;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import main.exception.DuplicationException;

public class CalendarService {
	private static CalendarService instance = new CalendarService();

	public static CalendarService getInstance() {
		return instance;
	}

	private CalendarService() {
	}

	public void rent(int userId, int roomId, String rentDate, String rentTime){
		//객체생성
		CalendarDao calendarDao = CalendarDao.getInstance();
		try(Connection conn = ConnectionProvider.getConnection()){
			conn.setAutoCommit(false);
			
			try {
				RentInquiry rentInquiry = calendarDao.select(conn, userId);
				if(rentInquiry != null) {
					conn.rollback();
					throw new DuplicationException("대실신청건이 존재합니다.하였습니다.");
				}
				
				//insert쿼리 실행
				calendarDao.insert(conn, userId, roomId, rentDate, rentTime);
				conn.commit();
					
				} catch (SQLException e) {
			
				conn.rollback();
				throw new RuntimeException(e);
				}
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

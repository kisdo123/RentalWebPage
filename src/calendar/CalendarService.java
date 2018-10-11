package calendar;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;

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
			//insert쿼리 실행
			calendarDao.insert(conn, userId, roomId, rentDate, rentTime);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

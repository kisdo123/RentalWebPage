package calendar;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;


public class RentInquiryService {
	private static RentInquiryService instance = new RentInquiryService();

	private RentInquiryService() {
	}

	public static RentInquiryService getInstance() {
		return instance;
	}

	public void select(int userId) {
		CalendarDao calendarDao = CalendarDao.getInstance();
		try(Connection conn = ConnectionProvider.getConnection()){
			calendarDao.select(conn, userId);
			if(userId == 0) {
				throw new RuntimeException("입력이 없습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
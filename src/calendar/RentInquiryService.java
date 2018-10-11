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

	public RentInquiry select(int userId) throws SQLException {
		CalendarDao calendarDao = CalendarDao.getInstance();
		try(Connection conn = ConnectionProvider.getConnection()){
			RentInquiry rentInquiry = calendarDao.select(conn, userId);
			return rentInquiry;
		}
	}
}
package calendar;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import main.exception.DuplicationException;

public class RendDeleteService {
	private static RendDeleteService instance = new RendDeleteService();

	private RendDeleteService() {
	}

	public static RendDeleteService getInstance() {
		return instance;
	}

	public void delete(int userId) throws SQLException {
		CalendarDao calendarDao = CalendarDao.getInstance();

		try (Connection conn = ConnectionProvider.getConnection()) {
			try {
				conn.setAutoCommit(false);
				RentInquiry rentInquiry = calendarDao.select(conn, userId);
				if(rentInquiry == null) {
					conn.rollback();
					throw new DuplicationException("대실신청건이 존재하지않습니다.");
				}
				
				
				calendarDao.delete(conn, userId);
				conn.commit();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}
}

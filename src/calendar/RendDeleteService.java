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
				//트렌젝션 사용을위해 autocommit을 막음
				conn.setAutoCommit(false);
				RentInquiry rentInquiry = calendarDao.select(conn, userId);
				
				//대실 신청건이 존재하지않으면 화면반환
				if(rentInquiry == null) {
					conn.rollback();
					throw new DuplicationException("대실신청건이 존재하지않습니다.");
				}
				
				//쿼리 실행
				calendarDao.delete(conn, userId);
				conn.commit();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}
}

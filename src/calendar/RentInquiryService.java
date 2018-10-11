package calendar;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import main.exception.DuplicationException;

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
			try {
				//트렌젝션 사용을위해 autocommit을 막음
				conn.setAutoCommit(false);
				RentInquiry rentInquiry = calendarDao.select(conn, userId);
				
				//대실 신청건이 존재하지않으면 화면반환
				if(rentInquiry == null) {
					conn.rollback();
					throw new DuplicationException("대실신청건이 존재하지않습니다.");
				}
				
				//존제히면 쿼리를 실행하고 rentInquiry 반환
				conn.commit();
				return rentInquiry;
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}
}
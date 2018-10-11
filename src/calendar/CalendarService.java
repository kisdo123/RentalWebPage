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
			//트렌젝션 사용하기위해 autocommit을 막음
			conn.setAutoCommit(false);
			
			try {
				//쿼리 실행
				RentInquiry rentInquiry = calendarDao.select(conn, userId);
				
				//대실 신청이 1개라도 존재하면 DuplicationException을 던지고 catch에서 화면반환
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

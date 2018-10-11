package calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginUser;
import main.exception.DuplicationException;
import main.exception.InvalidPasswordException;
import main.exception.UserNotFoundException;
import main.handler.CommandHandler;

public class CalendarHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/calendar.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, resp);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, resp);
		} else {
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		}
		return null;
	}

	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) {
		//LoginUser객체에서 userId를 가져옴.
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		int userId = loginUser.getUserId();
		
		//Parameter에서 roomId를 가져와서 int형으로 형 변환
		int roomId = Integer.parseInt(req.getParameter("roomId"));

		//Parameter에서 date를 가져옴
		String rentDate = req.getParameter("date");

		// time을 getParameterValues 가져오는변수
		String timeStr[] = req.getParameterValues("time");
		// int형으로 변환해서 넣기위한 변수
		int[] time = new int[timeStr.length];
		// str로 바꿔 넣기 위한 변수
		String rentTime = "";

		// String배열을 int배열로 변환후 저장
		for (int i = 0; i < timeStr.length; i++) {
			time[i] = Integer.parseInt(timeStr[i]);
		}

		for (int j = 0; j < time.length; j++) {

			switch (time[j]) {
			case 1:
				rentTime += " 09:00~10:00 ";
				break;
			case 2:
				rentTime += " 10:00~11:00 ";
				break;
			case 3:
				rentTime += " 11:00~12:00 ";
				break;
			case 4:
				rentTime += " 12:00~13:00 ";
				break;
			case 5:
				rentTime += " 13:00~14:00 ";
				break;
			case 6:
				rentTime += " 14:00~15:00 ";
				break;
			case 7:
				rentTime += " 15:00~16:00 ";
				break;
			case 8:
				rentTime += " 16:00~17:00 ";
				break;
			case 9:
				rentTime += " 17:00~18:00 ";
				break;
			}
		}
		//객체생성
		Calendar calendar = new Calendar();
		
		//데이터 삽입
		calendar.setUserId(userId);
		calendar.setRoomId(roomId);
		calendar.setRentDate(rentDate);
		calendar.setRentTime(rentTime);
		
		//서비스 객체생성
		CalendarService calendarService = CalendarService.getInstance();
		try {
			//서비스의 rent함수에 값을 데이터를 넣고 실행 성공하면 성공화면 반환
			calendarService.rent(userId, roomId, rentDate, rentTime);
			return "/WEB-INF/view/rentsuccess.jsp";

		} catch (InvalidPasswordException e) {
			e.printStackTrace();
			return null;
		} catch (UserNotFoundException e) {
			e.printStackTrace();
			return null;
		//DuplicationException이면 rentApplicationFail화면을 반환한다.
		} catch (DuplicationException e) {
			return "/WEB-INF/fail/rentApplicationFail.jsp";
		}

	}
}

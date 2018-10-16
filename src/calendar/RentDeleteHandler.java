package calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginUser;
import main.exception.DuplicationException;
import main.handler.CommandHandler;

public class RentDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		try {
			
			//LoginUser에서 getUserId를 가져온다.
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			int userId = loginUser.getUserId();

			RendDeleteService rendDeleteService = RendDeleteService.getInstance();
			rendDeleteService.delete(userId);
			
			//성공시 성공화면 반환
			return "/WEB-INF/view/rentDeleteSuccess.jsp";

			
		//실패시 실패화면 반환
		} catch (DuplicationException e) {
			return "/WEB-INF/fail/rentDeleteFail.jsp";
		}
	}

}

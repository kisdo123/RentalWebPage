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
		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
		int userId = loginUser.getUserId();
		
		RendDeleteService rendDeleteService = RendDeleteService.getInstance();
		rendDeleteService.delete(userId);
		return "/WEB-INF/view/rentDeleteSuccess.jsp";
		
		}catch (DuplicationException e) {
			return "/WEB-INF/fail/rentDeleteFail.jsp";
		}
	}

}

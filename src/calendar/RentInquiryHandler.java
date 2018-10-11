package calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginUser;
import main.handler.CommandHandler;

public class RentInquiryHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
		int userId = loginUser.getUserId();
		
		RentInquiryService rentInquiryService = RentInquiryService.getInstance();
		rentInquiryService.select(userId);
		return "/WEB-INF/view/rentInquiry.jsp";
	}
}

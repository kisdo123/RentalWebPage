package calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginUser;
import main.exception.DuplicationException;
import main.handler.CommandHandler;

public class RentInquiryHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		try {
			// LoginUser에서 userId를가져옴
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			int userId = loginUser.getUserId();

			RentInquiryService rentInquiryService = RentInquiryService.getInstance();
			RentInquiry rentInquiry = rentInquiryService.select(userId);

			// jsp에서 EL을 사용하기 위해 rentInquiry setAttribute에 저장
			req.getSession().setAttribute("rentInquiry", rentInquiry);
			// 조회화면 성공화면 변환
			return "/WEB-INF/view/rentInquiry.jsp";
	
			//존재하지않으면 실패화면 반환
		} catch (DuplicationException e) {
			return "/WEB-INF/fail/rentDeleteFail.jsp";
		}
	}
}

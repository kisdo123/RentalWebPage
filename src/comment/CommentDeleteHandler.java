package comment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginUser;
import main.exception.DuplicationException;
import main.handler.CommandHandler;

public class CommentDeleteHandler implements CommandHandler{
	private static final String FORM_VIEW = "/WEB-INF/view/readArticle.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, resp);
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, resp);
		}else {
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
			try {
				//System.out.println("gethandler");
				int comId = Integer.parseInt(req.getParameter("comId"));
				LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
				int userId = loginUser.getUserId();
				
				CommentDeleteRequest cDelReq = new CommentDeleteRequest(userId, comId);
				//System.out.println("log 2:"+comId + userId);
				
				req.setAttribute("cDelReq", cDelReq);
				//System.out.println("log 3:"+comId + userId);
				
				//성공시 성공화면 반환
				return FORM_VIEW;
			
			//실패시 실패화면 반환
			} catch (DuplicationException e) {
				return "/WEB-INF/fail/commentDeleteFail.jsp";
			}
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//System.out.println("posthandler");
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		int userId = loginUser.getUserId();
		int comId = Integer.parseInt(req.getParameter("comId"));
		//System.out.println("log 5:"+comId + userId);
		
		CommentDeleteRequest cDelReq = new CommentDeleteRequest(userId, comId);
		req.setAttribute("cDelReq", cDelReq);
		//System.out.println("log 5:"+comId + userId);
	try {
		//System.out.println("서비스 진입전");
			CommentDeleteService commentDeleteService = CommentDeleteService.getInstance();
			commentDeleteService.delete(cDelReq);
			return "/WEB-INF/view/commentDeleteSuccess.jsp";
		} catch (DuplicationException e) {
			return "/WEB-INF/fail/commentDeleteFail.jsp";
		}
	}
}

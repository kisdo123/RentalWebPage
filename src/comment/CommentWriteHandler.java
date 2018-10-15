package comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.WriteArticleService;
import login.LoginUser;
import main.handler.CommandHandler;

public class CommentWriteHandler implements CommandHandler {

	
private static final String FORM_VIEW = "/WEB-INF/view/articleReWriteForm.jsp";

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// 메소드의 내용을 비교
		if(req.getMethod().equalsIgnoreCase("GET")) {
			
			return processForm(req, resp);
			
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, resp);
			
		}else {
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	
	// 받고
	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		return FORM_VIEW;
	}

	
	
	
	
	// 사용자로부터 POST방식의 요청이 오면 이 메소드를 처리한다
	// 쉽게말해 보내고 (부치고)
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) {
		

		// 댓글에 대한 사용자의 요청
		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
		int userId = loginUser.getUserId();
		
		
		int articleId = Integer.parseInt(req.getParameter("articleId")); // null
		
		
		// String name = req.getParameter("name");
		String comContent = req.getParameter("comContent");	



		CommentWriteService commentWriteService = CommentWriteService.getInstance();

		Comment comment = commentWriteService.write(userId, articleId, comContent);

		// 문제가 없다면
		WriteArticleService articleService = WriteArticleService.getInstance();
				


		req.setAttribute("comment", comment);
		
		
		return "/WEB-INF/view/commentWriteSuccess.jsp";
	}



	
}

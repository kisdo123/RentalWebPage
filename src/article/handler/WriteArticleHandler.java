package article.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import article.service.WriteArticleService;
import article.service.WriteRequest;
import login.LoginUser;
import main.handler.CommandHandler;


public class WriteArticleHandler implements CommandHandler{

	private static final String FORM_VIEW = "/WEB-INF/view/newArticleForm.jsp";

	
	
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
		
		// 사용자한테 입력받은 게시글 내용의 무결성을 체크하기 위해
		// writeRequest 객체에 담아서 비어있는지 체크하고
		// 이상이 있으면 FORM_view로 다시 반환하고
		// 이상이 없으면 서비스를 이용해서 게시글 삽입 로직을 수행한다 

		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
		
		int userId = loginUser.getUserId();


		
		WriteRequest writeRequest = 
				// WriteRequest는 Writer, title, content 를 필요로 하는데
				// writer는 객체를 새로만들어서 authUser객체에서 데이터를 받아오고
				// title과 content는 사용자로 입력받은 데이터
				
				// WriteRequest 객체가 하는 일은 로그인된 유저가 글을 작성할 때
				// 연결해 주기 위한 객체
				new WriteRequest(
						userId,
						req.getParameter("title"),
						req.getParameter("content"));

		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);

		
		// 문제가 있다면 Map에 errors가 생길 것이고
		writeRequest.validate(errors);
		
		// 문제가 있다면 FORM_VIEW로 반환하고
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		// 문제가 없다면
		WriteArticleService articleService = WriteArticleService.getInstance();
		
		// 최종 파라미터값과 로그인 데이터를 담아서 write로 넘겨줌
		int newArticleNum = articleService.write(writeRequest, userId);


		req.setAttribute("newArticleNum", newArticleNum);
		
		
		return "/WEB-INF/view/newArticleSuccess.jsp";
	}

}

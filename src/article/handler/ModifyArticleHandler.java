package article.handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.ReadArticleService;
import login.LoginUser;
import main.exception.ArticleNotFoundException;
import main.exception.PermissionDeniedException;
import main.handler.CommandHandler;

public class ModifyArticleHandler implements CommandHandler{

	private static final String FORM_VIEW = "/WEB-INF/view/modifyForm.jsp";
	

	// <a href="modify?no=${articleData.article.articleId }">[게시글 수정]</a>
	// <a href="delete?no=${articleData.article.articleId }">[게시글 삭제]</a>
	
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

	
	private String processForm(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		ReadArticleService readArticleService = ReadArticleService.getInstance();
		
		try {
			
			// 게시글의 아이디를 받아서
			String noStr = req.getParameter("no");
			int no = Integer.parseInt(noStr);
		
			// 게시글을 읽어오는 서비스를 이용하여 데이터를 받아온다
			ArticleData articleData = readArticleService.getArticle(no, false);
			
			
			// 사용자가 수정을 할 수 있는 권한이 있는지 확인하고
			LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
			
			// 에러가 없으면 에러를 reponse에 담아서 보낸다 SC_FORBIDDEN
			if(!canModify(loginUser, articleData)) {
				resp.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			
			// 에러가 있으면 modifyRequest에 담아서 modifyForm.jsp(수정 화면)를 보여줌
			ModifyRequest modReq = 
					new ModifyRequest(loginUser.getUserId(), no, articleData.getArticle().getTitle(), articleData.getArticleContent());

			req.setAttribute("modReq", modReq);
			
			return FORM_VIEW;
			
		}catch (ArticleNotFoundException e) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	
	}
	
	
	
	private boolean canModify(LoginUser loginUser, ArticleData articleData) {
		
		int writeId = articleData.getArticle().getUserId();
		return loginUser.getUserId() == writeId;
		
	}
	
	
	
	
	// 사용자로부터 POST방식의 요청이 오면 이 메소드를 처리한다
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		// 사용자가 직접 작성한 게시글 제목과 내용을 받아온다
		// modifyRequest에 수정 내용들을 파라미터에서 받아서 담고
		ModifyRequest modReq = new ModifyRequest(loginUser.getUserId(), no, req.getParameter("title"), req.getParameter("content"));
		
		req.setAttribute("modReq", modReq);
		
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		modReq.validate(errors);
		
		// 에러를 체크하고
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}

		try {
			
			// 서비스를 통해서 수정을 실행 후
			// modifySuccess.jsp(수정 성공화면)으로 전환
			ModifyArticleService modifyArticleService = ModifyArticleService.getInstance();
			modifyArticleService.modify(modReq);
			
			return "/WEB-INF/view/modifySuccess.jsp";
			
			
		// 게시글이 없거나, 권한이 없으면 에러를 반환
		}catch (ArticleNotFoundException e) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}catch (PermissionDeniedException e) {
			resp.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}

	}
	
}

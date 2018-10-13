package article.handler;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.DeleteArticleService;
import article.service.DeleteRequest;

import article.service.ReadArticleService;
import login.LoginUser;
import main.exception.ArticleNotFoundException;
import main.exception.PermissionDeniedException;
import main.handler.CommandHandler;

public class DeleteArticleHandler implements CommandHandler{
	
	
	private static final String FORM_VIEW = "/WEB-INF/view/deleteConfirm.jsp";
	

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
			
			// 게시글의 아이디를 받아서 (꼭 필요)
			String noStr = req.getParameter("no");
			int no = Integer.parseInt(noStr);
		
			// 게시글을 읽어오는 서비스를 이용하여 데이터를 받아온다
			ArticleData articleData = readArticleService.getArticle(no, false);
			
			
			// 사용자가 수정을 할 수 있는 권한이 있는지 확인하고
			LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
			
			// 에러가 없으면 에러를 reponse에 담아서 보낸다 SC_FORBIDDEN
			if(!canDelete(loginUser, articleData)) {
				resp.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			
			// 에러가 있으면 deleteRequest에 담아서 deleteForm.jsp(삭제 화면)를 보여줌
			DeleteRequest delReq = new DeleteRequest(loginUser.getUserId(), no);
			req.setAttribute("delReq", delReq);
			
			return FORM_VIEW;
			
		}catch (ArticleNotFoundException e) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	
	}
	
	
	
	private boolean canDelete(LoginUser loginUser, ArticleData articleData) {
		
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
		DeleteRequest delReq = new DeleteRequest(loginUser.getUserId(), no);
		
		req.setAttribute("delReq", delReq);


		try {
			
			// 서비스를 통해서 수정을 실행 후
			// modifySuccess.jsp(수정 성공화면)으로 전환
			DeleteArticleService deleteArticleService = DeleteArticleService.getInstance();
			deleteArticleService.delete(delReq);
			
			return "/WEB-INF/view/deleteSuccess.jsp";
			
			
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

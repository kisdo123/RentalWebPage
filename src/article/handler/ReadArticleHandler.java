package article.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ReadArticleService;
import comment.CommentPage;
import main.exception.ArticleContentNotFoundException;
import main.exception.ArticleNotFoundException;
import main.handler.CommandHandler;

public class ReadArticleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		
		
		// 사용자에게 어떤 요청을 받고
		int no = Integer.parseInt(req.getParameter("no"));
		
		
		
		
		
//		// 댓글에 대한 사용자의 요청
//		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
//		int userId = loginUser.getUserId();
//		int articleId = Integer.parseInt(req.getParameter("articleId"));
//		String name = req.getParameter("name");
//		String comContent = req.getParameter("comContent");	
		
		
		
		
		

		// 서비스를 이용해서 화면에 보여줄 데이터를 생성하고
		ReadArticleService readArticleService = ReadArticleService.getInstance();
		
		
		
		
		

		
		try {
			
			// 화면으로 리턴
			ArticleData articleData = readArticleService.getArticle(no, true);
			

			CommentPage commentPage = readArticleService.getCommentPage(no, no);
	


			req.setAttribute("commentPage", commentPage);
			req.setAttribute("articleData", articleData);
			
			

			return "/WEB-INF/view/readArticle.jsp";
			
			
		}catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			
			
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
				
	}

}

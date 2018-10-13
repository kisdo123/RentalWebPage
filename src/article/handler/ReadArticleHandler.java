package article.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ReadArticleService;

import main.exception.ArticleContentNotFoundException;
import main.exception.ArticleNotFoundException;
import main.handler.CommandHandler;

public class ReadArticleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		// 사용자에게 어떤 요청을 받고
		int articleId = Integer.parseInt(req.getParameter("no"));
		

		// 서비스를 이용해서 화면에 보여줄 데이터를 생성하고
		ReadArticleService readArticleService = ReadArticleService.getInstance();

		try {
			
			// 화면으로 리턴
			ArticleData articleData = readArticleService.getArticle(articleId, true);

		/*	articleData.getArticleContent().replace("&", "&amp;");
			articleData.getArticleContent().replace("<", "&lt;");
			articleData.getArticleContent().replace(">", "&gt;");
			articleData.getArticleContent().replace(" ", "&nbsp;");
			articleData.getArticleContent().replace("\n", "<br>");*/
			
			req.setAttribute("articleData", articleData);
			
			return "/WEB-INF/view/readArticle.jsp";
			
		}catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
				
	}

}

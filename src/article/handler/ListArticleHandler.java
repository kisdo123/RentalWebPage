package article.handler;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import article.service.ArticlePage;
import article.service.ListArticleService;
import main.handler.CommandHandler;

public class ListArticleHandler implements CommandHandler {

	
	
	// 페이지번호를 파라미터로 받고
	// 서비스를 이용해서 페이지 목록을 받아온다 
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		

		ListArticleService listArticleService = ListArticleService.getInstance();
	

		String pageNostr = req.getParameter("pageNo");
		
		int pageNo = 1;
		
		if(pageNostr != null) {
			pageNo = Integer.parseInt(pageNostr);
		}
		
		ArticlePage articlePage = listArticleService.getArticlePage(pageNo);

		// listArticle에서 articlePage에 있는애를 꺼내 쓰면 된다
		req.setAttribute("articlePage",	articlePage);

		
		return "/WEB-INF/view/listArticle.jsp";
	
	}

}

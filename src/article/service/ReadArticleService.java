package article.service;

import java.sql.Connection;
import java.sql.SQLException;


import article.model.Article;
import article.model.ArticleContent;
import dao.ArticleContentDao;
import dao.ArticleDao;
import main.exception.ArticleContentNotFoundException;
import main.exception.ArticleNotFoundException;
import jdbc.ConnectionProvider;

public class ReadArticleService {

	private static ReadArticleService instance = new ReadArticleService();
	
	public static ReadArticleService getInstance() {
		return instance;
	}
	
	private ReadArticleService() {}
	
	
	
	// increaseReadCount 변수는 조회수를 올릴지 말지를 결정
	public ArticleData getArticle(int articleId, boolean increaseReadCount) {
		
		ArticleDao articleDao = ArticleDao.getInstance();
		ArticleContentDao articleContentDao = ArticleContentDao.getInstance();
		
		try(Connection conn = ConnectionProvider.getConnection()){
			
			// 1. article테이블
			Article article = articleDao.selectById(conn, articleId);
			
			if(article == null) {
				throw new ArticleNotFoundException("Article이 없음");
			}
			
			
			
			// 2. article_content테이블
			ArticleContent articleContent = articleContentDao.selectById(conn, articleId);
			
			if(articleContent == null) {
				throw new ArticleContentNotFoundException("ArticleContent가 없음");
			}
			
			
			/*// 둘다 정상적으로 가져왔다면
			if(increaseReadCount) {
				
				articleDao.increaseReadCount(conn, articleId);
				
			}
			*/
			
			// 객체를 두개 담아서 반환한다
			return new ArticleData(article, articleContent);
			
			
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	
		
	}
	

	
}

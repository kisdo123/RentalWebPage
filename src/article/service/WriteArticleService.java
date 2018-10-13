package article.service;

import java.sql.Connection;
import java.sql.SQLException;


import article.model.Article;
import article.model.ArticleContent;
import dao.ArticleContentDao;
import dao.ArticleDao;
import jdbc.ConnectionProvider;

public class WriteArticleService {

	private static WriteArticleService instance = new WriteArticleService();
	
	public static WriteArticleService getInstance() {
		return instance;
	}
	
	private WriteArticleService() {}
	
	
	
	
	public int write(WriteRequest wr, int userId) {
		
		ArticleDao articleDao = ArticleDao.getInstance();
		ArticleContentDao articleContentDao = ArticleContentDao.getInstance();
		
		
		// 게시글의 테이블이 두개가 있고,
		// 두개의 articleId는 같아야 무결성을 해치지 않음
		// 따라서 두개의 articleId는 동기화 되어야 하고
		
		// article이 삽입 됐을 때 생성되는 articleId가 생성되기 때문에
		// 삽입 후 select를 하여 articleId를 받아온다 (삽입	전에는 결과를 알수없다)
		// 그리고 그 articleId를 content(내용) 삽입시 사용하여 articleId가 같게 처리함
		try(Connection conn = ConnectionProvider.getConnection()){
			
			
			try {
				// article 테이블에 articleId 가 autoIcrement로 생성됨
				// article_content 테이블의 articleId가 같아야함
				// article이 성공하고 article_content이 실패하면 안되니 
				conn.setAutoCommit(false);
				
				
				Article article = new Article(wr.getTitle(), userId);

				
				// article 테이블에 내용을 insert를 먼저 함
				
				// insert 인데 제목과 articleId를 auto increment 시킴
				Article savedArticle = articleDao.insert(conn, article, userId);

				
				// insert가 실패했을 때
				if(savedArticle == null) {
					
					throw new RuntimeException("article 삽입 실패");
					
				}
				
				
				
				
				// article_content테이블의 articleId는 auro_increament되면 안되고
				// article에 삽입된 articleId를 가져와서 사용해야 한다
				
				ArticleContent content = new ArticleContent(savedArticle.getArticleId(), wr.getContent());
				
				ArticleContent savedContent = articleContentDao.insert(conn, content);
				
				if(savedContent == null) {
					
					throw new RuntimeException("content 삽입 실패");
					
				}
				
				conn.commit();
				return savedArticle.getArticleId();
				
			}catch (SQLException e) {
				
				// 잘못되었을 때는
				conn.rollback();
				throw new RuntimeException(e);
			}catch (RuntimeException e) {
				conn.rollback();
				throw e;
			}

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

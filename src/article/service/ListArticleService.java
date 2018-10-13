package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


import article.model.Article;
import dao.ArticleDao;
import jdbc.ConnectionProvider;

public class ListArticleService {

	private static ListArticleService instance = new ListArticleService();
	
	public static ListArticleService getInstance() {
		return instance;
	}
	
	private ListArticleService () {}
	
	
	private int size = 10;
	private int blockSize = 5;
	
	
	// Dao를 이용해서 리스트를 가져오기만 하면 됨
	public ArticlePage getArticlePage(int pageNum) {
		
		
		
		try(Connection conn = ConnectionProvider.getConnection()){
			
			ArticleDao articleDao = ArticleDao.getInstance();
			
			// 전체 article 갯수를 받아옴
			int totalArticles = articleDao.selectCount(conn);
			
			// (pageNum-1)*size는 시작 게시물
			List<Article> articleList = articleDao.selectList(conn, (pageNum-1)*size, size);
			
			
			return new ArticlePage(articleList, pageNum, totalArticles, size, blockSize);
			
			
			
		
			
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	
	}

}

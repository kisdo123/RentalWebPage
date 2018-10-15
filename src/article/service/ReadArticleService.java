package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.model.Article;
import article.model.ArticleContent;
import article.service.ArticleData;
import comment.Comment;
import comment.CommentPage;
import dao.ArticleContentDao;
import dao.ArticleDao;
import dao.CommentDao;
import jdbc.ConnectionProvider;
import main.exception.ArticleContentNotFoundException;
import main.exception.ArticleNotFoundException;

public class ReadArticleService {

	private static ReadArticleService instance = new ReadArticleService();
	
	public static ReadArticleService getInstance() {
		return instance;
	}
	
	private ReadArticleService() {}
	
	
	
	private int size = 10;
	private int blockSize = 5;
		
	
	
	

	
	public Comment write(int userId, int articleId, String comContent) {
		
		CommentDao commentDao = CommentDao.getInstance();
		
		
		
		try(Connection conn = ConnectionProvider.getConnection()){
			
			
			try {
			
				
				conn.setAutoCommit(false);
				
				
				
				Comment comment = new Comment(userId, articleId, comContent);
			
				Comment savedComment = commentDao.insertComment(conn, comment);
				
				if(savedComment == null) {
					
					throw new RuntimeException("content 삽입 실패");
					
				}
				
				conn.commit();
				return savedComment;
				
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
	
	
	
	
	
	
	
	
	
	
	// Dao를 이용해서 리스트를 가져오기만 하면 됨
	public CommentPage getCommentPage(int pageNum, int articleId) {
			
		

			
		try(Connection conn = ConnectionProvider.getConnection()){
				
			CommentDao commentDao = CommentDao.getInstance();
				
				// 전체 article 갯수를 받아옴
			int totalArticles = commentDao.selectCount(conn);
				
				// (pageNum-1)*size는 시작 게시물
			List<Comment> commentList = commentDao.selectList(conn, articleId);
				
				
			return new CommentPage(commentList, pageNum, totalArticles, size, blockSize);
				
				
				
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}



	

	
	
	public ArticleData getArticle(int articleId, boolean increaseCount) {
		
		
		
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
			
			


			// 객체를 두개 담아서 반환한다
			return new ArticleData(article, articleContent);
			
			
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	
		
	}
	

	
}

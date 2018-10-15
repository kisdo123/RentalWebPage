package comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import dao.CommentDao;
import jdbc.ConnectionProvider;

public class CommentWriteService {

	
	
	private static CommentWriteService instance = new CommentWriteService();
	
	public static CommentWriteService getInstance() {
		return instance;
	}
	
	private CommentWriteService() {}
	
	

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
	
	
	
	
	
	
	
	
	
}

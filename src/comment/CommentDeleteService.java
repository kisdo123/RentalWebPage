package comment;

import java.sql.Connection;
import java.sql.SQLException;

import dao.CommentDao;
import jdbc.ConnectionProvider;
import main.exception.DuplicationException;

public class CommentDeleteService {
	private static CommentDeleteService instance = new CommentDeleteService();

	private CommentDeleteService() {
	}

	public static CommentDeleteService getInstance() {
		return instance;
	}
	
	public void delete(CommentDeleteRequest cDelReq) {
		//System.out.println("서비스 진입후");
		CommentDao commentDao = CommentDao.getInstance();
		try(Connection conn = ConnectionProvider.getConnection()) {
			try {
				conn.setAutoCommit(false);
				//System.out.println("트렌잭션");
				CommentDeleteRequest commentDeleteRequest = commentDao.beforedeleteSelect(cDelReq.getComId(), conn);
				//System.out.println("log 6:"+cDelReq.getComId());
				if(commentDeleteRequest == null) {
					conn.rollback();
					throw new DuplicationException("작성한 댓글이 없습니다.");
				}
				commentDao.delete(conn, cDelReq.getComId());
				//System.out.println("log 7:"+cDelReq.getComId());
				conn.commit();
				//System.out.println("커밋완");
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

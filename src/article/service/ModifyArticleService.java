package article.service;

import java.sql.Connection;
import java.sql.SQLException;


import article.model.Article;
import dao.ArticleContentDao;
import dao.ArticleDao;
import main.exception.ArticleNotFoundException;
import main.exception.PermissionDeniedException;
import jdbc.ConnectionProvider;

public class ModifyArticleService {

	private static ModifyArticleService instance = new ModifyArticleService();
	
	public static ModifyArticleService getInstance() {
		return instance;
	}
	
	private ModifyArticleService() {}
	
	
	// readArticle에서 게시글 수정하기 버튼을 누르면
	// 핸들러를 통해서 서비스를 통해 로직을 불러오는데
	public void modify(ModifyRequest mr) {
		
	// articleDao, articleContentDao 를 이용해서
	// 게시글 수정 메소드를 실행
	// 게시글이 있는지 확인하고 사용자 권한이 있는지 확인하고
	ArticleDao articleDao = ArticleDao.getInstance();
	ArticleContentDao articleContentDao = ArticleContentDao.getInstance();
	
	try(Connection conn = ConnectionProvider.getConnection()){
		
		try {
			conn.setAutoCommit(false);
			
			// article을 통해 글이 있는지 없는지 가져온다
			Article article = articleDao.selectById(conn, mr.getArticleId());
			
			if(article == null) {
				throw new ArticleNotFoundException("없는 게시글입니다");
			}
			
			// 로그인 되어있는 사용자와 비교
			if(article.getUserId() != mr.getUserId()) {
				throw new PermissionDeniedException("사용자 권한이 없습니다");
			}
			
			// 여기까지 왔다는건 사용자권한이 있으면서 게시글이 있는 상태
			//articleDao와 articleContentDao를 이용해서 게시글 수정 메소드를 실행
			
			// 아이디랑 제목을 먼저 가져오고
			articleDao.update(conn, mr.getArticleId(), mr.getTitle());
			
			// 아이디와 게시글을 가져오고
			articleContentDao.update(conn, mr.getArticleId(), mr.getContent());
			
			conn.commit();

		}catch (SQLException e) {
			conn.rollback();
			throw new RuntimeException(e);
		}catch (PermissionDeniedException e) {
			conn.rollback();
			throw e;
		}
		
	}catch (SQLException e) {
		throw new RuntimeException(e);
	}
	
	}

}

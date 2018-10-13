package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import article.model.ArticleContent;

public class ArticleContentDao {

	private static ArticleContentDao instance = new ArticleContentDao();
	
	public static ArticleContentDao getInstance() {
		return instance;
	}
	
	private ArticleContentDao() {}
	
	
	
	
	
	
	// ArticleDao 에서의 articleId를 공유
	public ArticleContent insert(Connection conn, ArticleContent articleContent) throws SQLException {
		
		String sql = "insert into content(articleId, content) values(?,?)";
		
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			
			pst.setInt(1, articleContent.getArticleId());
			pst.setString(2, articleContent.getContent());
			
			int insertedCount = pst.executeUpdate();
			
			if(insertedCount > 0) {
				
				// insert가 되면 content를 반환
				return articleContent;
				
			}else {
				return null;				
			}
		}
	}
	
	
	
	
	
	
	
	

	// 게시글 내용을 가져오는 메소드
	public ArticleContent selectById(Connection conn, int articleId) throws SQLException {
		
		String sql = "select * from content where articleId = ?";
		
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			
			pst.setInt(1, articleId);
			
			try(ResultSet rs = pst.executeQuery()){
				
				ArticleContent articleContent = null;
				
				if(rs.next()) {
					
					articleContent = new ArticleContent(rs.getInt("articleId"), rs.getString("content"));
					
				}
				
				return articleContent;
			}
		}
	}
	
	
	
	
	// 내용을 수정하는 update메소드
	public int update(Connection conn, int articleId, String content) throws SQLException {
			
		String sql = "update content set content = ? where articleId = ?";
			
		try(PreparedStatement pst = conn.prepareStatement(sql)){
				
			pst.setString(1, content);
			pst.setInt(2, articleId);
			
			return pst.executeUpdate();
		}
	}
	
	
	
	
	
	
	
	
	

	// 삭제하는 메소드
	public int delete(Connection conn, int articleId) throws SQLException {
					
		String sql =  "delete from content where articleId = ?";
				
		try(PreparedStatement pst = conn.prepareStatement(sql)){
						
			pst.setInt(1, articleId);
			return pst.executeUpdate();
			
		}
	}
	
	
	
	
	
	
	
}

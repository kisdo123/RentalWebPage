package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import comment.Comment;
import comment.CommentDeleteRequest;

public class CommentDao {

	private static CommentDao instance = new CommentDao();
	
	public static CommentDao getInstance() {
		return instance;
	}
	
	private CommentDao() {}
	
	
	

	

	// List를 가져오는 쿼리
	public List<Comment> selectList(Connection conn, int articleId) throws SQLException{
		
		// 최신위주로 보기 위해 order by를 해주는데 내림차순으로 
		String sql = "SELECT comment.comId, comment.comContent,comment.userId,user.name,comment.articleId,article.title,content.content"
				+ " FROM comment, user, article, content WHERE comment.userId = user.userId AND comment.articleId = article.articleId"
				+ " AND article.articleId = content.articleId AND comment.articleId = ?";
		
		try(PreparedStatement pst = conn.prepareStatement(sql)){

			
			pst.setInt(1, articleId);
			
			List<Comment> commentList = new ArrayList<>();
				
			try(ResultSet rs = pst.executeQuery()){
				
				while(rs.next()) {
					
					// 메소드를 구현
					// 게시글을 하나씩 담은 리스트가 생성됨
					commentList.add(convArticle(rs));
		
				}
				
				return commentList;
			}
			
		}
	}

	
	
	
	
	// ResultSet으로 나온 결과를 article 객체로 생성해서 담는 메소드
	private Comment convArticle(ResultSet rs) throws SQLException {
		
			Comment comment = new Comment(
				
				// 댓글번호,  이름, 게시글번호, 제목, 내용	
				rs.getInt("comId"),
				rs.getInt("userId"),
				rs.getInt("articleId"),
				rs.getString("name"),
				rs.getString("content"),
				rs.getString("comContent")
				
				);
				
			// rs에 있는 내용을 담아서 던져준다
			return comment;
		}
	private CommentDeleteRequest conDelArticle(ResultSet rs) throws SQLException {
		
		CommentDeleteRequest commentDeleteRequest = new CommentDeleteRequest(
			rs.getInt("comId"),
			rs.getInt("userId")
			);
			
		// rs에 있는 내용을 담아서 던져준다
		return commentDeleteRequest;
	}

	
	// 댓글 등록
	public Comment insertComment(Connection conn, Comment comment) throws SQLException{
		
	       String sql = "INSERT INTO comment(userId, articleId, comContent) VALUES(?,?,?)";
	     
	       try (PreparedStatement pst = conn.prepareStatement(sql)){
	            
	            pst.setInt(1, comment.getUserId());
	            pst.setInt(2, comment.getArticleId());
	            pst.setString(3, comment.getComContent());
	            
	            int flag = pst.executeUpdate();
	            
	            if(flag > 0){
	            	
	                return comment;
	            }
	            
	            return null;
	        }
	         
	    }
	    


	// 게시글 개수를 가져오는 메소드 작성
	public int selectCount(Connection conn) throws SQLException {
		
		String sql = "select count(*) from comment";
		
		try(Statement st = conn.createStatement();
			
			// 결과값을 받아와야 하기 때문에
			ResultSet rs = st.executeQuery(sql)){
			
			if(rs.next()) {

				return rs.getInt(1);
			}
			
			// rs 값이 없을 때 0을 반환
			return 0;
		}
	}
	
	public int delete(Connection conn, int comId) throws SQLException{
		String sql = "delete from comment where comId=?";
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			pst.setInt(1, comId);
			//System.out.println(comId);
			return pst.executeUpdate();
		}
	}
	
	public CommentDeleteRequest beforedeleteSelect(int comId, Connection conn) throws SQLException{
		String sql = "select comment.comId, comment.userId, comment.articleId, content.content, comment.comContent FROM comment, user,  article,  content where comment.userId = user.userId and comment.articleId = article.articleId and article.articleId = content.articleId and comment.comId = ?";
			try(PreparedStatement pst = conn.prepareStatement(sql)){
				pst.setInt(1, comId);
				try(ResultSet rs = pst.executeQuery()){
					CommentDeleteRequest commentDeleteRequest = null;
					if(rs.next()) {
						commentDeleteRequest = conDelArticle(rs);
						//System.out.println(commentDeleteRequest.getComId());
					}
					return commentDeleteRequest;
				}
		}
	}

}

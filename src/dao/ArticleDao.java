package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import article.model.Article;

public class ArticleDao {

	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	private ArticleDao() {}
	
	
	
	
	// 게시글 작성하는 로직
	public Article insert(Connection conn, Article article, int userId) throws SQLException {
		
		// articleId 생성
		String sql = "insert into article(title, userId) values(?,?)";
		
		try(PreparedStatement pst = conn.prepareStatement(sql);
				Statement st = conn.createStatement()){
	
			pst.setString(1, article.getTitle());
			pst.setInt(2, userId);

			
			int insertedCount = pst.executeUpdate();
			
			if(insertedCount > 0) {
				
				// 최근에 insert된 id를 select 함
				try(ResultSet rs  = st.executeQuery("select last_insert_id() from article")){
					
					if(rs.next()) {
						
						// articleId 정보를 받아오고
						int articleId = rs.getInt(1); // 현재 2
						article.setArticleId(articleId);
						
						return article;
					}
				}
			}
			return null;
		}
	}
	
	

	
	
	
	
	// 게시글 개수를 가져오는 메소드 작성
	public int selectCount(Connection conn) throws SQLException {
		
		String sql = "select count(*) from article";
		
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
	
	
	
	

/*	private List<Article> selectName(Connection conn) throws SQLException {
		
		// user 테이블하고 
		String sql = "select article.articleId, article.userId, article.title, article.wdate, user.userId, user.name from user, article where article.userId = user.userId order by article.wdate desc";
		
		List<Article> listName = new ArrayList<Article>();
		
		Statement st = conn.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		return listName;
	}*/
	
	
	
	
	// limit를 이용한 List를 가져오는 쿼리
	public List<Article> selectList(Connection conn, int startRow, int size) throws SQLException{
		
		// 최신위주로 보기 위해 order by를 해주는데 내림차순으로 
		String sql = "select * from article, user where user.userId = article.userId order by articleId desc limit ?,?";
		
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			
			pst.setInt(1, startRow);
			pst.setInt(2, size);
			
			List<Article> articleList = new ArrayList<>();
				
			try(ResultSet rs = pst.executeQuery()){
				
				
				while(rs.next()) {
					
					// 메소드를 구현
					// 게시글을 하나씩 담은 리스트가 생성됨
					articleList.add(convArticle(rs));
		
				}
				
				return articleList;
			}
			
		}
	}

	
	
	
	
	// ResultSet으로 나온 결과를 article 객체로 생성해서 담는 메소드
	private Article convArticle(ResultSet rs) throws SQLException {
		
			Article article = new Article(
				
				rs.getInt("articleId"),
				rs.getInt("userId"),
				rs.getString("title"),
				rs.getString("name"),
				rs.getTimestamp("wdate").toLocalDateTime()
				
				);
				
			// rs에 있는 내용을 담아서 던져준다
			return article;
		}

	
	
	
	
	

	
	
	
	
	

	
	// 내용조회
	// 게시글 번호로 특정 게시글을 가져오는 메소드
	public Article selectById(Connection conn, int no) throws SQLException {
		
		// 여기서 조인으로 이름도 같이 쿼리문으로 한줄 받아옴
		String sql = "select article.articleId, article.userId, user.userId, user.name, article.title, article.wdate from user, article where user.userId = article.userId and articleId = ?";
		
		try(PreparedStatement pst = conn.prepareStatement(sql)){
			
			pst.setInt(1, no);
			
			try(ResultSet rs = pst.executeQuery()){
				
				Article article = null;
				
				if(rs.next()) {
					
					article = convArticle(rs);
				}
				
				return article;
			}
		}
	}

	
	
	
	
	
	
	
	
	// 제목을 수정하는 메소드
	public int update(Connection conn, int articleId, String title) throws SQLException {
			
		String sql = "update article set title = ? where articleId = ?";
			
		try(PreparedStatement pst = conn.prepareStatement(sql)){
				
			pst.setString(1, title);
			pst.setInt(2, articleId);
				
			return pst.executeUpdate();
				
		}
			
	}
	
	
	
	
	
	
	
	// 삭제하는 메소드
	public int delete(Connection conn, int articleId) throws SQLException {
				
		String sql =  "delete from article where articleId = ?";
				
		try(PreparedStatement pst = conn.prepareStatement(sql)){
					
			pst.setInt(1, articleId);
			return pst.executeUpdate();

		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	

}

package article.model;

import java.time.LocalDateTime;

// 게시글의 정보를 담는 객체
public class Article {

	private int articleId;
	private int userId;
	private String title;
	
	private String name;
	
	private LocalDateTime wdate;
	private LocalDateTime udate;

	
	
	public Article() {}
	
	
	public Article(String title, int userId) {
		
		this.title = title;
		this.userId = userId;
		
	}

	
	public Article(int articleId, int userId, String title, String name, LocalDateTime wdate) {

		this.articleId = articleId;
		this.userId = userId;
		this.title = title;
		this.name = name;
		this.wdate = wdate;

	}

	
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDateTime getWdate() {
		return wdate;
	}

	public void setWdate(LocalDateTime wdate) {
		this.wdate = wdate;
	}

	public LocalDateTime getUdate() {
		return udate;
	}

	public void setUdate(LocalDateTime udate) {
		this.udate = udate;
	}

}

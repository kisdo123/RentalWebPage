package comment;

import java.time.LocalDateTime;

public class Comment {

	private int comId;
	private int userId;
	private int articleId;
	private String title;

	private String name;
	
	private String content;
	

	private String comContent;

	private LocalDateTime comWdate;
	private LocalDateTime comUdate;

	
	
	
	
	
	public Comment() {}

	public Comment(int userId, int articleId, String comContent) {
		
		this.userId = userId;
		this.articleId = articleId;
		this.comContent = comContent;
	}

	public Comment(int comId, int userId, int articleId, String name, String content, String comContent) {

		this.comId = comId;
		this.userId = userId;
		this.articleId = articleId;
		
		this.name = name;
		this.content = content;
		this.comContent = comContent;
	
	}


	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public LocalDateTime getComWdate() {
		return comWdate;
	}

	public void setComWdate(LocalDateTime comWdate) {
		this.comWdate = comWdate;
	}

	public LocalDateTime getComUdate() {
		return comUdate;
	}

	public void setComUdate(LocalDateTime comUdate) {
		this.comUdate = comUdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}

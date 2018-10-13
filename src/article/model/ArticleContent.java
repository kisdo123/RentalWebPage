package article.model;

// 게시글의 내용을 담을 객체
public class ArticleContent {

	private int articleId;
	private String content;
	
	
	// 이 객체를 사용할 생성자
	public ArticleContent(int articleId, String content) {
		
		this.articleId = articleId;
		this.content = content;
	}

	
	
	

	// 값을 가져올 getter
	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	
	public String getContent() {
		return content;
	}
	

	
}

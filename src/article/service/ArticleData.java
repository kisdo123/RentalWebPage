package article.service;

import article.model.Article;
import article.model.ArticleContent;

// 게시글 보기에 필요한 객체
public class ArticleData {

	private Article article;  // article 테이블의 게시글 내용
	private ArticleContent	articleContent; // article_contetn 테이블의 게시글 내용
	
	
	
	
	public ArticleData(Article article, ArticleContent articleContent) {
		this.article = article;
		this.articleContent = articleContent;
	}

	
	
	
	public Article getArticle() {
		return article;
	}

	// ArticleContent 객체 전부를 쓸필요는 없다
	// articleId 가 겹치기 때문에 게시글 내용만 가져온다
	public String getArticleContent() {
		return articleContent.getContent();
	}

	
	
	
	
	
	
	
}

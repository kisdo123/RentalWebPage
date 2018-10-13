package main.exception;

public class ArticleContentNotFoundException extends RuntimeException {

	public ArticleContentNotFoundException(String message) {
		super(message);
	}
}

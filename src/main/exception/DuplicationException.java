package main.exception;

// 아이디가 중복일 때 발생할 예외 처리
public class DuplicationException extends RuntimeException {
	
	public DuplicationException(String message) {
		
		super(message);
	
	}
}

package main.exception;

// 현재 비밀번호를 잘못입력시 발생하는 예외 처리
public class InvalidPasswordException extends RuntimeException{

	public InvalidPasswordException(String message) {
		super(message);
	}
	
}

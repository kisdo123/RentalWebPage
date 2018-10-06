package main.exception;

// 아이디와 비밀번호가 일치하지 않을 때 발생하는 예외처리
public class LoginFailException extends RuntimeException {

	public LoginFailException(String message) {
		super(message);
	}

}

package main.exception;

// 접근권한이 없을때 수정하려 할때 예외처리
public class PermissionDeniedException extends RuntimeException {

	public PermissionDeniedException(String message) {
		super(message);
	}

}

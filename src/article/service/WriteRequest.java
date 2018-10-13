package article.service;

import java.util.List;
import java.util.Map;



public class WriteRequest {

	
	// articleId, wdate, udate, readCount는 다 처음 게시될 때 자동생성되거나 0인 변수들이기 때문에
	private int userId;
	private String userName;
	private String title;
	private String content;
	
	
	
	public WriteRequest(int userId, String title, String content) {
		
		this.userId = userId;
		this.title = title;
		this.content = content;
		
	}


	

	
	






	public int getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	
	
	
	public void validate(Map<String, Boolean> errors) {
		
		// 제목공간이 null이거나 제목공간의 공백을 다 지워도 공백이면
		if(title == null || title.trim().isEmpty()) {
			errors.put("title", true);
		}
	}
	
	
	
	
	
}

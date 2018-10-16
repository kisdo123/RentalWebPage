package comment;

public class CommentDeleteRequest {

	private int comId;
	private int userId;
	
	
	
	public CommentDeleteRequest (int userId, int comId) {
		this.userId = userId;
		this.comId = comId;
	}
	
	public int getComId() {
		return comId;
	}

	public int getUserId() {
		return userId;
	}
	
	
}

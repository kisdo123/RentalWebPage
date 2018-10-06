package login;


//로그인 인증에 사용할 객체
//로그인 상태 확인용 객체
public class LoginUser {

	private int userId;
	private String id;
	private String name;
	
	public LoginUser(int userId, String id, String name) {
		this.userId = userId;
		this.id = id;
		this.name = name;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}

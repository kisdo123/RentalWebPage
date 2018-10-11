package login;


//로그인 인증에 사용할 객체
//로그인 상태 확인용 객체
public class LoginUser {

	private int userId;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String team;
	private String birth;
	
	
	
	public LoginUser(int userId, String id, String name, String pw, String phone, String team, String birth) {
		this.userId = userId;
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.phone = phone;
		this.team = team;
		this.birth = birth;
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
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}
	
}

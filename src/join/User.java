package join;

import java.time.LocalDateTime;

// User테이블에 있는 회원 정보(데이터)를 담을 클래스
public class User {
	
	private int userId; // 회원 번호
	private String id; // 회원 아이디 (닉네임으로 사용)
	private String pw; // 비밀번호
	private String name; // 회원 이름
	private String phone; // 연락처 
	private String team; // 소속
	private String birth; // 생년월일
	private LocalDateTime jdate; //가입날짜
	
	public User() {}
	
	
	
	// 생성자
	// 하나는 DB에서 가져올 때 사용하는 생성자
	// 8개의 데이터를 담을 수 있게 만들면 되지만
	public User(int userId, String name, String id, String pw, String phone, String team, String birth, LocalDateTime jdate) {
		
		this.userId = userId;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.team = team;
		this.birth = birth;
		this.jdate = jdate;
	}

	
	
	// 또 하나는 입력할 때 쓸 생성자
	// 자동으로 들어가는 데이터를 넣을 필요가 없어서 (userId와 jdate는 자동입력)
	public User(String name, String id, String pw, String phone, String team, String birth) {
		
		this.name = name;
		this.id = id;
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
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public LocalDateTime getJdate() {
		return jdate;
	}

	public void setJdate(LocalDateTime jdate) {
		this.jdate = jdate;
	}



	// 입력받은 데이터(pw)와 기존 DB에 저장되있는 비밀번호(password)가 같은지 판단하는 메소드
	public boolean matchPassword(String password) {
		return pw.equals(password);
	}

	

}

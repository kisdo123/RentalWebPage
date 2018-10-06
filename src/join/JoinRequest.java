package join;

import java.util.Map;

// Form에서 받은 데이터의 무결성을 체크하는 클래스
public class JoinRequest {
	
	// Form 에서 입력되는 데이터
	private String id;
	private String name;
	private String pw;
	private String confirmPw;
	private String phone;
	private String team;
	private String birth;
	

	
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
	public String getConfirmPw() {
		return confirmPw;
	}
	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
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
	
	
	
	
	// 패스워드가 같은지 확인하는 메소드
	public boolean isEqPassword() {
		
		return pw != null && pw.equals(confirmPw);
	}
	
	

	// 입력받은 데이터가 비어있는지 확인하는 메소드 
	// 결과를 보여줄 에러맵, 값, Form필드이름을 인자로 받는 메소드
	public void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		
		// 여기서 말하는 value는 아래 validata 메소드에서
		// checkEmpty에 value값으로 들어오는데
		// 만약에 Form에서 아이디가 입력된 상태
		// 즉 value값이 존재하는 상태, value값이 Empty가 아닌상태이면
		// 이 전체적인 메소드는 실행되지 않는다
		// 이 메소드는 단순히 데이터가 비어있는지 아닌지만을 확인
		if(value == null || value.isEmpty()) {
		
			// 애러 발생 로직
			// 비거나 문제가 있다면 그 결과를 화면으로 다시 전송하기 위해서
			// 객체에 담아서 결과 화면에 보내줌
			errors.put(fieldName, true);
		}
	}
	
	
	

	
	// 데이터가 제대로 들어왔는지 확인하는 메소드
	public void validata(Map<String, Boolean> errors) {
		
		// 입력받은 값이 비어있는지 확인해서 있다면 errors true를 넣음
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, pw, "pw");
		checkEmpty(errors, confirmPw, "confirmPw");
		checkEmpty(errors, team, "team");
		checkEmpty(errors, phone, "phone");
		checkEmpty(errors, birth, "birth");

		// confirmPassword 가 입력이 된 상태라면
		if(!errors.containsKey("confirmPw")) {
			
			// 두개의 비밀번호 비교
			// 비밀번호가 같지 않다면
			if(!isEqPassword()) {
				
				// 문제가 있다면 Map객체에 put으로 내용이 추가됨
				errors.put("notMatch", true);
			}
		}
		
		
	}
	
	

}

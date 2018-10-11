package change;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import join.JoinRequest;
import login.LoginUser;
import main.exception.InvalidPasswordException;
import main.exception.UserNotFoundException;
import main.handler.CommandHandler;



public class ChangeHandler implements CommandHandler{

	
	private static final String FORM_VIEW = "/WEB-INF/view/changeForm.jsp";
	
	
	
	// 입력받은 데이터(비밀번호)가 문제가 있는지 무결성 체크 후
	// 비밀번호 화면으로 돌려보내거나, 정보수정 화면으로 돌려보냄
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equalsIgnoreCase("GET")) {
				
			return processForm(req,resp);
				
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
				
			return processSubmit(req,resp);
				
		}else {
				
			// 둘다 아니라면 상태오류 메세지
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}

	}

	
	
	// 비밀번호 변경화면으로 돌려보냄
	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		
		return FORM_VIEW;
	}
	
	
	
	


	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		
		// FORM_VIEW로 부터 입력받은 비밀번호의 무결성 검증을 해야하고
		// 세션에 있는 loginUser객체로부터 id 정보를 받아오고
		// 서비스를 이용해서 비밀번호 변경 수행
		LoginUser loginUser = (LoginUser)req.getSession().getAttribute("loginUser");
		
		
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		
		
		
		
		// 사용자에게 두개의 비밀번호를 입력받을 것
		// 기존의 비밀번호
		String oldPw = req.getParameter("oldPw");
		// 바꿀 비밀번호
		String newPw = req.getParameter("newPw");
		// 바꿀이름
		String name = req.getParameter("name");
		// 바꿀 연락처
		String phone = req.getParameter("phone");
		// 바꿀 소속
		String team = req.getParameter("team");
		

		
		// 각 데이터가 비어있으면 errors에 해당하는 이름의 변수를 put한다
		if(name == null || name.isEmpty()) {
			errors.put("name", true);
		}
		if(oldPw == null || oldPw.isEmpty()) {
			errors.put("oldPw", true);
		}
		if(newPw == null || newPw.isEmpty()) {
			errors.put("newPw", true);
		}
		if(phone == null || phone.isEmpty()) {
			errors.put("phone", true);
		}
		if(team == null || team.isEmpty()) {
			errors.put("team", true);
		}
		
		

				
		req.setAttribute("errors", errors);
		
		

		
		// 에러가 생성됬다면
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		// 여기까지가 무결성 검사 부분이고
		
		
		try {
			
			ChangeService changeService = ChangeService.getInstance();
			
			changeService.ChangeUserInfo(loginUser.getId(), oldPw, newPw, name, phone, team);
			
			return "/WEB-INF/view/changeSuccess.jsp";		
			
		}catch(InvalidPasswordException e) {
			
			// 입력한 비밀번호와 OldPw와 일치하지 않다면
			errors.put("wrongOldPw", true);
			return FORM_VIEW;
			
		}catch(UserNotFoundException e) {
			
			// 잘못된 요청 정보라고 던져준다
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}

	}
		
		

}

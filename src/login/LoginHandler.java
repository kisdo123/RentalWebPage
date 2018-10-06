package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import join.User;
import main.exception.LoginFailException;
import main.handler.CommandHandler;

public class LoginHandler implements CommandHandler{

	private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 메소드가 get인지 대소문자 구분없이 비교
		// GET 으로 넘어오는 경우엔 true 를 반환하고
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req,resp);
		
		// POST 로 넘어오는 경우엔 true를 반환 하겠죠
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req,resp);
			
		}else {
			// 상태이상
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
		
		
	}

	// Form화면을 반환함
	// 여기서 반환주소는
	// BoardControllerServletd 컨트롤러에서 viewPage로 넘어가게 된다
	// get방식으로 /WEB-INF/view/loginForm.jsp
	// 즉 loginForm jsp가 있는 위치의 주소값을 받아서 결과화면으로 넘겨주게 된다
	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		return FORM_VIEW;
	}
	
	
	
	
	
	// 비어있지 않다면 서비스를 통해서 로그인 인증을 하고
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
	
		// 서비스 객체 받기
		LoginService loginService = LoginService.getInstance();
		

		// request 에서 파라미터를 받음
		
		// trim메소드를 사용할 경우 null값일 때 오류가 발생하는데
		// String 값이 비어있을 때는 null로 비어있지 않을 때는 trim
		String id = ((req.getParameter("id")==null)? null : req.getParameter("id").trim());
		String pw = ((req.getParameter("pw")==null)? null : req.getParameter("pw").trim());		
		
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();

	

		// errors라는 변수이름의 errors Map객체를 request에 셋팅해준다
		req.setAttribute("errors", errors);
		
		

		// 비었는지 안비었는지 확인하고
		if(id == null || id.isEmpty()) {
			
			// 아이디가 비어있다면 에러발생
			errors.put("id", true);
		}
		
		
		
		if(pw == null || pw.isEmpty()) {
			// 비밀번호가 비어있다면 에러발생
			errors.put("pw", true);
		}
		
		
	
		
	
		// 비어있지 않다면 로그인화면 반환
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}

		// 그리고 성공하면 auth객체를 만들어서 세션에 넣고
		// 실패하면 에러에 실패정보를 넣고 로그인 화면으로 다시 보냄
		try {
		
			// 서비스를 통해서 로그인을 실행 및 검증
			// 문제가 발생시 Exception가 발생하고 바로 catch로 들어감
			LoginUser loginUser = loginService.login(id, pw);
		
			// 성공시 세션에 로그인한 사용자의 정보를 담음
			req.getSession().setAttribute("loginUser", loginUser);			
			resp.sendRedirect(req.getContextPath() + "/loginIndex.jsp");
			
			return null;
		
		
		}catch(LoginFailException e) {
			
			System.out.println(e.getMessage());
			errors.put("idOrPwNotMatch", true);
			return FORM_VIEW;
			
		}
	}
}

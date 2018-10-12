package join;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.exception.DuplicationException;
import main.handler.CommandHandler;

// 사용자의 요청을 받아서 Form 화면을 보여줄지, 데이터로 화원가입을 시킬지 구분하여 처리
public class JoinHandler implements CommandHandler{

	// 회원가입 페이지 주소를 상수로 만듬
	private static final String FORM_VIEW = "/WEB-INF/view/join.jsp";
	
	
	// 사용자는 url board/join →
	// Form에서 전송할 action역시 board/join
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		if(req.getMethod().equalsIgnoreCase("GET")) {
			
			// GET방식으로 요청이 오면 processForm으로 반환하고
			return processForm(req,resp);
			
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			
			// POST방식으로 요청이 오면 회원가입을 처리하고 결과를 보여주는 뷰로 리턴
			return processSubmit(req,resp);
			
		}else {
			
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			
		}
		
		return null;
	}


	
	


	
	
	// 사용자로부터 url로 GET받아 Form화면을 출력
	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		
		return FORM_VIEW;
	}

	
	// 사용자로부터 데이터를 입력받아
	// submit 버튼을 클릭해서 데이터가 넘어왔을때 실행하는 메소드 부분
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) {
		
		// Form에서 파라미터를 통해서 입력받은 데이터를 JoinRequest 객체에 담음
		JoinRequest joinRequest = new JoinRequest();
		
		// JoinRequest를 통해 입력받은 데이터가 제대로 입력되었는지
		// 잘못된 정보를 넣어놓기 위해 errors라는 Map객체를 생성 
		Map<String, Boolean> errors = new HashMap<String, Boolean>(); 
		
		
		
		// joinRequest객체에 입력받은 데이터를 넣어준다
		// 이 과정에서 어떤 데이터는 들어있고, 어떤 데이터는 안들어있을 수 있다
		joinRequest.setId((req.getParameter("id")));
		joinRequest.setName((req.getParameter("name")));
		joinRequest.setPw(req.getParameter("pw"));
		joinRequest.setConfirmPw(req.getParameter("confirmPw"));
		joinRequest.setPhone(req.getParameter("phone"));
		joinRequest.setTeam(req.getParameter("team"));	
		joinRequest.setBirth(req.getParameter("birth"));
		

		

		// errors는 화면에 표출해주기 위해 request 속성값으로 넣어줌
		
		// 최종적으로 BoardControllerServlet에 dispatcher에서 request를 넘겨주는데 여기에 추가가 됨
		req.setAttribute("errors", errors);
		
		// 데이터 검증, 무결성 체크
		// 패스워드와 패스워드 확인 두개가 서로 같은지를 확인

		// validata로 errors 맵객체를 넘겨줌
		joinRequest.validata(errors);
		
		// validata메소드를 실행하면, errors 맵에는 잘못된 데이터필드명(키)과 함께 true value값이 추가!
		
		// errors가 비어있지 않다면
		// errors가 있었다는 얘기 (validata메소드 참고 errors.put)
		// 잘못들어 왔다면 다시 joinForm.jsp로 반환
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		// 그래서 잘 입력되면 JoinService를 통해서 회원가입 로직 수행
		JoinService joinService = JoinService.getInstance();
		
		try {
		
			// join 메소드는 아이디가 중복일 때 예외를 여기로 던져줌!
			joinService.join(joinRequest);
			
			// 성공화면 반환 
			return "/WEB-INF/view/joinSuccess.jsp";
		
		}catch(DuplicationException e) {
			
			// 아이디가 중복일 때 service에서 발생시킨 예외를 받아서 처리해줌!
			errors.put("duplicateId", true);

			return FORM_VIEW;
			
		}
	}
}

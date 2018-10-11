package login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.handler.CommandHandler;

public class LogoutHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		// 세션 객체를 생성
		HttpSession session = req.getSession(false);
		
		if(session != null) {			
			// 세션을 날리고!
			session.invalidate();
		}
				
		return "/WEB-INF/view/loginPage.jsp";
	}
	
}

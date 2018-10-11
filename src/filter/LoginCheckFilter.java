package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {


	@Override
	public void doFilter(ServletRequest sreq, ServletResponse sresp, FilterChain chain)
			throws IOException, ServletException {
		
		// 로그인 했는지 확인
		// 세션을 받아서 세션이 살아있는지 확인
		// sreq.getSession이 존재하지 않는다
		// 그래서 부모껄 사용
		HttpServletRequest request = (HttpServletRequest)sreq;
		HttpSession session = request.getSession(false);

		if(session == null || session.getAttribute("loginUser") == null) {
					
			HttpServletResponse response = (HttpServletResponse)sresp;
			
			// 세션이 없다면 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/login");
					
		}else {
					
			// 세션이 있으면? 요청한 기능이 있는 곳으로 보내버림
			chain.doFilter(sreq, sresp);
					
		}

	}

	
	

	
	@Override
	public void init(FilterConfig arg0) throws ServletException {}

	@Override
	public void destroy() {}
}

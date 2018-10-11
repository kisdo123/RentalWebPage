package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// 인코딩을 해주는 필터
public class CharacterEncodingFilter implements Filter {

	private String encoding;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		
		// web.xml의 설정 값으로 인코딩을 설정하는데
		encoding = config.getInitParameter("encoding");
		
		// 인코딩이 없다면
		if(encoding == null) {
			
			// 기본으로 utf-8로 하겠다
			encoding = "utf-8";
		}
		
	}
	
	
	
	
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("encoding filter start");
		
		
		
		// 인코딩을 설정에서 가져오게 함
		req.setCharacterEncoding(encoding);
		chain.doFilter(req, resp);
		
		
		
		//System.out.println("encoding filter end");
	}

	
	
	
	
	
	
	
	
	@Override
	public void destroy() {}

}

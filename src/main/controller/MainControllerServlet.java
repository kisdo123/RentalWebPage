package main.controller;

// common.controller 패키지 생성 후
// 핸들러 정보를 담고있는 프로퍼티에서 커맨드와 핸들러클래스 정보를 가져와야함
// URI 요청에 따라 핸들러 객체로 process 메소드를 실행!


import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.handler.CommandHandler;
import main.handler.NullHandler;


public class MainControllerServlet extends HttpServlet {

	
	// 여기서는 get, post를 하나로 통합해서 작업을 하고
	// 추후에 핸들러에서 구분을 하여 로직을 분기처리 할 예정
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}


	private Map<String, CommandHandler> hMap = new HashMap<>();
	
	
	@Override
	public void init() throws ServletException {
		
		// 핸들러의 커맨드 명령어 정보가 있는 프로퍼티 파일을 프로퍼티 객체에 담기
		Properties prop = new Properties();
		
		// getInitParameter("handlerConfigFile")를 통해 프로퍼티 파일의 위치값을 가져오고
		// getRealPath를 통해 실제 시스템 경로를 가져옴
		String confPath = getServletContext().getRealPath(getInitParameter("handlerConfigFile"));
		//System.out.println("시스템 프로퍼티 파일주소 : " + confPath);
		
		
		// 파일에서 프로퍼티 내용을 가져옴
		try(FileReader fr = new FileReader(confPath)){
			
			prop.load(fr); // <String, String> -> <명령어, 핸들러클래스풀네임>
			
			// 프로퍼티 안에 내용을 보려면
			//System.out.println("프로퍼티의 내용");
			
			// 프로터티 파일 내용을 전부 읽어옴
			//prop.list(System.out);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		

		// 프로퍼티에 있는 정보를 통해 객체를 생성!
		// 프로퍼티에 담긴 아이를 hMap객체로 만들어서 담음
		for(Object key : prop.keySet()) {
			
			String command = (String) key;
			
			try {
				
				// 핸들러 주소 순서대로 받아온다
				Class handlerClass = Class.forName(prop.getProperty(command));

			
				CommandHandler handlerInstance
			
					= (CommandHandler) handlerClass.getDeclaredConstructor().newInstance();
					
				
				// 사이좋게 맵에 담아둠
				hMap.put(command, handlerInstance);
				
				}catch (ClassNotFoundException | InstantiationException | IllegalAccessException | InvocationTargetException |
						SecurityException | IllegalArgumentException | NoSuchMethodException e) {
					e.printStackTrace();
				}
				
		}
		
		//System.out.println("필터실행 아직");
	}
	

	
		// 실제로 동작하는 부분!!
		// 컨트롤러(클라이언트)에서 이부분이 실행되면 서버로 request요청을 하기되는데
		// 이때 Filter가 실행된다
		private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			//System.out.println("이 메소드부터 필터실행");
			
			// 명령을 command 파라미터로 받고
			// String command = req.getRequestURI();
			
			String command = req.getRequestURI();
			
			
			//System.out.println("command : " + command);
			// /RentalWebPage/command 로 반환을 하는데!!
			// 이 부분으로만 각각의 명령을 처리하게 바꾸면 된다
			// 즉!! URL부분을 각각의 명령에 따라 변경하면됨!
			
			//System.out.println("contextPath : " + req.getContextPath());
			//RentalWebPage 이부분
			
			
			
			// 프로젝트 주소를 잘라낼 것!
			
			// /RentalWebPage (프로젝트명) 이 글자 통째로의 인덱스 값이 0일때
			// 즉 이 프로젝트명의 통째값이 처음에 위치했을 때
			if(command.indexOf(req.getContextPath()) == 0) {
				command = command.substring(req.getContextPath().length());
				// substring(시작 인덱스) -> 시작인덱스 뒤부터 ~ 끝까지를 문자열! 을 반환
				// 즉 /RentalWebPage의 길이만큼을 뺀 뒤에 문자열을 반환
				
				// charAt(인덱스) → 해당 인덱스의 문자! 를 반환
			}
			
			//System.out.println("수정 후 command : " + command);
			
			
			
			
			// 핸들러 객체를 담을 핸들러 변수
			CommandHandler handler = null;
			

			// Null일때 null핸들러로 빈 페이지를 반환
			if(command == null) {
				
				// 명령어가 없을 때 NullHandler를 통해 처리!
				handler = new NullHandler();
				
			}else {
				
				// 명령어가 들어오면 해달 명령어를 키로하는 맵에서 핸들러 객체를 받아옴!
				handler = hMap.get(command);
			}
			
			
			
			// 핸들러로부터 결과 페이지 정보를 받아 보여줄 화면주소
			String viewPage = null;
			
			try {
				
				// viewPage에 페이지 정보를 받고
				viewPage = handler.process(req, resp);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			if(viewPage != null) {
				
				// 결과 페이지로 전환시킴
				RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
				dispatcher.forward(req, resp);
			}
		}
}

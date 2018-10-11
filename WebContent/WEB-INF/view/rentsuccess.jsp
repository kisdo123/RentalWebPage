<%@page import="dao.UserDao"%>
<%@page import="join.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="login.LoginUser"%>
<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

	//뒤로가기 못하게 막음
	history.pushState(null, null, location.href);
	window.onpopstate = function() {
		history.go(1);
	};
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		LoginUser loginUser = (LoginUser)request.getSession().getAttribute("loginUser");
		String username = loginUser.getName();
		
		//roomdate를 가져오는변수
		String roomdate = request.getParameter("dateroom");

		//time을 getParameterValues 가져오는변수
		String timeStr[] = request.getParameterValues("time");
		//int형으로 변환해서 넣기위한 변수
		int[] time = new int[timeStr.length];
		//str로 바꿔 넣기 위한 변수
		String realTime = "";
		
		//String배열을  int배열로 변환후 저장
		for (int i = 0; i < timeStr.length; i++) {
			time[i] = Integer.parseInt(timeStr[i]);
		}
		
		for (int j = 0; j < time.length; j++) {
			switch (time[j]) {
			case 1:
				realTime += " AM 09:00 ~ AM 10:00 " + "<br>";
				break;
			case 2:
				realTime += " AM 10:00 ~ AM 11:00 " + "<br>";
				break;
			case 3:
				realTime += " AM 11:00 ~ PM 12:00 " + "<br>";
				break;
			case 4:
				realTime += " PM 12:00 ~ PM 01:00 " + "<br>";
				break;
			case 5:
				realTime += " PM 01:00 ~ PM 02:00 " + "<br>";
				break;
			case 6:
				realTime += " PM 02:00 ~ PM 03:00 " + "<br>";
				break;
			case 7:
				realTime += " PM 03:00 ~ PM 04:00 " + "<br>";
				break; 
			case 8:
				realTime += " PM 04:00 ~ PM 05:00 " + "<br>";
				break;
			case 9:
				realTime += " PM 05:00 ~ PM 06:00 " + "<br>";
				break;
			}
		}
	%>
	<%= username %>님 <br>
	<%= roomdate + "<br>" + realTime %>
	대관 신청되었습니다.<br>
	<a href="main.jsp">[메인화면으로 돌아가기]</a>
</body>
</html>
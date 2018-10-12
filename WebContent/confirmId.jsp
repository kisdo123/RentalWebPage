<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경 성공화면</title>
<script type="text/javascript">
function end(){
    self.close();   //자기자신창을 닫습니다.
}
</script>
</head>
<body>
<%
	String id = request.getParameter("id");
	UserDao userDao = UserDao.getInstance();
	boolean result = userDao.confirmId(id);

	if(result) { %>
	
	<center>
	<br><br><br><br>
	<h3>이미 사용중인 ID입니다.</h3>
	<button onclick="end()">종료</button>
	</center>
	<% } else { %>
	
	<center>
	<br><br><br>
	<h3>입력하신 <%= id %> 는 <br> 사용 할 수 있는 ID입니다.</h3>
	<button onclick="end()">종료</button>
	</center>
	<% } 
	
%>
</body>
</html>
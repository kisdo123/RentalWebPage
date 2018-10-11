<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공화면</title>
</head>
<body>

<c:if test="${! empty loginUser.name }">
	<br>
	${loginUser.name }님
	<button type="button" onclick="location.href='UserInfo.jsp' ">마이페이지</button>
	<button type="button" onclick="location.href='logout' ">로그아웃</button>
</c:if>

<c:if test="${empty loginUser.name }">
</c:if>

</body>
</html>
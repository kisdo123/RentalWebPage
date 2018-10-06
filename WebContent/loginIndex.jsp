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
${loginUser.name }님, 안녕하세요 <br><br>
 <a href="logout">[로그아웃하기]</a><a href="changePw">[회원정보 변경]</a>
</c:if>

<c:if test="${empty loginUser.name }">
${loginUser.name }님, 안녕하세요 <br><br>
<a href="join">[회원가입하기]</a><a href="login">[로그인하기]</a>
</c:if>

</body>
</html>
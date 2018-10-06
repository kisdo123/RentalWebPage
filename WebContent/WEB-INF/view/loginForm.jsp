<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<form action="login" method="post">

<p>
	<input type="text" name="id" maxlength="20" value="${param.id }" placeholder="아이디">
	<c:if test="${errors.id }">아이디를 입력하세요</c:if>
	<c:if test="${errors.noid }">없는 ID(닉네임)입니다</c:if>
</p>

<p>
	<input type="password" name="pw" maxlength="20" value="${param.pw }" placeholder="비밀번호">
	<c:if test="${errors.pw }">비밀번호를 입력하세요</c:if>
</p>

<c:if test="${errors.idOrPwNotMatch }">아이디와 비밀번호가 맞지 않습니다</c:if>

<input type="submit" value="로그인">
</form>

</body>
</html>
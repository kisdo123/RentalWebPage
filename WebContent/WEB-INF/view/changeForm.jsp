<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경화면</title>
</head>
<body>

<form action="changePw" method="post">
<p>
	<input type="text" name="name" placeholder="이름">
	<c:if test="${errors.name }">이름을 입력하세요</c:if>
</p>
<p>
	<input type="password" name="oldPw" placeholder="현재 비밀번호">
	<c:if test="${errors.oldPw }">현재 비밀번호를 입력하세요</c:if>
	<c:if test="${errors.wrongOldPw }">잘못된 비밀번호 입니다</c:if>
</p>

<p>
	<input type="password" name="newPw" placeholder="새 비밀번호">
	<c:if test="${errors.newPw }">새 비밀번호를 입력하세요</c:if>
</p>
<p>
	<input type="text" name="phone" placeholder="연락처">
	<c:if test="${errors.phone }">연락처를 입력하세요</c:if>
</p>
<p>
	<input type="text" name="team" placeholder="소속">
	<c:if test="${errors.team }">소속을 입력하세요</c:if>
</p>

<input type="submit" value="회원정보 변경">	
<a href="loginIndex.jsp">회원정보 변경 취소</a>

</form>

</body>
</html>
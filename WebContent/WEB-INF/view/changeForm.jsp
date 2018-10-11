<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경화면</title>
</head>
<body>

<form action="change" method="post">

<p>
	ID : <input type="text" name="id" value="${loginUser.id }" readonly="readonly">
</p>


<p>
	이름 : <input type="text" name="name" value="${loginUser.name }" readonly="readonly">
</p>


<p>
	현재 비밀번호 : <input type="text" name="oldPw" value="${loginUser.pw }">
	<c:if test="${errors.oldPw }">현재 비밀번호를 입력하세요</c:if>
	<c:if test="${errors.wrongOldPw }">잘못된 비밀번호 입니다</c:if>
</p>

<p>
	새 비밀번호 : <input type="password" name="newPw" placeholder="새 비밀번호">
	<c:if test="${errors.newPw }">새 비밀번호를 입력하세요</c:if>
</p>
<p>
	연락처 : <input type="text" name="phone" value="${loginUser.phone }" placeholder="연락처">
	<c:if test="${errors.phone }">연락처를 입력하세요</c:if>
</p>
<p>
	소속 : <input type="text" name="team" value="${loginUser.team }" placeholder="소속">
	<c:if test="${errors.team }">소속을 입력하세요</c:if>
</p>
<p>
	생년월일 : <input type="text" name="team" value="${loginUser.birth }" placeholder="생년월일">
	<c:if test="${errors.birth }">소속을 입력하세요</c:if>
</p>


<input type="submit" value="회원정보 변경">	

</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
</head>
<body>


<form action="join" method="post">

<!-- 여기서 파라미터값을 입력하면 param값은 JoinHandler에 processSubmit 메소드의 getParam..로 넘어간다  -->
<p>
	<input type="text" name="id" value="${param.id }" placeholder="아이디(닉네임)">
	<c:if test="${errors.id }">ID(넥네임)를 입력하세요</c:if>
	<c:if test="${errors.duplicateId }">이미 사용중인 아이디입니다</c:if>
</p>
<p>
	<input type="text" name="name" value="${param.name }" placeholder="이름">
	<c:if test="${errors.name }">이름을 입력하세요</c:if>
</p>
<p>

	<input type="password" name="pw" value="${param.pw }" placeholder="비밀번호">
	<c:if test="${errors.pw }">비밀번호를 입력하세요</c:if>
</p>

<p>
	<input type="password" name="confirmPw" value="${param.confirmPw }" placeholder="비밀번호 확인">
	<c:if test="${errors.confirmPw }">비밀번호 확인을 입력하세요</c:if>
	<c:if test="${errors.notMatch }">비밀번호가 확인과 일치하지 않습니다</c:if>
</p>

<p>
	<input type="text" name="phone" value="${param.phone }" placeholder="연락처">
	<c:if test="${errors.phone }">연락처를 입력하세요</c:if>
</p>
<p>
	<input type="text" name="team" value="${param.team }" placeholder="소속">
	<c:if test="${errors.team }">소속을 입력하세요</c:if>
</p>
<p>
	<input type="text" name="birth" value="${param.birth }" placeholder="생년월일">
	<c:if test="${errors.birth }">생년월일을 입력하세요</c:if>
</p>


<p>
	<input type="submit" value="가입">
	<a href="login">[로그인하기]</a>
</p>

</form>


</body>
</html>
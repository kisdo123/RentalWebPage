<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
<style type="text/css">
	table{border="1px" width="500"}
</style>
</head>
<body>


<form action="join" method="post">
<table border="1px" width="550">
<!-- 여기서 파라미터값을 입력하면 param값은 JoinHandler에 processSubmit 메소드의 getParam..로 넘어간다  -->

	<tr>
		<td>닉네임(id)</td>
		<td><input type="text" name="id" value="${param.id }" placeholder="닉네임" maxlength="10"></td>
		<c:if test="${errors.id }">ID(넥네임)를 입력하세요</c:if>
		<c:if test="${errors.duplicateId }">이미 사용중인 아이디입니다</c:if>
	</tr>
	
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${param.name }" placeholder="이름" maxlength="10"></td>
		<c:if test="${errors.name }">이름을 입력하세요</c:if>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" value="${param.pw }" placeholder="비밀번호 4자리이상, 12자리이하" minlength="4" maxlength="12"></td>
		<c:if test="${errors.pw }">비밀번호를 입력하세요</c:if>
	</tr>

	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="confirmPw" value="${param.confirmPw }" placeholder="비밀번호 확인" minlength="4" maxlength="12"></td>
		<c:if test="${errors.confirmPw }">비밀번호 확인을 입력하세요</c:if>
		<c:if test="${errors.notMatch }">비밀번호가 확인과 일치하지 않습니다</c:if>
	</tr>
	
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" value="${param.phone }" placeholder="01012345678 (-)하이픈 제외" pattern="[0-1]{3}[0-9]{4}[0-9]{4}"></td>
		<c:if test="${errors.phone }">연락처를 입력하세요</c:if>
	</tr>
	
	<tr>
		<td>소속</td>
		<td><input type="text" name="team" value="${param.team }" placeholder="소속" maxlength="15"></td>
		<c:if test="${errors.team }">소속을 입력하세요</c:if>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input type="text" name="birth" value="${param.birth }" placeholder="생년월일 ex) 020228" pattern="[0-9]{2}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}"></td>
		<c:if test="${errors.birth }">생년월일을 입력하세요</c:if>
	</tr>


</table>
<p>
	<input type="submit" value="가입">
	<a href="login">[회원가입하기]</a>
</p>

</form>


</body>
</html>
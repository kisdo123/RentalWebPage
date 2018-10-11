<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<script type="text/javascript">

	function check(){
		
		if(!document.joinform.id.value){
			alert("ID를 입력하세요");
			return false;
		}
		
		if(!document.joinform.name.value){
			alert("이름을 입력하세요");
			return false;
		}
		
		if(!document.joinform.pw.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if(!document.joinform.confirmPw.value){
			alert("비밀번호 확인을 입력하세요");
			return false;
		}
		
		
		if(document.joinform.pw.value != document.joinform.confirmPw.value){
			alert("비밀번호가 일치하지 않습니다")
		}
		
		if(!document.joinform.phone.value){
			alert("연락처를 입력하세요");
			return false;
		}
		
		if(!document.joinform.team.value){
			alert("소속을 입력하세요");
			return false;
		}
		
		if(!document.joinform.birth.value){
			alert("생년월일을 입력하세요");
			return false;
		}
		
		
		

		
	}


	
	// 아이디 중복체크 화면open
	function checkId(){
		
		if(document.joinform.id.value == ""){
			alert("ID를 입력하세요");
			return;
		}
		
		 url = "confirmId.jsp?id=" + document.joinform.id.value;
         open(url, "confirm",
        	"width=300, height=200, resizable = no, scrollbars = no"); 
        
     }

	
	
  
</script>




</head>
<body>


<form action="join" method="post" name="joinform" onsubmit="return check()">
<table border="1">
<!-- 여기서 파라미터값을 입력하면 param값은 JoinHandler에 processSubmit 메소드의 getParam..로 넘어간다  -->

	<tr>
		<td>닉네임(id)</td>
		<td colspan="2"><input type="text" name="id" placeholder="닉네임" value="${param.id }" maxlength="10">
		<input type="button" value="중복확인" name="confirm_id" onclick="checkId(this.form)">
		
		
		<%-- <c:if test="${errors.duplicateId }">아이디 중복 체크를 해주세요</c:if></td> --%>
		
	</tr>
	
	<tr>
		<td>이름</td>
		<td colspan="2"><input type="text" name="name" value="${param.name }" placeholder="이름" maxlength="10">
		
		<%-- <c:if test="${errors.name }">이름을 입력하세요</c:if></td> --%>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td colspan="2"><input type="password" name="pw" value="${param.pw }" placeholder="비밀번호 4자리이상, 12자리이하" maxlength="12">
		
		<%-- <c:if test="${errors.pw }">비밀번호를 입력하세요</c:if></td> --%>
	</tr>

	<tr>
		<td>비밀번호 확인</td>
		<td colspan="2"><input type="password" name="confirmPw" value="${param.confirmPw }" placeholder="비밀번호 확인" maxlength="12">
		
		
		<%-- <c:if test="${errors.confirmPw }">비밀번호 확인을 입력하세요</c:if> --%>
		<%-- <c:if test="${errors.notMatch }">비밀번호가 확인과 일치하지 않습니다</c:if></td> --%>
	</tr>
	
	<tr>
		<td>연락처</td>
		<td colspan="2"><input type="text" name="phone" value="${param.phone }" placeholder="01012345678 (-)하이픈 제외" pattern="[0-1]{3}[0-9]{4}[0-9]{4}">
		
		<%-- <c:if test="${errors.phone }">연락처를 입력하세요</c:if></td> --%>
	</tr>
	
	<tr>
		<td>소속</td>
		<td colspan="2"><input type="text" name="team" value="${param.team }" placeholder="소속" maxlength="15">
		<%-- <c:if test="${errors.team }">소속을 입력하세요</c:if></td> --%>
	</tr>
	<tr>
		<td>생년월일</td>
		<td colspan="2"><input type="text" name="birth" value="${param.birth }" placeholder="생년월일 ex) 020228" pattern="[0-9]{2}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}">
		<%-- <c:if test="${errors.birth }">생년월일을 입력하세요</c:if></td> --%>
	</tr>


</table>
<p>
	<input type="submit" value="가입">
	<a href="login">[로그인]</a>
</p>

</form>


</body>
</html>
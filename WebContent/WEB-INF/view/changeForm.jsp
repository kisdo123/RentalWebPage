<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경화면</title>
	<script type="text/javascript">
	
	function check(){
		
		if(!document.change.newPw.value){
			alert("새 비밀번호를 입력하세요");
			return false;
		}
		
	}
	</script>
	

<style type="text/css">
	body{
			margin: 0;
			font-size: small;
			text-align: center;
			font-family:'Open Sans';
		}		

		input{
			width: 300px;
			height: 30px;
		}
		table{
		    border-collapse: collapse;

		}
		.info{
			width: 100px;
			text-align: left;
		}

		.outer-container {
		    position : absolute;
		    display: table;
		    width: 100%;
		    height: 100%;
		    background: #ccc;
		}

		.inner-container {
		    display: table-cell;
		    vertical-align: middle;
		    text-align: center;
		}

		.centered-content {
		    display: inline-block;
		    background: #fff;
		    padding : 20px;
		    border : 1px solid #000;
		}
		
		.logo{ padding-bottom: 17px; }
		.logbtn{ background-color: black; color: white; font-size: 0.9em; 	width: 300px;
			height: 45px; 
				margin-top: 15px;}
		.logtitle{ font-size: 0.9em; }
		.cancel{ font-size: small; padding-top: 10px; }

</style>
</head>
<body>


<form action="change" method="post" name="change" onsubmit="return check()">
<div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">
	
	

	<table>
		<tr>
			<!-- 로그인 위에 이미지가 들어가는 자리 -->
			<td class="logo" colspan="2"><img src="image/하자.png" width="180px"></td>
		</tr>
		<tr>
			<td class="info">닉네임(ID)</td>
			<td>
				<!-- 아이디가 입력되는 부분 -->
				<span class="id">
					<input type="text" name="id" value="${loginUser.id }" readonly="readonly">
				</span>
			</td>
		</tr>

	<tr>

		<td class="info">이름</td>
		<td><input type="text" name="name" value="${loginUser.name }" readonly="readonly"></td>
	</tr>
	
	<tr>
		<td class="info">현재 비밀번호</td>
		<td><input type="text" name="oldPw" value="${loginUser.pw }"></td>
	</tr>

	<tr>
		
		<td class="info">새 비밀번호</td>
		<td><input type="password" name="newPw" placeholder="새 비밀번호" minlength="4" maxlength="12"></td>
	</tr>
		
	<tr>
		<td class="info">연락처</td>
		<td><input type="text" name="phone" value="${loginUser.phone }" placeholder="연락처"></td>
	</tr>
	
	<tr>
		<td class="info">소속</td>
		<td><input type="text" name="team" value="${loginUser.team }" placeholder="소속" maxlength="15"></td>
	</tr>
	<tr>
		<td class="info">생년월일</td>
		<td><input type="text" name="team" value="${loginUser.birth }" placeholder="생년월일" readonly="readonly"></td>
	</tr>	


		<tr>
			<td colspan="2">
				<button class="logbtn" value="회원정보 변경">회원정보 변경</button>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>						
		<tr>
			<td colspan="3"><span class="cancel"><button type="button" onclick="location.href='main.jsp' " style="width: 70pt; height:25pt; background-color: white; color : black; border: solid 1px black; ">변경 취소</button></span></td>
		</tr>


		</table>
	

		</div>
	</div>	
</div>	
</form>

</body>
</html>
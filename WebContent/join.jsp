<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>로그인 | 하자공간</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">
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
		.logbtn{ background-color: black; color: white; font-size: 0.9em; height: 35px; 
				margin-top: 15px;}
		.logtitle{ font-size: 0.9em; }
		.cancel{ border-top: 1px solid black; font-size: small; padding-top: 10px; }
	</style>
</head>
<body>
<form action="" method="post">

<div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">
	
	

	<table>
		<tr>
			<!-- 로그인 위에 이미지가 들어가는 자리 -->
			<td class="logo" colspan="2"><img src="하자.png" width="180px"></td>
		</tr>
		<tr>
			<td class="info">
				<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>닉네임(id)
			</td>
			<td>
				<!-- 아이디가 입력되는 부분 -->
				<span class="id">
					<input type="text" name="id" placeholder="닉네임" maxlength="10">
				</span>
			</td>
		</tr>

	<tr>
		<td class="info">이름</td>
		<td><input type="text" name="name" value="${param.name }" placeholder="이름" maxlength="10"></td>
	</tr>
	
	<tr>
		<td class="info">비밀번호</td>
		<td><input type="password" name="pw" value="${param.pw }" placeholder="비밀번호 4자리이상, 12자리이하" minlength="4" maxlength="12"></td>
	</tr>

	<tr>
		<td class="info">비밀번호 확인</td>
		<td><input type="password" name="confirmPw" value="${param.confirmPw }" placeholder="비밀번호 확인" minlength="4" maxlength="12"></td>
	</tr>
		
	<tr>
		<td class="info">연락처</td>
		<td><input type="text" name="phone" value="${param.phone }" placeholder="01012345678 (-)하이픈 제외" pattern="[0-1]{3}[0-9]{4}[0-9]{4}"></td>
	</tr>
	
	<tr>
		<td class="info">소속</td>
		<td><input type="text" name="team" value="${param.team }" placeholder="소속" maxlength="15"></td>
	</tr>
	<tr>
		<td class="info">생년월일</td>
		<td><input type="text" name="birth" value="${param.birth }" placeholder="생년월일 ex) 020228" pattern="[0-9]{2}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}"></td>
	</tr>	


		<tr>
			<td colspan="2">
				<input class="logbtn" type="button" value="회원가입">
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>						
		<tr>
			<td colspan="2"><span class="cancel">가입취소</span></td>
		</tr>


		</table>
	

		</div>
	</div>	
</div>	
</form>


</body>
</html>

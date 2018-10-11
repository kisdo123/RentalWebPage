<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 하자공간</title>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300"
	rel="stylesheet">
<style type="text/css">
body {
	margin: 0;
	font-size: large;
	text-align: center;
	font-family: 'Open Sans';
}

input {
	width: 300px;
	height: 30px;
}

.id {
	/*width: 300px;  정렬하려는 요소의 넓이를 반드시 지정  
			margin: 0 auto;*/
	
}

.submit {
	background-color: black;
	width: 300px;
	height: 30px;
}

.outer-container {
	position: absolute;
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
	padding: 20px;
	border: 1px solid #000;
}

.logbtn {
	background-color: black;
	color: white;
	font-size: 0.8em;
}

.logtitle {
	font-size: 0.9em;
}

.join {
	border-top: 1px solid black;
	font-size: small;
	padding-top: 10px;
}
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
							<td><span class="logo"><img src="하자.png"></span></td>
						</tr>
						<tr>
							<td>
								<!-- 아이디가 입력되는 부분 --> <span class="id"> <input
									type="text" name="id" placeholder="닉네임" maxlength="10">
							</span>
							</td>
						</tr>
						<tr>
							<td><input type="password" name="pw"
								placeholder="비밀번호 4자리이상, 12자리이하" minlength="4" maxlength="12">
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><input class="logbtn" type="button" value="로그인">
							</td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td><span class="join">회원가입</span></td>
						</tr>


					</table>


				</div>
			</div>
		</div>
	</form>


</body>
</html>

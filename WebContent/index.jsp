<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		text-align: center;
		background-color: background;
	}
	.header{
		text-align: center;
		width: 100%;
		height: 150px;
		background-color: white;
	}
	.inbody{
		background-color: lightgreen;
		border: 1px solid black;
		width: 100%;
		height: 700px;
	}
	.inbody_container{
		display: inline-block;
		float: left;
		width: 49.78%;
		height: 700px;
		border: 1px solid blue;
	}
	.bottom{
		background-color: white;
		width: 100%;
		height: 100px;
	}
</style>
</head>
<body>
<div class="indexView">
	<div class="header">
		<h1><a>대관</a></h1>
	</div>
	<div class="inbody">
		<div class="inbody_container">
			<h2>메뉴</h2>
			<ul>
				<li>대관</li>
				<li>Q&A</li>
				<li>기타</li>
			</ul>
		</div>
		<div class="inbody_container">
			<div>
				<h1>대관 홈페이지입니다 환영합니다.</h1>
				<button>공간 1</button>
				<button>공간 2</button>
				<button>공간 3</button>
				<button>공간 4</button>
				<button>공간 5</button>
				<div>공간 정보 나오는 곳</div>
			</div>
			<div style="border: 1px solid black;">
				ID<input type="text" maxlength="20" placeholder="아디디"><br>
				password<input type="password" maxlength="20" placeholder="비밀번호">
				로그인 폼 넣는 곳
			</div>
		</div>
	</div>
	<div class="bottom">
		<span>연락처 | 문의 | 대표전화 번호</span>
	</div>
</div>
</body>
</html>
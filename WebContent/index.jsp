<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공간대여</title>
<style type="text/css">
	body {
		background-color: #2E2E2E;
	}
	
	li {
		list-style: none;
		display: inline-block;
		text-align: center;
		width: 19.5%;
		height: 30px;
	}
	
	a:link {
		color: red;
		text-decoration: none;
	}
	
	a:visited {
		color: black;
		text-decoration: none;
	}
	
	a:hover {
		color: white;
		text-decoration: underline;
	}
	
	.logo {
		text-align: center;
		color: white;
	}
	
	.menuBar {
		border: 10px double gray;
		border-radius: 5px;
		margin: 0px;
		padding: 0px;
	}
	
	.menu {
		display: inline-block;
		width: 100%;
		height: 30px;
		margin-left: auto;
		margin-right: auto;
		border-radius: 5px;
	}
	
	.menu:hover {
		background-color: black;
		color: white;
	}
</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
	$(document).ready(function(e) {
		$('a').click(function() {
			$('#view').attr('src', $(this).attr('data-url'));
		})
	});
</script>
</head>
<body>
	<!-- View 화면 -->
	<div class="View">

		<!-- 상단 로고 및 메뉴바 -->
		<div class="head">

			<!-- 상단 로고 -->
			<div class="header">

				<!-- 로고 -->
				<h1 class="logo">
					<a href="file:///C:/Users/KOITT-02-A/Desktop/index.html">PLACE
						RENT</a>
				</h1>
			</div>

			<!-- 메뉴바 -->
			<div>
				<ul class="menuBar">
					<li><a data-url="Test.jsp"> <span class="menu">own</span>
					</a></li>
					<li><a data-url="Test2.jsp"> <span class="menu">two</span>
					</a></li>
					<li><a data-url="Test3.jsp"> <span class="menu">three</span>
					</a></li>
					<li><a data-url="Test4.jsp"> <span class="menu">four</span>
					</a></li>
					<li><a data-url="Test5.jsp"> <span class="menu">five</span>
					</a></li>
				</ul>
			</div>

			<!-- 창 바뀌는 곳 -->
			<div>
				<iframe id="view" width="99.5%" height="800" src="Test.jsp"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
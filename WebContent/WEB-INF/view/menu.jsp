<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function menu(val){
	switch (val) {
	case 0:
		location.href="main.jsp"
		break;
	case 1:
		location.href="main.jsp?contentPage=/WEB-INF/view/calendar.jsp";
		break;
	case 2:
		//location.href="Q&A페이지";
		break;
	case 3:
		location.href="main.jsp?contentPage=/WEB-INF/view/daumMap2.jsp";
		break;
	}
}

</script>

<style type="text/css">
#home{
	float: left;
	width: 4%;
	margin: 0 auto;
}

.btndiv{
	float: left;
	width: 32%;
	margin: 0 auto;
}

.btn {
	border: solid 2px #ccc; 
	background-color: #5084C1;
	color: black;
	font-size:15pt;
	font-weight: bolder;
	width: 100%;
	height: 50px;
}
</style>
</head>
<body>
<div>
	<div id="home"><button class="btn" onclick="menu(0)"><img src="image/home.png" style= "width: 45px; height: 45px;" /></button></div>
	<div class="btndiv"><button class="btn" onclick="menu(1)">대관</button></div>
	<div class="btndiv"><button class="btn" onclick="menu(2)">Q&A</button></div>
	<div class="btndiv"><button class="btn" onclick="menu(3)">기타</button></div>
</div>
</body>
</html>
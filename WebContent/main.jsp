<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="/WEB-INF/view/firstPage.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	text-align: center;
	background:#ccc;
	margin: 0 auto;
}

#container{
	width: 80%;
	text-align: center;
	margin: 0 auto;
}

#header {
	text-align:right;
	height:70px;
    background: white;
}

#banner {
	height: 100px;
	background-image: url(image/hajacenter.PNG);
	background: url(image/hajacenter.PNG) no-repeat center center;
	background-size: 100% 100px;
	padding: 1px 0px;
}

#footer {
    bottom:0;
    width:100%;
    height:70px;   
    background:	#FAECC5;
    text-align: left;
    font-size: 10px;
}

#text {
	background:white;
}

</style>

</head>
<body>
	<div id="container">
	    <div id="header"><jsp:include page="/WEB-INF/view/loginIndex.jsp"/></div>
		<div id="banner"> <h1>하 자 센 터</h1></div>
		<div id="menu"><jsp:include page="/WEB-INF/view/menu.jsp"/></div>
		<div id="text">
			<div id="test"><jsp:include page="<%=contentPage%>" /></div>
		</div>
		<div id="footer">
			<br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고유번호: 107-82-06446 | 대표: 황윤옥 <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: 서울특별시 영등포구 영신로 200<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화: 02-2677-9200 | 팩스: 02-2679-9300
	</div>
</div>
</body>
</html>
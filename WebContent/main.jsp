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
<link rel="stylesheet" href="dog.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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

#banner {
	height: 230px;
	background-color: #C4BE8A;
	background-color: rgb(237,223,185);
}

#footer {
    /*bottom:0;*/
    width:100%;
    height:70px;
    color: white;   
    background:	black;
    text-align: left;
    font-size: 10px;
}
#header{
	text-align:right; 
}


#text {
	background:white;
	height: 500pt;
}

.btndiv{
	float: left;
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
	border: 0px;
}
.btn {
	font-size:1em;
	background-color: black;
	color: white;

	font-weight: bolder;
	width: 100%;
	height: 50px;
}
	.home{ background-color: white; }
	.funcTab td{ border: 1px solid black;}
	.funcTab{ border-collapse: collapse; width: 100%;}
	.func1, .func2, .func3{ width: calc(33%); text-align: center; height: 40px; 
		background-color: black; color: white;} 
</style>

</head>
<body>
<div id="container">
    <div id="header"><jsp:include page="/WEB-INF/view/loginIndex.jsp"/></div>

	<div id="banner">
		
		<div class="dog">
            <div class="dog-top">
                <div class="dog-eye"></div>
                <div class="dog-eye"></div>
            </div>
            <div class="dog-bottom">
                <div class="dog-nose">
                    <div class="dog-mouth">
                        <div class="dog-mouth-inner"></div>
                    </div>
                </div>
            </div>
        </div>

        <h1 align="center"><strong>하자센터</strong></h1>

	</div>
	
	<div id="menu"><jsp:include page="/WEB-INF/view/menu.jsp"/></div>
	<div id="text"><jsp:include page="<%=contentPage%>" /></div>
	

	<div id="footer">
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고유번호: 107-82-06446 | 대표: 황윤옥 <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: 서울특별시 영등포구 영신로 200<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화: 02-2677-9200 | 팩스: 02-2679-9300
	</div>
</div>


</body>
</html>
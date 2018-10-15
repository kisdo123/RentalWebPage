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
	.deviceimg{width: 80%}
	.map_wrap {position:relative;overflow:hidden;width:50%;height:350px; float: left;}
	.radius_border{border:1px solid #919191;border-radius:5px;}     
	.custom_zoomcontrol {position:absolute;top:20px;left:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
	.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
	.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}  
	.label {margin-bottom: 96px;}
	.label * {display: inline-block;vertical-align: top;}
	.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
	.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
	.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
	 
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}       
body{
	text-align: center;
	background:#ccc;
	margin: 0 auto;
}
#listtable{
	width: 80%;
	height: 500pt;
}

.firstbtn{
	width:150px;
	height:150px;
	border:1px solid black;
	border-radius:75px;
	-moz-border-radius : 75px;
	-webkit-border-radius : 75px;
	-ms-border-radius :75px;
	-khtml-border-radius : 75px;
	-o-border-radius :75px;
	background-color: black;
	color: white;
	
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
	overflow: hidden;
}

.btn {
	font-size:1em;
	background-color: black;
	color: white;
	font-weight: bolder;
	width: 100%;
	height: 50px;
}
	.home button{ background-color: black; }
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
        <h1>
       	 <font color="black">하 자 센 터</font>
        </h1>
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
<%@page import="calendar.RentInquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
			body{
			margin: 0;
			font-size: small;
			text-align: left;
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
		td{ border: 1px solid black; text-align: left;}

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
		.logbtn{ background-color: black; color: white; font-size: 0.9em; 
				width: 100px; height: 35px; margin-top: 15px; }
		.logtitle{ font-size: 0.9em; }
		.cancel{ border-top: 1px solid black; font-size: small; padding-top: 10px; }

</style>
</head>
<body>

<div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">

<table>
	<tr>
		<!-- 로그인 위에 이미지가 들어가는 자리 -->
		<th class="logo" colspan="2"><img src="image/하자.png" width="180px"></th>
	</tr>

	<tr>
		<td>신청인</td>
		<td>${rentInquiry.name}</td>
	</tr>
	<tr>
		<td>방 이름</td>
		<td>${rentInquiry.roomName }</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>${rentInquiry.rentDate }</td>
	</tr>
	<tr>
	    <td>시간</td>
    	<td>${rentInquiry.rentTime }</td>
	 </tr>

		<tr>
			<th colspan="2">
				<button class="logbtn" type="button" onclick="location.href='main.jsp' ">메인으로</button>
			</th>
		</tr>					

	
	</table>
	

		</div>
	</div>	
</div>	
</body>
</html>
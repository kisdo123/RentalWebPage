<%@page import="calendar.RentInquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
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
</table>
<br>
<a href="index.jsp">[메인화면으로 돌아가기]</a>
</body>
</html>
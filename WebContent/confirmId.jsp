<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String id = request.getParameter("id");
	UserDao userDao = UserDao.getInstance();
	boolean result = userDao.confirmId(id);

	if(result) { %>
	
	<center>
	<br><br>
	<h4>이미 사용중인 ID입니다.</h4>
	</center>
	
	<% } else { %>
	
	<center>
	<br><br>
	<h4>입력하신 <%= id %>는 사용하실 수 있는 ID입니다.</h4>
	</center>
	
	<% } 
	
%>
	




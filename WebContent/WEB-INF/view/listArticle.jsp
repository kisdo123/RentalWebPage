
<%@page import="article.model.Article"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>

<table border="1">
	<tr>
		<td colspan="4">
			<a href="articlewrite">[게시판 글쓰기]</a>
		</td>
	</tr>
	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자 이름</th>
		<!-- <th>조회수</th> -->
	</tr>

	<!-- 게시글이 없을 때 보여줄 화면 -->
	<c:if test="${!articlePage.hasArticles() }">
		<tr>
			<td colspan="4">게시글이 없습니다.</td>
		</tr>
	</c:if>
	
	
	
	<!-- 게시글이 있을 때 보여줄 화면 -->
	<c:forEach var="article" items="${articlePage.articleList }">
		<tr>
			<td>${article.articleId }</td>
			<td><a href="articleread?no=${article.articleId }&pageNo=${articlePage.currentPage }">${article.title }</a></td>
			<td>${article.name }</td>
	
		
			<%-- <td>${article.readCnt }</td> --%>
		</tr>
		
	</c:forEach>
	
	<!-- 게시글이 있다면 페이지 블럭 표현 -->
	<c:if test="${articlePage.hasArticles() }">
		<tr>
			<td colspan="4">
				<c:if test="${articlePage.startPage > 5 }">
					<a href="articlelist?pageNo=${articlePage.startPage - 5 }">[이전]</a>
				</c:if>
				<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
					<a href="articlelist?pageNo=${pNo }">[${pNo }]</a>
				</c:forEach>
				<c:if test="${articlePage.endPage < articlePage.totalPages }">
					<a href="articlelist?pageNo=${articlePage.startPage + 5 }">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>


	
</table>

</body>
</html>
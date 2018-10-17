<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="article.model.Article"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style type="text/css">
	body{
			margin: 0;
			font-size: medium;
			font-family:'Open Sans';
		}		

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
		
		a:link {text-decoration: none; color: black;}
		a:visited {text-decoration: none; color: black;}
		a:active {text-decoration: none; color: black;}
		a:hover {text-decoration: underline; color: red;}
		table{width: 100%; border-collapse: collapse;}
		#print td {text-align:center; border: 1px solid red; border-collapse: collapse;}
		.write{ border: none; text-align: right; font-size: 0.9em; }
		.con1{width: 300px;}
		.conNo{ width: 50px; }
		.con2{width: 50px; }
		.pageNo{ font-size: 0.9em; }
		#pagemovetable{
			border: none;		
		}
</style>

</head>
<body>
          
 <div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">   
	<div align="left" style="width: 100pt;"><a href="articlewrite" >[글쓰기]</a></div>
<table id="print">
	<tr>
		<td class="conNo">번호</td>
		<td class="con1">제목</td>
		<td class="con2">작성자</td>
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
			<td class="conNo">${article.articleId }</td>
			<td class="con1"><div align="left" style="padding-left: 10px"><a href="articleread?no=${article.articleId }&pageNo=${articlePage.currentPage }" ><u:pre value='${article.title }'/></a></div></td>
			<td class="con2">${article.name }</td>
		
			<%-- <td>${article.readCnt }</td> --%>
		</tr>
		
	</c:forEach>
	</table>
	<table id="pagemovetable">
	<c:if test="${articlePage.hasArticles() }">
	<tr align="center">
	<!-- 게시글이 있다면 페이지 블럭 표현 -->
				<td class="conNo" style="border: ">
					<c:if test="${articlePage.startPage > 5 }">
							<a href="articlelist?pageNo=${articlePage.startPage - 5 }"> ◀이전 </a>
					</c:if>
				</td>
				
				<td class="con1">
					<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
							<a href="articlelist?pageNo=${pNo }">[${pNo }]</a>
					</c:forEach>
				</td>
				
				<td class="con2">
					<c:if test="${articlePage.endPage < articlePage.totalPages }">
							<a href="articlelist?pageNo=${articlePage.startPage + 5 }" style="text-align: right;"> 다음▶ </a>
					</c:if><br>
				</td>
				</tr>
	</c:if>
	</table>
	<br>
		<a href="main.jsp">[메인으로]</a>
		</div>
	</div>
</div>	

</body>
</html>
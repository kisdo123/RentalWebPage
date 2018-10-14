<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="article.model.Article"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		a:link {text-decoration: none; color: #333333;}
		a:visited {text-decoration: none; color: #333333;}
		a:active {text-decoration: none; color: #333333;}
		a:hover {text-decoration: underline; color: red;}

		table, td{text-align:center; border: 1px solid red; border-collapse: collapse; }
		.write{ border: none; text-align: right; font-size: 0.9em; }
		.con1{width: 300px;}
		.conNo{ width: 50px; }
		.con2{width: 50px; }
		.pageNo{ font-size: 0.9em; }
		.listdiv{float: left;}
</style>
<script type="text/javascript">
//스크립트질문
/*function thisPagefind(val){
	//a태그를 가져옴
	var taga = document.getElementById("taga");
	//현재url을 가져옴
	var url = unescape(location.href);
	console.log(url);
	console.log(val.href);
		if((val.href == url)== true){
			taga.style.color="red";
		}
	}*/
</script>
</head>
<body>
          
 <div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">   
	<div align="left" style="width: 100pt;"><a href="articlewrite" >[글쓰기]</a></div>
<table>
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
			<td><div align="left"><a href="articleread?no=${article.articleId }&pageNo=${articlePage.currentPage }" >&nbsp;&nbsp;&nbsp;${article.title }</a></div></td>
			<td>${article.name }</td>
		
			<%-- <td>${article.readCnt }</td> --%>
		</tr>
		
	</c:forEach>
	
</table>
	<!-- 게시글이 있다면 페이지 블럭 표현 -->
	<c:if test="${articlePage.hasArticles() }">
				<div class="listdiv"style="min-width:50px; max-width: 50px; width: 50px;" align="left">
				<c:if test="${articlePage.startPage > 5 }">
					<a href="articlelist?pageNo=${articlePage.startPage - 5 }"> ◀이전 </a>
				</c:if>
				</div>
				<div class="listdiv" style="max-width:350px; min-width:300; width: 350px;"  align="center">
				<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
					<!--<a id="taga" href="articlelist?pageNo=${pNo }" onclick="thisPagefind(this);">${pNo }</a> -->
					<a href="articlelist?pageNo=${pNo }">${pNo }</a>
				</c:forEach>
				</div>
				<div class="listdiv" style="min-width:50px; max-width: 50px; width: 50px;" align="right">
				<c:if test="${articlePage.endPage < articlePage.totalPages }">
					<a href="articlelist?pageNo=${articlePage.startPage + 5 }" style="text-align: right;"> 다음▶ </a>
				</c:if><br>
				</div>
	</c:if>
	<br><br>
		<a href="main.jsp">[메인으로]</a>
		</div>
	</div>
</div>	

</body>
</html>
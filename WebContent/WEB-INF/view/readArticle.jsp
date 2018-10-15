<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 보기</title>
<style type="text/css">
	body{
			margin: 0;
			font-size: medium;
			font-family:'Open Sans';
		}		
		.info{
			width: 100px;
			text-align: left;
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
		
		.logo{ padding-bottom: 17px; }
		.logbtn{ background-color: black; color: white; font-size: 0.9em; height: 35px; 
				margin-top: 15px;}
		.logtitle{ font-size: 0.9em; }
		.cancel{ border-top: 1px solid black; font-size: small; padding-top: 10px; }
		
		.title{ text-align: left;  }

	table{
		width:100%;
		text-align: left;
		border:1px solid black;
		border-collapse: collapse;
	}
	td{
		border:1px solid black;
		border-collapse: collapse;}

	.artNun{ width: 95%; }
	.artform{ width: 5%; }
	.textHead{ border: 0px; }
	.artCon{ height: 500px; border-top: none; vertical-align : top; width: 100%;}
	.menu{ text-align: right; font-size: 0.8em; }
	.comm{ font-size: 0.8em; }
	
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: underline; color: red;}
</style>
</head>


<body>

 
           
           
 <div class="outer-container">
   <div class="inner-container">
     <div class="centered-content">           

 <table>
 
	<tr>
		<td class="artform">${articleData.article.articleId }</td>
		<td>${articleData.article.title }</td>	
	</tr>

	

	<tr>
		<td colspan="2" class="inner_td">${articleData.article.name }
		</td>

	</tr>
	<tr>
		<td colspan="2" class="artCon" style="padding-top: 1px;">
			<u:pre value='${articleData.articleContent }'/>
		</td>	
	</tr>
 </table>
 	<br>
 	
	<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
		<a href="articlelist?pageNo=${pageNo }">[목록 보기]</a>
	<c:if test="${loginUser.userId == articleData.article.userId }">
		<a href="articlemodify?no=${articleData.article.articleId }">[게시글 수정]</a>
		<a href="articledelete?no=${articleData.article.articleId }">[게시글 삭제]</a>
	</c:if>
 
<hr>

<form action="commentwrite" method="post">
	<table>
	    <tr bgcolor="#F5F5F5">
                <!-- 본문 작성-->
                <td colspan="2" class="comm">
                    <textarea name="comContent" rows="10pt" cols="100%" >${paran.comContent }</textarea>
                   	작성자 <input type="text" style="width: 70px;" name="name" value="${articleData.article.name }" readonly="readonly">

                    <!-- 댓글 등록 버튼 --> 
                </td>
    	 </tr>
   	</table>
   	<input type="submit" value="댓글 작성">
   	<br><br><br>
</form>

<table>
	<!-- 댓글이 있을 때 보여줄 화면 -->
	<c:forEach var="comment" items="${commentPage.commentList }">
	
		<c:if test="${articleData.article.articleId == comment.articleId}">
		
		<tr>
			<td width="5%" align="center">${articleData.article.articleId }</td>
			<td width="85%">${comment.comContent }</td>
			<td width="10%" align="center">${comment.name }</td>
		</tr>
		
		</c:if>
	</c:forEach>
</table>


	<!--댓글작성자이면 보이는 화면 -->
<c:if test="">
<table>
	<c:forEach var="comment" items="${commentPage.commentList }">
	
		<c:if test="${articleData.article.articleId == comment.articleId}">
		
		<tr>
			<td width="5%" align="center">${articleData.article.articleId }</td>
			<td width="71%">${comment.comContent }</td>
			<td width="10%" align="center">${comment.name }</td>
			<td width="7%"> <button style="width: 100%; height: 25pt; background-color: #ccc;">수정</button></td>
			<td width="7%"> <button style="width: 100%; height: 25pt; background-color: #ccc;">삭제</button></td>
		</tr>
		</c:if>
	</c:forEach>
</table>
</c:if>


		</div>
	</div>
</div>    
     
</body>
</html>
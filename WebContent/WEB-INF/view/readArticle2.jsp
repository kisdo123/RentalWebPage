
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 보기</title>
</head>
<body>



<table border="1">

	<tr>
		<th width="200" height="50">게시글 번호</th>
		<td colspan="3" width="600" align="center">${articleData.article.articleId }</td>	
	</tr>

	<tr>
		<th width="200" height="50">작성자 이름</th>
		<td colspan="3" width="600" align="center">${articleData.article.name }</td>	
	</tr>
	
	<tr>
		<th width="200" height="50">제목</th>
		<td colspan="3" width="600" align="center">${articleData.article.title }</td>	
	</tr>
	
	<tr>
		<th width="200" height="50">내용</th>
		<td colspan="3" width="600" align="center"><u:pre value='${articleData.articleContent }'/></td>	
	</tr>



   
	<tr>
		<td colspan="4" height="50"  align="center">
	
			<!-- 게시글이 있을 때 보여줄 화면 -->

			<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<input type="button" value="목록 보기" onclick="location.href='articlelist?pageNo=${pageNo }'">
			
			<c:if test="${loginUser.userId == articleData.article.userId }">
				<input type="button" value="게시글 수정" onclick="location.href='articlemodify?no=${articleData.article.articleId }'">
				<input type="button" value="게시글 삭제" onclick="location.href='articledelete?no=${articleData.article.articleId }'">
			</c:if>
			
			
		</td>
	</tr>

</table>





<form action="commentwrite" method="post">

		
		게시글 번호 <input type="text" name="articleId" value="${articleData.article.articleId }" readonly="readonly">
		작성자 이름  <input type="text" name="name" value="${articleData.article.name }" readonly="readonly">
		댓글 내용  <input type="text" name="comContent" value="${paran.comContent }">
		
		<input type="submit" value="댓글 작성">
	

</form>


	
	<!-- 게시글이 있을 때 보여줄 화면 -->
	<c:forEach var="comment" items="${commentPage.commentList }">
	
	<c:if test="${articleData.article.articleId == comment.articleId}">
	
			${comment.name }<br>
			${comment.comContent }<br><br>
	
	</c:if>
	</c:forEach>
	





</body>
</html>
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

<!--  ArticleData
article - articleId,Writer,날짜,카운트
articleContent - articleId, content  -->

<table border="1">
	<tr>
		<th>게시글 번호</th>
		<td>${articleData.article.articleId }</td>	
	</tr>

	<tr>
		<th>작성자 이름</th>
		<td>${articleData.article.name }</td>	
	</tr>
	
	<tr>
		<th>제목</th>
		<td>${articleData.article.title }</td>	
	</tr>
	
	<tr>
		<th>내용</th>
		<td><u:pre value='${articleData.articleContent }'/></td>	
	</tr>

	<tr>
		<td colspan="2">
			<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<a href="articlelist?pageNo=${pageNo }">[목록]</a>
			
			<c:if test="${loginUser.userId == articleData.article.userId }">
				<a href="articlemodify?no=${articleData.article.articleId }">[게시글 수정]</a>
				<a href="articledelete?no=${articleData.article.articleId }">[게시글 삭제]</a>
			</c:if>
		</td>
	</tr>
</table>

</body>
</html>
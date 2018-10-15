<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

댓글 작성 완료

<strong>${ctxPath = pageContext.request.contextPath ; '' }</strong>
<a href="${ctxPath }/articlelist">[목록 보기]</a>

<a href="${ctxPath }/articleread?no=${comment.articleId}">[내용 보기]</a>


</body>
</html>
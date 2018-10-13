<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 성공 화면</title>
</head>
<body>
게시글을 수정했습니다.
<br>
${ctxPath = pageContext.request.contextPath; ''}
<a href="${ctxPath }/articlelist">[게시글 목록보기]</a>

<a href="${ctxPath }/articleread?no=${modReq.articleId}">[게시글 내용보기]</a>
</body>
</html>
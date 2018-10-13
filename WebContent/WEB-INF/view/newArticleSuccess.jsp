<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 작성 완료 화면</title>
</head>
<body>
게시글이 등록되었습니다.
<br>
${ctxPath = pageContext.request.contextPath ; '' }
<a href="${ctxPath }/articlelist">[목록 보기]</a>
<br>
<%-- <a href="${ctxPath }/articleread?no=${newArticleNum}">[내용 보기]</a> --%>
</body>
</html>
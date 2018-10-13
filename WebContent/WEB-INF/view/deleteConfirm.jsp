<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>

<form action="articledelete" method="post">

	<input type="hidden" name="no" value="${delReq.articleId }">
	
	<p>
		게시글 번호 ${delReq.articleId }를 정말 삭제하시겠습니까?
	</p>

	<input type="button" value="뒤로" onclick="location.href='articlelist' ">
	<input type="submit" value="글 삭제">

</form>

</body>
</html>
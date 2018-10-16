<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성 성공 화면</title>


<link rel="stylesheet" href="rudolph.css">
<style type="text/css">
		input{
			color: black;
			background-color: beige;
			width: 100px;
			height: 30px;
			font-size: 13px;
			font-weight: bold;
		}
		h1 a{
			font-size: 0.7em;
		}
</style>
</head>
<body>
	<div class="rudolph">
            <div class="antlers left"></div>
            <div class="antlers right"></div>
            <div class="ears left">
                <div class="inner"></div>    
            </div>
            <div class="ears right">
                <div class="inner"></div>    
            </div>
		    <div class="face">
		        <div class="eyes left">
		            <div class="pupil"></div>    
		        </div>
		        <div class="eyes right">
		            <div class="pupil"></div>    
		        </div>
		    </div>
		    <div class="chin">
		        <div class="nose">
		            <div class="inner"></div>
		        </div>
		    </div>
		</div>
		
	



</head>
<body>

	<h1>
		댓글 작성 완료
		<br>
		<strong>${ctxPath = pageContext.request.contextPath ; '' }</strong>
		<a href="${ctxPath }/articlelist">[목록 보기]</a>

		<a href="${ctxPath }/articleread?no=${comment.articleId}">[내용 보기]</a>

	</h1>

</body>
</html>

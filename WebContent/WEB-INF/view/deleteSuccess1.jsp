<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
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
	
	<h1>
		<form action="articledelete" method="post">	
			<input type="hidden" name="no" value="${delReq.articleId }">
		</form>
		<strong>게시글을 삭제했습니다.</strong>
		<a href="${ctxPath }/articlelist">[게시글 목록보기]</a>
		<!-- <button type="button" onclick="location.href='main.jsp' ">메인으로</button> -->
	</h1>


</body>
</html>
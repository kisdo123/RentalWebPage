<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="rudolph.css">
<style type="text/css">
	button{
		color: black;
		background-color: beige;
		width: 100px;
		height: 30px;
		font-size: 13px;
		font-weight: bold;
	}

</style>
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
		<strong style="margin-top : 310pt; font-size: 18pt; line-height:100%;">이미 대실 신청건이 존재합니다.<br>
		대실신청은 한 건만 신청할수 있습니다.<br>
		대실신청을 다시 하고싶으시면 신청 취소를 해주세요<br></strong>
		<button type="button" onclick="location.href='main.jsp' ">메인으로</button>
	</h1>
</body>
</html>
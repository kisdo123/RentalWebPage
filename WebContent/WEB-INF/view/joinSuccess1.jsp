<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
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
		<strong>${param.name }님 회원 가입에 성공했습니다.</strong><button type="button" class="join" onclick="location.href='login' ">로그인</button>
	</h1>


</body>
</html>
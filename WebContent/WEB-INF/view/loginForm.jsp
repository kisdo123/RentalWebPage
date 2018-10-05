<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style type="text/css">
	input[type=tel]:invalid{border: 4px solid red;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96b8706698bbb616b540588b939a86bc"></script>
</head>
<body>

<form action="" method="post"> 
<table border="1px" width="500">
	
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" placeholder="이름" maxlength="10"></td>
	</tr>
	<tr>
		<td>닉네임(id)</td>
		<td><input type="text" name="id" placeholder="닉네임" maxlength="10"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" placeholder="비밀번호 4자리이상, 12자리이하" minlength="4" maxlength="12"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="pw" placeholder="비밀번호를 다시 입력해주세요" minlength="4" maxlength="12"></td>
	</tr>
	
	<tr>
		<td>연락처</td>
		<td><input type="tel" name="tel" placeholder="01012345678 (-)하이픈 제외" pattern="[0-1]{3}[0-9]{4}[0-9]{4}"></td>
	</tr>
	<tr>
		<td>소속</td>
		<td><input type="text" name="team" placeholder="소속" maxlength="15"></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input type="text" name="birth" placeholder="생년월일 ex) 020228" pattern="[0-9]{2}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}"></td>
	</tr>

</table>
<input type="submit" value="회원가입"> 

</form>

<div id="map" style="width:500px; height:400px;"></div>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.525215, 126.903400),
			level: 3
		};

		var map = new daum.maps.Map(container, options);

		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.525215, 126.903400); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);  
		
</script>




</body>
</html>
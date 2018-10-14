<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96b8706698bbb616b540588b939a86bc"></script>
</head>
<body>
<h2 style="color: red">약도/연락처</h2>
<div class="map_wrap" id="mapbody">
    <div id="map" style="width:500px;height:400px; position:relative; overflow:hidden;"></div> 
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
    </div>
<div class="map_wrap" id="map_wrap">
서울특별시 영등포구 영신로 200 (영등포동 7가 57번지)<br>
우편번호: 07244<br>	
대표 전화 02-2677-9200<br>
팩스 02-2679-9300<br>
<hr>
버스 이용시<br>
- 지선버스 5616, 5714, 6514 )<br>
- 간선버스 605, 661, 760 )<br>
- 좌석버스 8000, 9030, 700 )<br>
- 일반버스 5, 60, 60-3, 70-2, 88)<br>
  (신화병원 버스정류장 하차 기준)<br>
<hr>
지하철 이용시<br>
- 5호선 영등포시장역 1번 출구 도보 7분<br>
- 2, 5호선 영등포구청역 4번 출구 도보 12분<br>
</div>
<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.525215, 126.903400),
			level : 3
		};

		var map = new daum.maps.Map(container, options);


		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);  
</script>
<script>
		
		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
			map.setLevel(map.getLevel() - 1);
		}

		function zoomOut() {
			map.setLevel(map.getLevel() + 1);
		}
		
</script>
<script>
	
	 
	
	// 지도에 마커를 표시합니다 
	var marker = new daum.maps.Marker({
	    map: map, 
	    position: new daum.maps.LatLng(37.525215, 126.903400)
	});
	
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '           하자센터' + 
    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">영등포구 영등포동7가 영신로 200</div>' + 
    '                <div class="jibun ellipsis">(우) 07244 (지번) 영등포동7가 57</div>' +
    '                <div><a href="https://haja.net/contact" target="_blank" class="link">홈페이지</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
	
	
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new daum.maps.CustomOverlay({
	    content: content,
	    map: map,
	    position: marker.getPosition()       
	});

	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	daum.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	});
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    overlay.setMap(null);     
	}
</script>
</body>
</html>
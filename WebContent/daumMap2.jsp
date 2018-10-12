<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96b8706698bbb616b540588b939a86bc"></script>
	<style>
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
 
.custom_zoomcontrol {position:absolute;top:20px;left:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}  
  
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
 
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}       
</style>
</head>
<body>


<div class="map_wrap">
    <div id="map" style="width:500px;height:400px; position:relative; overflow:hidden;"></div> 
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
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
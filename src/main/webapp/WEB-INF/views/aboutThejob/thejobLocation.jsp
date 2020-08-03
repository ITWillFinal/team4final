<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/aboutSidebar.jsp"%>
<style>
	.way_info {
    display: inline-block;
    width: 100%;
    margin-top: 10px;
	}
	.way_info .top_box {
    border-bottom: 1px dashed #ccc;
    display: inline-block;
    width: 100%;
	}
	.way_info .bottom_box {
    clear: both;
	}
	.way_info .inner_box {
    width: 50%;
    float: left;
    padding: 25px 0;
	}
	.way_info .inner_box .txt01 {
    margin: 0;
    width: 85px;
    float: left;
    font-size: 19px;
    color: #333;
    font-weight: 400;
	}
	.way_info .inner_box .txt02 {
    margin: 0;
    font-size: 16px;
    color: #666;
    padding: 0 15px 0 75px;
	}
	.way_icon01 {
    display: inline-block;
    font-size: 15px;
    color: #fff;
    padding: 0px 6px;
    background: #3cb34b;
    float: left;
	}
	.way_info .inner_box .txt03.type01 {
    padding-top: 1px;
	}
	.way_info .inner_box .txt03 {
    display: block;
    padding-left: 55px;
    padding-top: 8px;
    font-weight: 350;
    line-height: 1.25;
	}
	.way_info .inner_box .txt02 {
    margin: 0;
    font-size: 17px;
    color: #666;
    padding: 0 15px 0 85px;
	}
	.way_info .inner_box {
    width: 50%;
    float: left;
    padding: 25px 0;
	}
	.way_info .inner_box .txt01 {
    margin: 0;
    width: 85px;
    float: left;
    font-size: 19px;
    color: #333;
    font-weight: 400;
	}
	.way_info .inner_box .txt02 {
    margin: 0;
    font-size: 16px;
    color: #666;
    padding: 0 15px 0 85px;
	}
	.way_info .bottom_box .txt03.type04 {
    padding-left: 52px;
    padding-top: 1px;
    margin-top: 8px;
	}
	.way_icon03 {
    display: inline-block;
    font-size: 15px;
    color: #fff;
    padding: 0px 6px;
    background: #db1218;
    float: left;
    margin-top: 25px;
	}
	.way_icon02 {
    display: inline-block;
    font-size: 15px;
    color: #fff;
    padding: 0px 6px;
    background: #395cb3;
    float: left;
	}
	.way_info .bottom_box .txt03.type03 {
    padding-left: 52px;
    padding-top: 1px;
    margin-top: 25px;
	}
	.way_info .bottom_box .txt03.type04 {
    padding-left: 52px;
    padding-top: 1px;
    margin-top: 8px;
	}
	.txt01{
	font-weight: bold;
	}
</style>
<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
	<div id="map" style="width:98%;height:600px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f5a970707d8d0e271a8262251139638&libraries=services,clusterer"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.498746, 127.031657), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.498746, 127.031657); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	
		var iwContent = '<div style="padding:5px;"><b>THE JOB+</b> <br><a href="https://map.kakao.com/link/map/THE JOB+,37.498746, 127.031657" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(37.498746, 127.031657); //인포윈도우 표시 위치입니다
	
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	</script>

	<div class="way_info">
		<div class="top_box">
			<div class="inner_box">
				<p class="txt01">주소</p>
				<p class="txt02">서울특별시 강남구 테헤란로 124( 역삼동,삼원타워 ) 4층</p>
			</div>
			
			<div class="inner_box">
				<p class="txt01">연락처</p>
				<p class="txt02">
					<span class="inner">
						<span class="cercle_txt01 type01">대표전화 : 02-6255-8002</span>
					</span>
					<span class="inner">
						<span class="cercle_txt01">팩스 : 02-566-1460</span>
					</span>
				</p>
			</div>
		</div>
		
		<div class="bottom_box">
			<div class="inner_box">
				<p class="txt01">지하철</p>
				<p class="txt02">
					<span class="way_icon01">2호선</span>
					<span class="txt03 type01"><b>강남역 1번 출구</b> 도보 150m</span>
					<span class="txt03"><b>역삼역 3번 출구</b> 도보 200m</span>
				</p>
			</div>
			<div class="inner_box">
				<p class="txt01">버스</p>
				<p class="txt02">
					<span class="way_icon02">간선</span>
					<span class="txt03 type02"><b>강남역,역삼세무서(23-287) </b>: 146, 341, 360, 740, N13, N61</span>
					<span class="txt03 type04"><b>강남역,12번출구(23-284)</b> : 146, 341, 360, 740, N13, N61</span>
					
					<span class="way_icon03">직행</span>
					<span class="txt03 type03"><b>강남역,역삼세무서(23-287) </b>: 1100, 1700, 2000, 2000-1, 3002, 3007, 3200, 3300, 3400, 7007, 9303, 8001</span>
					<span class="txt03 type04"><b>강남역 12번 출구(23-284) </b>: 1100, 1700 ,2000 , 2000-1, 3600, 7007 ,9303 ,9600 ,8001</span>
				</p>					
			</div>	
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
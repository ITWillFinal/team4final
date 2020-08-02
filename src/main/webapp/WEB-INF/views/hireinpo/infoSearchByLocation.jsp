<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<div id="map" style="width:600px;height:600px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f5a970707d8d0e271a8262251139638&libraries=services,clusterer"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(37.394921, 127.111282), // 지도의 중심좌표
	    level: 7 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 7 // 클러스터 할 최소 지도 레벨 
    });
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	var mapData = ['서울 강남구 가로수길 5', '서울 강남구 가로수길 9', '서울 강남구 가로수길 10'];
	var comName = ['아이티윌', '유니잡', '고로스키'];
	
	/* <c:forEach items="${vo }" var="vo">
   		mapData.push("${vo.address }");
   		comName.push("${vo.data}");
 	</c:forEach> */
	var markers = [];
 	var num = 0;
	//주소로 좌표를 검색합니다
	for(var i = 0; i < mapData.length; i++){
		geocoder.addressSearch(mapData[i], function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
				    map: map,
				    position: coords
				});
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow();
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				//map.setCenter(coords);
				addContent(infowindow);
				markers.push(marker);
				kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				// 클러스터러에 마커들을 추가합니다
				clusterer.addMarkers(markers);
			}
		});    
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow, i) {
	    return function() {
	        infowindow.open(map, marker);
	        
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	function addContent(infowindow) {
		console.log(num);
		infowindow.setContent('<div style="width:150px;text-align:center;padding:6px 0;">'+comName[num]+'</div>');
		num = num + 1;
	}
</script>
<%@ include file="../inc/bottom.jsp" %>
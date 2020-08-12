<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:parseDate var="end" value="${vo.endDate}" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
<input type="hidden" value="${vo.endDate }" id="timerEnd">
<style>
	#contentDiv{
		margin-top: 70px;
		margin-bottom: 100px;
		margin-left: 290px;
	    background: #ececec61;
	    width: 1100px;
		overflow: hidden;
		box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
	}
	
	#headDiv{
		padding-top: 30px;
	    float: left;
	    padding-left: 30px;
	}
	#headAddDiv1{
	    margin-top: 40px;
	    border: 1px solid #cecece;
	    float: right;
	    padding: 4px 5px;
	    text-align: center;
	}
	#headAddDiv2{
	    margin-top: 40px;
	    border: 1px solid #cecece;
	    float: right;
	    padding: 4px 5px;
	    text-align: center;
	}
	#infoDiv1{
		padding-top: 10px;
	    padding-left: 30px;
	    width: 40%;
	    float: left;
	}
	#infoDiv2{
		padding-top: 10px;
	    padding-left: 30px;
	    width: 40%;
	    float: left;
	}
	
	td{
		padding-left: 30px;
	}
	#moreDiv{
		padding-top: 10px;
	    padding-left: 30px;
	}
	hr{
		clear: both; 
		padding-top: 33px;"
	}
	a{
		color: #0b1c39;
	}
	#headAdd2{
		margin-top: 40px;
	    margin-left: 17px;
	    float: right;
	    margin-right: 50px
	}
	#bottomApply{
	    font-weight: bold;
	    width: 602px;
	    height: 59px;
	    margin-top: 50px;
	    margin-bottom: 100px;
	}
</style>

<script type="text/javascript">
	/* 시간 계산 */
	const countDownTimer = function (id, date) { 
		var _vDate = new Date(date); // 전달 받은 일자
		var _second = 1000; 
		var _minute = _second * 60; 
		var _hour = _minute * 60; 
		var _day = _hour * 24; 
		var timer; 
		
		function showRemaining() { 
			var now = new Date(); 
			var distDt = _vDate - now; 
			if (distDt < 0) { 
				clearInterval(timer); 
				document.getElementById(id).textContent = '해당 이벤트가 종료 되었습니다!'; 
				return; 
			} 
			var days = Math.floor(distDt / _day); 
			var hours = Math.floor((distDt % _day) / _hour); 
			var minutes = Math.floor((distDt % _hour) / _minute); 
			var seconds = Math.floor((distDt % _minute) / _second); 
			//document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
			document.getElementById(id).textContent = days + '일 '; 
			document.getElementById(id).textContent += hours + '시간 '; 
			document.getElementById(id).textContent += minutes + '분 '; 
			document.getElementById(id).textContent += seconds + '초'; 
		} 
		
		timer = setInterval(showRemaining, 1000); 
	} 
	var timerEnd = $('#timerEnd').val();
	countDownTimer('timer', timerEnd); // 내일까지 
	

	$(function() {
		
		
		
	});
	function scrapSave() {
		$.ajax({
			url:"<c:url value='/scrap/recruitScrap.do'/>",
			type:"get",
			dataType:"text",
			data:"recruitmentCode=${vo.recruitmentCode}",
			success:function(res){
				var io = res;
				if(res == 2){
					$('#headAddDiv2').attr('style','display:none;');
					$('#headAddDiv1').attr('style','display:bolck;');
				}
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	}
	
	function scrapDel() {
		$.ajax({
			url:"<c:url value='/scrap/delRecruitScrap.do'/>",
			type:"get",
			dataType:"text",
			data:"recruitmentCode=${vo.recruitmentCode}",
			success:function(res){
				var io = res;
				if(res == 2){
					$('#headAddDiv1').attr('style','display:none;');
					$('#headAddDiv2').attr('style','display:bolck;');
				}
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	}
	
	function nomember() {
		alert("로그인 이후에 이용 가능합니다.");
	}
	
	
</script>
<div id="contentDiv">
	<div id="headDiv">
		<p>${vo.comName }</p>
		<h3 style="font-weight: bold;">${vo.title }</h3>
		<p style="margin-bottom: -15px; font-size: 0.8em;">등록일 : ${vo.regdate }</p>
	</div>
	<div id="headAdd2">
		<c:if test="${endDate-startDate+1 > 0}">
			<a href="<c:url value='/application/applicationResume.do?recruitmentCode=${vo.recruitmentCode }'/>" class="btn head-btn2" style="font-weight: bold; width: 120px; height: 59px;">지원</a>
		</c:if>
		<c:if test="${endDate-startDate+1 < 0}">
			<div style="font-weight: bold; width: 120px; height: 59px; background: #585858e0; padding: 20px 30px; color: white;">지원마감</div>
		</c:if>
	</div>
	<c:if test="${sessionScope.userid != null && sessionScope.status == 'U'}">
		<div id="headAddDiv1" 
			<c:if test="${result == 0 }">
				style="display: none"
			</c:if>
		>
				<a href="#" onclick="javascript:scrapDel()" style="font-size: 0.9em;"><i class="fa fa-star fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true" id="fullStar"></i>
				스크랩</a>
		</div>
		<div id="headAddDiv2" 
			<c:if test="${result > 0 }">
				style="display: none"
			</c:if>
		>
				<a href="#" onclick="javascript:scrapSave()" style="font-size: 0.9em;"><i class="fa fa-star-o fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true" id="fullStar"></i>
				스크랩</a>
		</div>
	</c:if>
	<c:if test="${sessionScope.userid == null }">
		<div id="headAddDiv2">
				<a href="#" onclick="javascript:nomember()" style="font-size: 0.9em;"><i class="fa fa-star-o fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true" id="fullStar"></i>
				스크랩</a>
		</div>
	</c:if>
	<hr>
	<div id="infoDiv1">
		<table>
			<tr>
				<th>경력</th>
				<td>${vo.career }</td>
			<tr>
			<tr>
				<th>학력</th>
				<td>${vo.educationLv }</td>
			<tr>
			<tr>
				<th>성별</th>
				<td>${vo.gender }</td>
			<tr>
			<tr>
				<th>근무형태</th>
				<td>${vo.recType }</td>
			<tr>
		</table>
	</div>
	<div id="infoDiv2">
		<table>
			<tr>
				<th>급여</th>
				<td>${vo.pay }</td>
			<tr>
			<tr>
				<th>근무일시</th>
				<td>${vo.workHours }</td>
			<tr>
			<tr>
				<th>근무지역</th>
				<td>${vo.location1 } ${vo.location2 }</td>
				
			<tr>
		</table>
	</div>
	<hr>
	<div id="moreDiv">
		${vo.recDetail }
	</div>
	<div id="moreDiv">
		<h5>우대사항</h5>
		
		<p>
		<i class="fa fa-leanpub" aria-hidden="true"></i> 
		${vo.preference }
		</p>
	</div>
	<div id="moreDiv">
		<h5>복리후생</h5>
		
		<p>
		<i class="fa fa-gift" aria-hidden="true"></i> 
		${vo.welfare }
		</p>
	</div>
	<div id="moreDiv">
		<h5>근무지 위치</h5>
		<p>
		<i class="fa fa-map-marker" aria-hidden="true"></i>
		 (${vo.zipcode }) ${vo.address } ${vo.addressDetail }
		</p>
		<div id="map" style="width:600px;height:350px;"></div>
	</div>
	<br>
	<div id="moreDiv">
		<h5>접수기간 및 지원</h5>
		<p><i class="fa fa-file-text" aria-hidden="true"></i> 필수 제출 서류 : ${vo.document }</p>
		<p style="color: black; font-weight: 700">모집 마감일 : <fmt:formatDate value="${end }" pattern="yyyy년 MM월 dd일"/><br>남은 일수 : D-${endDate-startDate+1 }
		<p id="timer" style="color: red; font-weight: 700"></p></p>
		
		<div>
			<c:if test="${endDate-startDate+1 > 0}">
				<a href="<c:url value='/application/applicationResume.do?recruitmentCode=${vo.recruitmentCode }'/>" class="btn head-btn2" id="bottomApply">지원</a>
			</c:if>
			<c:if test="${endDate-startDate+1 < 0}">
				<div style="margin-bottom: 100px; margin-top: 50px; font-weight: bold; width: 602px; height: 59px; background: #585858e0; padding: 20px; text-align: center; color: white;">지원마감</div>
			</c:if>
	   

		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f5a970707d8d0e271a8262251139638&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('${vo.address }', function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.comName}</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		} 
	});    
	
</script>
<%@ include file="../inc/bottom.jsp" %>

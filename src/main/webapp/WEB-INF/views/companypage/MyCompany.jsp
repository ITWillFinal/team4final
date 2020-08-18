<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/comMypageTop.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f5a970707d8d0e271a8262251139638&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
$(function(){
	
	$('#edit').click(function() {
		location.href = "<c:url value = '/companypage/MyCompanyEdit.do?comCode=${vo.comCode}'/>";
	});
	
});//function

</script>

<style type="text/css">

	.btSubmit{
		float: right;
	}
	img {
	   width: 100%;
	   height:100%;
	    margin-left: 2%;
	}
	.form-control {
	    border: none;
	}
	
	/* 라벨 */
	label.col-sm-3.control-label {
	    font-size: 10pt;
	    color: gray;
	}
	input[type="text"] {
	    font-weight: bold;
	}
	label.col-sm-3.control-label {
	    margin-top: 2%;
	}
	#bbk > form > div.form-horizontal > div:nth-child(2) {
	    margin-top: -3%;
	}
	input[type="text"] {
	    border-style: none;
	}
	
	img{
		width: 100%;
	}
	
	#edit{
		margin-top: 23px;
	}
	
	.infoBox{
		height: 850px;
		margin-bottom: 10px;
	}
	
	.info_company_ceo{
	    width: 170px;
		height: 65px;
	    background-color: #fb246a;
	    border-radius: 0 0 8px 8px;
		font-size: 20px;
		color: white;
		text-align: center;
		padding-top: 16px;
	}
	.info_company_name{
		margin-top: 7px;
		font-size: 35px;
		width:465px; 
		height: 56px;
		
	}
	
	.salary{		
		
	}
	
	.info_company_address{
		margin-top: 7px;
	}
	
	.fontBold{
		font-size: 15px;
	    font-weight: bolder;
	}
	.space{
		margin-left: 30px;
	
	}
	.pay_salary{
		margin-top: 15px;
		font-size: 28px;
		width:465px; 
		height: 56px;
	}
	.info_top{
		height: 100px;
	}
	.info_body_title{
		font-size: 25px;
		width:465px; 
		height: 56px;
	}
	.fontNormal{
		font-weight: normal;
	}

</style>
<main>
	<div id = "bbk"	style="width: 1055px; margin: 0 auto; font-size: 15px;margin-bottom: 30px;">

		<h1 style="background: white;font-weight: bold;">회사정보조회 <span class="deleteInfo" style="margin-left: 10px;font-size: small;color: red">(필수가 아닌항목은 체크해제시 적용되지 않습니다)</span></h1>
				<hr style="border: 1px solid #fb246a;margin: 30px 0;">
		<div class="btSubmit">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="button" id ="edit" class="btn btn-primary">기업정보수정</button>
			</div>
		</div>

		<form name="frm" method="post" style="margin-top: 50px;" enctype="multipart/form-data" >
			<input type="hidden" name = "comCode" value = ${vo.comCode }>
			<!-- 회사 정보 조회 -->
				<div class="infoBox">
					<section class="info_top">
						<div class="info_company_name"  style="float: left">
							<span>${vo.comName}</span>
						</div>
						<div class="salary" >
							<span style="font-size: x-small;">예상평균금액</span><br>
							<c:if test="${!empty comRecruitVo }">
								<span class="pay_salary">${comRecruitVo.pay }</span>
							</c:if>
							<c:if test="${empty comRecruitVo }">
								<span>추후협의</span>
							</c:if>	
						</div>
						<div class="info_company_address" style="clear: both;">
							<c:set var="addressArr" value="${fn:split(vo.address,' ') }" />
							<span class="fontBold">소재지</span><span class="company_adrees"></span>
							<span>${addressArr[0] }</span>
							
							<c:if test="${!empty comRecruitVo }">
								<span class="fontBold space">산업군</span><span class="company_adrees"></span>
								<span>${comRecruitVo.induType1 }</span>
							</c:if>
						</div>
					</section>
					
					<hr>
					<section class="info_body">
						<div class="info_company_body" style="width: 50%;float: left;">
							<span class="info_body_title">기업정보</span>
							<br><br>
							<div class="company_register_number">
								<span class="fontBoldA">사업자등록번호 : <span class="fontNormal">${vo.comNum}</span></span>
							</div>
							<br>
							<div class="company_ceeor">
								<span class="fontBoldA">대표자 : <span class="fontNormal">${vo.ceo}</span></span>
							</div>
							<br>
							<div class="company_addr">
								<span class="fontBoldA">우편번호 : <span class="fontNormal">(${vo.zipcode}) ${vo.address} ${vo.addressDetail}</span></span>
							</div>
							<br>
							<div class="company_hp">
								<span class="fontBoldA">내부전화번호 : <span class="fontNormal">${vo.comHp}</span></span>						
							</div>
							<br>
							<div class="company_comType">
								<span class="fontBoldA">기업형태 : <span class="fontNormal">${vo.comType}</span></span>						
							</div>
							<br>
							<div class="company_comIndustry">
								<span class="fontBoldA">기업업종 : <span class="fontNormal">${vo.comIndustry}</span></span>						
							</div>
							<br>
							<div class="company_content">
								<span class="fontBoldA" >사업내용 : </span>
								<div class="company_content_write">
									<span name="content" class="fontBoldA">${fn:replace(vo.content , newLine, '<br>')}</span>
								</div>
							</div>
							<br>
							<div class="company_homepage">
								<c:if test="${empty vo.homepage }">
									<span class="fontBoldA">등록된 홈페이지가 없습니다</span>
								</c:if>
								<c:if test="${!empty vo.homepage }">
									<span class="fontBoldA">홈페이지 : <span class="fontNormal">${vo.homepage}</span></span>
								</c:if>
							</div>
							<br>
						</div>
						<div id="moreDiv" style="width: 49%;float: right;">
								<span class="info_body_title">회사위치</span>
								<p>
								<i class="fa fa-map-marker" aria-hidden="true"></i>
								 (${vo.zipcode }) ${vo.address } ${vo.addressDetail }
								</p>
								<div id="map" style="width:450px;height:313px;"></div>
						</div>
							<hr style="clear: both;">
						<div>
							<span class="info_body_title">기업사진</span>
							<c:if test="${!empty vo.imageURL }">
								<div class="company_image" style="width: 225px;height: 200px;">
									<img class="fontBoldA" src="<c:url value = '/companyInfoImage/${vo.imageURL }'/>">
								</div>							
							</c:if>
							<c:if test="${empty vo.imageURL }">
								<br>
								<br>
								<div>등록된 사진이 없습니다.</div>
							</c:if>
						</div>
					</section>
				</div>
			<!-- 회사 정보 조회 끝 -->
		</form>
		
	</div>
</main>
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
<%@ include file="../inc/companyBottom.jsp"%>

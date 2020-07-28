<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
.resume_basic .area_title h3.title {
	color: #222;
	font-size: 26px;
	font-weight: bold;
	letter-spacing: -2px;
	line-height: 34px;
}

#pm_contents {
	margin: 0 auto;
	padding: 20px 0 60px;
	width: 1260px;
	letter-spacing: -1px;
	z-index: 20;
}

#container {
	width: auto;
	min-height: 100%;
	background-color: #f8f8f8;
}

.resume_write {
	padding: 50px 0 25px;
	background-color: #fff;
}
.info_row{
	margin-left: 50px;
}

.point {
	margin-left: 5px;
    color: #fc0038;
    font-size: 12px;
    letter-spacing: -1px;
}
.basic{
	margin-bottom: 15px;
}

</style>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('addrress').value = roadAddr;

			}
		}).open();

	}
</script>

<div id="container">
	<section id="pm_contents">
			<div class="area_title">
				<h3 class="title" style="text-align: center;">기본정보</h3>
			</div>
			<div class="resume_write resume_basic">
				<div class="basic">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2" style="margin-top: 7px;">
								<span>이름</span>						    	
					    		<span class="point">필수</span>
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="text" name="lastname" class="form-control input-lg" placeholder="이름"  />
					    </div>
					  </div>	
				</div>
				<div class="basic">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 " style="margin-top: 7px;">
								<span>이메일</span>						    	
					    		<span class="point">필수</span>
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="email" name="email" class="form-control input-lg" placeholder="이메일"  />
					    </div>
					  </div>	
				</div>
				<div class="basic">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 " style="margin-top: 7px;">
								<span>별명</span>						    	
					    		<span class="point">필수</span>
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="nickname" name="nickname" class="form-control input-lg" placeholder="별명"  />
					    </div>
					  </div>	
				</div>
				<div class="basic">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 " style="margin-top: 7px;">
								<span>생년월일</span>						    	
					    		<span class="point">필수</span>
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="birth" name="birth" class="form-control input-lg" placeholder="생년월일"  />
					    </div>
					  </div>	
				</div>
				<div class="basica">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 " style="margin-top: 7px;">
								<span>주소</span>						    	
					    		<span class="point">필수</span>
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="zipcode" name="zipcode" id="zipcode" onclick="sample4_execDaumPostcode()" class="form-control input-lg" placeholder="우편번호" readonly="readonly"  />
					    </div>
					  </div>	
				</div>
				<div class="basica">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 ">
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="address" name="address" id="address" class="form-control input-lg" placeholder="주소" readonly="readonly"  />
					    </div>
					  </div>	
				</div>
				<div class="basic">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 ">
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="addressDetail" name="addressDetail" class="form-control input-lg" placeholder="상세주소"  />
					    </div>
					  </div>	
				</div>
				<div class="basic">
					  <div class="row info_row">
					    <div class="col-xs-6 col-md-2 " style="margin-top: 7px;">
								<span>휴대폰</span>						    	
					    		<span class="point">필수</span>
					    </div>
					    <div class="col-xs-6 col-md-3">
					      <input type="hp" name="hp" class="form-control input-lg" placeholder="휴대폰"  />
					    </div>
					  </div>	
				</div>
				
				
				
			</div>
	</section>
</div>

<%@ include file="../inc/bottom.jsp"%>
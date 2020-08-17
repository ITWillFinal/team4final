<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/comMypageTop.jsp" %>
<script type="text/javascript">
	$(function(){
		document.getElementById('imageUpload').onchange = function() {
			readImage();
		};

		function readImage() {
			var file = document.getElementById('imageUpload');
			if (file.files && file.files[0]) {
				var reader = new FileReader();

				//이미지 읽기
				reader.readAsDataURL(file.files[0]);

				//이미지 전부 읽어들였으면 호출
				reader.onload = function() {
					var image = document.getElementById('image');
					image.src = reader.result;
					//img 태그 노출
					image.style.display = '';
				};
			}
		}//function readImage()
		
		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});
		$(".onlyHangulEnglish").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[!@#$%^&*-_+=~;?0-9]/gi, ''));
			}
		});
		$(".onlyHangul").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
			}
		});
		$('.onlyAlphabet').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-zA-Z]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});
		$('#comIndustry').change(function(){
			if($(this).val()=='etc'){
				$('#comIndustry2').val("");
				$('#comIndustry2').show();
				$('#comIndustry2').focus();				
			}else{
				$('#comIndustry2').hide();
			}
		});
		
		$('form[name=frm]').submit(function() {
			if($('#comName').val().length<1){
				alert('회사명을 입력하세요!');
				$('#comName').focus();
				event.preventDefault();
				return false;
			}else if($('#ceo').val().length<1){
				alert('대표자명을 입력하세요!');
				$('#ceo').focus();
				event.preventDefault();
				return false;
			}else if($('#comNum').val().length<1){
				alert('사업자등록번호를 입력하세요!');
				$('#comNum').focus();
				event.preventDefault();
				return false;
			}else if($('#zipcode').val().length<1){
				alert('우편번호를 입력하세요!');
				$('#zipcode').focus();
				event.preventDefault();
				return false;
			}else if($('#comHp').val().length<1){
				alert('회사 내부 전화를 입력하세요!');
				$('#comHp').focus();
				event.preventDefault();
				return false;
			}else if($('#comType').val() == "0"){
				alert('회사 형태를 입력하세요!');
				$('#comType').focus();
				event.preventDefault();
				return false;comHp
			}else if($('#comIndustry').val() == "0"){
				alert('회사 업종을 입력하세요!');
				$('#comIndustry').focus();
				event.preventDefault();
				return false;comHp
			}else if($('#content').val().length<1){
				alert('주요 사업 내용을  입력하세요!');
				$('#content').focus();
				event.preventDefault();
				return false;comHp
			}
			 
			 
		});
		
	});//function
</script>
<style type="text/css">
hr{
	height: 3px;
    background: #da2461;

}
.btSubmit{
	text-align: center;
	padding: 30px;
}
img {
    width: 100%;
}
input#imageUpload {
    margin-top: 3%;
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
				document.getElementById('address').value = roadAddr;

			}
		}).open();
		
		
	}
</script>
<main>
	<div id = "bbk"
		style="float: left; width: 49%; margin-left: 29%; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
		
		<!-- main -->
		<div style="margin: 5px; height: 95px;"><br>
			<h1 style="background: white; padding: 20px; font-weight: bold;">
				회사 정보 수정 <span
					style="font-size: 14px; color: red; padding-left: 30px;">*
					필수가 아닌항목은 체크해제시 적용되지 않습니다.</span>
			</h1>
		</div>
		<br>
		<hr style="margin: 5px 0px;">
		<form name="frm" method="post" style="margin-top: 50px;"
			action="<c:url value='/companypage/MyCompanyEdit.do' /> "
			enctype="multipart/form-data" >
			<input type="hidden" name = "comCode" value = ${param.comCode }>
		<div class="form-horizontal">
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comName"
						name="comName" value = "${vo.comName}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">대표자명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="ceo"
						name="ceo" value = "${vo.ceo }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">사업자등록번호 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comNum"
						name="comNum" value = "${vo.comNum }">
				</div>
			</div>
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label">주소<span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="zipcode" name="zipcode"
						placeholder="우편번호" value = "${vo.zipcode }" onclick="sample4_execDaumPostcode()" readonly="readonly">
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="address" name="address"
						placeholder="도로명주소" value = "${vo.address }" >
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="addressDetail"
						name="addressDetail" placeholder="상세주소" value = "${vo.addressDetail }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사 사진 
				</label>
				<div class="col-sm-9 form-input">
					<c:if test="${empty vo.imageURL }">
						<input type="hidden" name = "imageURL" value = "${vo.imageURL }">
						<input type="file" name="imageUpload" id="imageUpload" class="infobox"
						placeholder="회사 사진 재업로드"> 
					</c:if>
					<c:if test="${!empty vo.imageURL }">
						<img src = "<c:url value = '/companyInfoImage/${vo.imageURL }'/>">
					<input type="file" name="imageUpload" id="imageUpload" class="infobox"
						placeholder="회사 사진 재업로드"> 
					</c:if>
					<input type="hidden" name = "imageURL" value = "${vo.imageURL }">
				</div>
				<div class="col-sm-9 form-input">
					<img id="image" width="100" height="100" alt="Image Preview" style="display: none;">
				</div>
			</div>
			<div class="form-group">
					<label for="inputUser" class="col-sm-4 control-label">회사 내부 전화 번호 <span>*</span>
					</label>
					<div class="col-sm-9 form-input">
						<input type="text" class="form-control onlyNumber" id="comHp"
							name="comHp" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" value = "${vo.comHp }">
					</div>
			</div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 형태 <span>*</span></label>
	            	<div class="col-sm-9 form-input">
	                <select name="comType" id="comType" class="form-control">
	                	<option value="0">회사 형태를 선택하세요</option>
               			<option value="중소기업"
               				<c:if test="${'중소기업' eq vo.comType}">
               					selected
               				</c:if>
               			>중소기업</option>
               			<option value="중견기업"
               				<c:if test="${'중견기업' eq vo.comType}">
               					selected
               				</c:if>
               			>중견기업</option>
               			<option value="대기업"
               				<c:if test="${'대기업' eq vo.comType}">
               					selected
               				</c:if>
               			>대기업</option>
               			<option value="상장기업"
               				<c:if test="${'상장기업' eq vo.comType}">
               					selected
               				</c:if>
               			>상장기업</option>
               			<option value="공공기업"
               				<c:if test="${'공공기업' eq vo.comType}">
               					selected
               				</c:if>
               			>공공기업</option>
               			<option value="외국기업"
               				<c:if test="${'외국기업' eq vo.comType}">
               					selected
               				</c:if>
               			>외국기업</option>
               			<option value="기타"
               				<c:if test="${'기타' eq vo.comType}">
               					selected
               				</c:if>
               			>기타</option>
                      </select>
	                  </div>
	        </div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 업종  <span>*</span></label>
	            	<div class="col-sm-9 form-input">
	                <select name="comIndustry" id="comIndustry" class="form-control">
	                	<option value="0">회사 업종을 선택하세요</option>
	                	<option value="정보보안"
               				<c:if test="${'정보보안' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>정보보안</option>
	                	<option value="AS/카센터/주유"
               				<c:if test="${'AS/카센터/주유' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>AS/카센터/주유</option>
	                	<option value="판매/유통"
               				<c:if test="${'판매/유통' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>판매/유통</option>
	                	<option value="신문/잡지/언론사"
               				<c:if test="${'신문/잡지/언론사유통' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>신문/잡지/언론사</option>
	                	<option value="보험/증권/카드"
               				<c:if test="${'보험/증권/카드' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>보험/증권/카드</option>
	                	<option value="부동산/임대/중개"
               				<c:if test="${'부동산/임대/중개' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>부동산/임대/중개</option>
	                	<option value="병원/의료/약국"
               				<c:if test="${'병원/의료/약국' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>병원/의료/약국</option>
	                	<option value="통역/번역"
               				<c:if test="${'통역/번역' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>통역/번역</option>
	                	<option value="공연/예술/문화"
               				<c:if test="${'공연/예술/문화' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>공연/예술/문화</option>
	                	<option value="공연/예술/문화"
               				<c:if test="${'공연/예술/문화' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>공연/예술/문화</option>
	                	<option value="우편업"
               				<c:if test="${'우편업' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>우편업</option>
	                	<option value="식품가공/개발"
               				<c:if test="${'식품가공/개발' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>식품가공/개발"</option>
	                	<option value="기계/설비/자동차"
               				<c:if test="${'기계/설비/자동차' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>기계/설비/자동차</option>
	                	<option value="정부/공공기관/공기업"
               				<c:if test="${'정부/공공기관/공기업' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>정부/공공기관/공기업</option>
	                	<option value="공증/법률/특허"
               				<c:if test="${'공증/법률/특허' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>공증/법률/특허</option>
	                	<option value="포털/인터넷/컨텐츠"
               				<c:if test="${'포털/인터넷/컨텐츠' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>포털/인터넷/컨텐츠</option>
	                	<option value="웹에이젼시"
               				<c:if test="${'웹에이젼시' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>웹에이젼시</option>
	                	<option value="웨딩/이벤트"
               				<c:if test="${'웨딩/이벤트' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>웨딩/이벤트</option>
	                	<option value="섬유/의류/패션"
               				<c:if test="${'섬유/의류/패션' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>섬유/의류/패션</option>
	                	<option value="보안/경호/안전"
               				<c:if test="${'보안/경호/안전' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>보안/경호/안전</option>
	                	<option value="렌탈/임대"
               				<c:if test="${'렌탈/임대' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>렌탈/임대</option>
	                	<option value="택배/물류"
               				<c:if test="${'택배/물류' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>택배/물류</option>
	                	<option value="기타서비스업"
               				<c:if test="${'기타서비스업' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>기타서비스업</option>
	                	<option value="은행/금융서비스"
               				<c:if test="${'은행/금융서비스' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>은행/금융서비스</option>
	                	<option value="구인구직/채용서비스"
               				<c:if test="${'구인구직/채용서비스' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>구인구직/채용서비스</option>
	                	<option value="전기/전자/제어"
               				<c:if test="${'전기/전자/제어' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>전기/전자/제어</option>
	                	<option value="가구/목재/제지"
               				<c:if test="${'가구/목재/제지' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>가구/목재/제지</option>
	                	<option value="조선/항공/우주"
               				<c:if test="${'조선/항공/우주' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>조선/항공/우주</option>
	                	<option value="관광/항공"
               				<c:if test="${'관광/항공' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>관광/항공</option>
	                	<option value="제약/건강관리/바이오"
               				<c:if test="${'제약/건강관리/바이오' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>제약/건강관리/바이오</option>
	                	<option value="솔루션/SI/ERP/CRM"
               				<c:if test="${'솔루션/SI/ERP/CRM' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>솔루션/SI/ERP/CRM</option>
	                	<option value="생활용품/소모품"
               				<c:if test="${'생활용품/소모품' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>생활용품/소모품</option>
	                	<option value="헤드헌팅/인력공급"
               				<c:if test="${'헤드헌팅/인력공급' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>헤드헌팅/인력공급</option>
	                	<option value="학원/어학원"
               				<c:if test="${'학원/어학원' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>학원/어학원</option>
	                	<option value="IT/정보기술"
               				<c:if test="${'IT/정보기술' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>IT/정보기술</option>
	                	<option value="호텔/여행"
               				<c:if test="${'호텔/여행' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>호텔/여행</option>
	                	<option value="금속/재료/철강/요업"
               				<c:if test="${'웹에이금속/재료/철강/요업젼시' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>금속/재료/철강/요업</option>
	                	<option value="대출/캐피탈"
               				<c:if test="${'대출/캐피탈' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>대출/캐피탈</option>
	                	<option value="유아/유치원"
               				<c:if test="${'유아/유치원' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>유아/유치원</option>
	                	<option value="네트워크/통신/모바일"
               				<c:if test="${'네트워크/통신/모바일' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>네트워크/통신/모바일</option>
	                	<option value="화장품/뷰티"
               				<c:if test="${'화장품/뷰티' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>화장품/뷰티</option>
	                	<option value="인테리어/조경"
               				<c:if test="${'인테리어/조경' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>웹에이인테리어/조경젼시</option>
	                	<option value="농업/어업/광업"
               				<c:if test="${'농업/어업/광업' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>농업/어업/광업</option>
	                	<option value="etc"
               				<c:if test="${'etc' eq vo.comIndustry}">
               					selected
               				</c:if>
               			>기타</option>
               			
		                <option value="etc" >기타</option>
                      </select>
	                  </div>
					<div class="form-group">
						<div class="col-sm-9 form-input">
							<input type="text" class="form-control" name="comIndustry2" id="comIndustry2" title="기타 입력란"
							 style="display: none;">
						</div>
					</div>
 	        </div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">주요 사업 내용 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<textarea rows="8" cols="20" name = "content"
						style="width: 570px;">${fn:replace(vo.content , newLine, '<br>')}</textarea>
				</div>
			</div>	
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label onlyAlphabet ">홈페이지
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="homepage"
						name="homepage" value = "${vo.homepage }">
				</div>
			</div>
		<!-- main end -->
		</div>
		<div class="btSubmit">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="submit" class="btn btn-primary">수정하기</button>
			</div>
		</div>
		</form>
		<!-- submit button -->
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

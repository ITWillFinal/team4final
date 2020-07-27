<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp"%>
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
		
		$('#select_industry').change(function(){
			if($(this).val()=='기타'){
				$('#select_industry2').val("");
				$('#select_industry2').css('visibility','visible');
				$('#select_industry2').focus();				
			}else{
				$('#select_industry2').css('visibility','hidden');
			}
		});
		
	});//function
</script>

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
<style>
hr{
	height: 3px;
    background: #da2461;
}

</style>
<main>
	<%@ include file="../inc/companySidebar.jsp"%>
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px; border: 1px solid lightgray">
		<!-- main -->
		<div style="margin: 5px; height: 95px;">
			<h1 style="background: white; padding: 20px 0; font-weight: bold;">
				회사 정보 입력 <span
					style="font-size: 14px; color: red; padding-left: 30px;">*
					필수가 아닌항목은 체크해제시 적용되지 않습니다.</span>
			</h1>
		</div>
		<br>
		<div class="form-horizontal">
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comName"
						name="comName"
						placeholder="회사명 입력 부탁드립니다.">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">대표자명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="ceo"
						name="ceo" >
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">사업자등록번호 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comNum"
						name="comNum" >
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">사업자등록번호 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comNum"
						name="comNum" >
				</div>
			</div>
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label">주소</label> 
				<div class="col-sm-9 form-input">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					<br><br>
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="zipcode" name="zipcode"
						placeholder="우편번호" ReadOnly>
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="address" name="address"
						placeholder="도로명주소">
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="addressDetail"
						name="addressDetail" placeholder="상세주소">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사 사진 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="file" name="imageUpload" id="imageUpload" class="infobox"
						placeholder="회사 사진 업로드"> 
				</div>
				<div class="col-sm-9 form-input">
					<img id="image" width="100" height="100" alt="Image Preview" style="display: none;">
				</div>
			</div>
			<div class="form-group">
					<label for="inputUser" class="col-sm-3 control-label">회사 내부 전화 번호 <span>*</span>
					</label>
					<div class="col-sm-9 form-input">
						<input type="text" class="form-control onlyNumber" id="comHp"
							name="comHp" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" >
					</div>
			</div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 형태 <span>*</span></label>
	            	<div class="col-sm-9 form-input">
	                <select name="select_type" id="select_type" class="form-control">
	                	<option value="0">회사형태를 선택하세요</option>
                 			<option value="소기업" >소기업</option>
						   	<option value="중소기업" >중소기업</option>
			                <option value="중견기업" >중견기업</option>
			                <option value="대기업" >대기업</option>
			                <option value="상장기업" >상장기업</option>
			                <option value="공공기업" >공공기업</option>
			                <option value="외국기업" >외국기업</option>
			                <option value="기타" >기타</option>
                      </select>
	                  </div>
	        </div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 업종  <span>*</span></label>
	            	<div class="col-sm-9 form-input">
	                <select name="select_industry" id="select_industry" class="form-control">
	                	<option value="0">회사 업종을 선택하세요</option>
			                <option value="정보보안" >정보보안</option>
			                <option value="AS/카센터/주유" >AS/카센터/주유</option>
			                <option value="판매/유통" >판매/유통</option>
			                <option value="신문/잡지/언론사" >신문/잡지/언론사</option>
			                <option value="보험/증권/카드" >보험/증권/카드</option>
			                <option value="부동산/임대/중개" >부동산/임대/중개</option>
			                <option value="병원/의료/약국" >병원/의료/약국</option>
			                <option value="통역/번역" >통역/번역</option>
			                <option value="공연/예술/문화" >공연/예술/문화</option>
			                <option value="우편업" >우편업</option>
			                <option value="식품가공/개발" >식품가공/개발</option>
			                <option value="기계/설비/자동차" >기계/설비/자동차</option>
			                <option value="정부/공공기관/공기업" >정부/공공기관/공기업</option>
			                <option value="공증/법률/특허" >공증/법률/특허</option>
			                <option value="반도체/광학/LCD" >반도체/광학/LCD</option>
			                <option value="포털/인터넷/컨텐츠" >포털/인터넷/컨텐츠</option>
			                <option value="웹에이젼시" >웹에이젼시</option>
			                <option value="웨딩/이벤트" >웨딩/이벤트</option>
			                <option value="섬유/의류/패션" >섬유/의류/패션</option>
			                <option value="보안/경호/안전" >보안/경호/안전</option>
			                <option value="렌탈/임대" >렌탈/임대</option>
			                <option value="택배/물류" >택배/물류</option>
			                <option value="기타서비스업" >기타서비스업</option>
			                <option value="은행/금융서비스" >은행/금융서비스</option>
			                <option value="구인구직/채용서비스" >구인구직/채용서비스</option>
			                <option value="전기/전자/제어" >전기/전자/제어</option>
			                <option value="가구/목재/제지" >가구/목재/제지</option>
			                <option value="조선/항공/우주" >조선/항공/우주</option>
			                <option value="관광/항공" >관광/항공</option>
			                <option value="제약/건강관리/바이오" >제약/건강관리/바이오</option>
			                <option value="솔루션/SI/ERP/CRM" >솔루션/SI/ERP/CRM</option>
			                <option value="생활용품/소모품" >생활용품/소모품</option>
			                <option value="헤드헌팅/인력공급" >헤드헌팅/인력공급</option>
			                <option value="학원/어학원" >학원/어학원</option>
			                <option value="IT/정보기술" >IT/정보기술</option>
			                <option value="호텔/여행" >호텔/여행</option>
			                <option value="금속/재료/철강/요업" >금속/재료/철강/요업</option>
			                <option value="대출/캐피탈" >대출/캐피탈</option>
			                <option value="유아/유치원" >유아/유치원</option>
			                <option value="네트워크/통신/모바일" >네트워크/통신/모바일</option>
			                <option value="화장품/뷰티" >화장품/뷰티</option>
			                <option value="인테리어/조경" >인테리어/조경</option>
			                <option value="농업/어업/광업" >농업/어업/광업</option>
			                <option value="기타" >기타</option>
                      </select>
	                  </div>
					<div class="form-group">
						<div class="col-sm-9 form-input">
							<input type="text" class="form-control" name="select_industry2" id="select_industry2" title="기타 입력란"
							 style="visibility: hidden;">
						</div>
					</div>
					
 	        </div>
						
			
		<!-- main end -->
		</div>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

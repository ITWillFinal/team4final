<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
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
	
	$('#edit').click(function() {
		location.href = "<c:url value = '/companypage/MyCompanyEdit.do?comCode=${vo.comCode}'/>";
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
<style>
hr{
	height: 3px;
    background: #da2461;
}

</style>
<main>
	<%@ include file="../inc/companySidebar.jsp"%>
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
		
		<!-- main -->
		<div style="margin: 5px; height: 95px;"><br>
			<h1 style="background: white; padding: 20px; font-weight: bold;">
				[${vo.comName }] 정보 조회 
			</h1>
		</div>
		<br>
		<hr>
		<form name="frm" method="post" style="margin-top: 50px;" enctype="multipart/form-data" >
		<div class="form-horizontal">
			<input type="hidden" name = "comCode" value = ${vo.comCode }>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comName"
						name="comName" value = "${vo.comName}" ReadOnly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">대표자명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="ceo"
						name="ceo" value = "${vo.ceo}" ReadOnly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">사업자등록번호 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comNum"
						name="comNum" value = "${vo.comNum }" ReadOnly>
				</div>
			</div>
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label">주소<span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					<br><br>
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="zipcode" name="zipcode"
						placeholder="우편번호" ReadOnly value = "${vo.zipcode}" ReadOnly>
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="address" name="address"
						placeholder="도로명주소" value = "${vo.address }" ReadOnly>
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="addressDetail"
						name="addressDetail" placeholder="상세주소" value = "${vo.addressDetail }" ReadOnly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사 사진 
				</label>
				<div class="col-sm-9 form-input">
					<input type="file" name="imageUpload" id="imageUpload" class="infobox"
						placeholder="회사 사진 업로드"> 
				</div>
				<div class="col-sm-9 form-input">
					<img id="image" width="100" height="100" alt="Image Preview" style="display: none;">
					<%-- 회사 사진 보기
					<img alt="회사 사진 보기" src="<c:url value = '/resources/img'/>"> --%>
				</div>
			</div>
			<div class="form-group">
					<label for="inputUser" class="col-sm-4 control-label">회사 내부 전화 번호 <span>*</span>
					</label>
					<div class="col-sm-9 form-input">
						<input type="text" class="form-control onlyNumber" id="comHp"
							name="comHp" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" 
							value = "${vo.comHp }" ReadOnly>
					</div>
			</div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 형태 <span>*</span></label>
            		<div class="col-sm-9 form-input">
            			<input type="text" value = "${vo.comType }"readonly="readonly">
                  	</div>
	        </div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 업종  <span>*</span></label>
	            	<div class="col-sm-9 form-input">
	            		<input type="text" value = "${vo.comIndustry}" readonly="readonly">
                    </div>	
 	        </div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">주요 사업 내용 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<textarea rows="8" cols="20" name = "content" readonly="readonly"
						style="width: 645px;">${fn:replace(vo.content , newLine, '<br>')}</textarea>
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
				<button type="button" id = "edit" class="btn btn-primary">수정</button>
			</div>
		</div>
		</form>
		<!-- submit button -->
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

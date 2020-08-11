<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style>
	td {
		border:solid 1px lightgray;
	}
	input[type=text] {
		width:100%;
	}
	input[type=date] {
		width:100%;
	}
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
	
	textarea {
    resize:none; /*크기고정 */ 
	}	
	
	/* 체크박스 => 토글 슬라이더 */
	.switch {
	position: relative;
	display: inline-block;
	width: 30px;
	height: 17px;
	}
	.switch input {
		opacity: 0;
		width: 0;
		height: 0;	
	}
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #ccc;
		-webkit-transition: .4s;
		transition: .4s;
	}
	.slider:before {
		position: absolute;
		content: "";
		height: 13px;
		width: 13px;
		left:2px;
		bottom: 2px;
		background-color: white;
		-webkit-transition: .4s;
		transition: .4s;	
	}
	input:checked + .slider {
		background-color: #2196F3;
	}
	input:focus + .slider {
		box-shadow: 0 0 1px #2196F3;
	}
	input:checked + .slider:before {
		-webkit-transform: translateX(13px);
		-ms-transform: translateX(13px);
		transform: translate(13px);
	}
	.slider.round {
		border-radius: 17px;
	}
	.slider.round:before {
		border-radius: 50%;
	}
	
	.awardsTr {
		display: none;
	}
	.careerTr {
		display: none;
	}
	.activityTr {
		display: none;
	}
	.languageTr {
		display: none;
	}
	.certificateTr {
		display: none;
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
	};
	

</script>



<script type="text/javascript">
	
	$(function(){
		//DB값 처리 시작
		var n1 = $("#schoolVal").val();
		if(n1=="n"){
			$("#schoolDiv").hide();
		}
		
		var n2 = $("#careerVal").val();
		if(n2=="n"){
			$("#careerDiv").hide();
		}
		
		var n3 = $("#certificateVal").val();
		if(n3=="n"){
			$("#certificateDiv").hide();
		}
		
		var n4 = $("#languageVal").val();
		if(n4=="n"){
			$("#languageDiv").hide();
		}	
		
		var n5 = $("#awardsVal").val();
		if(n5=="n"){
			$("#awardsDiv").hide();
		}
		
		var n6 = $("#specialVal").val();
		if(n6=="n"){
			$("#specialDiv").hide();
		}
		
		var n7 = $("#activityVal").val();
		if(n7=="n"){
			$("#activityDiv").hide();
		}
		
		var n8 = $("#selfVal").val();
		if(n8=="n"){
			$("#selfDiv").hide();
		}
		//DB값 처리 끝
		
		
		
		
		//필수값 처리
		
		$("#address").val();
		$("#addressDetail").val();
		
		$('form[name=frm]').submit(function(){
			if($("#name").val()==''){
				alert('이름을 입력하세요');
				$('#name').focus();
				event.preventDefault();
			}else if($('#gender').val()==''){
				alert('성별을 입력하세요');
				$('#gender').focus();
				event.preventDefault();
			}else if($('#email').val()==''){
				alert('이메일주소를 입력하세요');
				$('#email').focus();
				event.preventDefault();
			}else if($('#hp').val()==''){
				alert('전화번호를 입력하세요');
				$('#hp').focus();
				event.preventDefault();
			}else if($('#birth').val()==''){
				alert('생년월일을 입력하세요');
				$('#birth').focus();
				event.preventDefault();
			}else if($('#zipcode').val()==''){
				alert('우편번호를 입력하세요');
				$('#zipcode').focus();
				event.preventDefault();
			}else if($('#address').val()==''){
				alert('주소를 입력하세요');
				$('#address').focus();
				event.preventDefault();
			}else if($('#addressDetail').val()==''){
				alert('상세주소를 입력하세요');
				$('#addressDetail').focus();
				event.preventDefault();
			}else if($('#self1area').val().indexOf('*')!=-1){
				alert("자기소개서 내용에 *은 포함될 수 없습니다");
				$('#self1area').focus();
				event.preventDefault();
			}else if($('#self2area').val().indexOf('*')!=-1){
				alert("자기소개서 내용에 *은 포함될 수 없습니다");
				$('#self2area').focus();
				event.preventDefault();
			}else if($('#self3area').val().indexOf('*')!=-1){
				alert("자기소개서 내용에 *은 포함될 수 없습니다");
				$('#self3area').focus();
				event.preventDefault();
			}else if($('#self4area').val().indexOf('*')!=-1){
				alert("자기소개서 내용에 *은 포함될 수 없습니다");
				$('#self4area').focus();
				event.preventDefault();
			}else if($('#self5area').val().indexOf('*')!=-1){
				alert("자기소개서 내용에 *은 포함될 수 없습니다");
				$('#self5area').focus();
				event.preventDefault();
			}		
			
			
		});
		
		//성별
		$("#genderSelect").change(function(){
			var genderSel = $("#genderSelect option:selected").val();
			$("#gender").val(genderSel);
		});
						
		//학력사항		
		var eduData = "";
		var eduData1 = "";
		var eduData2 = "";
		var eduData3 = "";
		
		$("#schoolTable").children().children().change(function(){
			eduData1 = $("#schoolName").val();
			eduData2 = $("#schoolMajor").val();
			eduData3 = $("#schoolDate").val();

			$("#edu1").val(eduData1);
			$("#edu2").val(eduData2);
			$("#edu3").val(eduData3);
			
			if(eduData1=="" || eduData2=="" || eduData3==""){
				eduData = "";				
			}else{
				eduData = eduData1+" "+eduData2+" "+eduData3;
			}
			
			$("#edu").val(eduData);
		});
		
		
		
		//경력
		var careerTr1Td1 = "";
		var careerTr1Td2 = "";
		var careerTr1Td3 = "";
		var careerTr1Td4 = "";
		var careerTr1Td5 = "";
		
		var careerTr2Td1 = "";
		var careerTr2Td2 = "";
		var careerTr2Td3 = "";
		var careerTr2Td4 = "";
		var careerTr2Td5 = "";
		
		var careerTr3Td1 = "";
		var careerTr3Td2 = "";
		var careerTr3Td3 = "";
		var careerTr3Td4 = "";
		var careerTr3Td5 = "";
		
		var careerTr4Td1 = "";
		var careerTr4Td2 = "";
		var careerTr4Td3 = "";
		var careerTr4Td4 = "";
		var careerTr4Td5 = "";
		
		var careerTr5Td1 = "";
		var careerTr5Td2 = "";
		var careerTr5Td3 = "";
		var careerTr5Td4 = "";
		var careerTr5Td5 = "";
		
		var careerTotal = "";
		
		var careerResult1 = "";
		var careerResult2 = "";
		var careerResult3 = "";
		var careerResult4 = "";
		var careerResult5 = "";
										
		$("#careerTable").children().children().change(function(){
			careerTr1Td1 = $("#careerTr1Td1").val();
			careerTr1Td2 = $("#careerTr1Td2").val();
			careerTr1Td3 = $("#careerTr1Td3").val();
			careerTr1Td4 = $("#careerTr1Td4").val();
			careerTr1Td5 = $("#careerTr1Td5").val();
			
			careerTr2Td1 = $("#careerTr2Td1").val();
			careerTr2Td2 = $("#careerTr2Td2").val();
			careerTr2Td3 = $("#careerTr2Td3").val();
			careerTr2Td4 = $("#careerTr2Td4").val();
			careerTr2Td5 = $("#careerTr2Td5").val();
			
			careerTr3Td1 = $("#careerTr3Td1").val();
			careerTr3Td2 = $("#careerTr3Td2").val();
			careerTr3Td3 = $("#careerTr3Td3").val();
			careerTr3Td4 = $("#careerTr3Td4").val();
			careerTr3Td5 = $("#careerTr3Td5").val();
			
			careerTr4Td1 = $("#careerTr4Td1").val();
			careerTr4Td2 = $("#careerTr4Td2").val();
			careerTr4Td3 = $("#careerTr4Td3").val();
			careerTr4Td4 = $("#careerTr4Td4").val();
			careerTr4Td5 = $("#careerTr4Td5").val();
			
			careerTr5Td1 = $("#careerTr5Td1").val();
			careerTr5Td2 = $("#careerTr5Td2").val();
			careerTr5Td3 = $("#careerTr5Td3").val();
			careerTr5Td4 = $("#careerTr5Td4").val();
			careerTr5Td5 = $("#careerTr5Td5").val();
			
			if(careerTr1Td1=="" || careerTr1Td2=="" || careerTr1Td3=="" || careerTr1Td4=="" || careerTr1Td5==""){
				careerResult1 = "";				
			}else{
				careerResult1 = careerTr1Td1+" "+careerTr1Td2+" "+careerTr1Td3+" "+careerTr1Td4+" "+careerTr1Td5;
			}
			
			if(careerTr2Td1=="" || careerTr2Td2=="" || careerTr2Td3=="" || careerTr2Td4=="" || careerTr2Td5==""){
				careerResult2 = "";				
			}else{
				careerResult2 = careerTr2Td1+" "+careerTr2Td2+" "+careerTr2Td3+" "+careerTr2Td4+" "+careerTr2Td5;
			}
			
			if(careerTr3Td1=="" || careerTr3Td2=="" || careerTr3Td3=="" || careerTr3Td4=="" || careerTr3Td5==""){
				careerResult3 = "";				
			}else{
				careerResult3 = careerTr3Td1+" "+careerTr3Td2+" "+careerTr3Td3+" "+careerTr3Td4+" "+careerTr3Td5;
			}
			
			if(careerTr4Td1=="" || careerTr4Td2=="" || careerTr4Td3=="" || careerTr4Td4=="" || careerTr4Td5==""){
				careerResult4 = "";				
			}else{
				careerResult4 = careerTr4Td1+" "+careerTr4Td2+" "+careerTr4Td3+" "+careerTr4Td4+" "+careerTr4Td5;
			}
			
			if(careerTr5Td1=="" || careerTr5Td2=="" || careerTr5Td3=="" || careerTr5Td4=="" || careerTr5Td5==""){
				careerResult5 = "";				
			}else{
				careerResult5 = careerTr5Td1+" "+careerTr5Td2+" "+careerTr5Td3+" "+careerTr5Td4+" "+careerTr5Td5;
			}						
			
			$("#careerResult1").val(careerResult1);
			$("#careerResult2").val(careerResult2);
			$("#careerResult3").val(careerResult3);
			$("#careerResult4").val(careerResult4);
			$("#careerResult5").val(careerResult5);
			
			if(careerResult2!=""){
				careerResult2="*"+careerResult2;
			}
			if(careerResult3!=""){
				careerResult3="*"+careerResult3;
			}
			if(careerResult4!=""){
				careerResult4="*"+careerResult4;
			}
			if(careerResult5!=""){
				careerResult5="*"+careerResult5;
			}
			
			careerTotal = careerResult1 + careerResult2 + careerResult3 + careerResult4 + careerResult5;
			$("#career").val(careerTotal);
										
		});
		
		$("#careerAddBtn").click(function(){
			$('.careerTr:eq(0)').removeClass('careerTr');
		});
		
		$("#careerDelBtn").click(function(){
			$('.careerDel').not('.careerTr').last().find('input').val('');
			$('.careerDel').not('.careerTr').last().addClass('careerTr');
			
			careerTr1Td1 = $("#careerTr1Td1").val();
			careerTr1Td2 = $("#careerTr1Td2").val();
			careerTr1Td3 = $("#careerTr1Td3").val();
			
			careerTr2Td1 = $("#careerTr2Td1").val();
			careerTr2Td2 = $("#careerTr2Td2").val();
			careerTr2Td3 = $("#careerTr2Td3").val();
			
			careerTr3Td1 = $("#careerTr3Td1").val();
			careerTr3Td2 = $("#careerTr3Td2").val();
			careerTr3Td3 = $("#careerTr3Td3").val();
			
			careerTr4Td1 = $("#careerTr4Td1").val();
			careerTr4Td2 = $("#careerTr4Td2").val();
			careerTr4Td3 = $("#careerTr4Td3").val();
			
			careerTr5Td1 = $("#careerTr5Td1").val();
			careerTr5Td2 = $("#careerTr5Td2").val();
			careerTr5Td3 = $("#careerTr5Td3").val();
			
			if(careerTr1Td1=="" || careerTr1Td2=="" || careerTr1Td3=="" || careerTr1Td4=="" || careerTr1Td5==""){
				careerResult1 = "";				
			}else{
				careerResult1 = careerTr1Td1+" "+careerTr1Td2+" "+careerTr1Td3+" "+careerTr1Td4+" "+careerTr1Td5;
			}
			
			if(careerTr2Td1=="" || careerTr2Td2=="" || careerTr2Td3=="" || careerTr2Td4=="" || careerTr2Td5==""){
				careerResult2 = "";				
			}else{
				careerResult2 = careerTr2Td1+" "+careerTr2Td2+" "+careerTr2Td3+" "+careerTr2Td4+" "+careerTr2Td5;
			}
			
			if(careerTr3Td1=="" || careerTr3Td2=="" || careerTr3Td3=="" || careerTr3Td4=="" || careerTr3Td5==""){
				careerResult3 = "";				
			}else{
				careerResult3 = careerTr3Td1+" "+careerTr3Td2+" "+careerTr3Td3+" "+careerTr3Td4+" "+careerTr3Td5;
			}
			
			if(careerTr4Td1=="" || careerTr4Td2=="" || careerTr4Td3=="" || careerTr4Td4=="" || careerTr4Td5==""){
				careerResult4 = "";				
			}else{
				careerResult4 = careerTr4Td1+" "+careerTr4Td2+" "+careerTr4Td3+" "+careerTr4Td4+" "+careerTr4Td5;
			}
			
			if(careerTr5Td1=="" || careerTr5Td2=="" || careerTr5Td3=="" || careerTr5Td4=="" || careerTr5Td5==""){
				careerResult5 = "";				
			}else{
				careerResult5 = careerTr5Td1+" "+careerTr5Td2+" "+careerTr5Td3+" "+careerTr5Td4+" "+careerTr5Td5;
			}					
			
			$("#careerResult1").val(careerResult1);
			$("#careerResult2").val(careerResult2);
			$("#careerResult3").val(careerResult3);
			$("#careerResult4").val(careerResult4);
			$("#careerResult5").val(careerResult5);
			
			if(careerResult2!=""){
				careerResult2="*"+careerResult2;
			}
			if(careerResult3!=""){
				careerResult3="*"+careerResult3;
			}
			if(careerResult4!=""){
				careerResult4="*"+careerResult4;
			}
			if(careerResult5!=""){
				careerResult5="*"+careerResult5;
			}
			
			careerTotal = careerResult1 + careerResult2 + careerResult3 + careerResult4 + careerResult5;
			$("#career").val(careerTotal);
		});
		
		//자격증
		var certificateTr1Td1 = "";
		var certificateTr1Td2 = "";
		var certificateTr1Td3 = "";
		
		var certificateTr2Td1 = "";
		var certificateTr2Td2 = "";
		var certificateTr2Td3 = "";
		
		var certificateTr3Td1 = "";
		var certificateTr3Td2 = "";
		var certificateTr3Td3 = "";
		
		var certificateTr4Td1 = "";
		var certificateTr4Td2 = "";
		var certificateTr4Td3 = "";
		
		var certificateTr5Td1 = "";
		var certificateTr5Td2 = "";
		var certificateTr5Td3 = "";
		
		var certificateTotal = "";
		
		var certificateResult1 = "";
		var certificateResult2 = "";
		var certificateResult3 = "";
		var certificateResult4 = "";
		var certificateResult5 = "";
										
		$("#certificateTable").children().children().change(function(){
			certificateTr1Td1 = $("#certificateTr1Td1").val();
			certificateTr1Td2 = $("#certificateTr1Td2").val();
			certificateTr1Td3 = $("#certificateTr1Td3").val();
			
			certificateTr2Td1 = $("#certificateTr2Td1").val();
			certificateTr2Td2 = $("#certificateTr2Td2").val();
			certificateTr2Td3 = $("#certificateTr2Td3").val();
			
			certificateTr3Td1 = $("#certificateTr3Td1").val();
			certificateTr3Td2 = $("#certificateTr3Td2").val();
			certificateTr3Td3 = $("#certificateTr3Td3").val();
			
			certificateTr4Td1 = $("#certificateTr4Td1").val();
			certificateTr4Td2 = $("#certificateTr4Td2").val();
			certificateTr4Td3 = $("#certificateTr4Td3").val();
			
			certificateTr5Td1 = $("#certificateTr5Td1").val();
			certificateTr5Td2 = $("#certificateTr5Td2").val();
			certificateTr5Td3 = $("#certificateTr5Td3").val();
			
			if(certificateTr1Td1=="" || certificateTr1Td2=="" || certificateTr1Td3=="" ){
				certificateResult1 = "";				
			}else{
				certificateResult1 = certificateTr1Td1+" "+certificateTr1Td2+" "+certificateTr1Td3;
			}
			
			if(certificateTr2Td1=="" || certificateTr2Td2=="" || certificateTr2Td3==""){
				certificateResult2 = "";				
			}else{
				certificateResult2 = certificateTr2Td1+" "+certificateTr2Td2+" "+certificateTr2Td3;
			}
			
			if(certificateTr3Td1=="" || certificateTr3Td2=="" || certificateTr3Td3==""){
				certificateResult3 = "";				
			}else{
				certificateResult3 = certificateTr3Td1+" "+certificateTr3Td2+" "+certificateTr3Td3;
			}
			
			if(certificateTr4Td1=="" || certificateTr4Td2=="" || certificateTr4Td3==""){
				certificateResult4 = "";				
			}else{
				certificateResult4 = certificateTr4Td1+" "+certificateTr4Td2+" "+certificateTr4Td3;
			}
			
			if(certificateTr5Td1=="" || certificateTr5Td2=="" || certificateTr5Td3==""){
				certificateResult5 = "";				
			}else{
				certificateResult5 = certificateTr5Td1+" "+certificateTr5Td2+" "+certificateTr5Td3;
			}						
			
			$("#certificateResult1").val(certificateResult1);
			$("#certificateResult2").val(certificateResult2);
			$("#certificateResult3").val(certificateResult3);
			$("#certificateResult4").val(certificateResult4);
			$("#certificateResult5").val(certificateResult5);
			
			if(certificateResult2!=""){
				certificateResult2="*"+certificateResult2;
			}
			if(certificateResult3!=""){
				certificateResult3="*"+certificateResult3;
			}
			if(certificateResult4!=""){
				certificateResult4="*"+certificateResult4;
			}
			if(certificateResult5!=""){
				certificateResult5="*"+certificateResult5;
			}
			
			certificateTotal = certificateResult1 + certificateResult2 + certificateResult3 + certificateResult4 + certificateResult5;
			$("#certificate").val(certificateTotal);
										
		});
		
		$("#certificateAddBtn").click(function(){
			$('.certificateTr:eq(0)').removeClass('certificateTr');
		});
		
		$("#certificateDelBtn").click(function(){
			$('.certificateDel').not('.certificateTr').last().find('input').val('');
			$('.certificateDel').not('.certificateTr').last().addClass('certificateTr');
			
			certificateTr1Td1 = $("#certificateTr1Td1").val();
			certificateTr1Td2 = $("#certificateTr1Td2").val();
			certificateTr1Td3 = $("#certificateTr1Td3").val();
			
			certificateTr2Td1 = $("#certificateTr2Td1").val();
			certificateTr2Td2 = $("#certificateTr2Td2").val();
			certificateTr2Td3 = $("#certificateTr2Td3").val();
			
			certificateTr3Td1 = $("#certificateTr3Td1").val();
			certificateTr3Td2 = $("#certificateTr3Td2").val();
			certificateTr3Td3 = $("#certificateTr3Td3").val();
			
			certificateTr4Td1 = $("#certificateTr4Td1").val();
			certificateTr4Td2 = $("#certificateTr4Td2").val();
			certificateTr4Td3 = $("#certificateTr4Td3").val();
			
			certificateTr5Td1 = $("#certificateTr5Td1").val();
			certificateTr5Td2 = $("#certificateTr5Td2").val();
			certificateTr5Td3 = $("#certificateTr5Td3").val();
			
			if(certificateTr1Td1=="" || certificateTr1Td2=="" || certificateTr1Td3=="" ){
				certificateResult1 = "";				
			}else{
				certificateResult1 = certificateTr1Td1+" "+certificateTr1Td2+" "+certificateTr1Td3;
			}
			
			if(certificateTr2Td1=="" || certificateTr2Td2=="" || certificateTr2Td3==""){
				certificateResult2 = "";				
			}else{
				certificateResult2 = certificateTr2Td1+" "+certificateTr2Td2+" "+certificateTr2Td3;
			}
			
			if(certificateTr3Td1=="" || certificateTr3Td2=="" || certificateTr3Td3==""){
				certificateResult3 = "";				
			}else{
				certificateResult3 = certificateTr3Td1+" "+certificateTr3Td2+" "+certificateTr3Td3;
			}
			
			if(certificateTr4Td1=="" || certificateTr4Td2=="" || certificateTr4Td3==""){
				certificateResult4 = "";				
			}else{
				certificateResult4 = certificateTr4Td1+" "+certificateTr4Td2+" "+certificateTr4Td3;
			}
			
			if(certificateTr5Td1=="" || certificateTr5Td2=="" || certificateTr5Td3==""){
				certificateResult5 = "";				
			}else{
				certificateResult5 = certificateTr5Td1+" "+certificateTr5Td2+" "+certificateTr5Td3;
			}						
			
			$("#certificateResult1").val(certificateResult1);
			$("#certificateResult2").val(certificateResult2);
			$("#certificateResult3").val(certificateResult3);
			$("#certificateResult4").val(certificateResult4);
			$("#certificateResult5").val(certificateResult5);
			
			if(certificateResult2!=""){
				certificateResult2="*"+certificateResult2;
			}
			if(certificateResult3!=""){
				certificateResult3="*"+certificateResult3;
			}
			if(certificateResult4!=""){
				certificateResult4="*"+certificateResult4;
			}
			if(certificateResult5!=""){
				certificateResult5="*"+certificateResult5;
			}
			
			certificateTotal = certificateResult1 + certificateResult2 + certificateResult3 + certificateResult4 + certificateResult5;
			$("#certificate").val(certificateTotal);
		});
				
	
		//외국어능력
		var languageTr1Td1 = "";
		var languageTr1Td2 = "";
		var languageTr1Td3 = "";
		
		var languageTr2Td1 = "";
		var languageTr2Td2 = "";
		var languageTr2Td3 = "";
		
		var languageTr3Td1 = "";
		var languageTr3Td2 = "";
		var languageTr3Td3 = "";
		
		var languageTr4Td1 = "";
		var languageTr4Td2 = "";
		var languageTr4Td3 = "";
		
		var languageTr5Td1 = "";
		var languageTr5Td2 = "";
		var languageTr5Td3 = "";
		
		var languageTotal = "";
		
		var languageResult1 = "";
		var languageResult2 = "";
		var languageResult3 = "";
		var languageResult4 = "";
		var languageResult5 = "";
										
		$("#languageTable").children().children().change(function(){
			languageTr1Td1 = $("#languageTr1Td1").val();
			languageTr1Td2 = $("#languageTr1Td2").val();
			languageTr1Td3 = $("#languageTr1Td3").val();
			
			languageTr2Td1 = $("#languageTr2Td1").val();
			languageTr2Td2 = $("#languageTr2Td2").val();
			languageTr2Td3 = $("#languageTr2Td3").val();
			
			languageTr3Td1 = $("#languageTr3Td1").val();
			languageTr3Td2 = $("#languageTr3Td2").val();
			languageTr3Td3 = $("#languageTr3Td3").val();
			
			languageTr4Td1 = $("#languageTr4Td1").val();
			languageTr4Td2 = $("#languageTr4Td2").val();
			languageTr4Td3 = $("#languageTr4Td3").val();
			
			languageTr5Td1 = $("#languageTr5Td1").val();
			languageTr5Td2 = $("#languageTr5Td2").val();
			languageTr5Td3 = $("#languageTr5Td3").val();
			
			if(languageTr1Td1=="" || languageTr1Td2=="" || languageTr1Td3=="" ){
				languageResult1 = "";				
			}else{
				languageResult1 = languageTr1Td1+" "+languageTr1Td2+" "+languageTr1Td3;
			}
			
			if(languageTr2Td1=="" || languageTr2Td2=="" || languageTr2Td3==""){
				languageResult2 = "";				
			}else{
				languageResult2 = languageTr2Td1+" "+languageTr2Td2+" "+languageTr2Td3;
			}
			
			if(languageTr3Td1=="" || languageTr3Td2=="" || languageTr3Td3==""){
				languageResult3 = "";				
			}else{
				languageResult3 = languageTr3Td1+" "+languageTr3Td2+" "+languageTr3Td3;
			}
			
			if(languageTr4Td1=="" || languageTr4Td2=="" || languageTr4Td3==""){
				languageResult4 = "";				
			}else{
				languageResult4 = languageTr4Td1+" "+languageTr4Td2+" "+languageTr4Td3;
			}
			
			if(languageTr5Td1=="" || languageTr5Td2=="" || languageTr5Td3==""){
				languageResult5 = "";				
			}else{
				languageResult5 = languageTr5Td1+" "+languageTr5Td2+" "+languageTr5Td3;
			}						
			
			$("#languageResult1").val(languageResult1);
			$("#languageResult2").val(languageResult2);
			$("#languageResult3").val(languageResult3);
			$("#languageResult4").val(languageResult4);
			$("#languageResult5").val(languageResult5);
			
			if(languageResult2!=""){
				languageResult2="*"+languageResult2;
			}
			if(languageResult3!=""){
				languageResult3="*"+languageResult3;
			}
			if(languageResult4!=""){
				languageResult4="*"+languageResult4;
			}
			if(languageResult5!=""){
				languageResult5="*"+languageResult5;
			}
			
			languageTotal = languageResult1 + languageResult2 + languageResult3 + languageResult4 + languageResult5;
			$("#language").val(languageTotal);
										
		});
		
		$("#languageAddBtn").click(function(){
			$('.languageTr:eq(0)').removeClass('languageTr');
		});
		
		$("#languageDelBtn").click(function(){
			$('.languageDel').not('.languageTr').last().find('input').val('');
			$('.languageDel').not('.languageTr').last().addClass('languageTr');
			
			languageTr1Td1 = $("#languageTr1Td1").val();
			languageTr1Td2 = $("#languageTr1Td2").val();
			languageTr1Td3 = $("#languageTr1Td3").val();
			
			languageTr2Td1 = $("#languageTr2Td1").val();
			languageTr2Td2 = $("#languageTr2Td2").val();
			languageTr2Td3 = $("#languageTr2Td3").val();
			
			languageTr3Td1 = $("#languageTr3Td1").val();
			languageTr3Td2 = $("#languageTr3Td2").val();
			languageTr3Td3 = $("#languageTr3Td3").val();
			
			languageTr4Td1 = $("#languageTr4Td1").val();
			languageTr4Td2 = $("#languageTr4Td2").val();
			languageTr4Td3 = $("#languageTr4Td3").val();
			
			languageTr5Td1 = $("#languageTr5Td1").val();
			languageTr5Td2 = $("#languageTr5Td2").val();
			languageTr5Td3 = $("#languageTr5Td3").val();
			
			if(languageTr1Td1=="" || languageTr1Td2=="" || languageTr1Td3=="" ){
				languageResult1 = "";				
			}else{
				languageResult1 = languageTr1Td1+" "+languageTr1Td2+" "+languageTr1Td3;
			}
			
			if(languageTr2Td1=="" || languageTr2Td2=="" || languageTr2Td3==""){
				languageResult2 = "";				
			}else{
				languageResult2 = languageTr2Td1+" "+languageTr2Td2+" "+languageTr2Td3;
			}
			
			if(languageTr3Td1=="" || languageTr3Td2=="" || languageTr3Td3==""){
				languageResult3 = "";				
			}else{
				languageResult3 = languageTr3Td1+" "+languageTr3Td2+" "+languageTr3Td3;
			}
			
			if(languageTr4Td1=="" || languageTr4Td2=="" || languageTr4Td3==""){
				languageResult4 = "";				
			}else{
				languageResult4 = languageTr4Td1+" "+languageTr4Td2+" "+languageTr4Td3;
			}
			
			if(languageTr5Td1=="" || languageTr5Td2=="" || languageTr5Td3==""){
				languageResult5 = "";				
			}else{
				languageResult5 = languageTr5Td1+" "+languageTr5Td2+" "+languageTr5Td3;
			}						
			
			$("#languageResult1").val(languageResult1);
			$("#languageResult2").val(languageResult2);
			$("#languageResult3").val(languageResult3);
			$("#languageResult4").val(languageResult4);
			$("#languageResult5").val(languageResult5);
			
			if(languageResult2!=""){
				languageResult2="*"+languageResult2;
			}
			if(languageResult3!=""){
				languageResult3="*"+languageResult3;
			}
			if(languageResult4!=""){
				languageResult4="*"+languageResult4;
			}
			if(languageResult5!=""){
				languageResult5="*"+languageResult5;
			}
			
			languageTotal = languageResult1 + languageResult2 + languageResult3 + languageResult4 + languageResult5;
			$("#language").val(languageTotal);
		});
		
		//수상기록
		var awardsTr1Td1 = "";
		var awardsTr1Td2 = "";
		var awardsTr1Td3 = "";
		
		var awardsTr2Td1 = "";
		var awardsTr2Td2 = "";
		var awardsTr2Td3 = "";
		
		var awardsTr3Td1 = "";
		var awardsTr3Td2 = "";
		var awardsTr3Td3 = "";
		
		var awardsTr4Td1 = "";
		var awardsTr4Td2 = "";
		var awardsTr4Td3 = "";
		
		var awardsTr5Td1 = "";
		var awardsTr5Td2 = "";
		var awardsTr5Td3 = "";
		
		var awardsTotal = "";
		
		var awardsResult1 = "";
		var awardsResult2 = "";
		var awardsResult3 = "";
		var awardsResult4 = "";
		var awardsResult5 = "";
										
		$("#awardsTable").children().children().change(function(){
			awardsTr1Td1 = $("#awardsTr1Td1").val();
			awardsTr1Td2 = $("#awardsTr1Td2").val();
			awardsTr1Td3 = $("#awardsTr1Td3").val();
			
			awardsTr2Td1 = $("#awardsTr2Td1").val();
			awardsTr2Td2 = $("#awardsTr2Td2").val();
			awardsTr2Td3 = $("#awardsTr2Td3").val();
			
			awardsTr3Td1 = $("#awardsTr3Td1").val();
			awardsTr3Td2 = $("#awardsTr3Td2").val();
			awardsTr3Td3 = $("#awardsTr3Td3").val();
			
			awardsTr4Td1 = $("#awardsTr4Td1").val();
			awardsTr4Td2 = $("#awardsTr4Td2").val();
			awardsTr4Td3 = $("#awardsTr4Td3").val();
			
			awardsTr5Td1 = $("#awardsTr5Td1").val();
			awardsTr5Td2 = $("#awardsTr5Td2").val();
			awardsTr5Td3 = $("#awardsTr5Td3").val();
			
			if(awardsTr1Td1=="" || awardsTr1Td2=="" || awardsTr1Td3=="" ){
				awardsResult1 = "";				
			}else{
				awardsResult1 = awardsTr1Td1+" "+awardsTr1Td2+" "+awardsTr1Td3;
			}
			
			if(awardsTr2Td1=="" || awardsTr2Td2=="" || awardsTr2Td3==""){
				awardsResult2 = "";				
			}else{
				awardsResult2 = awardsTr2Td1+" "+awardsTr2Td2+" "+awardsTr2Td3;
			}
			
			if(awardsTr3Td1=="" || awardsTr3Td2=="" || awardsTr3Td3==""){
				awardsResult3 = "";				
			}else{
				awardsResult3 = awardsTr3Td1+" "+awardsTr3Td2+" "+awardsTr3Td3;
			}
			
			if(awardsTr4Td1=="" || awardsTr4Td2=="" || awardsTr4Td3==""){
				awardsResult4 = "";				
			}else{
				awardsResult4 = awardsTr4Td1+" "+awardsTr4Td2+" "+awardsTr4Td3;
			}
			
			if(awardsTr5Td1=="" || awardsTr5Td2=="" || awardsTr5Td3==""){
				awardsResult5 = "";				
			}else{
				awardsResult5 = awardsTr5Td1+" "+awardsTr5Td2+" "+awardsTr5Td3;
			}						
			
			$("#awardsResult1").val(awardsResult1);
			$("#awardsResult2").val(awardsResult2);
			$("#awardsResult3").val(awardsResult3);
			$("#awardsResult4").val(awardsResult4);
			$("#awardsResult5").val(awardsResult5);
			
			if(awardsResult2!=""){
				awardsResult2="*"+awardsResult2;
			}
			if(awardsResult3!=""){
				awardsResult3="*"+awardsResult3;
			}
			if(awardsResult4!=""){
				awardsResult4="*"+awardsResult4;
			}
			if(awardsResult5!=""){
				awardsResult5="*"+awardsResult5;
			}
			
			awardsTotal = awardsResult1 + awardsResult2 + awardsResult3 + awardsResult4 + awardsResult5;
			$("#award").val(awardsTotal);
										
		});
		
		$("#awardsAddBtn").click(function(){
			$('.awardsTr:eq(0)').removeClass('awardsTr');
		});
		
		$("#awardsDelBtn").click(function(){
			$('.awardsDel').not('.awardsTr').last().find('input').val('');
			$('.awardsDel').not('.awardsTr').last().addClass('awardsTr');
			
			awardsTr1Td1 = $("#awardsTr1Td1").val();
			awardsTr1Td2 = $("#awardsTr1Td2").val();
			awardsTr1Td3 = $("#awardsTr1Td3").val();
			
			awardsTr2Td1 = $("#awardsTr2Td1").val();
			awardsTr2Td2 = $("#awardsTr2Td2").val();
			awardsTr2Td3 = $("#awardsTr2Td3").val();
			
			awardsTr3Td1 = $("#awardsTr3Td1").val();
			awardsTr3Td2 = $("#awardsTr3Td2").val();
			awardsTr3Td3 = $("#awardsTr3Td3").val();
			
			awardsTr4Td1 = $("#awardsTr4Td1").val();
			awardsTr4Td2 = $("#awardsTr4Td2").val();
			awardsTr4Td3 = $("#awardsTr4Td3").val();
			
			awardsTr5Td1 = $("#awardsTr5Td1").val();
			awardsTr5Td2 = $("#awardsTr5Td2").val();
			awardsTr5Td3 = $("#awardsTr5Td3").val();
			
			if(awardsTr1Td1=="" || awardsTr1Td2=="" || awardsTr1Td3=="" ){
				awardsResult1 = "";				
			}else{
				awardsResult1 = awardsTr1Td1+" "+awardsTr1Td2+" "+awardsTr1Td3;
			}
			
			if(awardsTr2Td1=="" || awardsTr2Td2=="" || awardsTr2Td3==""){
				awardsResult2 = "";				
			}else{
				awardsResult2 = awardsTr2Td1+" "+awardsTr2Td2+" "+awardsTr2Td3;
			}
			
			if(awardsTr3Td1=="" || awardsTr3Td2=="" || awardsTr3Td3==""){
				awardsResult3 = "";				
			}else{
				awardsResult3 = awardsTr3Td1+" "+awardsTr3Td2+" "+awardsTr3Td3;
			}
			
			if(awardsTr4Td1=="" || awardsTr4Td2=="" || awardsTr4Td3==""){
				awardsResult4 = "";				
			}else{
				awardsResult4 = awardsTr4Td1+" "+awardsTr4Td2+" "+awardsTr4Td3;
			}
			
			if(awardsTr5Td1=="" || awardsTr5Td2=="" || awardsTr5Td3==""){
				awardsResult5 = "";				
			}else{
				awardsResult5 = awardsTr5Td1+" "+awardsTr5Td2+" "+awardsTr5Td3;
			}						
			
			$("#awardsResult1").val(awardsResult1);
			$("#awardsResult2").val(awardsResult2);
			$("#awardsResult3").val(awardsResult3);
			$("#awardsResult4").val(awardsResult4);
			$("#awardsResult5").val(awardsResult5);
			
			if(awardsResult2!=""){
				awardsResult2="*"+awardsResult2;
			}
			if(awardsResult3!=""){
				awardsResult3="*"+awardsResult3;
			}
			if(awardsResult4!=""){
				awardsResult4="*"+awardsResult4;
			}
			if(awardsResult5!=""){
				awardsResult5="*"+awardsResult5;
			}
			
			awardsTotal = awardsResult1 + awardsResult2 + awardsResult3 + awardsResult4 + awardsResult5;
			$("#award").val(awardsTotal);
		});
		
		//대외활동
		var activityTr1Td1 = "";
		var activityTr1Td2 = "";
		var activityTr1Td3 = "";
		var activityTr1Td4 = "";
		
		var activityTr2Td1 = "";
		var activityTr2Td2 = "";
		var activityTr2Td3 = "";
		var activityTr2Td4 = "";
		
		var activityTr3Td1 = "";
		var activityTr3Td2 = "";
		var activityTr3Td3 = "";
		var activityTr3Td4 = "";
		
		var activityTr4Td1 = "";
		var activityTr4Td2 = "";
		var activityTr4Td3 = "";
		var activityTr4Td4 = "";
		
		var activityTr5Td1 = "";
		var activityTr5Td2 = "";
		var activityTr5Td3 = "";
		var activityTr5Td4 = "";
		
		var activityTotal = "";
		
		var activityResult1 = "";
		var activityResult2 = "";
		var activityResult3 = "";
		var activityResult4 = "";
		var activityResult5 = "";
										
		$("#activityTable").children().children().change(function(){
			activityTr1Td1 = $("#activityTr1Td1").val();
			activityTr1Td2 = $("#activityTr1Td2").val();
			activityTr1Td3 = $("#activityTr1Td3").val();
			activityTr1Td4 = $("#activityTr1Td4").val();
			
			activityTr2Td1 = $("#activityTr2Td1").val();
			activityTr2Td2 = $("#activityTr2Td2").val();
			activityTr2Td3 = $("#activityTr2Td3").val();
			activityTr2Td4 = $("#activityTr2Td4").val();
			
			activityTr3Td1 = $("#activityTr3Td1").val();
			activityTr3Td2 = $("#activityTr3Td2").val();
			activityTr3Td3 = $("#activityTr3Td3").val();
			activityTr3Td4 = $("#activityTr3Td4").val();
			
			activityTr4Td1 = $("#activityTr4Td1").val();
			activityTr4Td2 = $("#activityTr4Td2").val();
			activityTr4Td3 = $("#activityTr4Td3").val();
			activityTr4Td4 = $("#activityTr4Td4").val();
			
			activityTr5Td1 = $("#activityTr5Td1").val();
			activityTr5Td2 = $("#activityTr5Td2").val();
			activityTr5Td3 = $("#activityTr5Td3").val();
			activityTr5Td4 = $("#activityTr5Td4").val();
			
			if(activityTr1Td1=="" || activityTr1Td2=="" || activityTr1Td3=="" || activityTr1Td4==""){
				activityResult1 = "";				
			}else{
				activityResult1 = activityTr1Td1+" "+activityTr1Td2+" "+activityTr1Td3+" "+activityTr1Td4;
			}
			
			if(activityTr2Td1=="" || activityTr2Td2=="" || activityTr2Td3=="" || activityTr2Td4==""){
				activityResult2 = "";				
			}else{
				activityResult2 = activityTr2Td1+" "+activityTr2Td2+" "+activityTr2Td3+" "+activityTr2Td4;
			}
			
			if(activityTr3Td1=="" || activityTr3Td2=="" || activityTr3Td3=="" || activityTr3Td4==""){
				activityResult3 = "";				
			}else{
				activityResult3 = activityTr3Td1+" "+activityTr3Td2+" "+activityTr3Td3+" "+activityTr3Td4;
			}
			
			if(activityTr4Td1=="" || activityTr4Td2=="" || activityTr4Td3=="" || activityTr4Td4==""){
				activityResult4 = "";				
			}else{
				activityResult4 = activityTr4Td1+" "+activityTr4Td2+" "+activityTr4Td3+" "+activityTr4Td4;
			}
			
			if(activityTr5Td1=="" || activityTr5Td2=="" || activityTr5Td3=="" || activityTr5Td4==""){
				activityResult5 = "";				
			}else{
				activityResult5 = activityTr5Td1+" "+activityTr5Td2+" "+activityTr5Td3+" "+activityTr5Td4;
			}						
			
			$("#activityResult1").val(activityResult1);
			$("#activityResult2").val(activityResult2);
			$("#activityResult3").val(activityResult3);
			$("#activityResult4").val(activityResult4);
			$("#activityResult5").val(activityResult5);
			
			if(activityResult2!=""){
				activityResult2="*"+activityResult2;
			}
			if(activityResult3!=""){
				activityResult3="*"+activityResult3;
			}
			if(activityResult4!=""){
				activityResult4="*"+activityResult4;
			}
			if(activityResult5!=""){
				activityResult5="*"+activityResult5;
			}
			
			activityTotal = activityResult1 + activityResult2 + activityResult3 + activityResult4 + activityResult5;
			$("#activity").val(activityTotal);
										
		});
		
		$("#activityAddBtn").click(function(){
			$('.activityTr:eq(0)').removeClass('activityTr');
		});
		
		$("#activityDelBtn").click(function(){
			$('.activityDel').not('.activityTr').last().find('input').val('');
			$('.activityDel').not('.activityTr').last().addClass('activityTr');
			
			activityTr1Td1 = $("#activityTr1Td1").val();
			activityTr1Td2 = $("#activityTr1Td2").val();
			activityTr1Td3 = $("#activityTr1Td3").val();
			
			activityTr2Td1 = $("#activityTr2Td1").val();
			activityTr2Td2 = $("#activityTr2Td2").val();
			activityTr2Td3 = $("#activityTr2Td3").val();
			
			activityTr3Td1 = $("#activityTr3Td1").val();
			activityTr3Td2 = $("#activityTr3Td2").val();
			activityTr3Td3 = $("#activityTr3Td3").val();
			
			activityTr4Td1 = $("#activityTr4Td1").val();
			activityTr4Td2 = $("#activityTr4Td2").val();
			activityTr4Td3 = $("#activityTr4Td3").val();
			
			activityTr5Td1 = $("#activityTr5Td1").val();
			activityTr5Td2 = $("#activityTr5Td2").val();
			activityTr5Td3 = $("#activityTr5Td3").val();
			
			if(activityTr1Td1=="" || activityTr1Td2=="" || activityTr1Td3=="" || activityTr1Td4==""){
				activityResult1 = "";				
			}else{
				activityResult1 = activityTr1Td1+" "+activityTr1Td2+" "+activityTr1Td3+" "+activityTr1Td4;
			}
			
			if(activityTr2Td1=="" || activityTr2Td2=="" || activityTr2Td3=="" || activityTr2Td4==""){
				activityResult2 = "";				
			}else{
				activityResult2 = activityTr2Td1+" "+activityTr2Td2+" "+activityTr2Td3+" "+activityTr2Td4;
			}
			
			if(activityTr3Td1=="" || activityTr3Td2=="" || activityTr3Td3=="" || activityTr3Td4==""){
				activityResult3 = "";				
			}else{
				activityResult3 = activityTr3Td1+" "+activityTr3Td2+" "+activityTr3Td3+" "+activityTr3Td4;
			}
			
			if(activityTr4Td1=="" || activityTr4Td2=="" || activityTr4Td3=="" || activityTr4Td4==""){
				activityResult4 = "";				
			}else{
				activityResult4 = activityTr4Td1+" "+activityTr4Td2+" "+activityTr4Td3+" "+activityTr4Td4;
			}
			
			if(activityTr5Td1=="" || activityTr5Td2=="" || activityTr5Td3=="" || activityTr5Td4==""){
				activityResult5 = "";				
			}else{
				activityResult5 = activityTr5Td1+" "+activityTr5Td2+" "+activityTr5Td3+" "+activityTr5Td4;
			}						
			
			$("#activityResult1").val(activityResult1);
			$("#activityResult2").val(activityResult2);
			$("#activityResult3").val(activityResult3);
			$("#activityResult4").val(activityResult4);
			$("#activityResult5").val(activityResult5);
			
			if(activityResult2!=""){
				activityResult2="*"+activityResult2;
			}
			if(activityResult3!=""){
				activityResult3="*"+activityResult3;
			}
			if(activityResult4!=""){
				activityResult4="*"+activityResult4;
			}
			if(activityResult5!=""){
				activityResult5="*"+activityResult5;
			}
			
			activityTotal = activityResult1 + activityResult2 + activityResult3 + activityResult4 + activityResult5;
			$("#activity").val(activityTotal);
		});
		
			
		//우대사항
		$(".specialChk").click(function(){
			var specialData = "";
			$(".specialChk").each(function(){
				if($(this).is(":checked"))
					specialData += $(this).val() + " ";
			});			
			$("#special").val(specialData);			
		});
		
		//자기소개서
		if($("#selfTitle1Val").val()==""){
			$(".selfTitleTr1").hide();
		}
		if($("#selfTitle2Val").val()==""){
			$(".selfTitleTr2").hide();
		}
		if($("#selfTitle3Val").val()==""){
			$(".selfTitleTr3").hide();
		}
		if($("#selfTitle4Val").val()==""){
			$(".selfTitleTr4").hide();
		}
		if($("#selfTitle5Val").val()==""){
			$(".selfTitleTr5").hide();
		}		
		
				
		$(".self").change(function(){				
			
			var self1 = $("#self1area").val();
			var self2 = $("#self2area").val();
			var self3 = $("#self3area").val();
			var self4 = $("#self4area").val();
			var self5 = $("#self5area").val();
						
			var self1Title = $("#selfTitle1Val").val();
			var self2Title = $("#selfTitle2Val").val();
			var self3Title = $("#selfTitle3Val").val();
			var self4Title = $("#selfTitle4Val").val();
			var self5Title = $("#selfTitle5Val").val();
			
			var selfResult1 = "";
			var selfResult2 = "";
			var selfResult3 = "";
			var selfResult4 = "";
			var selfResult5 = "";
			
			if(self1Title=="" || self1==""){
				selfResult1 = "";				
			}else{
				selfResult1 = self1Title+"*"+self1;
			}
			
			if(self2Title=="" || self2==""){
				selfResult2 = "";				
			}else{
				selfResult2 = self2Title+"*"+self2;
			}
			
			if(self3Title=="" || self3==""){
				selfResult3 = "";				
			}else{
				selfResult3 = self3Title+"*"+self3;
			}
			
			if(self4Title=="" || self4==""){
				selfResult4 = "";				
			}else{
				selfResult4 = self4Title+"*"+self4;
			}
			
			if(self5Title=="" || self5==""){
				selfResult5 = "";				
			}else{
				selfResult5 = self5Title+"*"+self5;
			}					
		
			$("#self1").val(selfResult1);
			$("#self2").val(selfResult2);
			$("#self3").val(selfResult3);
			$("#self4").val(selfResult4);
			$("#self5").val(selfResult5);
		});
			
	});
	
	
</script>

<main>
	<%@ include file="../inc/sidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<form name="frm" method="post" action="<c:url value='/companypage/companyResumeUse.do'/>">
		
		이력서코드 : <input type="text" name="recruitmentCode" id="recruitmentCode" value="${vo.recruitmentCode}">
		일반회원아이디 : <input type="text" name="userId" value="${userId}">
			<!-- 
			<div style="margin:5px; height:95px; border:1px solid lightgray">
			위쪽 가로 긴 구역
			</div>
			-->
			<span style="font-size: 25px; font-weight: bold;">자사 이력서 양식 작성</span>
			<hr>
			<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">기본정보</span>
			<br><br>
				<table>
					<colgroup>
						<col style="width:300px;">
						<col style="width:300px;">
					</colgroup>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="text" name="gender" id="gender" value="남자" readonly></td>
						<td>
							<select id="genderSelect" name="genderSelect">
								<option value="남자">남자</option>
						   		<option value="여자">여자</option>
			                </select>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" id="email"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="hp" id="hp"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" name="birth" id="birth"></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" name="zipcode" id="zipcode" readonly></td>
						<td><input type="button" onclick="sample4_execDaumPostcode()" value="찾기"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" id="address" readonly></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" name="addressDetail" id="addressDetail"></td>
					</tr>
				</table>
			<hr>
			</div>
			
			
			<div id="schoolDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">학력사항</span>
				<input type="text" name="schoolVal" id="schoolVal" value="${vo.schoolVal}">
				<%-- 체크박스를 토글로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="schoolChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글로 바꾼 부분 끝 --%>
				<br><br>
				<div id="schoolDivChk">
					<span>최종학력을 입력하세요</span>
					<br><br>
					<table id="schoolTable">
						<colgroup>
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
						</colgroup>
						<tr>
							<td>학교 : <input type="text" id="schoolName"></td>
							<td>전공 : <input type="text" id="schoolMajor"></td>
							<td>졸업일 : <input type="date" id="schoolDate"></td>		
						</tr>
					</table>
					<input type="text" name="edu" id="edu">
					<input type="hidden" name="edu1" id="edu1">
					<input type="hidden" name="edu2" id="edu2">
					<input type="hidden" name="edu3" id="edu3">
				</div>
			<hr>
			</div>
				
			
			<div id="careerDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">경력사항</span>
				<input type="text" name="careerVal" id="careerVal" value="${vo.careerVal}">
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="careerChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="careerDivChk">				
					<input type="button" value="추가" id="careerAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
					<input type="button" value="삭제" id="careerDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
					<span>(최대 5건)</span>
					<br><br>
					<table id="careerTable">
						<colgroup>
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
						</colgroup>
						<tr>
							<td>회사명</td>
							<td>직위</td>	
							<td>담당업무</td>
							<td>입사일</td>
							<td>퇴사일</td>
						</tr>
						<tr id="careerTr1" class="careerTr careerDel">
							<td><input type='text' id="careerTr1Td1"></td>
							<td><input type='text' id="careerTr1Td2"></td>	
							<td><input type='text' id="careerTr1Td3"></td>
							<td><input type='date' id="careerTr1Td4"></td>
							<td><input type='date' id="careerTr1Td5"></td>
						</tr>
						<tr id="careerTr2" class="careerTr careerDel">
							<td><input type='text' id="careerTr2Td1"></td>
							<td><input type='text' id="careerTr2Td2"></td>	
							<td><input type='text' id="careerTr2Td3"></td>
							<td><input type='date' id="careerTr2Td4"></td>
							<td><input type='date' id="careerTr2Td5"></td>
						</tr>
						<tr id="careerTr3" class="careerTr careerDel">
							<td><input type='text' id="careerTr3Td1"></td>
							<td><input type='text' id="careerTr3Td2"></td>	
							<td><input type='text' id="careerTr3Td3"></td>
							<td><input type='date' id="careerTr3Td4"></td>
							<td><input type='date' id="careerTr3Td5"></td>
						</tr>
						<tr id="careerTr4" class="careerTr careerDel">
							<td><input type='text' id="careerTr4Td1"></td>
							<td><input type='text' id="careerTr4Td2"></td>	
							<td><input type='text' id="careerTr4Td3"></td>
							<td><input type='date' id="careerTr4Td4"></td>
							<td><input type='date' id="careerTr4Td5"></td>
						</tr>
						<tr id="careerTr5" class="careerTr careerDel">
							<td><input type='text' id="careerTr5Td1"></td>
							<td><input type='text' id="careerTr5Td2"></td>	
							<td><input type='text' id="careerTr5Td3"></td>
							<td><input type='date' id="careerTr5Td4"></td>
							<td><input type='date' id="careerTr5Td5"></td>
						</tr>
					</table>
					<input type="text" name="career" id="career">
					<input type="hidden" id="careerResult1" class="careerResult">
					<input type="hidden" id="careerResult2" class="careerResult">
					<input type="hidden" id="careerResult3" class="careerResult">
					<input type="hidden" id="careerResult4" class="careerResult">
					<input type="hidden" id="careerResult5" class="careerResult">
				</div>
			<hr>
			</div>
			
			
			<div id="certificateDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">자격증</span>
				<input type="text" name="certificateVal" id="certificateVal" value="${vo.certificateVal}">
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="certificateChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="certificateDivChk">	
					<input type="button" value="추가" id="certificateAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
					<input type="button" value="삭제" id="certificateDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
					<span>(최대 5건)</span>
					<br><br>
					<table id="certificateTable">
						<colgroup>
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
						</colgroup>
						<tr>
							<td>종류</td>
							<td>발급기관</td>				
							<td>취득일</td>				
						</tr>
						<tr id="certificateTr1" class="certificateTr certificateDel">
							<td><input type='text' id="certificateTr1Td1"></td>
							<td><input type='text' id="certificateTr1Td2"></td>	
							<td><input type='date' id="certificateTr1Td3"></td>
						</tr>
						<tr id="certificateTr2" class="certificateTr certificateDel">
							<td><input type='text' id="certificateTr2Td1"></td>
							<td><input type='text' id="certificateTr2Td2"></td>	
							<td><input type='date' id="certificateTr2Td3"></td>
						</tr>
						<tr id="certificateTr3" class="certificateTr certificateDel">
							<td><input type='text' id="certificateTr3Td1"></td>
							<td><input type='text' id="certificateTr3Td2"></td>	
							<td><input type='date' id="certificateTr3Td3"></td>
						</tr>
						<tr id="certificateTr4" class="certificateTr certificateDel">
							<td><input type='text' id="certificateTr4Td1"></td>
							<td><input type='text' id="certificateTr4Td2"></td>	
							<td><input type='date' id="certificateTr4Td3"></td>
						</tr>
						<tr id="certificateTr5" class="certificateTr certificateDel">
							<td><input type='text' id="certificateTr5Td1"></td>
							<td><input type='text' id="certificateTr5Td2"></td>	
							<td><input type='date' id="certificateTr5Td3"></td>
						</tr>
					</table>
					자격증<input type="text" name="certificate" id="certificate">
					<input type="hidden" id="certificateResult1" class="certificateResult">
					<input type="hidden" id="certificateResult2" class="certificateResult">
					<input type="hidden" id="certificateResult3" class="certificateResult">
					<input type="hidden" id="certificateResult4" class="certificateResult">
					<input type="hidden" id="certificateResult5" class="certificateResult">
				</div>
			<hr>
			</div>
			
			
			<div id="languageDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">외국어능력</span>
				<input type="text" name="languageVal" id="languageVal" value="${vo.languageVal}">
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="languageChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="languageDivChk">	
					<input type="button" value="추가" id="languageAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
					<input type="button" value="삭제" id="languageDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
					<span>(최대 5건)</span>
				 	<br><br>
					<table id="languageTable">
						<colgroup>
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
						</colgroup>
						<tr>
							<td>종류</td>
							<td>발급기관</td>				
							<td>취득일</td>				
						</tr>
						<tr id="languageTr1" class="languageTr languageDel">
							<td><input type='text' id="languageTr1Td1"></td>
							<td><input type='text' id="languageTr1Td2"></td>	
							<td><input type='date' id="languageTr1Td3"></td>
						</tr>
						<tr id="languageTr2" class="languageTr languageDel">
							<td><input type='text' id="languageTr2Td1"></td>
							<td><input type='text' id="languageTr2Td2"></td>	
							<td><input type='date' id="languageTr2Td3"></td>
						</tr>
						<tr id="languageTr3" class="languageTr languageDel">
							<td><input type='text' id="languageTr3Td1"></td>
							<td><input type='text' id="languageTr3Td2"></td>	
							<td><input type='date' id="languageTr3Td3"></td>
						</tr>
						<tr id="languageTr4" class="languageTr languageDel">
							<td><input type='text' id="languageTr4Td1"></td>
							<td><input type='text' id="languageTr4Td2"></td>	
							<td><input type='date' id="languageTr4Td3"></td>
						</tr>
						<tr id="languageTr5" class="languageTr languageDel">
							<td><input type='text' id="languageTr5Td1"></td>
							<td><input type='text' id="languageTr5Td2"></td>	
							<td><input type='date' id="languageTr5Td3"></td>
						</tr>
					</table>
					어학능력<input type="text" name="language" id="language">
					<input type="hidden" id="languageResult1" class="languageResult">
					<input type="hidden" id="languageResult2" class="languageResult">
					<input type="hidden" id="languageResult3" class="languageResult">
					<input type="hidden" id="languageResult4" class="languageResult">
					<input type="hidden" id="languageResult5" class="languageResult">
				</div>
			<hr>
			</div>
			
			
			<div id="awardsDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">수상내역</span>
				<input type="text" name="awardsVal" id="awardsVal" value="${vo.awardsVal}">
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="awardsChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="awardsDivChk">	
					<input type="button" value="추가" id="awardsAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
					<input type="button" value="삭제" id="awardsDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
					<span>(최대 5건)</span>
					<br><br>
					<table id="awardsTable">
						<colgroup>
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
						</colgroup>						
						<tr>
							<td>종류</td>
							<td>수여기관</td>				
							<td>수여일</td>				
						</tr>						
						<tr id="awardsTr1" class="awardsTr awardsDel">
							<td><input type='text' id="awardsTr1Td1"></td>
							<td><input type='text' id="awardsTr1Td2"></td>	
							<td><input type='date' id="awardsTr1Td3"></td>
						</tr>
						<tr id="awardsTr2" class="awardsTr awardsDel">
							<td><input type='text' id="awardsTr2Td1"></td>
							<td><input type='text' id="awardsTr2Td2"></td>	
							<td><input type='date' id="awardsTr2Td3"></td>
						</tr>
						<tr id="awardsTr3" class="awardsTr awardsDel">
							<td><input type='text' id="awardsTr3Td1"></td>
							<td><input type='text' id="awardsTr3Td2"></td>	
							<td><input type='date' id="awardsTr3Td3"></td>
						</tr>
						<tr id="awardsTr4" class="awardsTr awardsDel">
							<td><input type='text' id="awardsTr4Td1"></td>
							<td><input type='text' id="awardsTr4Td2"></td>	
							<td><input type='date' id="awardsTr4Td3"></td>
						</tr>
						<tr id="awardsTr5" class="awardsTr awardsDel">
							<td><input type='text' id="awardsTr5Td1"></td>
							<td><input type='text' id="awardsTr5Td2"></td>	
							<td><input type='date' id="awardsTr5Td3"></td>
						</tr>
					</table>
					수상기록<input type="text" name="award" id="award">
					<input type="hidden" id="awardsResult1" class="awardsResult">
					<input type="hidden" id="awardsResult2" class="awardsResult">
					<input type="hidden" id="awardsResult3" class="awardsResult">
					<input type="hidden" id="awardsResult4" class="awardsResult">
					<input type="hidden" id="awardsResult5" class="awardsResult">
				</div>
			<hr>
			</div>
						
			<div id="specialDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">우대사항</span>
				<input type="text" name="specialVal" id="specialVal" value="${vo.specialVal}">
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="specialChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="specialDivChk">	
					<table id="specialTable">
						<colgroup>
							<col style="width:200px;">
						</colgroup>
						<tr>
							<td><input type="checkbox" class="specialChk" value="병역대상">&nbsp;병역대상</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="specialChk" value="보훈대상">&nbsp;보훈대상</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="specialChk" value="고용지원금대상">&nbsp;고용지원금대상</td>
						</tr>
					</table>
					<input type="text" name="special" id="special">
				</div>
			<hr>
			</div>
			
			
			<div id="activityDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">대외활동</span>
				<input type="text" name="activityVal" id="activityVal" value="${vo.activityVal}">
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="activityChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="activityDivChk">	
					<input type="button" value="추가" id="activityAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
					<input type="button" value="삭제" id="activityDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
					<span>(최대 5건)</span>
					<br><br>
					<table id="activityTable">
						<colgroup>
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
							<col style="width:180px;">
						</colgroup>
						<tr>							
							<td>대외활동명</td>				
							<td>대외활동기관</td>
							<td>대외활동시작일</td>			
							<td>대외활동종료일</td>			
						</tr>
						<tr id="activityTr1" class="activityTr activityDel">
							<td><input type='text' id="activityTr1Td1"></td>
							<td><input type='text' id="activityTr1Td2"></td>	
							<td><input type='date' id="activityTr1Td3"></td>
							<td><input type='date' id="activityTr1Td4"></td>
						</tr>
						<tr id="activityTr2" class="activityTr activityDel">
							<td><input type='text' id="activityTr2Td1"></td>
							<td><input type='text' id="activityTr2Td2"></td>	
							<td><input type='date' id="activityTr2Td3"></td>
							<td><input type='date' id="activityTr2Td4"></td>
						</tr>
						<tr id="activityTr3" class="activityTr activityDel">
							<td><input type='text' id="activityTr3Td1"></td>
							<td><input type='text' id="activityTr3Td2"></td>	
							<td><input type='date' id="activityTr3Td3"></td>
							<td><input type='date' id="activityTr3Td4"></td>
						</tr>
						<tr id="activityTr4" class="activityTr activityDel">
							<td><input type='text' id="activityTr4Td1"></td>
							<td><input type='text' id="activityTr4Td2"></td>	
							<td><input type='date' id="activityTr4Td3"></td>
							<td><input type='date' id="activityTr4Td4"></td>
						</tr>
						<tr id="activityTr5" class="activityTr activityDel">
							<td><input type='text' id="activityTr5Td1"></td>
							<td><input type='text' id="activityTr5Td2"></td>	
							<td><input type='date' id="activityTr5Td3"></td>
							<td><input type='date' id="activityTr5Td4"></td>
						</tr>
					</table>
					대외활동<input type="text" name="activity" id="activity">
					<input type="hidden" id="activityResult1" class="activityResult">
					<input type="hidden" id="activityResult2" class="activityResult">
					<input type="hidden" id="activityResult3" class="activityResult">
					<input type="hidden" id="activityResult4" class="activityResult">
					<input type="hidden" id="activityResult5" class="activityResult">
				</div>
			<hr>
			</div>
			
						
			<div id="selfDiv" style="margin:5px;">
			<input type="text" name="selfVal" id="selfVal" value="${vo.selfVal}">
				<span style="font-size: 18px; font-weight: bold;">자기소개서</span>	
				<br><br>		
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="selfChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<div id="selfDivChk">
					<table id="selfTable">
						<tr class="selfTitleTr1">						
							<td><input type="text" id="selfTitle1Val" value="${vo.selfTitle1}" readonly></td>			
						</tr>
						<tr class="selfTitleTr1">
							<td><textarea id="self1area" class="self" name="self1area" rows="8" cols="80"></textarea></td>						
						</tr>
						<tr class="selfTitleTr2">
							<td><input type="text" id="selfTitle2Val" value="${vo.selfTitle2}" readonly></td>			
						</tr>
						<tr class="selfTitleTr2">
							<td><textarea id="self2area" class="self" name="self2area" rows="8" cols="80"></textarea></td>						
						</tr>
						<tr class="selfTitleTr3">
							<td><input type="text" id="selfTitle3Val" value="${vo.selfTitle3}" readonly></td>			
						</tr>
						<tr class="selfTitleTr3">
							<td><textarea id="self3area" class="self" name="self3area" rows="8" cols="80"></textarea></td>						
						</tr>
						<tr class="selfTitleTr4">
							<td><input type="text" id="selfTitle4Val" value="${vo.selfTitle4}" readonly></td>			
						</tr>
						<tr class="selfTitleTr4">
							<td><textarea id="self4area" class="self" name="self4area" rows="8" cols="80"></textarea></td>						
						</tr>
						<tr class="selfTitleTr5">
							<td><input type="text" id="selfTitle5Val" value="${vo.selfTitle5}" readonly></td>			
						</tr>
						<tr class="selfTitleTr5">
							<td><textarea id="self5area" class="self" name="self5area" rows="8" cols="80"></textarea></td>						
						</tr>
					</table>
					5가지 자기소개
					<input type="text" name="self1" id="self1">
					<input type="text" name="self2" id="self2">
					<input type="text" name="self3" id="self3">
					<input type="text" name="self4" id="self4">
					<input type="text" name="self5" id="self5">
				</div>
			<hr>
			</div>			
			<div style="text-align: center;">
				<input type="submit" value="작성완료">
				<input type="button" value="뒤로가기">
			</div>
			<br><br>
		</form>
	</div>
</main>
<%@ include file="../inc/bottom.jsp" %>
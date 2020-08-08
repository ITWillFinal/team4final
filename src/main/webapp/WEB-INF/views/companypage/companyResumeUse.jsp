<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>

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
		
		//성별
		$("#genderSelect").change(function(){
			var genderSel = $("#genderSelect option:selected").val();
			$("#gender").val(genderSel);
		});
						
		//학력사항
		
		var eduData = "";
		$("#schoolName").keyup(function(){
			eduData = ($("#schoolName").val() +" "+ $("#schoolMajor").val() +" " + $("#schoolDate").val());
			$("#edu").val(eduData);
		});
		
		$("#schoolMajor").keyup(function(){
			eduData = ($("#schoolName").val() +" "+ $("#schoolMajor").val() +" " + $("#schoolDate").val());
			$("#edu").val(eduData);
		});		
		
		$("#schoolDate").change(function(){
			eduData = ($("#schoolName").val() +" "+ $("#schoolMajor").val() +" " + $("#schoolDate").val());
			$("#edu").val(eduData);
		});
		
		//경력사항
		var z2 = 1;
		var careerData = "";
		$("#careerDelBtn").prop("disabled", true);
		$("#careerAddBtn").click(function(){
			$("#careerTable")
			.append("<tr id='careerTr'><td><input type='text' id='careerName"+z2+"'></td><td><input type='text' id='careerLv"+z2+"'></td><td><input type='text' id='careerContent"+z2+"'></td><td><input type='date' id='careerStartDate"+z2+"' style='width:50%;'><input type='date' id='careerEndDate"+z2+"' style='width:50%;'></td></tr>");
			++z2;
			if(z2 >= 1){
				$("#careerDelBtn").prop("disabled", false);
			}
			
		});
		
		$("#careerDelBtn").click(function(){
			$("#careerTr:nth-last-child(1)").remove();
			--z2;
			if(z2 < 2){
				$("#careerDelBtn").prop("disabled", true);
			}
		});
		
		//자격증
		var z3 = 1;
		$("#certificateDelBtn").prop("disabled", true);
		$("#certificateAddBtn").click(function(){
			$("#certificateTable")
			.append("<tr id='certificateTr'><td><input type='text' id='certificateName"+z3+"'></td><td><input type='text' id='certificateOrg"+z3+"'></td><td><input type='date' id='certificateDate"+z3+"'></td></tr>");
			++z3;
			if(z3 >= 1){
				$("#certificateDelBtn").prop("disabled", false)
			}		
		});
		
		$("#certificateDelBtn").click(function(){
			$("#certificateTr:nth-last-child(1)").remove();
			--z3;
			if(z3 < 2){
				$("#certificateDelBtn").prop("disabled", true);
			}
		});
				
		
		//외국어능력
		var z4 = 1;
		$("#languageDelBtn").prop("disabled", true);
		$("#languageAddBtn").click(function(){
			$("#languageTable")
			.append("<tr id='languageTr'><td><input type='text' id='languageName"+z4+"'></td><td><input type='text' id='languageOrg"+z4+"'></td><td><input type='date' id='languageDate"+z4+"'></td></tr>");
			++z4;
			if(z4 >= 1){
				$("#languageDelBtn").prop("disabled", false)
			}
		});
		
		$("#languageDelBtn").click(function(){
			$("#languageTr:nth-last-child(1)").remove();
			--z4;
			if(z4 < 2){
				$("#languageDelBtn").prop("disabled", true);
			}
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
		var z6 = 1;
		$("#activityDelBtn").prop("disabled", true);
		$("#activityAddBtn").click(function(){
			$("#activityTable")
			.append("<tr id='activityTr'><td><input type='text' id='activityName"+z6+"'></td><td><input type='text' id='activityOrg"+z6+"'></td><td><input type='date' id='activityStartDate"+z6+"' style='width:50%;'><input type='date' id='activityEndDate"+z6+"' style='width:50%;'></td></tr>");
			++z6;
			if(z6 >= 1){
				$("#activityDelBtn").prop("disabled", false)
			}
		});
		
		$("#activityDelBtn").click(function(){
			$("#activityTr:nth-last-child(1)").remove();
			--z6;
			if(z6 < 2){
				$("#activityDelBtn").prop("disabled", true);
			}
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
		var i = 2;
		$("#selfAddBtn").click(function(){

			if (i >= 6) return; // 4번째부터는 append 안되고 return 시키기
			$("#selfTable")			
			.append("<tr id='selfTr'><td>항목 "+i+" :</td><td><input type='text'></td></tr>");
			i++;

		});
		
		$("#selfDelBtn").click(function(){
			
			if (i <= 2) return;
			$("#selfTr:nth-last-child(1)").remove();
			i--;
		});
				
	});
	
	
</script>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
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
						<td><input type="text" name="name"></td>
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
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="hp"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" name="birth"></td>
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
						<td><input type="text" name="addressDetail"></td>
					</tr>
				</table>
			<hr>
			</div>
			
			
			<div id="schoolDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">학력사항</span>
				<input type="hidden" name="schoolVal" id="schoolVal" value="${vo.schoolVal}">
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
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
						</colgroup>
						<tr>
							<td>학교 : <input type="text" id="schoolName"></td>
							<td>전공 : <input type="text" id="schoolMajor"></td>
							<td>졸업일 : <input type="date" id="schoolDate"></td>		
						</tr>
					</table>
					<input type="text" name="edu" id="edu">
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
					<br><br>
					<table id="careerTable">
						<colgroup>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:250px;">
						</colgroup>
						<tr>
							<td>회사명</td>
							<td>직위</td>	
							<td>담당업무</td>
							<td>근무기간</td>
						</tr>
					</table>
					<input type="text" id="career">
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
					<br><br>
					<table id="certificateTable">
						<colgroup>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
						</colgroup>
						<tr>
							<td>종류</td>
							<td>발급기관</td>				
							<td>취득일</td>				
						</tr>
					</table>
					<input type="text" name="certificate">
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
				 	<br><br>
					<table id="languageTable">
						<colgroup>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
						</colgroup>
						<tr>
							<td>종류</td>
							<td>발급기관</td>				
							<td>취득일</td>				
						</tr>
					</table>
					<input type="text" name="language">
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
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
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
					<input type="text" name="award" id="award">
					<input type="text" id="awardsResult1" class="awardsResult">
					<input type="text" id="awardsResult2" class="awardsResult">
					<input type="text" id="awardsResult3" class="awardsResult">
					<input type="text" id="awardsResult4" class="awardsResult">
					<input type="text" id="awardsResult5" class="awardsResult">
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
					<br><br>
					<table id="activityTable">
						<colgroup>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:250px;">
						</colgroup>
						<tr>							
							<td>대외활동명</td>				
							<td>대외활동기관</td>
							<td>대외활동일자</td>			
						</tr>
					</table>
					<input type="text" name="activity">
				</div>
			<hr>
			</div>
			
						
			<div id="selfDiv" style="margin:5px;">
			<input type="text" name="selfVal" id="selfVal" value="${vo.selfVal}">
				<span style="font-size: 18px; font-weight: bold;">자기소개서</span>				
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작
				<label class="switch">
					<input type="checkbox" id="selfChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label>
				체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<br><br>
				<div id="selfDivChk">
				<input type="button" value="추가" id="selfAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
				<input type="button" value="삭제" id="selfDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
				<br><br>
					<table id="selfTable">
						<colgroup>
							<col style="width:100px;">
							<col style="width:500px;">
						</colgroup>
						<tr>
							<td>항목 1 : </td>
							<td><input type="text"></td>			
						</tr>
					</table>
					<input type="text" name="self">
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
<%@ include file="../inc/companyBottom.jsp" %>
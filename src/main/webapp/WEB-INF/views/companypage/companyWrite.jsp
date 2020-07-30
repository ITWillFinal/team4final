<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/companyTop.jsp" %>
<script src="<c:url value='/editor/ckeditor/ckeditor.js'/>"></script>
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
	$(function() {
		$('#sido').click(function() {
			var sido = $('#sido').val();
			$('#sigugun').empty();
			$('input[name=location1]').empty();
			$.ajax({
				url:"<c:url value='/sigugun.do'/>",
				type:"get",
				dataType:"json",
				data:"sido="+sido,
				success:function(res){
					for(var i = 0; i< res.length; i++){
						var option ="<option value='"+res[i]+"'>"+res[i]+"</option>";
						$('#sigugun').append(option);
					}
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
			$('input[name=location1]').val(sido);
		});
		
		$('#sigugun').click(function() {
			var sigugun = $('#sigugun').val();
			$('input[name=location2]').empty();
			$('input[name=location2]').val(sigugun);
		});
		
		
		$('#jobLarge').click(function() {
			var num = $('#jobLarge').val();
			$('#jobMiddle').empty();
			$.ajax({
				url:"<c:url value='/job/jobMiddle.do'/>",
				type:"get",
				dataType:"json",
				data:"no="+num,
				success:function(res){
					for(var i = 0; i< res.length; i++){
						var option ="<option value='"+res[i].MIDDLE_NO+"'>"+res[i].MIDDLE_GROUP+"</option>";
						$('#jobMiddle').append(option);
					}
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
			$('input[name=jobType1]').val(num);
		});
		
		$('#jobMiddle').click(function() {
			var numMiddle = $('#jobMiddle').val();
			$('input[name=jobType2]').empty();
			$('input[name=jobType2]').val(numMiddle);
		});
		
		$('#induLarge').click(function() {
			var num = $('#induLarge').val();
			$('#induMiddle').empty();
			$.ajax({
				url:"<c:url value='/job/induMiddle.do'/>",
				type:"get",
				dataType:"json",
				data:"no="+num,
				success:function(res){
					for(var i = 0; i< res.length; i++){
						var option ="<option value='"+res[i].MIDDLE_NO+"'>"+res[i].MIDDLE_GROUP+"</option>";
						$('#induMiddle').append(option);
					}
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
			
			$('input[name=induType1]').val(num);
		});
		
		$('#induMiddle').click(function() {
			var numMiddle = $('#induMiddle').val();
			$('input[name=induType2]').empty();
			$('input[name=induType2]').val(numMiddle);
		});
		
		var timeSel1="";
		var timeSel2="";
		var timeSel3="";
		var timeSel4="";		
		var timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
		
		$("#timeSelect3").attr("disabled", true);
	    $("#timeChk").on('click',function(){
	        var chk = $('#timeChk').is(":checked");
	        if(chk==true){
	            $("#timeSelect3").removeAttr('disabled');
	        }else{
	            $("#timeSelect3").attr("disabled", true);
	            timeSel3="";
	            timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
				$("#workHours").val(timeSel);	
	        }
	    });
	    
	    $("#timeSelect4").attr("disabled", true);
	    $("#timeChk").on('click',function(){
	        var chk = $('#timeChk').is(":checked");
	        if(chk==true){
	            $("#timeSelect4").removeAttr('disabled');
	        }else{
	            $("#timeSelect4").attr("disabled", true);
	            timeSel4="";
	            timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
				$("#workHours").val(timeSel);	
	        }
	    });
		
		$("#timeSelect1").change(function(){
			timeSel1 = $("#timeSelect1 option:selected").val();
			$("#workHours1").val(timeSel1);
			timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
			$("#workHours").val(timeSel);	
		});
		
		$("#timeSelect2").change(function(){
			timeSel2 = $("#timeSelect2 option:selected").val();
			$("#workHours2").val(timeSel2);
			timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
			$("#workHours").val(timeSel);
		});
		
		$("#timeSelect3").click(function(){
			timeSel3 = $("#timeSelect3").val();
			$("#workHours3").val(timeSel3);
			timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
			$("#workHours").val(timeSel);
		});
		
		$("#timeSelect4").click(function(){
			timeSel4 = $("#timeSelect4").val();
			$("#workHours4").val(timeSel4);
			timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
			$("#workHours").val(timeSel);
		});
		
		$("#timeSelect3").change(function(){
			timeSel3 = $("#timeSelect3").val();
			$("#workHours3").val(timeSel3);
			timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
			$("#workHours").val(timeSel);
		});
		
		$("#timeSelect4").change(function(){
			timeSel4 = $("#timeSelect4").val();
			$("#workHours4").val(timeSel4);
			timeSel = timeSel1 + " " + timeSel2 + " " + timeSel3 + " " + timeSel4;
			$("#workHours").val(timeSel);
		});
		
		$("#paySelect").change(function(){
			var paySel = $("#paySelect option:selected").val();
			$("#pay").val(paySel);
		});
		
		$("#recNumSelect").change(function(){
			var recNumSel = $("#recNumSelect option:selected").val();
			$("#recNumber").val(recNumSel);
		});
		
		$("#genderSelect").change(function(){
			var genderSel = $("#genderSelect option:selected").val();
			$("#gender").val(genderSel);
		});
		
		$("#ageSelect").change(function(){
			var ageSel = $("#ageSelect option:selected").val();
			$("#age").val(ageSel);
		});
		
		$("#eduSelect").change(function(){
			var eduSel = $("#eduSelect option:selected").val();
			$("#educationLv").val(eduSel);
		});
		
		$("#careerSelect").change(function(){
			var careerSel = $("#careerSelect option:selected").val();
			$("#career").val(careerSel);
		});
		
		$("#comTypeSelect").change(function(){
			var comTypeSel = $("#comTypeSelect option:selected").val();
			$("#companyType").val(comTypeSel);
		});
		
		
		$(".welfareChk").click(function(){
			var strWel = "";
			$(".welfareChk").each(function(){
				if($(this).is(":checked"))
					strWel += $(this).val() + " ";  // str에 저장한다.
			});			
			$("#welfare").val(strWel);			
		});
		
		$(".recTypeChk").click(function(){
			var strRec = "";
			$(".recTypeChk").each(function(){
				if($(this).is(":checked"))
					strRec += $(this).val() + " ";  // str에 저장한다.
			});			
			$("#recType").val(strRec);			
		});
		
		$(".preferChk").click(function(){
			var strPrefer = "";
			$(".preferChk").each(function(){
				if($(this).is(":checked"))
					strPrefer += $(this).val() + " ";  // str에 저장한다.
			});			
			$("#preference").val(strPrefer);			
		});
		
		$(".docChk").click(function(){
			var strDoc = "";
			$(".docChk").each(function(){
				if($(this).is(":checked"))
					strDoc += $(this).val() + " ";  // str에 저장한다.
			});			
			$("#document").val(strDoc);			
		});
		
		
		CKEDITOR.replace('recDetail',{
			filebrowserUploadUrl:"<c:url value=''/>"
		});
		
		$('form[name=frmWrite]').submit(function(){
			if($('#title').val()==''){
				alert('제목을 입력하세요');
				event.preventDefault();
			}else if($('#comName').val()==''){
				alert('회사명을 입력하세요');
				event.preventDefault();
			}else if($('#jobType1').val()==''){
				alert('직무1을 입력하세요');
				event.preventDefault();
			}else if($('#jobType2').val()==''){
				alert('직무2를 입력하세요');
				event.preventDefault();
			}else if($('#induType1').val()==''){
				alert('산업1을 입력하세요');
				event.preventDefault();
			}else if($('#induType2').val()==''){
				alert('산업2를 입력하세요');
				event.preventDefault();
			}else if($('#location1').val()==''){
				alert('지역1을 입력하세요');
				event.preventDefault();
			}else if($('#location2').val()==''){
				alert('지역2를 입력하세요');
				event.preventDefault();
			}else if($('#zipcode').val()==''){
				alert('우편번호를 입력하세요');
				event.preventDefault();
			}else if($('#address').val()==''){
				alert('주소를 입력하세요');
				event.preventDefault();
			}else if($('#addressDetail').val()==''){
				alert('상세주소를 입력하세요');
				event.preventDefault();
			}else if($('#workHours').val()==''){
				alert('근무시간을 입력하세요');
				event.preventDefault();
			}else if($('#recType').val()==''){
				alert('근무형태를 입력하세요');
				event.preventDefault();
			}else if($('#pay').val()==''){
				alert('급여를 입력하세요');
				event.preventDefault();
			}else if($('#welfare').val()==''){
				alert('복리후생을 입력하세요');
				event.preventDefault();
			}else if($('#recNumber').val()==''){
				alert('모집인원을 입력하세요');
				event.preventDefault();
			}else if($('#gender').val()==''){
				alert('성별을 입력하세요');
				event.preventDefault();
			}else if($('#age').val()==''){
				alert('나이를 입력하세요');
				event.preventDefault();
			}else if($('#educationLv').val()==''){
				alert('학력을 입력하세요');
				event.preventDefault();
			}else if($('#career').val()==''){
				alert('경력을 입력하세요');
				event.preventDefault();
			}else if($('#preference').val()==''){
				alert('우대사항을 입력하세요');
				event.preventDefault();
			}else if($('#document').val()==''){
				alert('제출서류를 입력하세요');
				event.preventDefault();
			}else if($('#recDetail').val()==''){
				alert('상세모집내용을 입력하세요');
				event.preventDefault();
			}else if($('#comCode').val()==''){
				alert('회사코드를 입력하세요');
				event.preventDefault();
			}else if($('#companyType').val()==''){
				alert('기업형태를 입력하세요');
				event.preventDefault();
			}
			
		});
		
	});
	
	
</script>
<style>
	tr {
		border-bottom: 1px solid lightgray;
		border-top: 1px solid lightgray;
	}
	
	td {
		padding-top: 5px;
		padding-bottom: 5px;
	}

	
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
	
	input[type=text]:hover {
	    background : #dcdcdc;
	}
	
	input[type=text] {
		padding-left: 15px;
		padding-right: 15px;
		background : whitesmoke;
		width:350px;
		height:35px;
		border:none;
		border-radius: 10px;
	}
	
	label {
		margin-top:10px;
		margin-right: 5px;
	}
	
	.recTypeChk {
		margin-right: 3px;
		
	}
	
	.welfareChk {
		margin-right: 3px;
	}
	
	.docChk {
		margin-right: 3px;
	}
	
	.preferChk {
		margin-right: 3px;
	}
	
	.sel{
		width:150px;
		display: inline-block;
	
	}
	
	.bttn{
		width:75px;
		display: inline-block;
		margin-top: -3.5px;
	}	
	
	.cat{
		width:200px;
		display: inline-block;
	}


</style>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>

	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<form name="frmWrite" method="post" action="<c:url value='/companypage/companyWrite.do'/>">
			<span style="font-size: 25px; font-weight: bold;">채용정보등록</span>
			<hr>
			<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">◎모집내용</span><br><br>

			<table style="width: 900px;">
				<colgroup>
					<col style="width:20%;"/>
					<col style="width:80%;" />
				</colgroup>
				<tr>
					<td>모집제목</td>
					<td>
						<input type="text" id="title" name="title">
					</td>
				</tr>

				<tr>
					<td>회사명</td>
					<td>
						<input type="text" id="comName" name="comName">
					</td>
				</tr>
				<tr>
					<td>기업형태</td>
					<td>
						<select id="comTypeSelect" name="comTypeSelect" class="form-control sel">
							<option value="">선택</option>
							<option value="대기업">대기업</option>
							<option value="공기업">공사/공기업</option>
							<option value="중견기업">중견기업</option>
							<option value="중소기업">중소기업</option>
							<option value="스타트업">스타트업</option>
							<option value="외국계기업">외국계기업</option>
						</select>
						<input type="hidden" id="companyType" name="companyType">
					</td>
				</tr>	

				<tr>
					<td>직무</td>
					<td>
						<select size="5" id="jobLarge" class="form-control cat">
							<c:forEach var="map" items="${jobList }">
			               		<option value="${map['LARGE_NO'] }">${map['LARGE_GROUP'] }</option>
			                </c:forEach>
						</select>
						<select id="jobMiddle" size="5" class="form-control cat">
				
						</select>	
					</td>
				</tr>
				
				<tr>
					<td>산업</td>
					<td>
						<select size="5" id="induLarge" class="form-control cat">
							<c:forEach var="map" items="${induList }">
			               		<option value="${map['LARGE_NO'] }">${map['LARGE_GROUP'] }</option>
			                </c:forEach>
						</select>
						<select id="induMiddle" size="5" class="form-control cat">
				
						</select>	
					</td>
				</tr>
				
				<tr>
					<td>근무지역</td>
					<td>

						<select id="sido" class="form-control sel">
							<c:if test="${!empty list}">
								<c:forEach var="location" items="${list}">
									<option value="${location}">${location}</option>
								</c:forEach>
							</c:if>
						</select>
						<div style="display: inline;" id="sigugunDiv">
							<select id="sigugun" class="form-control sel">
							
							</select>
						</div>
					</td>
				</tr>
										
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="zipcode" name="zipcode" readonly>
					 	<input type="button" onclick="sample4_execDaumPostcode()" value="선택" class="form-control bttn"> 
					</td>
				</tr>

				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="address" name="address" readonly>
					</td>
				</tr>

				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" id="addressDetail" name="addressDetail">
					</td>
				</tr>


				<tr>
					<td>근무시간</td>
					<td>
						<select id="timeSelect1" name="timeSelect1" class="form-control sel">
							<option value="">선택</option>
							<option value="주 5일">주 5일</option>
							<option value="주 6일">주 6일</option>
						</select>
						<select id="timeSelect2" name="timeSelect2" class="form-control sel">
							<option value="">선택</option>
							<option value="월~금">월~금</option>
							<option value="월~토">월~토</option>
							<option value="2교대">2교대</option>
							<option value="3교대">3교대</option>
							<option value="탄력근무제">탄력근무제</option>
						</select><br>
												
						<div style="margin:5px 0px 5px 0px;">
							<input type="time" value="09:00" id="timeSelect3" name="timeSelect3" class="form-control sel">
							<input type="time" value="18:00" id="timeSelect4" name="timeSelect4" class="form-control sel">
							<span>시간설정</span>
							<input type="checkbox" id="timeChk" name="timeChk">
						</div>
																
						<input type="hidden" id="workHours1" name="workHours1">
						<input type="hidden" id="workHours2" name="workHours2">
						<input type="hidden" id="workHours3" name="workHours3">
						<input type="hidden" id="workHours4" name="workHours4">
						
						<input type="text" id="workHours" name="workHours">
						
					</td>
				</tr>
				
				<tr>
					<td>근무형태</td>
					<td>
						<label><input type="checkbox" class="recTypeChk" value="추후협의">추후협의</label>
						<label><input type="checkbox" class="recTypeChk" value="인턴직">인턴직</label>
						<label><input type="checkbox" class="recTypeChk" value="정규직">정규직</label>
						<label><input type="checkbox" class="recTypeChk" value="계약직">계약직</label>
						<label><input type="checkbox" class="recTypeChk" value="프리랜서">프리랜서</label>
						<input type="hidden" id="recType" name="recType">
					</td>
				</tr>
				
				<tr>
					<td>급여사항</td>
					<td>
						<select id="paySelect" name="paySelect" class="form-control cat">
							<option value="추후협의">추후협의</option>
							<option value="2000만원~2100만원">2000만원~2100만원</option>
							<option value="2100만원~2200만원">2100만원~2200만원</option>
							<option value="2200만원~2300만원">2200만원~2300만원</option>
							<option value="2300만원~2400만원">2300만원~2400만원</option>
							<option value="2400만원~2500만원">2400만원~2500만원</option>
							<option value="2500만원~2600만원">2500만원~2600만원</option>
							<option value="2600만원~2700만원">2600만원~2700만원</option>
							<option value="2700만원~2800만원">2700만원~2800만원</option>
							<option value="2800만원~2900만원">2800만원~2900만원</option>
							<option value="2900만원~3000만원">2900만원~3000만원</option>
							<option value="3000만원~3100만원">3000만원~3100만원</option>
							<option value="3100만원~3200만원">3100만원~3200만원</option>
							<option value="3200만원~3300만원">3200만원~3300만원</option>
							<option value="3300만원~3400만원">3300만원~3400만원</option>
							<option value="3400만원~3500만원">3400만원~3500만원</option>
							<option value="3500만원~3600만원">3500만원~3600만원</option>
							<option value="3600만원~3700만원">3600만원~3700만원</option>
							<option value="3700만원~3800만원">3700만원~3800만원</option>
							<option value="3800만원~3900만원">3800만원~3900만원</option>
							<option value="3900만원~4000만원">3900만원~4000만원</option>
							<option value="4000만원~4100만원">4000만원~4100만원</option>
							<option value="4100만원~4200만원">4100만원~4200만원</option>
							<option value="4200만원~4300만원">4200만원~4300만원</option>
							<option value="4300만원~4400만원">4300만원~4400만원</option>
							<option value="4400만원~4500만원">4400만원~4500만원</option>
							<option value="4500만원~4600만원">4500만원~4600만원</option>
							<option value="4600만원~4700만원">4600만원~4700만원</option>
							<option value="4700만원~4800만원">4700만원~4800만원</option>
							<option value="4800만원~4900만원">4800만원~4900만원</option>
							<option value="4900만원~5000만원">4900만원~5000만원</option>
							<option value="5000만원 초과">5000만원 초과</option>
						</select>
						<input type="hidden" id="pay" name="pay" value="추후협의">
					</td>
				</tr>
				
				<tr>
					<td>복리후생</td>
					<td>
						<label><input type="checkbox" class="welfareChk" value="4대보험">4대보험</label>
						<label><input type="checkbox" class="welfareChk" value="격주휴무">격주휴무</label>
						<label><input type="checkbox" class="welfareChk" value="경조금">경조금</label>
						<label><input type="checkbox" class="welfareChk" value="기숙사">기숙사</label>
						<label><input type="checkbox" class="welfareChk" value="석식제공">석식제공</label>
						<label><input type="checkbox" class="welfareChk" value="셔틀버스">셔틀버스</label>
						<label><input type="checkbox" class="welfareChk" value="식당운영">식당운영</label>
						<label><input type="checkbox" class="welfareChk" value="연차">연차</label>
						<label><input type="checkbox" class="welfareChk" value="월차">월차</label>
						<label><input type="checkbox" class="welfareChk" value="자녀학자금">자녀학자금</label>
						<label><input type="checkbox" class="welfareChk" value="장애인우대">장애인우대</label>
						<label><input type="checkbox" class="welfareChk" value="주5일근무">주5일근무</label>
						<label><input type="checkbox" class="welfareChk" value="중식비">중식비</label>
						<label><input type="checkbox" class="welfareChk" value="퇴직금">퇴직금</label>
						<input type="hidden" id="welfare" name="welfare">
					</td>
				</tr>
				<tr>
					<td>모집인원</td>
					<td>
						<select id="recNumSelect" name="recNumSelect" class="form-control sel">
							<option value="0명">0명</option>
							<option value="1명">1명</option>
							<option value="2명">2명</option>
							<option value="3명">3명</option>
							<option value="4명">4명</option>
							<option value="5명">5명</option>
						</select>
						<input type="hidden" id="recNumber" name="recNumber" value="0명">
					</td>
				</tr>				
			</table>
			</div>
			<hr>
			
			<div>
				<span style="font-size: 18px; font-weight: bold;">◎자격요건</span><br><br>
			<table style="width: 900px;">
				<colgroup>
					<col style="width:20%;" />
					<col style="width:80%;" />
				</colgroup>
				<tr>
					<td>성별</td>
					<td>						 
						<select id="genderSelect" name="genderSelect" class="form-control sel">
							<option value="무관">무관</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select> 
						<input type="hidden" id="gender" name="gender" value="무관">
						<br>
						<span>채용에서 남녀를 차별하거나, 여성근로자를 채용할 경우 직무수행에 불필요한 용모, 키, 체중 등의 신체조건, 미혼조건을 제시 또는 요구하는 경우 남녀고용평등법 위반에 따른 500만원 이하의 벌금이 부과될 수 있습니다.</span>
					</td>
				</tr>

				<tr>
					<td>나이</td>
					<td>
						<select id="ageSelect" name="ageSelect" class="form-control sel">
							<option value="제한없음">제한없음</option>
							<option value="20세 이하">20세 이하</option>
							<option value="21세 이하">21세 이하</option>
							<option value="22세 이하">22세 이하</option>
							<option value="23세 이하">23세 이하</option>
							<option value="24세 이하">24세 이하</option>
							<option value="25세 이하">25세 이하</option>
							<option value="26세 이하">26세 이하</option>
							<option value="27세 이하">27세 이하</option>
							<option value="28세 이하">28세 이하</option>
							<option value="29세 이하">29세 이하</option>
							<option value="30세 이하">30세 이하</option>
							<option value="31세 이하">31세 이하</option>
							<option value="32세 이하">32세 이하</option>
							<option value="33세 이하">33세 이하</option>
							<option value="34세 이하">34세 이하</option>
							<option value="35세 이하">35세 이하</option>
							<option value="40세 이하">40세 이하</option>
							<option value="45세 이하">45세 이하</option>
							<option value="55세 이하">55세 이하</option>
							<option value="60세 이하">60세 이하</option>							
						</select>  
						<input type="hidden" name="age" id="age" value="제한없음">
						<br>
						모집·채용에서 합리적인 이유 없이 연령제한을 하는 경우는 연령차별금지법 위반에 따른 500만원 이하의 벌금이 부과될 수 있습니다.
					</td>
				</tr>

				<tr>
					<td>학력</td>
					<td> 
						<select id="eduSelect" name="eduSelect" class="form-control sel">
							<option value="무관">무관</option>
							<option value="초등학교">초등학교</option>
							<option value="중학교">중학교</option>
							<option value="고등학교">고등학교</option>
							<option value="대학(2~3년) 졸업">대학(2~3년) 졸업</option>
							<option value="대학(4년) 졸업">대학(4년) 졸업</option>
							<option value="대학원(석사) 졸업">대학원(석사) 졸업</option>
							<option value="대학원(박사) 졸업">대학원(박사) 졸업</option>
						</select> 
						<input type="hidden" id="educationLv" name="educationLv" value="무관">
					</td>
				</tr>

				<tr>
					<td>경력</td>
					<td> 
						<select id="careerSelect" name="careerSelect" class="form-control sel">
							<option value="무관">무관</option>
							<option value="1년">1년</option>
							<option value="2년">2년</option>
							<option value="3년">3년</option>
							<option value="4년">4년</option>
							<option value="5년">5년</option>
							<option value="6년">6년</option>
							<option value="7년">7년</option>
							<option value="8년">8년</option>
							<option value="9년">9년</option>
							<option value="10년">10년</option>
							<option value="11년">11년</option>
							<option value="12년">12년</option>
							<option value="13년">13년</option>
							<option value="14년">14년</option>
							<option value="15년">15년</option>
							<option value="16년">16년</option>
							<option value="17년">17년</option>
							<option value="18년">18년</option>
							<option value="19년">19년</option>
							<option value="20년">20년</option>
							<option value="21년">21년</option>
							<option value="22년">22년</option>
							<option value="23년">23년</option>
							<option value="24년">24년</option>
							<option value="25년">25년</option>
							<option value="26년">26년</option>
							<option value="27년">27년</option>
							<option value="28년">28년</option>
							<option value="29년">29년</option>
							<option value="30년">30년</option>
							<option value="30년 초과">30년 초과</option>
						</select> 
						<input type="hidden" id="career" name="career" value="무관">
					</td>
				</tr>

				<tr>
					<td>우대조건</td>
					<td> 
						<label><input type="checkbox" class="preferChk" value="국가유공자">국가유공자</label>
						<label><input type="checkbox" class="preferChk" value="보훈대상자">보훈대상자</label>
						<label><input type="checkbox" class="preferChk" value="고용촉진장려금대상자">고용촉진장려금대상자</label>
						<label><input type="checkbox" class="preferChk" value="장애인">장애인</label>
						<label><input type="checkbox" class="preferChk" value="취업보호대상자">취업보호대상자</label>
						<label><input type="checkbox" class="preferChk" value="영어가능자">영어가능자</label>
						<label><input type="checkbox" class="preferChk" value="일본어가능자">일본어가능자</label>
						<label><input type="checkbox" class="preferChk" value="중국어가능자">중국어가능자</label>
						<label><input type="checkbox" class="preferChk" value="독일어가능자">독일어가능자</label>
						<label><input type="checkbox" class="preferChk" value="프랑스어가능자">프랑스어가능자</label>
						<label><input type="checkbox" class="preferChk" value="스페인어가능자">스페인어가능자</label>
						<label><input type="checkbox" class="preferChk" value="러시아어가능자">러시아어가능자</label>
						<label><input type="checkbox" class="preferChk" value="컴퓨터활용능력우수자">컴퓨터활용능력우수자</label>
						<label><input type="checkbox" class="preferChk" value="엑셀고급능력보유자">엑셀고급능력보유자</label>
						<label><input type="checkbox" class="preferChk" value="CAD능숙자">CAD능숙자</label>
						<label><input type="checkbox" class="preferChk" value="MAC능숙자">MAC능숙자</label>
						<label><input type="checkbox" class="preferChk" value="학점우수">학점우수</label>
						<label><input type="checkbox" class="preferChk" value="MBA">MBA</label>
						<label><input type="checkbox" class="preferChk" value="2교대근무가능자">2교대근무가능자</label>
						<label><input type="checkbox" class="preferChk" value="3교대근무가능자">3교대근무가능자</label>
						<label><input type="checkbox" class="preferChk" value="해외근무가능자">해외근무가능자</label>
						<label><input type="checkbox" class="preferChk" value="병역특례">병역특례</label>
						<label><input type="checkbox" class="preferChk" value="차량소지자">차량소지자</label>
						<input type="hidden" id="preference" name="preference">
					</td>
				</tr>
				
				<tr>
					<td>제출서류</td>
					<td>	 
						<label><input type="checkbox" class="docChk" value="이력서">이력서</label>
						<label><input type="checkbox" class="docChk" value="자기소개서">자기소개서</label>
						<label><input type="checkbox" class="docChk" value="졸업증명서">졸업증명서</label>
						<label><input type="checkbox" class="docChk" value="주민등록등본">주민등록등본</label>
						<label><input type="checkbox" class="docChk" value="성적증명서">성적증명서</label>
						<label><input type="checkbox" class="docChk" value="경력증명서">경력증명서</label>
						<input type="hidden" name="document" id="document">
					</td>
				</tr>
				</table>
			</div>
			<hr>
			<div>
				<span style="font-size: 18px; font-weight: bold;">◎상세모집내용</span><br><br>
				<textarea id="recDetail" name="recDetail" rows="20" cols="93"></textarea>
			</div>
			<br>
			<div style="width: 900px; text-align: center;">
				<input type="submit" value="채용공고 등록하기"/>
			</div><br>
			
			<input type="hidden" id="jobType1" name="jobType1">
			<input type="hidden" id="jobType2" name="jobType2">			
			<input type="hidden" id="induType1" name="induType1">
			<input type="hidden" id="induType2" name="induType2">			
			<input type="hidden" id="location1" name="location1">
			<input type="hidden" id="location2" name="location2">			
			<input type="text" id="comCode" name="comCode">
			
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>"></script>
<style>
	
	#eduView, #careerView, #certificateView,
	#languageView, #awardView, #specialView,
	#activityView, #self1Title, #self2Title,
	#self3Title, #self4Title, #self5Title,
	#self1Content, #self2Content,
	#self3Content, #self4Content, #self5Content{
		font-size: 15px;
	}
	
	td span {
		font-size: 15px;
	}
	
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
		
	textarea {
    	resize:none; /*크기고정 */
    	font-size: 16px;
    	color: black;
    	background-color: white;
    	border: none;    	
	}		
	
	.photo{
      background-image:url("<c:url value='/personalMemberProfile/${memberVo.imageURL}'/>");
      background-repeat:no-repeat;
      background-size:100% 100%;
      width: 130px;
      height: 180px;
      position: absolute;
      left: 570px;
   }

</style>	
<script type="text/javascript">	
	$(function(){
		/*학력*/		
		var eduView = $("#edu").val();
		if(eduView!=''){
			$("#eduView").html(eduView);
		}else{
			$("#eduDiv").hide();
		}		
		
		/*경력*/
		var career = $("#career").val();
		var careerView = career.replace('*', '<br>');
		if(career!=''){
			$("#careerView").html(careerView);
		}else{
			$("#careerDiv").hide();
		}
		
		/*자격*/
		var certificate = $("#certificate").val();
		var certificateView = certificate.replace('*', '<br>');
		if(certificateView!=''){
			$("#certificateView").html(certificateView);
		}else{
			$("#certificateDiv").hide();
		}
		
		/*어학*/
		var language = $("#language").val();
		var languageView = language.replace('*', '<br>');
		if(languageView!=''){
			$("#languageView").html(languageView);
		}else{
			$("#languageDiv").hide();	
		}
		
		/*수상*/
		var award = $("#award").val();
		var awardView = award.replace('*', '<br>');
		if(awardView!=''){
			$("#awardView").html(awardView);
		}else{
			$("#awardDiv").hide();	
		}
		
		/*우대*/
		var special = $("#special").val();
		var specialView = special.replace('*', '<br>');
		if(specialView!=''){	
			$("#specialView").html(specialView);
		}else{
			$("#specialDiv").hide();				
		}	
		
		/*대외활동*/
		var activity = $("#activity").val();
		var activityView = activity.replace('*', '<br>');
		if(activityView!=''){	
			$("#activityView").html(activityView);
		}else{
			$("#activityDiv").hide();				
		}	
		
		/*자기소개*/
		var self1 = $("#self1").val();
		
		if(self1==""){			
			$("#self1Div").hide();			
		}
		
		var self1Arr = self1.split('*');
		var self1Title = self1Arr[0];
		var self1Content = self1Arr[1];
		
		$("#self1Title").html(self1Title);
		$("#self1Content").html(self1Content);
		
		var self2 = $("#self2").val();
		
		if(self2==""){
			$("#self2Div").hide();
		}
		
		var self2Arr = self2.split('*');
		var self2Title = self2Arr[0];
		var self2Content = self2Arr[1];
		
		$("#self2Title").html(self2Title);
		$("#self2Content").html(self2Content);
		
		var self3 = $("#self3").val();
		
		if(self3==""){
			$("#self3Div").hide();
		}
		
		var self3Arr = self3.split('*');
		var self3Title = self3Arr[0];
		var self3Content = self3Arr[1];
		
		$("#self3Title").html(self3Title);
		$("#self3Content").html(self3Content);
		
		var self4 = $("#self4").val();
		
		if(self4==""){
			$("#self4Div").hide();
		}
		
		var self4Arr = self4.split('*');
		var self4Title = self4Arr[0];
		var self4Content = self4Arr[1];
		
		$("#self4Title").html(self4Title);
		$("#self4Content").html(self4Content);		
				
		var self5 = "";
		self5 = $("#self5").val();
		if(self5==""){
			$("#self5Div").hide();
		}
		
		var self5Arr = self5.split('*');
		var self5Title = self5Arr[0];
		var self5Content = self5Arr[1];
				
		$("#self5Title").val(self5Title);
		$("#self5Content").val(self5Content);
		
		if(self1=='' && self2=='' && self3=='' && self4=='' && self5==''){
			$("#selfIntroDiv").hide();
		}
		
	});
	
</script>
<main>	
	<!-- 채용공고코드 --><input type="hidden" name="recruitmentCode" id="recruitmentCode" value="${param.recruitmentCode}">
	<!-- 유저아이디 --><input type="hidden" name="userid" id="userid" value="${param.userid}">
	<!-- main -->
	
	<div style="float: left; width:700px; margin-left:30px; font-size: 14px;">
		<span style="font-size: 25px; font-weight: bold;">자사 이력서 양식 작성</span>
		<br><br>
		<hr>
		<div style="margin:5px;"><br>
			<span style="font-size: 18px; font-weight: bold;">기본정보</span>
			<br><br>
			<div class="photo">
			</div>
			<table>
				<colgroup>
					<col style="width:180px;">
					<col style="width:180px;">
				</colgroup>
				<tr>
					<td><span>이름</span></td>
					<td><span id="name">${vo.name}</span></td>
				</tr>
				<tr>
					<td><span>성별</span></td>
					<td><span id="gender">${vo.gender}</span></td>
				</tr>
				<tr>
					<td><span>이메일</span></td>
					<td><span id="email">${vo.email}</span></td>
				</tr>
				<tr>
					<td><span>전화번호</span></td>
					<td><span id="hp">${vo.hp}</span></td>
				</tr>
				<tr>
					<td><span>생년월일</span></td>
					<td><span id="birth">${vo.birth}</span></td>
				</tr>
				<tr>
					<td><span>우편번호</span></td>
					<td><span id="zipcode">${vo.zipcode}</span></td>
				</tr>
				<tr>
					<td><span>주소</span></td>
					<td><span id="address">${vo.address}</span></td>
				</tr>
				<tr>
					<td><span>상세주소</span></td>
					<td><span id="addressDetail">${vo.addressDetail}</span></td>	
				</tr>
			</table>
			<br>
			<hr>
		</div>
		<div style="margin:5px;"><br>
			<span style="font-size: 18px; font-weight: bold;">학력사항</span><br><br>
			<span id="eduView"></span>
			<input type="hidden" name="edu" id="edu" value="${vo.edu}">
			<br><br>
			<hr>
		</div>
		<div style="margin:5px;"><br>
			<span style="font-size: 18px; font-weight: bold;">경력사항</span><br><br>
			<span id="careerView"></span>
			<input type="hidden" name="career" id="career" value="${vo.career}">
			<br><br>
			<hr>
		</div>
		<div style="margin:5px;" id="certificateDiv"><br>
		<span style="font-size: 18px; font-weight: bold;">자격증</span><br><br>
			<span id="certificateView"></span>
			<input type="hidden" name="certificate" id="certificate" value="${vo.certificate}">
			<br><br>
			<hr>
		</div>
		<div style="margin:5px;" id="languageDiv"><br>
		<span style="font-size: 18px; font-weight: bold;">어학능력</span><br><br>
			<span id="languageView"></span>
			<input type="hidden" name="language" id="language" value="${vo.language}">
			<br><br>
			<hr>			
		</div>
		<div style="margin:5px;" id="awardDiv"><br>
		<span style="font-size: 18px; font-weight: bold;">수상이력</span><br><br>
			<span id="awardView"></span>
			<input type="hidden" name="award" id="award" value="${vo.award}">
			<br><br>
			<hr>
		</div>
		<div style="margin:5px;" id="specialDiv"><br>
			<span style="font-size: 18px; font-weight: bold;">우대사항</span><br><br>
			<span id="specialView"></span>
			<input type="hidden" name="special" id="special" value="${vo.special}">
			<br><br>
			<hr>
		</div>
		<div style="margin:5px;" id="activityDiv"><br>
			<span style="font-size: 18px; font-weight: bold;">대외활동</span><br><br>
			<span id="activityView"></span>
			<input type="hidden" name="activity" id="activity" value="${vo.activity}">
			<br><br>
			<hr>
		</div>
		<div style="margin:5px;" id="selfIntroDiv"><br>
		<span style="font-size: 18px; font-weight: bold;">자기소개</span><br><br>
			<div id="self1Div" class="selfDivv">
				<span id="self1Title" class="selfDivv"></span><br>
				<span id="self1Content"></span><br>
			</div>
			<div id="self2Div" class="selfDivv">
				<br>
				<span id="self2Title"></span><br>
				<span id="self2Content"></span><br>
			</div>
			<div id="self3Div" class="selfDivv">
				<br>
				<span id="self3Title"></span><br>
				<span id="self3Content"></span><br>
			</div>
			<div id="self4Div" class="selfDivv">
				<br>
				<span id="self4Title"></span><br>
				<span id="self4Content"></span><br>
			</div>
			<div id="self5Div" class="selfDivv">
				<br>
				<span id="self5Title"></span><br>
				<span id="self5Content"></span><br>
			</div>
			<input type="hidden" name="self1" id="self1" value="${vo.self1}">
			<input type="hidden" name="self2" id="self2" value="${vo.self2}">
			<input type="hidden" name="self3" id="self3" value="${vo.self3}">
			<input type="hidden" name="self4" id="self4" value="${vo.self4}">
			<input type="hidden" name="self5" id="self5" value="${vo.self5}">	
			<br>		
			<hr>
		</div>
	</div>
</main>
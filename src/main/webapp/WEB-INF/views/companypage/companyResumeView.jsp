<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>

<style>
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
	input[type=text]{
		border: none;
	}
	
	textarea {
    	resize:none; /*크기고정 */ 
	}
	
	.photo{
		margin-top:20px;
		background-image: url(/team4final/personalMemberProfile/);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		width: 156px;
		height: 216px;
		position: absolute;
		left: 1300px;
	}
	
	.btn2{
		width:90px;
		display: inline-block;
		margin-top: -3.5px;
	}
	

</style>
<script type="text/javascript">
	
	$(function(){
		
		$("#okBtn").click(function(){			
			if(confirm("완료하시겠습니까? 제출하면 내용을 수정할 수 없습니다")){
				alert('제출완료');
				location.href="<c:url value='/index.do'/>";
			}else{
				alert('취소되었습니다');
				event.preventDefault();			
			}						
		});
		
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
		
		if(careerView!=''){
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
		
		var self5 = $("#self5").val();
		
		if(self5==""){
			$("#self5Div").hide();
		}
		
		var self5Arr = self5.split('*');
		var self5Title = self5Arr[0];
		var self5Content = self5Arr[1];
		
		$("#self5Title").html(self5Title);
		$("#self5Content").html(self5Content);
		
	});

	
</script>

<main>
	<%@ include file="../inc/sidebar.jsp" %>
	<!-- 채용공고코드 --><input type="hidden" name="recruitmentCode" id="recruitmentCode" value="${vo.recruitmentCode}"><br>
	<!-- 유저아이디 --><input type="hidden" name="userid" id="userid" value="${vo.userId}"><br>
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<span style="font-size: 25px; font-weight: bold;">자사 이력서 양식 작성</span>
		<hr>
		<div style="margin:5px;">
			<div class="photo">
			</div>
			<span style="font-size: 18px; font-weight: bold;">기본정보</span>
			<br><br>
			<table>
				<colgroup>
					<col style="width:180px;">
					<col style="width:180px;">
				</colgroup>
				<tr>
					<td>이름</td>
					<td><input type="text" readonly name="name" id="name" value="${vo.name}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" readonly name="gender" id="gender" value="${vo.gender}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" readonly name="email" id="email" value="${vo.email}"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" readonly name="hp" id="hp" value="${vo.hp}"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" readonly name="birth" id="birth" value="${vo.birth}"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" readonly name="zipcode" id="zipcode" value="${vo.zipcode}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" readonly name="address" id="address" value="${vo.address}"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" readonly name="addressDetail" id="addressDetail" value="${vo.addressDetail}"></td>
				</tr>
			</table>
			<hr>
		</div>
		<div id="eduDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">학력사항</span><br><br>
			<span id="eduView"></span>
			<input type="hidden" name="edu" id="edu" value="${vo.edu}">
			<hr>
		</div>
		<div id="careerDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">경력사항</span><br><br>
			<span id="careerView"></span>
			<input type="hidden" name="career" id="career" value="${vo.career}">
			<hr>
		</div>
		<div id="certificateDiv" style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">자격증</span><br><br>
			<span id="certificateView"></span>
			<input type="hidden" name="certificate" id="certificate" value="${vo.certificate}">
			<hr>
		</div>
		<div id="languageDiv" style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">어학능력</span><br><br>
			<span id="languageView"></span>
			<input type="hidden" name="language" id="language" value="${vo.language}">
			<hr>			
		</div>
		<div id="awardDiv" style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">수상이력</span><br><br>
			<span id="awardView"></span>
			<input type="hidden" name="award" id="award" value="${vo.award}">
			<hr>
		</div>
		<div id="specialDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">우대사항</span><br><br>
			<span id="specialView"></span>
			<input type="hidden" name="special" id="special" value="${vo.special}">
			<hr>
		</div>
		<div id="activityDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">대외활동</span><br><br>
			<span id="activityView"></span>
			<input type="hidden" name="activity" id="activity" value="${vo.activity}">
			<hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">자기소개</span><br><br>
			<div id="self1Div">
				<span id="self1Title"></span><br>
				<span id="self1Content"></span><br>				
			</div>
							
			<div id="self2Div">
				<br>
				<span id="self2Title"></span><br>
				<span id="self2Content"></span><br>				
			</div>
				
			<div id="self3Div">
				<br>
				<span id="self3Title"></span><br>
				<span id="self3Content"></span><br>				
			</div>
			
			<div id="self4Div">
				<br>
				<span id="self4Title"></span><br>
				<span id="self4Content"></span><br>				
			</div>
			
			<div id="self5Div"><br>
				<span id="self5Title"></span><br>
				<span id="self5Content"></span><br>				
			</div>
			<input type="hidden" name="self1" id="self1" value="${vo.self1}">
			<input type="hidden" name="self2" id="self2" value="${vo.self2}">
			<input type="hidden" name="self3" id="self3" value="${vo.self3}">
			<input type="hidden" name="self4" id="self4" value="${vo.self4}">
			<input type="hidden" name="self5" id="self5" value="${vo.self5}">
			<hr>
		</div>
		<div style="text-align: center;">
			<input type="button" name="modifyBtn" id="modifyBtn" class="form-control btn2" value="수정하기" onclick="history.back();"/>
			<input type="button" name="okBtn" id="okBtn" class="form-control btn2" value="확인완료"><br><br>
			<br>
		</div>
	</div>
</main>
<%@ include file="../inc/bottom.jsp" %>
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
	

</style>
<script type="text/javascript">
	
	$(function(){
		
		$("#okBtn").click(function(){
			
			if(confirm("입력확인을 완료하시겠습니까? 확인 시 내용을 수정할 수 없습니다")){
				alert('입력확인완료');
				location.href="<c:url value='/index.do'/>";
			}else{
				alert('취소되었습니다');
				event.preventDefault();
			
			}
						
		});
		
		var eduView = $("#edu").val();
		$("#eduView").html(eduView);
		
		var career = $("#career").val();
		var careerView = career.replace('*', '<br>');
		$("#careerView").html(careerView);
		
		var certificate = $("#certificate").val();
		var certificateView = certificate.replace('*', '<br>');
		$("#certificateView").html(certificateView);
		
		var language = $("#language").val();
		var languageView = language.replace('*', '<br>');
		$("#languageView").html(languageView);
		
		var award = $("#award").val();
		var awardView = award.replace('*', '<br>');
		$("#awardView").html(awardView);
		
		var special = $("#special").val();
		var specialView = special.replace('*', '<br>');
		$("#specialView").html(specialView);
		
		var activity = $("#activity").val();
		var activityView = activity.replace('*', '<br>');
		$("#activityView").html(activityView);
		
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
		<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">학력사항</span><br><br>
			<span id="eduView"></span>
			<input type="hidden" name="edu" id="edu" value="${vo.edu}">
			<hr>
		</div>
		<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">경력사항</span><br><br>
			<span id="careerView"></span>
			<input type="hidden" name="career" id="career" value="${vo.career}">
			<hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">자격증</span><br><br>
			<span id="certificateView"></span>
			<input type="hidden" name="certificate" id="certificate" value="${vo.certificate}">
			<hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">어학능력</span><br><br>
			<span id="languageView"></span>
			<input type="hidden" name="language" id="language" value="${vo.language}">
			<hr>			
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">수상이력</span><br><br>
			<span id="awardView"></span>
			<input type="hidden" name="award" id="award" value="${vo.award}">
			<hr>
		</div>
		<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">우대사항</span><br><br>
			<span id="specialView"></span>
			<input type="hidden" name="special" id="special" value="${vo.special}">
			<hr>
		</div>
		<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">대외활동</span><br><br>
			<span id="activityView"></span>
			<input type="hidden" name="activity" id="activity" value="${vo.activity}">
			<hr>
		</div>
		<div style="margin:5px;">	
		<span style="font-size: 18px; font-weight: bold;">자기소개</span><br><br>
			<div id="self1Div">
				<span id="self1Title"></span><br>
				<textarea id="self1Content" rows="8" cols="80"></textarea><br>
			</div>
			<div id="self2Div">
				<span id="self2Title"></span><br>
				<textarea id="self2Content" rows="8" cols="80"></textarea><br>
			</div>
			<div id="self3Div">
				<span id="self3Title"></span><br>
				<textarea id="self3Content" rows="8" cols="80"></textarea><br>
			</div>
			<div id="self4Div">
				<span id="self4Title"></span><br>
				<textarea id="self4Content" rows="8" cols="80"></textarea><br>
			</div>
			<div id="self5Div">
				<span id="self5Title"></span><br>
				<textarea id="self5Content" rows="8" cols="80"></textarea><br>
			</div>
			<input type="hidden" name="self1" id="self1" value="${vo.self1}">
			<input type="hidden" name="self2" id="self2" value="${vo.self2}">
			<input type="hidden" name="self3" id="self3" value="${vo.self3}">
			<input type="hidden" name="self4" id="self4" value="${vo.self4}">
			<input type="hidden" name="self5" id="self5" value="${vo.self5}">
			<hr>
		</div>
		<div style="text-align: center;">
			<input type="button" name="modifyBtn" id="modifyBtn" value="수정하기" onclick="history.back();"/>
			<input type="button" name="okBtn" id="okBtn" value="확인완료"><br><br>
			<br>
		</div>
	</div>
</main>
<%@ include file="../inc/bottom.jsp" %>
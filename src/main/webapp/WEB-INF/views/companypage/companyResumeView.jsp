<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>

<style>
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
	input[type=text]{
		border: none;
	}
	

</style>
<script type="text/javascript">
	
	$(function(){
		var career = $("#career").val();
		var careerView = career.replace('*', '<br>');
		$("#careerView").html(careerView);
		
		var certificate = $("#certificate").val();
		var certificateView = certificate.replace('*', '<br>');
		$("#certificateView").html("+"+certificateView);
		
		var language = $("#language").val();
		var languageView = language.replace('*', '<br>');
		$("#languageView").html(languageView);
		
		var award = $("#award").val();
		var awardView = award.replace('*', '<br>');
		$("#awardView").html(awardView);
		
		
		
		
		
		
		
	});

	
</script>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	채용공고코드<input type="text" name="recruitmentCode" id="recruitmentCode" value="${vo.recruitmentCode}"><br>
	유저아이디<input type="text" name="userid" id="userid" value="${vo.userId}"><br>
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
			<span style="font-size: 18px; font-weight: bold;">학력사항</span><br>
			<input type="text" name="eduView" id="eduView">
			<input type="hidden" name="edu" id="edu" value="${vo.edu}">
			<hr>
		</div>
		<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">경력사항</span><br>
			<span id="careerView"></span>
			<input type="hidden" name="career" id="career" value="${vo.career}">
			<hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">자격증</span><br>
			<span id="certificateView"></span>
			<input type="hidden" name="certificate" id="certificate" value="${vo.certificate}">
			<hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">어학능력</span><br>
			<span id="languageView"></span>
			<input type="hidden" name="language" id="language" value="${vo.language}">
			<hr>			
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">수상이력</span><br>
			<span id="awardView"></span>
			<input type="hidden" name="award" id="award" value="${vo.award}">
			<hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">우대사항</span><br>
			<input type="text" name="special" id="special" value="${vo.special}"><hr>
		</div>
		<div style="margin:5px;">
		<span style="font-size: 18px; font-weight: bold;">대외활동</span><br>
			<input type="text" name="activity" id="activity" value="${vo.activity}"><hr>
		</div>
		<div style="margin:5px;">	
		<span style="font-size: 18px; font-weight: bold;">자기소개</span><br>
			<textarea>${vo.self1}</textarea><br>
			<textarea>${vo.self2}</textarea><br>
			<textarea>${vo.self3}</textarea><br>
			<textarea>${vo.self4}</textarea><br>
			<textarea>${vo.self5}</textarea><hr>
		</div>
		<div style="text-align: center;">
			<input type="button" value="수정하기">
			<input type="button" value="저장하기"><br><br>
		</div>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
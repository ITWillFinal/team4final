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
</style>
<script type="text/javascript">
	
	$(function(){
		$("#schoolAddBtn").click(function(){
			$("#schoolTable")
			.append("<tr><td><input type='text'></td><td><input type='text'></td></tr>");
		});
		
		$("#careerAddBtn").click(function(){
			$("#careerTable")
			.append("<tr><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td></tr>");
		});
		
		$("#careerDelBtn").click(function(){
			$("#careerTable tr").last()
			.remove();
		});
		
		$("#certificateAddBtn").click(function(){
			$("#certificateTable")
			.append("<tr><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td></tr>");
		});
		
		$("#languageAddBtn").click(function(){
			$("#languageTable")
			.append("<tr><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td></tr>");
		});
		
		$("#awardsAddBtn").click(function(){
			$("#awardsTable")
			.append("<tr><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td></tr>");
		});
		
		var i = 2;
		$("#selfAddBtn").click(function(){
			$("#selfTable")			
			.append("<tr><td>항목 "+i+" :</td><td><input type='text'></td></tr>");
			i++;
		});
				
	});
	
	
</script>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px; border:1px solid lightgray">
		<form>
		<div style="margin:5px; height:95px; border:1px solid lightgray">
		위쪽 가로 긴 구역
		</div>
		자사이력서양식<hr>
		<div style="margin:5px;">
		<span>인적사항</span>
		<br>
			<table>
				<colgroup>
					<col style="width:300px;">
					<col style="width:300px;">
				</colgroup>
				<tr>
					<td>이름</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date"></td>
				</tr>
				<tr>
					<td>우편번호 찾기</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text"></td>
				</tr>
			</table>
		</div><hr>
		
		<div id="schoolDiv" style="margin:5px;">
		<span>학력사항</span>
		<input type="button" value="추가" id="schoolAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
		<br>
			<table id="schoolTable">
				<colgroup>
					<col style="width:300px;">
					<col style="width:300px;">
				</colgroup>
				<tr>
					<td>학교명</td>
					<td>졸업일</td>				
				</tr>
			</table>
		</div><hr>
		
		
		<div id="careerDiv" style="margin:5px;">
		<span>경력사항</span>
		<input type="button" value="추가" id="careerAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
		<input type="button" value="삭제" id="careerDelBtn"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
		<br>
			<table id="careerTable">
				<colgroup>
					<col style="width:300px;">
					<col style="width:300px;">
					<col style="width:300px;">
				</colgroup>
				<tr>
					<td>회사명</td>
					<td>직위</td>				
					<td>근무기간</td>				
				</tr>
			</table>
		</div><hr>
		
		<div id="certificateDiv" style="margin:5px;">
		<span>자격증</span>
		<input type="button" value="추가" id="certificateAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
		<br> 
			<table id="certificateTable">
				<colgroup>
					<col style="width:300px;">
					<col style="width:300px;">
					<col style="width:300px;">
				</colgroup>
				<tr>
					<td>자격명</td>
					<td>발급기관</td>				
					<td>취득일</td>				
				</tr>
			</table>
		</div><hr>
		
		<div id="languageDiv" style="margin:5px;">
		<span>외국어능력</span>
		<input type="button" value="추가" id="languageAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
		<br> 
			<table id="languageTable">
				<colgroup>
					<col style="width:300px;">
					<col style="width:300px;">
					<col style="width:300px;">
				</colgroup>
				<tr>
					<td>종류</td>
					<td>등급</td>				
					<td>평가년월</td>				
				</tr>
			</table>
		</div><hr>
		
		<div id="awardsDiv" style="margin:5px;">
		<span>수상내역</span>
		<input type="button" value="추가" id="awardsAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
		<br>
			<table id="awardsTable">
				<colgroup>
					<col style="width:300px;">
					<col style="width:300px;">
					<col style="width:300px;">
				</colgroup>
				<tr>
					<td>수상일자</td>
					<td>수상명</td>				
					<td>수여기관</td>				
				</tr>
			</table>
		</div><hr>
		
		<div id="selfDiv" style="margin:5px;">
		<span>자기소개서</span>
		<input type="button" value="추가" id="selfAddBtn"> <!-- 추가 클릭시 작성공간 생성 -->
		<br>
			<table id="selfTable">
				<colgroup>
					<col style="width:100px;">
					<col style="width:500px;">
				</colgroup>
				<tr>
					<td>항목 1 :</td>
					<td><input type="text"></td>			
				</tr>
			</table>
		</div><hr>
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
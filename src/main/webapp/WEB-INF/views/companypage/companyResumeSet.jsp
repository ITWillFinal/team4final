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
	/* 토글 슬라이더 끝 */
</style>
<script type="text/javascript">
	
	$(function(){
		$("#schoolChk").change(function(){
	        if($("#schoolChk").is(":checked")){
	            alert("학력 사용설정");
	            $("#schoolDivChk").show();
	        }else{
	            alert("학력 사용해제");
	            $("#schoolDivChk").hide();
	        }
	    });
		$("#careerChk").change(function(){
	        if($("#careerChk").is(":checked")){
	            alert("경력 사용설정");
	            $("#careerDivChk").show();
	        }else{
	            alert("경력 사용해제");
	            $("#careerDivChk").hide();
	        }
	    });
		$("#certificateChk").change(function(){
	        if($("#certificateChk").is(":checked")){
	            alert("자격증 사용설정");
	            $("#certificateDivChk").show();
	        }else{
	            alert("자격증 사용해제");
	            $("#certificateDivChk").hide();
	        }
	    });
		$("#languageChk").change(function(){
	        if($("#languageChk").is(":checked")){
	            alert("외국어능력 사용설정");
	            $("#languageDivChk").show();
	        }else{
	            alert("외국어능력 사용해제");
	            $("#languageDivChk").hide();
	        }
	    });
		$("#awardsChk").change(function(){
	        if($("#awardsChk").is(":checked")){
	            alert("수상내역 사용설정");
	            $("#awardsDivChk").show();
	        }else{
	            alert("수상내역 사용해제");
	            $("#awardsDivChk").hide();
	        }
	    });
		$("#activityChk").change(function(){
	        if($("#activityChk").is(":checked")){
	            alert("대외활동 사용설정");
	            $("#activityDivChk").show();
	        }else{
	            alert("대외활동 사용해제");
	            $("#activityDivChk").hide();
	        }
	    });
		$("#specialChk").change(function(){
	        if($("#specialChk").is(":checked")){
	            alert("우대사항 사용설정");
	            $("#specialDivChk").show();
	        }else{
	            alert("우대사항 사용해제");
	            $("#specialDivChk").hide();
	        }
	    });
		
		$("#selfChk").change(function(){
	        if($("#selfChk").is(":checked")){
	            alert("자기소개서 사용설정");
	            $("#selfDivChk").show();
	        }else{
	            alert("자기소개서 사용해제");
	            $("#selfDivChk").hide();
	        }
	    });
		
				
		var i = 2;
		$("#selfAddBtn").click(function(){
			$("#selfTable")			
			.append("<tr id='selfTr'><td>항목 "+i+" :</td><td><input type='text'></td></tr>");
			i++;
		});
		
		$("#selfDelBtn").click(function(){
			$("#selfTr:nth-last-child(1)").remove();
			i--;
		});
				
	});
	
	
</script>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<form>
		<%--
		<div style="margin:5px; height:95px; border:1px solid lightgray">
		위쪽 가로 긴 구역
		</div>
		--%>
		<span style="font-size: 25px; font-weight: bold;">자사 이력서 양식 설정</span>
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
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" readonly></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" readonly></td>
				</tr>
			</table>
		</div>
		<hr>
		
		<div id="schoolDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">학력사항</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="schoolChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="schoolDivChk">
				<table id="schoolTable">
					<colgroup>
						<col style="width:200px;">
						<col style="width:200px;">
					</colgroup>
					<tr>
						<td>학교명</td>
						<td>졸업일</td>				
					</tr>
				</table>
			</div>
		</div>
		<hr>		
		
		<div id="careerDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">경력사항</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="careerChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="careerDivChk">	
				<table id="careerTable">
					<colgroup>
						<col style="width:200px;">
						<col style="width:200px;">
						<col style="width:200px;">
						<col style="width:200px;">
					</colgroup>
					<tr>
						<td>회사명</td>
						<td>직위</td>				
						<td>담당업무</td>
						<td>근무기간</td>		
					</tr>
				</table>
			</div>
		</div>
		<hr>
		
		<div id="certificateDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">자격증</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="certificateChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="certificateDivChk">	
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
			</div>
		</div>
		<hr>
		
		<div id="languageDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">외국어능력</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="languageChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="languageDivChk">	
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
			</div>
		</div>
		<hr>
		
		<div id="awardsDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">수상내역</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="awardsChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="awardsDivChk">	
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
				</table>
			</div>
		</div>
		<hr>
		
		<div id="specialDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">우대사항</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="specialChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="specialDivChk">	
				<table id="specialTable">
					<colgroup>
						<col style="width:200px;">
					</colgroup>
					<tr>
						<td><input type="checkbox">&nbsp;병역대상</td>
					</tr>
					<tr>
						<td><input type="checkbox">&nbsp;보훈대상</td>
					</tr>
					<tr>
						<td><input type="checkbox">&nbsp;고용지원금 대상</td>
					</tr>
				</table>
			</div>
		</div>
		<hr>
		
		<div id="activityDiv" style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">대외활동</span>
			<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
			<label class="switch">
				<input type="checkbox" id="activityChk" checked> <!-- 체크 시 테이블 등장 -->
				<span class="slider round"></span>
			</label><br><br>
			<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
			<div id="activityDivChk">	
				<table id="activityTable">
					<colgroup>
						<col style="width:200px;">
						<col style="width:200px;">
						<col style="width:200px;">
					</colgroup>
					<tr>
						<td>대외활동명</td>				
						<td>대외활동기관</td>
						<td>대외활동일자</td>			
					</tr>
				</table>
			</div>
		</div>
		<hr>
		
			<div id="selfDiv" style="margin:5px;">
				<span style="font-size: 18px; font-weight: bold;">자기소개서</span>
				<%-- 체크박스를 토글스위치로 바꾼 부분 시작 --%>
				<label class="switch">
					<input type="checkbox" id="selfChk" checked> <!-- 체크 시 테이블 등장 -->
					<span class="slider round"></span>
				</label><br><br>
				<%-- 체크박스를 토글스위치로 바꾼 부분 끝 --%>
				<div id="selfDivChk">
				<span>주제를 입력하세요</span>
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
				</div>
			</div>
			<hr>
			<div style="text-align: center;">
				<input type="submit" value="설정완료">
				<input type="button" value="뒤로가기">
			</div>
			<br><br>
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/companyTop.jsp" %>

<style>
	
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
	
	input[type=text]:hover {
	    background : #dcdcdc;
	}
	
	input[type=text] {
		padding-left: 15px;
		padding-right: 15px;
		background : whitesmoke;
		width:200px;
		height:35px;
		border:1px lightgray solid;
		border-radius: 5px;
	}
	
	tr {
		border-bottom: 1px solid lightgray;
		border-top: 1px solid lightgray;
	}
	
	td {
		padding-top: 5px;
		padding-bottom: 5px;
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
	
	.selfTitle{
		display: none;
	}
	
	.cat {
		width:200px;
		display: inline-block;
	}
	
	.btn1 {
		width:60px;
		display: inline-block;
		margin-top: -3.5px;
	}
	
	.btn1:hover {
	    background : #dcdcdc;
	}
	
	.btn2 {
		width:90px;
		display: inline-block;
		margin-top: -3.5px;
	}
	
	.btn2:hover {
	    background : #dcdcdc;
	}
	
</style>
<script type="text/javascript">
	
	$(function(){
		
		$("#schoolVal").val("y");
		$("#schoolChk").change(function(){
	        if($("#schoolChk").is(":checked")){
	            alert("학력 사용설정");
	            $("#schoolDivChk").show();
	            $("#schoolVal").val("y");
	        }else{
	            alert("학력 사용해제");
	            $("#schoolDivChk").hide();
	            $("#schoolVal").val("n");
	        }
	    });
		
		$("#careerVal").val("y");
		$("#careerChk").change(function(){
	        if($("#careerChk").is(":checked")){
	            alert("경력 사용설정");
	            $("#careerDivChk").show();
	            $("#careerVal").val("y");
	        }else{
	            alert("경력 사용해제");
	            $("#careerDivChk").hide();
	            $("#careerVal").val("n");
	        }
	    });
		
		$("#certificateVal").val("y");
		$("#certificateChk").change(function(){
	        if($("#certificateChk").is(":checked")){
	            alert("자격증 사용설정");
	            $("#certificateDivChk").show();
	            $("#certificateVal").val("y");
	        }else{
	            alert("자격증 사용해제");
	            $("#certificateDivChk").hide();
	            $("#certificateVal").val("n");
	        }
	    });
	
		$("#languageVal").val("y");
		$("#languageChk").change(function(){
	        if($("#languageChk").is(":checked")){
	            alert("외국어능력 사용설정");
	            $("#languageDivChk").show();
	            $("#languageVal").val("y");
	        }else{
	            alert("외국어능력 사용해제");
	            $("#languageDivChk").hide();
	            $("#languageVal").val("n");
	        }
	    });
		
		$("#awardsVal").val("y");
		$("#awardsChk").change(function(){
	        if($("#awardsChk").is(":checked")){
	            alert("수상내역 사용설정");
	            $("#awardsDivChk").show();
	            $("#awardsVal").val("y");
	        }else{
	            alert("수상내역 사용해제");
	            $("#awardsDivChk").hide();
	            $("#awardsVal").val("n");
	        }
	    });
		
		$("#activityVal").val("y");
		$("#activityChk").change(function(){
	        if($("#activityChk").is(":checked")){
	            alert("대외활동 사용설정");
	            $("#activityDivChk").show();
	            $("#activityVal").val("y");
	        }else{
	            alert("대외활동 사용해제");
	            $("#activityDivChk").hide();
	            $("#activityVal").val("n");
	        }
	    });
		
		$("#specialVal").val("y");
		$("#specialChk").change(function(){
	        if($("#specialChk").is(":checked")){
	            alert("우대사항 사용설정");
	            $("#specialDivChk").show();
	            $("#specialVal").val("y");
	        }else{
	            alert("우대사항 사용해제");
	            $("#specialDivChk").hide();
	            $("#specialVal").val("n");
	        }
	    });
		
		
		
		$("#selfVal").val("y");
		$("#selfChk").change(function(){
	        if($("#selfChk").is(":checked")){
	            alert("자기소개서 사용설정");
	            $("#selfDivChk").show();
	            $("#selfVal").val("y");
	        }else{
	            alert("자기소개서 사용해제");
	            $("#selfDivChk").hide();
	            $("#selfVal").val("n");
	            $('#selfTable').find('input[type=text]').val('');
	        }
	    });
		
		$("#selfAddBtn").click(function(){
			$('.selfTitle:eq(0)').removeClass('selfTitle');		
		});
		
		$("#selfDelBtn").click(function(){
			$('.removeTr').not('.selfTitle').last().find('input').val('');
			$('.removeTr').not('.selfTitle').last().addClass('selfTitle');
		});
				
	});
	
	
</script>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<form name="frm" method="post" action="<c:url value='/companypage/companyResumeSet.do'/>">
		<!--채용공고코드 : --> <input type="hidden" name="recruitmentCode" id="recruitmentCode" value="${recruitmentCode}">
		<span style="font-size: 25px; font-weight: bold;">자사 이력서 양식 설정</span>
		<hr>
		<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">기본정보</span>
			<br><br>
			<table>
				<colgroup>
					<col style="width:200px;">
					<col style="width:200px;">
				</colgroup>
				<tr>
					<td>이름</td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>성별</td>
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
					<td><input type="date" readonly class="form-control cat"></td>
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
						<col style="width:200px;">
					</colgroup>
					<tr>
						<td>학교</td>
						<td>전공</td>
						<td>졸업일</td>				
					</tr>
					<tr>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="schoolVal" id="schoolVal">
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
					<tr>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="careerVal" id="careerVal">
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
					<tr>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="certificateVal" id="certificateVal">
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
					<tr>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="languageVal" id="languageVal">
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
					<tr>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="awardsVal" id="awardsVal">
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
		<input type="hidden" name="specialVal" id="specialVal">
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
					<tr>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
						<td><input type="text" readonly></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="activityVal" id="activityVal">
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
			&nbsp;
			&nbsp;
			<input type="button" value="추가" id="selfAddBtn" class="form-control btn1"> <!-- 추가 클릭시 작성공간 생성 -->
			<input type="button" value="삭제" id="selfDelBtn" class="form-control btn1"> <!-- 삭제 클릭시 마지막 작성공간 삭제 -->
			<br><br>
				<table id="selfTable">
					<colgroup>
						<col style="width:100px;">
						<col style="width:500px;">
					</colgroup>
					<tr>
						<td>항목 1 : </td>
						<td><input type="text" name="selfTitle1" style="width:600px;"></td>
					</tr>
					<tr class="selfTitle removeTr" >
						<td>항목 2 : </td>
						<td><input type="text" name="selfTitle2" style="width:600px;"></td>
					</tr>
					<tr class="selfTitle removeTr" >
						<td>항목 3 : </td>
						<td><input type="text" name="selfTitle3" style="width:600px;"></td>
					</tr>
					<tr class="selfTitle removeTr" >
						<td>항목 4 : </td>
						<td><input type="text" name="selfTitle4" style="width:600px;"></td>
					</tr>
					<tr class="selfTitle removeTr" >
						<td>항목 5 : </td>
						<td><input type="text" name="selfTitle5" style="width:600px;"></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="selfVal" id="selfVal">
		<hr>
		<div style="text-align: center;">
			<input type="submit" value="설정완료" class="form-control btn2">
			<input type="button" value="뒤로가기" class="form-control btn2">
		</div>
		<br><br>
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
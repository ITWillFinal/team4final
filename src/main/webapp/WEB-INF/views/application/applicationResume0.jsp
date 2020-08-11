<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp" %>
<script src="<c:url value='/resources/js/html2canvas.js'/>"></script>
<script src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<style type="text/css">
	*{
		box-sizing: border-box;
	}
	

	#infoDiv1{
		padding-top: 10px;
	    padding-left: 30px;
	    width: 40%;
	    float: left;
	}
	#infoDiv2{
		padding-top: 10px;
	    padding-left: 30px;
	    width: 45%;
	    float: left;
	}
	
	.info{
		height: 130px;
    border: 1px solid #CCC;
    background: #f1f1f1;
    padding: 10px;
    margin-bottom: 30px;
    width: 85%;
	}
	
	.resumeMain{
		width: 1020px;
		margin: 0 auto;
		background: #f7f7f79e;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		padding: 50px; 
		margin-bottom: 70px;
		margin-top: 50px;
	}
	
	.resume-desc{
		font-size: small;
	    color: #8f9294;
	    padding: 10px 40px;
	}
	
	.resume-desc ul li{
		list-style: disc;
	}
	
	.resume-add a{
	 	text-align: center; 
	 	margin: 0 auto;
	 	width: 900px;
	 	font-weight: bold;
	 	display: block;
	 	margin: 30px auto;
	}
	
	.resumeList{
		clear:both;
	    width: 900px;
	    margin: 10px auto;
	}
	
	.resumeList ul li {
	    font-size: larger;
	    font-weight: bold;
	    height: 110px;
	}
	
	.resumeList ul li a{
		color: #000;
		font-size: 1.1em
	}
	
	.resumeList ul li .regdate{
		position: relative;
	    top: 40px;
	    left: 25px;
	    color: #989696;
	    font-weight: normal;
	    font-size: 13px;
	}
	
	.resumeList ul li .regdate a{
		color: #989696;
	    font-weight: normal;
	    font-size: 13px;
	}
	
	.resume-info{
		background:white;
	    /* margin: 20px; */
    	font-size: larger;
    	font-weight: bold;
    	border: 1px solid #aeaeae;
	    height: 100px;
    	padding: 40px 25px 5px;
    }

    
    .delResume{
    	position: relative;
    	top: 35px;
    	left: 580px;
    }
    
    .resume-info-career{
    	font-size: 15px;
 		font-weight: lighter;
    }
    
    .repResume{
    	border: 3px solid #fb246a;
    }
    
    /* 체크박스 => 토글 슬라이더 */
	.switch {
	margin-top:10px;
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
		background-color: #fb246a;
	}
	input:focus + .slider {
		box-shadow: 0 0 1px #fb246a;
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
	
	.YorN{
		color: #989696;
	    font-weight: normal;
	    font-size: 13px;
	    position: relative;
    	top: -11px;
	}
</style>
<script type="text/javascript">
	$(function(){


	});
	
	function open_resume(resumeNo){
		window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
				'RESUME','width=980,height=auto,left=0,top=0,location=yes,resizable=false')
	}
</script>
	<div class="resumeMain">
		<h1>${vo.comName} 지원</h1>
		<div class="info">
		<div id="infoDiv1">
		<table>
			<tr>
				<th>경력</th>
				<td>${vo.career }</td>
			<tr>
			<tr>
				<th>학력</th>
				<td>${vo.educationLv }</td>
			<tr>
			<tr>
				<th>성별</th>
				<td>${vo.gender }</td>
			<tr>
			<tr>
				<th>근무형태</th>
				<td>${vo.recType }</td>
			<tr>
		</table>
		</div>
		<div id="infoDiv2">
			<table>
				<tr>
					<th>급여</th>
					<td>${vo.pay }</td>
				<tr>
				<tr>
					<th>근무일시</th>
					<td>${vo.workHours }</td>
				<tr>
				<tr>
					<th>근무지역</th>
					<td>${vo.location1 } ${vo.location2 }</td>
					
				<tr>
			</table>
			</div>
		</div>
		<div class="resumeList">
			<ul>
			<c:if test="${empty resumeList }">
				등록된 이력서가 없습니다. 이력서 등록 후 지원해주세요.
			</c:if>
			<c:if test="${!empty resumeList }">
				<span>총 <b style="color: #fb246a;">${resumeList.size() }</b>건</span><br>
				<span>지원할 이력서를 선택해주세요.</span>
				<c:forEach var="resumeVo" items="${resumeList }">
						<li>
							<span class="regdate">수정 : ${resumeVo.regdate }</span>
							<input type="hidden" value="${resumeVo.resumeNo }"/>
							<div class="resume-info">
								<input type="radio" name="selResume"/>
								<a onclick="open_resume(${resumeVo.resumeNo})" style="cursor: pointer;">
								<c:if test="${empty resumeVo.selfIntTitle or resumeVo.selfIntTitle==''}">no title</c:if>
								<c:if test="${!empty resumeVo.selfIntTitle or resumeVo.selfIntTitle!=''}">${resumeVo.selfIntTitle }</c:if>
								 </a>
							</div>
						</li>
				</c:forEach>				
			</c:if>
			</ul>
		</div>
		<c:if test="${empty resumeList }">
			<div class="resume-add">
					<a href="<c:url value='/resume/resumeWrite.do'/>" class="btn head-btn2">새로운 이력서 등록하기</a>
			</div>
		</c:if>
		<c:if test="${!empty resumeList }">
			<div class="resume-add">
					<a href="<c:url value='/application/apply.do'/>" class="btn head-btn2">지원하기</a>
			</div>
		</c:if>
	</div>
<%@ include file="../inc/bottom.jsp" %>
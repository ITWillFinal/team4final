<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE JOB</title>
<script src="<c:url value='/resources/js/html2canvas.js'/>"></script>
<script src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<jsp:useBean id="currTime" class="java.util.Date" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 아이콘 태그 -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/nice-select.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/js/jquery-3.5.1.min.js'/>">

<!-- 파비콘 -->
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico'/>">
<link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>">
<style type="text/css">
	*{
		box-sizing: border-box;
	}
	
	.resume-detail-main{
		width: 980px;
	}
	
	.resume-detail{
		background: #fafafa;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		width: 980px;
		padding: 35px 30px 80px;
	}
	
	.resume-title{
		border-bottom: 2px solid #9E9E9E;
		margin-bottom: 25px;
    	font-weight: bold;
	}
	
	.member-info{
	}
	
	em{
		display: inline-block;
	    padding-right: 15px;
	    color: #444;
	    font-size: 22px;
	    font-weight: bold;
	    line-height: 16px;
	    font-style: normal;
	}
	
	.member-name{
		width: 600px;
		display: inline-block;
	}
	
	li{
		height: 35px;
	}
	
	.info-ul{
		display: inline-block;
    	width: 600px;
	}
	
	.photh{
		background-image:url("<c:url value='/personalMemberProfile/${memberVo.imageURL}'/>");
		background-repeat:no-repeat;
		background-size:100% 100%;
		width: 130px;
		height: 180px;
		display:inline-block;
		float: right;
		margin-right: 30px;
	}
	
	.add-info{
		text-align: center;
		width:702px;
		height: 90px;
		background: #f7f7f7;
		border: 1px solid #e3e3e3;
		padding-top:12px; 
		margin-top: 10px;
	}
	
	.add-info-div{
		border-right:1px solid #e3e3e3;
		width : 140px;
		height : 66px;
		display: inline-block;
		float: left;
		background: #f7f7f7;
	}
	
	.add-info-div:last-child{
		border: none;
	}
	
	.section-part{
		clear:both;
		display:block;
		width: 920px;
		margin: 50px 0; 
	}
	
	.self-int{
		width: 920px;
		height:auto;
		display:block;
		border: 2px solid #666;
		padding: 10px;
	}
	
	table {
		display: table;
    	border-collapse: collapse;
    	width: 920px;
	    border: 0;
	    border-left: 1px solid #eaeaea;
	    table-layout: fixed;
	    background-color: #fff;
	    text-align: center;
	    margin-top: 15px;
    	border-top: 2px solid #666;
	}
	
	thead{
		display: table-header-group;
	    vertical-align: middle;
	    border-color: inherit;
	}
	
	tbody {
	    display: table-row-group;
	    vertical-align: middle;
	    border-color: inherit;
	}
	
	.part-table th{
	    padding: 18px 0 20px 0;
	    background: #f7f7f7;
	    border-bottom: 1px solid #eaeaea;
	    border-right: 1px solid #eaeaea;
	    text-align: center;
	    color: #444;
	    font-size: 14px;
	    font-weight: bold;
	    vertical-align: middle;
	    line-height: 14px;
	}
	
	.part-table td {
	    padding: 15px 14px 17px 14px;
	    border-right: 1px solid #eaeaea;
	    border-bottom: 1px solid #eaeaea;
	    color: #444;
	    font-size: 14px;
	    vertical-align: top;
	    line-height: 20px;
	    word-break: break-all;
	    font-family: "Malgun Gothic",dotum,gulim,sans-serif;
	}
	
	.ta-left{
		text-align: left;
	}
	
	.remoteController{
		position: fixed;
	    width: 270px;
	    height: 405px;
	    top: 180px;
	    left: 1320px;
		background: #eaeaea;
	    text-align: center;
	    padding: 10px;
	}
	
	.remoteContent{
		padding-top:10px;
	    background: #f7f7f7;
		width: 100%;
    	height: 50px;
    	margin-bottom: 10px;
    	
	}
	.remoteContent p{
		font-weight: bold;
    	font-size: large;
	}
	.pdf-down, .resume-edit{
		background: #fb236a;
		border:1px solid #fb236a; 
	}
	
	.pdf-down p, .resume-edit p{
		color: white;
	}

	.pdf-save{
		position: absolute;
    	top: -100px;
    	left: -324px;
	}
	
	.isSaving{
		width: 100%;
	    height: 1100px;
	    position: fixed;
	    text-align: center;
	    display: none;
	    top:-100px;
	    z-index: 1;
	} 
	.op{
		width: 100%;
	    height: 100%;
 	   	background: #ff9800;
	    text-align: center;
	    padding-top: 30%;
	    z-index: 2;
	    opacity:0.9;
	} 
	
	.op em{
		color: white;
		font-size: xxx-large;
	}
	.saving{
		display: block;
	}
	
	
	
	
</style>
<script type="text/javascript">

</script>
<body>
<div class="resume-detail-main">
	<div class="resume-detail" id="resumeDetail">
		<div class="profile">
			<h1 class="resume-title">
			<c:if test="${empty resumeAllVo.resumeVo.selfIntTitle or resumeAllVo.resumeVo.selfIntTitle==''}">
			no title</c:if>
			<c:if test="${!empty resumeAllVo.resumeVo.selfIntTitle or resumeAllVo.resumeVo.selfIntTitle!=''}">
			${resumeAllVo.resumeVo.selfIntTitle }</c:if>
			</h1>
			<div class="member-info">
				<p class="member-name"><em>${memberVo.userName }</em> 
					<span>
						<c:set var="birthYear" value="${fn:substring(memberVo.birth,0,2) }"/>
						<fmt:formatDate value="${currTime}" var="sysYear" pattern="yy" />
						<c:if test="${birthYear>sysYear }">
							19${birthYear }년 (${101+sysYear-birthYear }세) | 
							${memberVo.gender}
						</c:if>
						<c:if test="${birthYear<=sysYear }">
							20${birthYear }년 (${sysYear-birthYear+1 }세) | 
							${memberVo.gender}
						</c:if>
					</span>
				</p>
				<div class="photh"></div>	
				<br>
				<ul class="info-ul">
					<li style="float: left; margin-right: 45px;"><img class="icon" alt="이메일 아이콘" src="<c:url value='/resources/images/emailIcon.png'/>"> ${memberVo.email }</li>
					<li><img class="icon" alt="휴대혼 아이콘" src="<c:url value='/resources/images/hpIcon.png'/>"> ${memberVo.hp }</li>
					<li style="clear: both;"><img class="icon" alt="주소 아이콘" src="<c:url value='/resources/images/addressIcon.png'/>"> (${memberVo.zipcode })${memberVo.address }</li>
				</ul>
				<div class="add-info">
					<div class="add-info-div">
						<b>학력사항</b><br>
						<c:if test="${empty resumeAllVo.educationVo.uni }">
							${resumeAllVo.educationVo.finalEdu}
						</c:if>
						<c:if test="${!empty resumeAllVo.educationVo.uni }">
							${resumeAllVo.educationVo.uni }
						</c:if>
					</div>
					<div class="add-info-div">
						<b>경력사항</b><br>
						<c:if test="${resumeAllVo.careerVoList.size()==1 and resumeAllVo.careerVoList[0].careerCompany=='신입' }">
							신입
						</c:if>
						<c:if test="${resumeAllVo.careerVoList.size()!=1 or resumeAllVo.careerVoList[0].careerCompany!='신입'}">
						 	경력
						</c:if>
					</div>
					<div class="add-info-div">
						<b>희망연봉</b><br>
						${resumeAllVo.resumeVo.sal }
					</div>
					<div class="add-info-div">
						<b>희망 근무지</b><br>
						${resumeAllVo.resumeVo.location1 }<br>					
						${resumeAllVo.resumeVo.location2 }
					</div>
					<div class="add-info-div">
						<b>희망직종</b><br>
						${resumeAllVo.resumeVo.jobtype1 }<br>
						${resumeAllVo.resumeVo.jobtype2 }
					</div>
				</div>
			</div>
			<div class="section-part">
				<div class="area-title">
					<p><em>학력</em> <span>최종학력 | 
						<c:if test="${empty resumeAllVo.educationVo.uni }">
							${resumeAllVo.educationVo.finalEdu}
						</c:if>
						<c:if test="${!empty resumeAllVo.educationVo.uni }">
							${resumeAllVo.educationVo.uni }
						</c:if>
					</span></p>
				</div>
				<div class="part-table">
					<table>
						<caption style="display: none;">개인 학력</caption>
							<col width="19%">
							<col width="11%">
							<col width="34%">
							<col width="25%">
							<col width="11%">
						<colgroup>
						<thead>
							<tr>
								<th scope="col">재학기간</th>
								<th scope="col">구분</th>
								<th scope="col">학교명(소재지)</th>
								<th scope="col">전공</th>
								<th scope="col">학점</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:set var="eduPeriod" value="${fn:split(resumeAllVo.educationVo.eduPeriod,':') }"/>
								<c:set var="eduState" value="${fn:substring(eduPeriod[1],9,fn:length(eduPeriod[1])) }"/>
								<td>${fn:substring(eduPeriod[1],0,6) }
								~ ${eduPeriod[2] }</td>
								<td>${eduState }</td>
								<td>${resumeAllVo.educationVo.uniName }</td>
								<td>${resumeAllVo.educationVo.major }
								</td>
								<td>
									<c:if test="${!empty resumeAllVo.educationVo.eduScore }">
										${resumeAllVo.educationVo.eduScore }
									</c:if>
									<c:if test="${empty resumeAllVo.educationVo.eduScore }">
										-
									</c:if>							
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="section-part">
				<div class="area-title">
					<p><em>경력</em> <span> 
						<c:if test="${resumeAllVo.careerVoList.size()==1 and resumeAllVo.careerVoList[0].careerCompany=='신입' }">
							신입
						</c:if>
					</span></p>
				</div>
				<div class="part-table">
					<table>
						<caption style="display: none;">경력</caption>
							<col width="16%">
							<col width="9%">
							<col width="28%">
							<col width="20%">
							<col width="17%">
							<col width="10%">
						<colgroup>
						<c:if test="${resumeAllVo.careerVoList.size()==1 and resumeAllVo.careerVoList[0].careerCompany=='신입' }">
							<div style="border: 1px solid #666;"></div>
						</c:if>
						<c:if test="${resumeAllVo.careerVoList.size()!=1 or resumeAllVo.careerVoList[0].careerCompany!='신입'}">
								<thead>
									<tr>
										<th scope="col">재직기간</th>
										<th scope="col">구분</th>
										<th scope="col">회사명</th>
										<th scope="col">직급/직책/연차</th>
										<th scope="col">담당업무</th>
										<th scope="col">연봉</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="careerVo" items="${resumeAllVo.careerVoList }">
										<tr>
											<c:set var="careerPeriod" value="${fn:split(careerVo.careerPeriod,':') }"/>
											<td>${fn:substring(careerPeriod[1],0,6) }
											~ ${careerPeriod[2] }</td>
											<td>${careerPeriod[0] }</td>
											<td>${careerVo.careerCompany }</td>
											<td>${careerVo.careerRank }/${careerVo.careerYear }년</td>
											<td>
												${careerVo.task }			
											</td>
											<td>
												${careerVo.careerSal }
											</td>
										</tr>
									</c:forEach>
								</tbody>
						</c:if>
					</table>
				</div>
			</div>
			<c:if test="${!empty resumeAllVo.activeVoList }">
				<div class="section-part">
					<div class="area-title">
						<p><em>대외활동</em></p>
					</div>
					<div class="part-table">
						<table>
							<caption style="display: none;">대외 활동</caption>
								<col width="19%">
								<col width="11%">
								<col width="20%">
								<col width="50%">
							<colgroup>
							<thead>
								<tr>
									<th scope="col">활동기간</th>
									<th scope="col">활동구분</th>
									<th scope="col">기관/장소</th>
									<th scope="col">활동내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="activeVo" items="${resumeAllVo.activeVoList }">
									<tr>
										<td>${fn:substring(activeVo.actPeriod,0,6) }
										~ ${fn:substring(activeVo.actPeriod,9,15) }</td>
										<td>${activeVo.activity }</td>
										<td>${activeVo.actPlace}</td>
										<td>${activeVo.actContent }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty resumeAllVo.certifyVoList }">
				<div class="section-part">
					<div class="area-title">
						<p><em>자격증</em></p>
					</div>
					<div class="part-table">
						<table>
							<caption style="display: none;">자격증</caption>
								<col width="24%">
								<col width="41%">
								<col width="35%">
							<colgroup>
							<thead>
								<tr>
									<th scope="col">취득일</th>
									<th scope="col">자격증명</th>
									<th scope="col">발행처/기관</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="certifyVo" items="${resumeAllVo.certifyVoList }">
									<tr>
										<td>${certifyVo.certifyGetDate }</td>
										<td>${certifyVo.certifyName }</td>
										<td>${certifyVo.certifyPlace}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty resumeAllVo.languageVoList }">
				<div class="section-part">
					<div class="area-title">
						<p><em>어학</em></p>
					</div>
					<div class="part-table">
						<table>
							<caption style="display: none;">어학</caption>
								<col width="21%">
								<col width="14%">
								<col width="37%">
								<col width="28%">
							<colgroup>
							<thead>
								<tr>
									<th scope="col">취득일</th>
									<th scope="col">언어</th>
									<th scope="col">시험종류</th>
									<th scope="col">점수/급수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="languageVo" items="${resumeAllVo.languageVoList }">
									<tr>
										<td>${languageVo.langGetDate }</td>
										<td>${languageVo.kinds }</td>
										<td>${languageVo.testName}</td>
										<td>${languageVo.langScore}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty resumeAllVo.awardVoList }">
				<div class="section-part">
					<div class="area-title">
						<p><em>수상내역/공모전</em></p>
					</div>
					<div class="part-table">
						<table>
							<caption style="display: none;">수상내역/공모전</caption>
								<col width="24%">
								<col width="41%">
								<col width="35%">
							<colgroup>
							<thead>
								<tr>
									<th scope="col">수상/공모일</th>
									<th scope="col">수상명</th>
									<th scope="col">수여기관</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="awardVo" items="${resumeAllVo.awardVoList }">
									<tr>
										<td>${awardVo.awardGetDate }</td>
										<td>${awardVo.awardName }</td>
										<td>${awardVo.awardCom}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty addInfoVo.awardVoList }">
				<div class="section-part">
					<div class="area-title">
						<p><em>취업 우대사항</em></p>
					</div>
					<div class="part-table">
						<table>
							<caption style="display: none;">취업 우대사항</caption>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">
							<colgroup>
							<thead>
								<tr>
									<th scope="col">장애여부</th>
									<th scope="col">보훈대상</th>
									<th scope="col">병역대상</th>
									<th scope="col">고용지원금 대상</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="addInfo" items="${resumeAllVo.addInfoVoList }">
									<tr>
										<td>${addInfo.disable }</td>
										<td>${addInfo.affair }</td>
										<td>${addInfo.military}</td>
										<td>${addInfo.sFund}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty resumeAllVo.potfolioVo }">
				<div class="section-part">
					<div class="area-title">
						<p><em>포트폴리오</em></p>
					</div>
					<div class="part-table">
						<table>
							<caption style="display: none;">포트폴리오</caption>
								<col width="19%">
								<col width="16%">
								<col width="10%">
								<col width="55%">
							<colgroup>
							<thead>
								<tr>
									<th scope="col">작업기간</th>
									<th scope="col">작업툴</th>
									<th scope="col">작업인원</th>
									<th scope="col">작품소개</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td>${fn:substring(resumeAllVo.potfolioVo.potPeriod,0,6) }
										~ ${fn:substring(resumeAllVo.potfolioVo.potPeriod,9,15) }</td>
										<td>${resumeAllVo.potfolioVo.potTools }</td>
										<td>${resumeAllVo.potfolioVo.workers}</td>
										<td>${resumeAllVo.potfolioVo.intro }</td>
									</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<div class="section-part">
				<div class="area-title">
					<p><em>자기소개서</em></p>
				</div>
				<div class="self-int">
					<c:if test="${resumeAllVo.resumeVo.selfInt != ''}">
						 ${fn:replace(resumeAllVo.resumeVo.selfInt, crcn, br)}
					</c:if>
					<c:if test="${resumeAllVo.resumeVo.selfInt == ''}">
						내용이 없습니다.
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</head>
</html>
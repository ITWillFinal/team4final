<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/comMypageTop.jsp"%>
<jsp:useBean id="today" class="java.util.Date"/>
<!-- CSS here -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">

<style>
	#upDiv{
		margin: 90px 0;
	}
	#scrapListDiv{
		margin: 0 auto;
		width: 48%;
		
	}
	
	#listOne{
		border: 1px solid #e0e0e08f;
		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
	}
	.deleteInfo{
		font-size: x-small;
		color: red;
	}
</style>
<div id="upDiv">
	<div id="scrapListDiv">
		<c:if test="${!empty list }">
			<h3 style="margin: 40px;">채용 공고&nbsp;&nbsp; <span class="deleteInfo">(삭제는 수정에서 가능합니다)</span> </h3>
			<c:forEach var="vo" items="${list }">
				<fmt:parseDate var="end" value="${vo.endDate }" pattern="yyyy-MM-dd"></fmt:parseDate>
				<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
				<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
				
				<div class="single-job-items mb-30" id="listOne">
					<div class="job-items">
						<div class="job-tittle">
						<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>"><h4>${vo.title }</h4></a>
							<ul>
								<li>${vo.comName }</li>
								<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
								<li>${vo.pay }(연봉)</li>
							</ul>
						</div>
					</div>
					<c:if test="${endDate-startDate+1 > 0}">
					<div class="items-link f-right">
						<a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정</a>
						<span>채용 공고 마감까지 D - ${endDate-startDate+1 }일</span>
					</div>
					</c:if>
					<c:if test="${endDate-startDate+1 == 0}">
						<div class="items-link f-right">
							<a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정</a>
							<span>오늘 채용 공고 마감!</span>
						</div>
					</c:if>
					<c:if test="${endDate-startDate+1 < 0}">
						<div class="items-link f-right">
							<a style="background: #7b7b7bbf;border: 1px solid #7b7b7bbf;">채용 공고 마감</a>
							<span>채용 공고가 마감되었습니다.</span>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<%@ include file="../../inc/companyBottom.jsp"%>
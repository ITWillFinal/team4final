<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mypageTop.jsp" %>
<jsp:useBean id="today" class="java.util.Date"/>
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
</style>
<div id="upDiv">
	<div id="scrapListDiv">
		<c:if test="${!empty list }">
			<h3 style="margin: 40px;">내가 스크랩한 공고</h3>
			<c:forEach var="vo" items="${list }">
				<fmt:parseDate var="end" value="${vo.endDate}" pattern="yy/MM/dd" />
				<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
				<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>

				<div class="single-job-items mb-30" id="listOne">
					<div class="job-items">
						<div class="job-tittle">
							<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>"><h4>${vo.title }</h4></a>
							<ul>
								<li>${vo.comName }</li>
								<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
								<li>${vo.pay }</li>
							</ul>
						</div>
					</div>
					<c:if test="${endDate-startDate+1 > 0}">
						<div class="items-link f-right">
							<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>">${vo.recType }</a>
							<span>지원마감까지 D - ${endDate-startDate+1 }일</span>
						</div>
					</c:if>
					<c:if test="${endDate-startDate+1 == 0}">
						<div class="items-link f-right">
							<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>">${vo.recType }</a>
							<span>오늘 지원 마감!</span>
						</div>
					</c:if>
					<c:if test="${endDate-startDate+1 < 0}">
						<div class="items-link f-right">
							<a style="background: #7b7b7bbf;border: 1px solid #7b7b7bbf;">지원마감</a>
							<span>지원이 마감되었습니다.</span>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
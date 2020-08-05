<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mypageTop.jsp" %>
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
				<div class="single-job-items mb-30" id="listOne">
					<div class="job-items">
						<div class="job-tittle">
							<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>"><h4>${vo.title }</h4></a>
							<ul>
								<li>${vo.comName }</li>
								<li><i class="fas fa-map-marker-alt"></i>${vo.jobType2 }</li>
								<li>${vo.pay }</li>
							</ul>
						</div>
					</div>
					<div class="items-link f-right">
						<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>">${vo.recType }</a>
						<span><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></span>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
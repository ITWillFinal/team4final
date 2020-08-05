<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mypageTop.jsp" %>
<div>
	<c:if test="${!empty list }">
		<c:forEach var="vo" items="${list }">
			<div class="single-job-items mb-30">
				<div class="job-items">
					<div class="job-tittle">
						<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${map["RECRUITMENT_CODE"] }'/>"><h4>${map["TITLE"] }</h4></a>
						<ul>
							<li>${map["COM_NAME"] }</li>
							<li><i class="fas fa-map-marker-alt"></i>${map["JOB_TYPE2"] }</li>
							<li>${map["PAY"] }</li>
						</ul>
					</div>
				</div>
				<div class="items-link f-right">
					<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${map["RECRUITMENT_CODE"] }'/>">${map["REC_TYPE"] }</a>
					<span><fmt:formatDate value="${map['REGDATE'] }" pattern="yyyy-MM-dd"/></span>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
<%@ include file="../inc/bottom.jsp" %>
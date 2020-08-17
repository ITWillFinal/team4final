<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<jsp:useBean id="today" class="java.util.Date"/>
<style>
	#hot100Div{
		width: 1055px;
	    /* margin: 0 auto; */
	}
	#totalDiv{
		margin-bottom: 60px;
	}
</style>
<%@ include file="../inc/sidebar.jsp"%>
<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
	<div id="totalDiv">
		<div id="hot100Div">
			<p style="font-weight: bold;font-size: xx-large;color: #010b1d; margin-top: 26px;display: inline-block;">실시간 HOT100&nbsp;</p>
			<span style="color: #939596; font-size: 0.8em;">&nbsp;&nbsp;&nbsp; *조회수 기준으로 직무와 관계없이 조회됩니다.</span>
			<hr style="border: 1px solid #fb246a;margin: 15px 0 30px 0;">
			<c:if test="${!empty list }">
				<c:set var="num" value="1" property="int"/>
				<c:forEach var="vo" items="${list }">
					<fmt:parseDate var="end" value="${vo.endDate}" pattern="yy/MM/dd" />
					<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
					<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
					
					<div class="single-job-items mb-30" id="listOne">
						<div class="job-items">
							<div class="job-tittle">
								<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>"><h4>${num}　 ${vo.title }</h4></a>
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
					</div>
					<c:set var="num" value="${num + 1 }" property="int"/>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
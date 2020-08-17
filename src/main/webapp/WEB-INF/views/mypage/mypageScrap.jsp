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
	
	h1{
		height: 100px;
	}

h1 span {
  position: relative;
  top: 20px;
  display: inline-block;
  animation: bounce .3s ease infinite alternate;
  font-family: 'Titan One', cursive;
  font-size: 80px;
  color: black;
  text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px rgba(0, 0, 0, .4);
}

h1 span:nth-child(2) { animation-delay: .1s; }
h1 span:nth-child(3) { animation-delay: .2s; }
h1 span:nth-child(4) { animation-delay: .3s; }
h1 span:nth-child(5) { animation-delay: .4s; }
h1 span:nth-child(6) { animation-delay: .5s; }
h1 span:nth-child(7) { animation-delay: .6s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #CCC,
                 0 2px 0 #CCC,
                 0 3px 0 #CCC,
                 0 4px 0 #CCC,
                 0 5px 0 #CCC,
                 0 6px 0 #CCC,
                 0 7px 0 #CCC,
                 0 8px 0 #CCC,
                 0 9px 0 #CCC,
                 0 50px 25px rgba(0, 0, 0, .2);
  }
}
</style>
<div id="upDiv" style="min-height: 800px;">
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
		<c:if test="${empty list }">
			<div class="applyEmpty">
				<h3 style="margin: 40px; padding-bottom: 67px;">스크랩하신 공고가 없습니다.</h3>
				<a href="<c:url value='/hireinpo/hot100.do' />">
					<h1 style="margin-left: 33px;">
					  <span>채</span>
					  <span>용</span>
					  <span>공</span>
					  <span>고</span>
					  <span>보</span>
					  <span>기</span>
					  <span>!</span>
					</h1>						
				</a>
			</div>
		</c:if>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
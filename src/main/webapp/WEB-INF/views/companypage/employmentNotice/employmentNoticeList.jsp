<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/comMypageTop.jsp"%>
<jsp:useBean id="today" class="java.util.Date"/>
<!-- CSS here -->

<style>
	#upDiv{
		margin-bottom: 30px;
	}
	#scrapListDiv{
		margin: 0 auto;
		width: 1055px;
		min-height: 800px;
		
	}
	
	#listOne{
		border: 1px solid #e0e0e08f;
		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
	}
	.deleteInfo{
		font-size: x-small;
		color: red;
	}
	.noList{
		text-align: center;
		height: 220px;
		margin-top: 140px;
	}
	.items-link{
		float: left;
		padding-right: 0px;
	
	}
</style>
<script type="text/javascript">
	$(function(){
		/* 서비스 연장 */
		$('.extendPeriod').click(function(){
			var recruitmentCode = $('.extendPeriod_recruitmentCode').val();
			var con = confirm("기간 연장하시겠습니까?");
			if(con){
				window.open(
					"<c:url value='/payment/extendPeriod.do?recruitmentCode="+recruitmentCode+"'/>", 'extendPeriod',
					'width=800,height=612,location=no, scrollbars=1, toolbars=no, menubar=no,left=500px,top=100');
			}else{
				return false;
			}
		});
		
	});

</script>
<!-- list 값이 없으면 -->
<c:if test="${empty list }">
	<div class="noList">
		<span> 현재 진행 중인 채용정보 없습니다.</span>
		<br><br>
		<a href="<c:url value='/companypage/companyWrite.do'/> " >채용 공고 등록하러 가시겠습니까?</a>
	</div>

</c:if>



<!-- list 값이 있으면 -->
<div id="upDiv">
	<div id="scrapListDiv">
			<h1 style="background: white;font-weight: bold;">채용공고<span class="deleteInfo" style="margin-left: 10px;font-size: small;">(삭제는 수정에서 가능합니다)</span></h1>
				<hr style="border: 1px solid #fb246a;margin: 30px 0;">
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">
				<fmt:parseDate var="end" value="${vo.endDate }" pattern="yy/MM/dd"></fmt:parseDate>
				<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
				<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
				
				<div class="single-job-items mb-30" id="listOne">
					<div class="job-items">
						<div class="job-tittle">
						<h4>${vo.title }</h4>
							<ul>
								<li>${vo.comName }</li>
								<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
								<li>${vo.pay }(연봉)</li>
							</ul>
						</div>
					</div>
					<c:if test="${endDate-startDate+1 > 0}">
					<div class="items-link ">
						<a style="margin-bottom: 3px;" href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정</a>
						<c:if test="${empty vo.endDate }">
							<a href="<c:url value='/companypage/companyWritePeriod.do?recruitmentCode=${vo.recruitmentCode }'/>">서비스 결제</a>
						</c:if>
						<c:if test="${!empty vo.endDate }">
							<a class="extendPeriod" href="#">기간연장</a>
							<input type="hidden" value="${vo.recruitmentCode }" class="extendPeriod_recruitmentCode">
							<span>채용 공고 마감까지 D - ${endDate-startDate+1 }일</span>
						</c:if>
						
					</div>
					</c:if>
					<c:if test="${endDate-startDate+1 == 0}">
						<div class="items-link ">
							<a style="margin-bottom: 3px;" href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정</a>
							<c:if test="${empty vo.endDate }">
								<a href="<c:url value='/companypage/companyWritePeriod.do?recruitmentCode=${vo.recruitmentCode }'/>">서비스 결제</a>
							</c:if>
							<c:if test="${!empty vo.endDate }">
								<a class="extendPeriod" href="#">기간연장</a>
								<span>오늘 채용 공고 마감!</span>
							</c:if>
							
						</div>
					</c:if>
					<c:if test="${endDate-startDate+1 < 0}">
						<div class="items-link ">
							<c:if test="${empty vo.endDate }">
								<a style="margin-bottom: 3px;" href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정</a>
								<a href="<c:url value='/companypage/companyWritePeriod.do?recruitmentCode=${vo.recruitmentCode }'/>">서비스 결제</a>
							</c:if>
							<c:if test="${!empty vo.endDate }">
								<a style="margin-bottom: 3px;" href="#" class="" >공고마감</a>
								<a style="margin-bottom: 3px;" href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정</a>
								<a class="extendPeriod" href="#">기간연장</a>
								<span>채용 공고가 마감되었습니다.</span>
							</c:if>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<%@ include file="../../inc/companyBottom.jsp"%>
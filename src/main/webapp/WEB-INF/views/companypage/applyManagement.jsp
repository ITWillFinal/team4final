<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/comMypageTop.jsp" %>
<script type="text/javascript">
	
	$(function(){
		$('.checkAll').change(function(){
			if($(this).is(':checked')){
				$(this).parent().parent().parent().parent().find('.checkMember').prop('checked', true); 
			}else{
				$(this).parent().parent().parent().parent().find('.checkMember').prop('checked', false); 				
			}
		});
		
		$('.checkMember').change(function(){
			if(!$(this).is(':checked')){
				$('.checkAll').prop('checked', false); 
			}
		});
		$('#button1').click(function(){
			var len=$(this).parent().parent().find('.checkMember:checked').length;
			if(len==0){
				alert('요청취소 할 이력서를 체크해주세요');
				return;
			}
			var resumeNoListforDel=[];
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					resumeNoListforDel.push($(this).val());					
				}
			});
			
			$.ajax({
				url:"<c:url value='/companypage/requestDelete.do'/>",
				type:"get",
				data: "resumeNoListforDel="+resumeNoListforDel,
				success:function(res){
					alert(res);
					
					
				},
				error:function(xhr, status, error){
					alert(status+","+error );
					return;
				}
			});
			
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					$(this).parent().parent().remove();
				}						
			});
		});

		$('#button2').click(function(){
			var len=$(this).parent().parent().find('.checkMember:checked').length;
			if(len==0){
				alert('처리완료 할 이력서를 체크해주세요');
				return;
			}
			var resumeNoListforJoin=[];
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					resumeNoListforJoin.push($(this).val());					
				}
			});
			
			$.ajax({
				url:"<c:url value='/companypage/yesToJoin.do'/>",
				type:"get",
				data: "resumeNoListforJoin="+resumeNoListforJoin,
				success:function(res){
					alert(res);
					
				},
				error:function(xhr, status, error){
					alert(status+","+error );
					return;
				}
			});
			
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					$(this).parent().parent().remove();
				}						
			});
		});
	
	})
		
	function open_resume(resumeNo){
		window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
				'RESUME','width=980,height=auto,left=0,top=0,location=yes,resizable=false')
	}

</script>
<style type="text/css">
	a{
		color:black;
		font-weight: bold;
	}

	.ST-main{
		width: 1000px;
		height: auto;
		padding: 15px;
	}

</style>
<main>
	<%@ include file="../inc/companySidebar.jsp"%>
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->		
		<div class="ST-main">
				<c:set var="check" value="0"/>
	<div id="upDiv">
		<div id="scrapListDiv">
			<h3 style="margin: 40px;">현재 진행중인 채용공고</h3>
			<c:if test="${!empty comRecuritListVo}">
				<c:forEach var="vo" items="${comRecuritListVo }">
					<fmt:parseDate var="end" value="${vo.endDate}" pattern="yy/MM/dd" />
					<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
					<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
					<c:if test="${endDate-startDate+1 >= 0}">
						<c:set var="check" value="${check + 1 }"/>
						<div class="single-job-items mb-30" id="listOne">
							
							<div class="job-items">
								<div class="job-tittle">
									<h4><a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">${vo.title }</a></h4>
									<ul>
										<li>${vo.comName }</li>
										<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
										<li>${vo.pay }</li>
									</ul>
								</div>
							</div>
							<c:if test="${endDate-startDate+1 > 0}">
								<div class="items-link f-right">
									<a style="margin-bottom: 3px;" href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정 및 삭제</a>
									<a class="extendPeriod" href="#">기간연장</a>
									<input type="hidden" value="${vo.recruitmentCode }" class="extendPeriod_recruitmentCode">
									<span>지원마감까지 D - ${endDate-startDate+1 }일</span>
								</div>
							</c:if>
							<c:if test="${endDate-startDate+1 == 0}">
								<div class="items-link f-right">
									<a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정 및 삭제</a>
									<span>오늘 지원 마감!</span>
								</div>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${check == 0}">
				<div class="single-job-items mb-30" id="listOne">
					<h4>현재 진행중인 채용공고가 없습니다.</h4>
				</div>
			</c:if>
		</div>
	</div>

		</div>
		<!-- 사이드바이용에필요함 맨밑에 div -->
		</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

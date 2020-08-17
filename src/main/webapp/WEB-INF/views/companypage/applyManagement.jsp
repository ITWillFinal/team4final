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

	function open_applyList(recruitmentCode){
		window.open("<c:url value='/companypage/applyList.do?recruitmentCode="+recruitmentCode+"'/>",
				'applyList','width=300,height=auto,left=0,top=0,location=yes,resizable=false')
	}

</script>
<style type="text/css">
	job-tittle a{
		color:black;
		font-weight: bold;
		
	}

	.AM-main{
	min-height:800px;
		width: 1055px;
    height: auto;
    /* padding: 15px; */
    margin: 0 auto;
	}

	#listOne {
	height: 194px;
    	border: 1px solid #e0e0e08f;
    	box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
	}
</style>
<main>
	
		<div class="AM-main">
		<div class="AM-top">
			<h1 style="background: white;font-weight: bold;">지원자관리</h1>
				<hr style="border: 1px solid #fb246a;margin: 30px 0;">
		</div>
	<c:set var="check" value="0"/>
	<div id="upDiv">
		<div id="scrapListDiv">
			<c:if test="${!empty comRecuritListVo}">
				<c:forEach var="vo" items="${comRecuritListVo }">
					<c:set var="check" value="${check + 1 }"/>
					<div class="single-job-items mb-30" id="listOne">
						
						<div class="job-items">
							<div class="job-tittle">
								<h4><a onclick="open_applyList(${vo.recruitmentCode})" style="cursor: pointer;">${vo.title }</a></h4>
								<ul>
									<li>${vo.comName }</li>
									<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
									<li>${vo.pay }</li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty comRecuritListVo}">
				<h3 style="padding: 5px">등록된 채용공고가 없습니다.</h3>
			</c:if>
		</div>
	</div>

		</div>

</main>
<%@ include file="../inc/companyBottom.jsp"%>

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
	a{
		color:black;
		font-weight: bold;
	}

	.AM-main{
		width: 1000px;
		height: auto;
		padding: 15px;
		margin: auto;
	}

	.AM-top{
		border-bottom: 3px solid #fd5a77;
    	margin-bottom: 20px;
	}
</style>
<main>
	
		<div class="AM-main">
		<div class="AM-top">
			<h1 style="font-weight: bold;">지원자 관리</h1>
		</div>
	<c:set var="check" value="0"/>
	<div id="upDiv">
		<div id="scrapListDiv">
			<h3 style="margin: 40px;">현재 진행중인 채용공고</h3>
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
		</div>
	</div>

		</div>

</main>
<%@ include file="../inc/companyBottom.jsp"%>

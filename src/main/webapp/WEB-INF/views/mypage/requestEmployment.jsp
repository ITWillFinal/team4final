<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mypageTop.jsp" %>


<script type="text/javascript">
	$(function() {
		$('.yes').click(function(){
			var $remove = $(this).parent();
			if(confirm("입사를 희망하시겠습니까? 희망 의사는 기업에게 전달되며 수정할 수 없습니다.")){
				$.ajax({
					url:"<c:url value='/companypage/requestHope.do'/>",
					type:"get",
					data:"cMemberCode="+$(this).parent().find('.cmc').val()+"&resumeNo="+$(this).parent().find('.rn').val(),
					success:function(res){
						var result="입사희망 요청에 실패하였습니다.";
						if(res="변경에 되었습니다."){
							$remove.remove();
							if(Number($('.requestCount').text())-1==0){
								$('.requestCount').parent().remove();
								$('.re-main').append('<h3 style="color: #8490a5;">입사 요청사항이 없습니다.</h3>');
								
							}else{
								$('.requestCount').text(Number($('.requestCount').text())-1);								
							}
							result="입사희망 요청하였습니다.";
						}
						alert(result);
					},
					error:function(xhr, status, error){
						alert(status+","+error );
					}
				});
			}
		});

		$('.no').click(function(){
			var $remove = $(this).parent();
			if(confirm("입사를 거절하시겠습니까? 거절 의사는 기업에게 전달되며 수정할 수 없습니다.")){
				$.ajax({
					url:"<c:url value='/companypage/requestNo.do'/>",
					type:"get",
					data:"cMemberCode="+$(this).parent().find('.cmc').val()+"&resumeNo="+$(this).parent().find('.rn').val(),
					success:function(res){
						var result="입사거절 요청에 실패하였습니다.";
						if(res="변경에 되었습니다."){
							$remove.remove();	
							if(Number($('.requestCount').text())-1==0){
								$('.requestCount').parent().remove();
								$('.re-main').append('<h3 style="color: #8490a5;">입사 요청사항이 없습니다.</h3>');
								
							}else{
								$('.requestCount').text(Number($('.requestCount').text())-1);								
							}
							result="입사거절 요청하였습니다.";
						}
						alert(result);
					},
					error:function(xhr, status, error){
						alert(status+","+error );
					}
				});
			}
		});
		
	});
	
	function open_resume(resumeNo){
		window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
				'RESUME','width=980,height=auto,left=0,top=0,location=yes,resizable=false')
	}
</script>
<style>
	.re-main{
		border: 1px solid #e0e0e08f;
		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		width: 100%;
		height: auto;
		margin: 30px auto;
		padding: 30px;
	}
	
	.perscrap{
		background: #f7f7f7;
	    height: 50px;
	    padding: 10px;
	    font-weight: bold;
	}

	a{
		cursor: pointer;
	}

	.a-bt{
		float:right;
	 	text-align: center; 
	 	width:100px;
	 	font-weight: bold;
	 	margin: 0 5px;;
	 	color: white;
	 	display:inline-block;
	 	height:30px;
	 	background: #fb246a;
	 	padding: 5px;
	}
	
	.resumeTitle{
		overflow: hidden;
	    color: #fb246a;
	    height: 23px;
	    width: 210px;
	    display: inline-block;
	    font-size: large;
	}
</style>
<div style="width: 900px;margin: 50px auto; min-height: 800px;">
<h1>입사 요청</h1>
<div class="re-main">
	<c:if test="${empty perList }">
		<h3 style="color: #8490a5;">입사 요청사항이 없습니다.</h3>
	</c:if>
	<c:if test="${!empty perList }">
		<p>대기중인 입사요청이 <b class="requestCount" style="color: #fb246a">${perList.size() }</b>건 있습니다.</p>
	</c:if>
	<div>
		<ul>
		<c:forEach var="perscrap" items="${perList }">
			<li class="perscrap">
			<input type="hidden" class="cmc" value="${perscrap['C_MEMBER_CODE'] }">
			<input type="hidden" class="rn" value="${perscrap['RESUME_NO'] }">
			<a style="color: #fb246a;font-size: large;">${perscrap['COM_NAME'] }</a>
			에서<a class="resumeTitle" style="color: #fb246a;font-size: large;" onclick="open_resume(${perscrap['RESUME_NO']})">
			<c:if test="${empty perscrap['SELF_INT_TITLE'] }">
				no title
			</c:if>
			<c:if test="${!empty perscrap['SELF_INT_TITLE'] }">
				${perscrap['SELF_INT_TITLE'] }
			</c:if>
			</a>이력서에 대해 입사요청을 했습니다.
				<a class="a-bt no" style="color: white;">입사거절</a><a class="a-bt yes" style="color: white;">입사희망</a></li>
		</c:forEach>
		</ul>
	</div>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
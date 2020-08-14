	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp" %>
<script src="<c:url value='/resources/js/html2canvas.js'/>"></script>
<script src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<style type="text/css">
	*{
		box-sizing: border-box;
	}
	
	.applyMain{
		width: 1020px;
		margin: 0 auto;
		background: #f7f7f79e;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		padding: 50px; 
		margin-bottom: 70px;
		margin-top: 50px;
	}
	
	.apply-bt a{
	 	text-align: center; 
	 	margin: 0 auto;
	 	width: 900px;
	 	font-weight: bold;
	 	display: block;
	 	margin: 10px auto;
	}
</style>
<script type="text/javascript">

</script>
	<div class="applyMain">
		<h1>입사 지원이 완료되었습니다!</h1>
		
		<div class="apply-bt">
			<a href="<c:url value='/member/currentApply.do'/>" class="btn head-btn2">입사 지원 확인하기</a>
		</div>
		<div class="apply-bt">
			<a href="<c:url value='#'/>" class="btn head-btn2">목록으로</a>
		</div>
	</div>
<%@ include file="../inc/bottom.jsp" %>
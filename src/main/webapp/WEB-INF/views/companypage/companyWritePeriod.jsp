<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>

 
<script>
document.getElementById('now_date').valueAsDate = new Date();
</script>




<style>
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
	
	.sel{
		width:150px;
		display: inline-block;
	}
</style>
	
<script type="text/javascript">
	$(function(){
		$("#radioResumeTJ").click(function(){
			$("#resumeType").val($("#radioResumeTJ").val());
		});
			
		$("#radioResumeCom").click(function(){
			$("#resumeType").val($("#radioResumeCom").val());
		});		
		
		$("#radioPeriodMonth").click(function(){
			$("#datePick").attr('disabled', true);
		});
		
		$("#radioPeriodDate").click(function(){
			$("#datePick").attr('disabled', false);
		});
		
		var productName = "";
		$("#radioPeriodMonth").click(function(){
			productName = $("#radioPeriodMonth").val();
			$("#productName").val(productName);
		});
		
		$("#radioPeriodDate").click(function(){
			productName = $("#radioPeriodDate").val();
			$("#productName").val(productName);
		});
		
		var date = "";
		$("#datePick").click(function(){
			date = $("#datePick").val();
			$("#endDate").val(date);
		});
		
		$("#datePick").change(function(){
			date = $("#datePick").val();
			$("#endDate").val(date);
		});
		
	});//function
	
	
</script>


<main>
	<%@ include file="../inc/companySidebar.jsp" %>

	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<form name="frmWrite" method="post" action="<c:url value='/companypage/companyWritePeriod.do'/>">
			<span style="font-size: 25px; font-weight: bold;">채용정보등록 - 기간설정</span>
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎지원방법</span><br><br>

			<input type="radio" name="radioResume" id="radioResumeTJ" value="더잡 이력서"> 더잡 이력서<br>
			<input type="radio" name="radioResume" id="radioResumeCom" value="자사 이력서"> 자사 이력서<br>
			
			<div id="radioResumeDiv"></div>			
			<input type="text" name="resumeType" id="resumeType">
			
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎모집기간</span><br><br>
			<span>모집기간을 선택하세요</span><br><br>
			<input type="radio" name="radioPeriod" id="radioPeriodMonth" value="month"> 상시채용 또는 채용시까지 : 결제일로 부터 1달 이용가능<br>
			<input type="radio" name="radioPeriod" id="radioPeriodDate" value="date"> 날짜지정 : 결제일로부터 지정일 까지 이용가능
					
			<input type="date" name="datePick" id="datePick" disabled>
			
			<input type="date" id="now_date"> // 여기서 중요한건 input type을 date로 해줘야합니다.
			
			<br>
			<input type="submit" value="결제하기"><br>
			상품명<input type="text" name="productName" id="productName"><br>
			끝나는날<input type="text" name="endDate" id="endDate"><br>
			기업정보코드<input type="text" name="comCode" id="comCode">
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
	
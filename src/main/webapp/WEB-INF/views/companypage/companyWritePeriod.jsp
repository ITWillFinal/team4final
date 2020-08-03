<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>
<<<<<<< HEAD
=======

 
<script>
document.getElementById('now_date').valueAsDate = new Date();
</script>


<<<<<<< HEAD
=======


>>>>>>> master
>>>>>>> 46972ea06982451532a9e9de09173f8692a476f7
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
<<<<<<< HEAD
		/* $("#radioPeriodMonth").click(function(){
=======
		$("#radioResumeTJ").click(function(){
			$("#resumeType").val($("#radioResumeTJ").val());
		});
			
		$("#radioResumeCom").click(function(){
			$("#resumeType").val($("#radioResumeCom").val());
		});		
		
		$("#radioPeriodMonth").click(function(){
>>>>>>> 46972ea06982451532a9e9de09173f8692a476f7
			$("#datePick").attr('disabled', true);
		});
		*/
		/* 시작날짜 보여주기 */	
		function getToday(){
			var date = new Date();
		    var day = date.getDate();
		    var month = date.getMonth() + 1;
		    var year = date.getFullYear();

		    if (month < 10) month = "0" + month;
		    if (day < 10) day = "0" + day;

		    var today = year + "-" + month + "-" + day;       
		    $(".startDay").attr("value", today);
		   
		}
		getToday()
		
		
		function getMonth(){
			var date = new Date();
		    var day = date.getDate();
		    var month = date.getMonth() + 2;
		    var year = date.getFullYear();

		    if (month < 10) month = "0" + month;
		    if (day < 10) day = "0" + day;

		    var month = year + "-" + month + "-" + day;      
		    $('#monthEnd').attr("value", month);
		}
		getMonth()
		
		$("#radioPeriodMonth").click(function(){
			var productName = $("#radioPeriodMonth").val()
			$("#productName").val(productName);
			
			var priceForMonth =45000;
			$("#price").val(priceForMonth);
		}); 
		$("#radioPeriodDate").click(function(){
			var productName = $("#radioPeriodDate").val()
			$("#productName").val(productName);
			$("#datePick").attr('disabled', false);
		});
		
<<<<<<< HEAD
		/* 현재 날짜 전은 못 구하게 하기 */
		$('#datePick').change(function(){
			var startDate = $('input[name=startDay]').val();
	        var startDateArr = startDate.split('-');
	        var endDate = $('input[name=endDay]').val(); 
	        //alert(endDate);
	        var endDateArr = endDate.split('-');
	        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
	        //alert(startDateCompare);
	        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
	         
	        if(startDateCompare.getTime() > endDateCompare.getTime()) {
	            alert("시작날짜와 종료날짜를 확인해 주세요.");
	            $('#price').val("");
	            $('#datePick').val("");
	            return;
	        }
	        
	        /* 가격 구하기 */
	        var cDay = 24 * 60 * 60 * 1000;
	       	var dif = parseInt((endDateCompare - startDateCompare)/cDay);
	       	$('#price').val(dif * 1000);
		});
		
		/* resumeType */
		$('input[name=radioResumeType]').click(function(){
			var val =$(this).val();
			$('#resumeType').val(val);
=======
		var productName = "";
		$("#radioPeriodMonth").click(function(){
			productName = $("#radioPeriodMonth").val();
			$("#productName").val(productName);
>>>>>>> 46972ea06982451532a9e9de09173f8692a476f7
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
<<<<<<< HEAD
		<form name="frmPeriod" method="post" action="<c:url value='/companyWritePeriod/payment.do'/>">
=======
		<form name="frmWrite" method="post" action="<c:url value='/companypage/companyWritePeriod.do'/>">
>>>>>>> 46972ea06982451532a9e9de09173f8692a476f7
			<span style="font-size: 25px; font-weight: bold;">채용정보등록 - 기간설정</span>
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎지원방법</span><br><br>

<<<<<<< HEAD
			<input type="radio" name="radioResumeType" id="radioResumeTheJob" value="0"> 더잡 이력서<br>
			<input type="radio" name="radioResumeType" id="radioResumeCompany" value="1"> 자사 이력서<br>
			
			<div id="radioResumeDiv"></div>			
			<input type="date" id="theDate">
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎모집기간</span><br><br>
			<span>모집기간을 선택하세요</span><br><br>
			<input type="radio" name="period" id="radioPeriodMonth" value="month"> 상시채용 또는 채용시까지 : 결제일로 부터 1달 이용가능
			<input type="date" name="monthStart" class="startDay" readonly>
			<input type="date" name="monthEnd" id="monthEnd" readonly>
			
			<br>
			<input type="radio" name="period" id="radioPeriodDate" value="date"> 날짜지정 : 결제일로부터 지정일 까지 이용가능
=======
			<input type="radio" name="radioResume" id="radioResumeTJ" value="더잡 이력서"> 더잡 이력서<br>
			<input type="radio" name="radioResume" id="radioResumeCom" value="자사 이력서"> 자사 이력서<br>
			
			<div id="radioResumeDiv"></div>			
			<input type="text" name="resumeType" id="resumeType">
			
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎모집기간</span><br><br>
			<span>모집기간을 선택하세요</span><br><br>
			<input type="radio" name="radioPeriod" id="radioPeriodMonth" value="month"> 상시채용 또는 채용시까지 : 결제일로 부터 1달 이용가능<br>
			<input type="radio" name="radioPeriod" id="radioPeriodDate" value="date"> 날짜지정 : 결제일로부터 지정일 까지 이용가능
>>>>>>> 46972ea06982451532a9e9de09173f8692a476f7
					
			<input type="date" name="startDay" class="startDay" readonly>
			<input type="date" name="endDay" id="datePick" >
			
			<input type="date" id="now_date"> // 여기서 중요한건 input type을 date로 해줘야합니다.
			
			<br>
<<<<<<< HEAD
			<input type="text" name="price" id="price" disabled>			
			
			<br><br><br>
			<input type="button" id="btn" value="결제하기">
			<input type="text" name="productName" id="productName">
			<input type="text" name="resumeType" id="resumeType">
			<input type="text" name="recruitmentCode" id="recruitmentCode" value="${recruitmentCode }">
			
=======
			<input type="submit" value="결제하기"><br>
			상품명<input type="text" name="productName" id="productName"><br>
			끝나는날<input type="text" name="endDate" id="endDate"><br>
			기업정보코드<input type="text" name="comCode" id="comCode">
>>>>>>> 46972ea06982451532a9e9de09173f8692a476f7
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>
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
			var date = new Date();
		    var day = date.getDate();
		    var month = date.getMonth() + 2;
		    var year = date.getFullYear();

		    if (month < 10) month = "0" + month;
		    if (day < 10) day = "0" + day;

		    var month = year + "-" + month + "-" + day;      
		    $('#monthEnd').attr("value", month);
			$('#endDay').attr("value", month);
			
			var priceForMonth =45000;
			$("#price").val(priceForMonth);
		}); 
		$("#radioPeriodDate").click(function(){
			$('#price').val("");
			$('#endDay').attr("value", "");
			var productName = $("#radioPeriodDate").val()
			$("#productName").val(productName);
			$("#datePick").attr('disabled', false);
		});
		
		/* 현재 날짜 전은 못 구하게 하기 */
		$('#datePick').change(function(){
			
			var startDate = $('input[name=startDay]').val();
	        var startDateArr = startDate.split('-');
	        var endDate = $('input[name=endPickDay]').val(); 
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
	        $('#endDay').val(endDate);
	        /* 가격 구하기 */
	        var cDay = 24 * 60 * 60 * 1000;
	       	var dif = parseInt((endDateCompare - startDateCompare)/cDay);
	       	$('#price').val(dif * 1000);
		});
		
		/* resumeType */
		$('input[name=radioResumeType]').click(function(){
			var val =$(this).val();
			$('#resumeType').val(val);
			
		});
		
		$('form[name=frmPeriod]').submit(function() {
			if(!$('input[name=radioResumeType]').is(":checked")){
				alert("이력서를 선택해주세요");
				$(this).focus();
				event.preventDefault();
				return false;
			}else if(!$('input[name=period]').is(":checked")){
				alert("모집 기간을 선택해주세요");
				$(this).focus();
				event.preventDefault();
				return false;
			}else if($('#endDay').val().length <1){
				alert("모집 기간을 선택해주세요");
				$(this).focus();
				event.preventDefault();
				return false;
			}
			
			
		});
	});
</script>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>

	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<form name="frmPeriod" method="post" action="<c:url value='/companyWritePeriod/payment.do'/>">

			<span style="font-size: 25px; font-weight: bold;">채용정보등록 - 기간설정</span>
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎지원방법</span><br><br>

			<input type="radio" name="radioResumeType" id="radioResumeTheJob" value="0"> 더잡 이력서<br>
			<input type="radio" name="radioResumeType" id="radioResumeCompany" value="1"> 자사 이력서<br>
			
			<div id="radioResumeDiv"></div>			
			<hr>
			<span style="font-size: 18px; font-weight: bold;">◎모집기간</span><br><br>
			<span>모집기간을 선택하세요</span><br><br>
			<input type="radio" name="period" id="radioPeriodMonth" value="month"> 상시채용 또는 채용시까지 : 결제일로 부터 1달 이용가능
			<input type="date" name="monthStart" class="startDay" readonly>
			<input type="date" name="monthEnd" id="monthEnd" >
			
			<br>
			<input type="radio" name="period" id="radioPeriodDate" value="date"> 날짜지정 : 결제일로부터 지정일 까지 이용가능
			<input type="date" name="startDay" class="startDay" readonly>
			<input type="date" name="endPickDay" id="datePick" ><br>
			가격
			<input type="text" name="price" id="price" readonly style="text-align: right; width: 80px; padding-right: 10px;">원	
			
			<br><br><br>
			<input type="submit" id="btn" value="결제하기" >
			<input type="hidden" name="productName" id="productName">
			<input type="hidden" name="resumeType" id="resumeType">
			<input type="hidden" name="endDay" id="endDay" >
			<input type="hidden" name="recruitmentCode" id="recruitmentCode" value="${recruitmentCode }">
			

		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
	
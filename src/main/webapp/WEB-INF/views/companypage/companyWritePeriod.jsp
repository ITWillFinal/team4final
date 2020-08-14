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
   input[type=radio]{
      width: 0px;
      height: 1px;
      position: absolute;
   }
   .lab{
      text-align: center;
       width: 48%;
       font-size: 16px;
       line-height: 49px;
       background: #b4c5d2;
       color: #fff;
       cursor: pointer;
       font-weight: bold;
         margin-left: 9px;
       font-weight: bold;
   }
   
   .labpay{
      text-align: center;
       width: 40%;
       font-size: 16px;
       line-height: 49px;
       background: #b4c5d2;
       color: #fff;
       cursor: pointer;
       font-weight: bold;
   }
   
   input[type=date]{
      text-align: center;
       font-size: large;
       width: 200px;
       height: 46px;
   }
   
   #priceDiv{
       float: right;
       margin: 18px;
       margin-right: 4%;
       font-size: 20px;
       font-weight: bold;
       padding: 40px;
       border: 1px solid #cacaca;
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
		var yy = year.toString();
		if (month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;
		
		var month = yy.substring(2,4) + "/" + month + "/" + day;      
		return month;
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

          var month = year + "/" + month + "/" + day;      
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
           var startDateVal = startDateArr[0].substring(2,4) + "/" + startDateArr[1] + "/" + startDateArr[2];
           var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
           //alert(startDateCompare);
           var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
           var endDateVal = endDateArr[0].substring(2,4) + "/" + endDateArr[1] + "/" + endDateArr[2];
           if(startDateCompare.getTime() > endDateCompare.getTime()) {
               alert("시작날짜와 종료날짜를 확인해 주세요.");
               $('#price').val("");
               $('#datePick').val("");
               return;
           }
           $('#endDay').val(endDateVal);
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
      $('input[type=radio]').change(function() {
         if($(this).val() == 0){
            $('#labTheJob').css('background', '#2e3752');
            $('#labCom').css('background', '#b4c5d2');
         }else if($(this).val() == 1){
            $('#labTheJob').css('background', '#b4c5d2');
            $('#labCom').css('background', '#2e3752');
         }
         
      });
      $('#dateDiv').hide();
      $('input[type=radio]').change(function() {
         if($(this).val() == '월간 이용 상품'){
            $('#labPeriodMonth').css('background', '#2e3752');
            $('#labPerioddDate').css('background', '#b4c5d2');
            $('#dateDiv').hide();
            $('#endDay').val(getMonth());
         }else if($(this).val() == '기간 지정 상품'){
            $('#labPeriodMonth').css('background', '#b4c5d2');
            $('#labPerioddDate').css('background', '#2e3752');
            $('#dateDiv').show();
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

         <input type="radio" name="radioResumeType" id="radioResumeTheJob" value="0"> 
         <label for="radioResumeTheJob" class="lab" id="labTheJob">더잡 이력서</label>
         <input type="radio" name="radioResumeType" id="radioResumeCompany" value="1"> 
         <label for="radioResumeCompany" class="lab" id="labCom">자사 이력서</label>
         <br>
         
         <div id="radioResumeDiv"></div>         
         <hr>
         <span style="font-size: 18px; font-weight: bold;">◎모집기간</span><br><br>
         <input type="radio" name="period" id="radioPeriodMonth" value="월간 이용 상품">
         <label for="radioPeriodMonth" class="labpay" id="labPeriodMonth">상시채용</label><br>결제일로 부터 30일 이용가능
         <input type="date" name="monthEnd" id="monthEnd" style="display: none;"><br><br>
         
         <br>
         <input type="radio" name="period" id="radioPeriodDate" value="기간 지정 상품">
         <label for="radioPeriodDate" class="labpay" id="labPerioddDate">날짜지정</label>
         <div style="display: inline;margin-left: 50px;" id="dateDiv">
            <input type="date" name="startDay" class="startDay" readonly> ~ 
            <input type="date" name="endPickDay" id="datePick" >
         </div>
         <br>
         <div id="priceDiv">
            <span style="color: #f73f22">결재 금액</span>
            <input type="text" name="price" id="price" readonly style="text-align: right; width: 100px; padding-right: 10px; border: 0">원   
         </div>
         
         <div style="text-align: center; margin: 50px; clear: both;">
            <input type="submit" id="btn" class="btn" value="결제하기" >
         </div>
         <input type="hidden" name="productName" id="productName">
         <input type="hidden" name="resumeType" id="resumeType">
         <input type="hidden" name="endDay" id="endDay" >
         <input type="hidden" name="recruitmentCode" id="recruitmentCode" value="${recruitmentCode }">
         

      </form>
   </div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
   
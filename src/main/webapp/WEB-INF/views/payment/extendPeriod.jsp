<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		/* 동의서 확인 */
		$('.chAgree').click(function(){
			if($('.chAgree').is(":checked")){
				alert("동의되셨습니다.");
				$('.tosChange').slideDown();
			}else{
				$('.tosChange').slideUp();
			}		
			
		});
		
		/* 서비스 기간은 서비스 결제 된 날짜 전은 못 구하게 하기  */
		$('.datePick').change(function(){
			/* 전 endDate 구하기 */
			var preEndDate = $('.preEndDate').val(); //예) 20/02/01
			var preEndDateArr = preEndDate.split('/');
			var endDate = $('.datePick').val();
			//alert(endDate);//yyyy-MM-dd로 나옴
			var endDateArr = endDate.split('-');
			var endDateVal = endDateArr[0].substring(2,4) + "/" + endDateArr[1] + "/" + endDateArr[2];
			endDateArr = endDateVal.split('/');			
			
			/* 전 마지막 날짜와 현재 마지막 날짜 비교 */
			var preEndDateCompare = new Date(preEndDateArr[0], parseInt(preEndDateArr[1])-1, preEndDateArr[2]);
			var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
			
			if(preEndDateCompare.getTime() >= endDateCompare.getTime()) {
               alert("서비스 종료 기간을 확인해 주세요.");
               $('.endDate').val("");
               $('.datePick').val("");
               $('.price').val("");
               $('.priceShow').val("");
               $('.extraPrice').val("");
               return;
			}else{
				$('.endDate').val(endDateVal);
				
				/* 금액 구하기 */
				var cDay = 24 * 60 * 60 * 1000;
				var dif = parseInt((endDateCompare - preEndDateCompare)/cDay);
				$('.priceShow').html("");
				$('.priceShow').append(dif * 1000+ "원");
				
				var prePrice = $('.prePrice').val();
				
				$('.price').val("");
				$('.price').val((dif * 1000) + Number(prePrice));
				
				
				$('.extraPrice').val("");
				$('.extraPrice').val(dif * 1000);
			}
			
		});//datePick
		
		$('form[name=frmExtend]').submit(function() {
			if($('.endDate').val().length <1 ){
				alert('서비스 기간을 다시 선택해주세요.');
				$(".datePick").focus();
				event.preventDefault();
				return false;
			}
			
		});
		
		
		/* 개인정보 제공 및 위탁안내 */
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
<style type="text/css">
	 body {
        width: 100%;
        height: 100%;
      }
	.paymentChoice{
		text-align: center;
	}
	.paymentChoice a{
		text-decoration: none;
	}
	.paymentChoice{
		margin-top: 60px;
	}
	.bodyCenter{
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 60px;
	}
	hr {
		height: 1px;
		background: #da2461;
	}
	html {overflow:hidden;} 
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	.bodyLeft{
		background-color: #fee705;;
	
	}
	.btSubmit{
		margin-left: 475px;
	    margin-top: 5px;
	}
	.price_submit{
		margin-top: 15px;
	}
	
</style>
<!-- width 784 -->
<body style="overflow-x:hidden; overflow-y:auto; margin: 0px;">
	<div class="body">
		<div class="bodyLeft" style="float: left; width: 15%;height: 610px;">
			<div class="paymentChoice" st >
				<img alt="" src="<c:url value='/resources/images/kakao.png'/>">
				<iframe style="margin-top: 213px;" width="120" height="120" src="https://www.youtube.com/embed/XQuK7H7bcyM?autoplay=1"  allow='autoplay' frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<img alt="itwill" src="<c:url value='/resources/images/itwill.png'/> ">
			</div>
		</div>
		<div class="bodyCenter"  style="float: left; width: 79%;height: 550px; ">
			
			The JOB <span style="margin-left: 55%;">안전하게 결제 가능 합니다</span>
			<hr>
			<br>
			이용약관<span style="margin-left: 77%;"><input type="checkbox" class="chAgree">동의</span><br><br>
			<a style="margin-left: 65%;" href="#">개인정보 제공 및 위탁안내</a>
			<hr>
			<div class="tosChange" style="display: none;" >
			<!-- 결제 되어 있는 것에 대한 내용 -->
			[현재 채용 공고 내용]<br><br>
			
			제목 : ${comRecruitVO.title }<br>
			서비스 기간 : ${tosVo.startDate } ~ ${tosVo.endDate }<br>
			<input type="hidden" value="${tosVo.endDate }" class="preEndDate">
			결제 상품 : ${paymentVo.productName }<br>
			결제 금액 : ${paymentVo.price }원<br>
			<input type="hidden" value="${paymentVo.price }" class="prePrice">
			<br>
			<hr>
			<!-- 결제 후 변경되는 사항 -->	
			[채용 공고 연장 서비스]<br><br>
			
			<!-- form문 시작 -->
			<form name="frmExtend" method="post" action="<c:url value='/payment/extendPeriod.do' />">
				제목 : ${comRecruitVO.title }<br>
				서비스 기간 : ${tosVo.startDate } ~ <input type="date" name="endPickDay" class="datePick"> <br>
				<div>추가 금액 : <div class="priceShow" style="display: inline;"></div></div>
				
				<hr>
				<br>
				<div class="price_submit">결제 금액 : <div class="priceShow" style="display: inline;"></div> <input class="btSubmit" type="submit" value="결제하기"></div>
				
				
				<!-- 서비스 종료 일과 총 합계 금액 -->
				<input type="hidden" name="endDate" class="endDate">
				<input type="hidden" name="price" class="price">
				<input type="hidden" name="extraPrice" class="extraPrice">
				<input type="hidden" name="recruitmentCode" value="${comRecruitVO.recruitmentCode }">
			</form>
			<!-- form문 끝 -->
			</div>
			
		</div>
	</div>
</body>
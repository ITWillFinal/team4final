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
	
	
</style>
<!-- width 784 -->
<body>
	<div class="body">
		<div class="bodyLeft" style="border: 1px solid ; float: left; width: 15%; height: 100%;">
			<div class="paymentChoice" st >
				<a href="#">카카오페이</a>
			</div>
		</div>
		<div class="bodyCenter"  style="border: 1px solid ; float: left; width: 79%; height: 100%;">
			
			The JOB <span style="margin-left: 55%;">안전하게 결제 가능 합니다</span>
			<hr>
			<br>
			이용약관<span style="margin-left: 77%;"><input type="checkbox" class="chAgree">동의</span><br><br>
			<a style="margin-left: 65%;" href="#">개인정보 제공 및 위탁안내</a>
			<hr>
			<div class="tosChange" style="display: none;" >
			<!-- 결제 되어 있는 것에 대한 내용 -->
			현재 채용 공고 내용<br><br>
			
			제목 : ${comRecruitVO.title }<br>
			서비스 기간 : ${tosVo.startDate } ~ ${tosVo.endDate }
				
			<hr>
			<!-- 결제 후 변경되는 사항 -->	
			
			
			</div>
			
			
		</div>
	</div>
</body>
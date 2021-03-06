<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp31064420'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var price = $('#price').val();
        var resumeType = $('#resumeType').val();
        var recruitmentCode = $('#recruitmentCode').val();
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'The JOB 채용 정보 결제',
            amount : parseInt(price),
        }, function(rsp) {
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			$.ajax({
				url: "<c:url value='/import/payment.do' />",
				type: "post",
				data: $('#frmPayment').serialize(),
				success: function(result){
					if(result >0){	
						alert("결제 성공했습니다");
						if(resumeType == 0){
							location.href = "<c:url value='/companypage/employmentNotice/employmentNoticeList.do' />";
						}else{
							location.href = "<c:url value='/companypage/companyResumeSet.do?recruitmentCode="+recruitmentCode+"' />";
						}
						
					}else{
						alert("결제 실패했습니다");
						location.href="<c:url value='/companypage/companyHome.do' />";
					}
				},
				error : function(xhr, status, error) {
					alert(status + ", " + error);

				}
				
				
			});
        })
        
    });
    </script>
    <form id="frmPayment" name="frmPayment">
	 	<input type="hidden" id="productName" name="productName" value="${paymentVo.productName }">
	 	<input type="hidden" id="cMemberCode" name="cMemberCode" value="${cMemberCode }" id="cMemberCode">
	 	<input type="hidden" id="price" name="price" value="${paymentVo.price }">
	 	<input type="hidden" id="recruitmentCode" name="recruitmentCode" value="${recruitmentCode }"><br><br>
	 	<input type="hidden" id="endDay" name="endDay" value="${endDay }">
	 	<input type="hidden" id="resumeType" name="resumeType" value="${resumeType }">
    </form>
</body>
</html>
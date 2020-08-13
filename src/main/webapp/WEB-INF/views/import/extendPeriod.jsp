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
        var price = $('#extraPrice').val();
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'The JOB 채용 정보 결제',
            amount : parseInt(price),
        }, function(rsp) {
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			$.ajax({
				url: "<c:url value='/import/extendPeriod.do' />",
				type: "post",
				data: $('#frmPayment').serialize(),
				success: function(result){
					if(result > 0){
						alert("결제 성공했습니다");
						window.opener.location = "<c:url value='/companypage/employmentNotice/employmentNoticeList.do' />";
						window.close();
					}else{
						alert("입력 실패했습니다");
						window.opener.location = "<c:url value='/companypage/employmentNotice/employmentNoticeList.do' />";
						window.close();
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
	 	<input type="hidden" id="price" name="price" value="${paymentVo.price }">
	 	<input type="hidden" id="extraPrice" name="extraPrice" value="${extraPrice }">
	 	<input type="hidden" id="recruitmentCode" name="recruitmentCode" value="${paymentVo.recruitmentCode }"><br><br>
	 	<input type="hidden" id="endDate" name="endDate" value="${tosVo.endDate }">
    </form>
</body>
</html>
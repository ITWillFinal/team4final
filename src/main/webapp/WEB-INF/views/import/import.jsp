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
        var productName = $('#productName').val();
        var cMemberCode = $('#cMemberCode').val();
        var startDay = $('#startDay').val();
        var endDay = $('#endDay').val();
        var price = $('#price').val();
        var comName = $('#comName').val();
        var title = $('#title').val();
        var frmPayment = $('#frmPayment').serialize();
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'The JOB 채용 정보 결제',
            amount : parseInt(price),
            buyer_name : comName,
            title :title,
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                	url:"<c:url value='/import/payment.do' />", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: $('#frmPayment').serialize()
                }).done(function(data) {
	                   $.ajax({
	                   	url:"/import/payment.do",
	                   	type: 'POST',
	                   	data: $('#frmPayment').serialize(),
	                    dataType: 'json',
	                       success : function(data) {
	                       	alert("결제 완료되었습니다.");
	                       	
	   					},
	   					error : function(xhr, status, error) {
	   						alert(status + ", " + error);
	   					}
	                   });
	                    
                });
                //성공시 이동할 페이지 companyHome
                location.href="<c:url value='/companypage/companyHome.do' />";
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
               	location.href="<c:url value='/companypage/companyHome.do' />";
                alert(msg);
            }
        });
        
    });
    </script>
    <form id="frmPayment" name="frmPayment">
	 	<input type="text" id="productName" name="productName" value="${paymentVo.productName }">상품 이름 <br><br>
	 	<input type="text" id="cMemberCode" name="cMemberCode" value="${cMemberCode }" id="cMemberCode">
	 	<input type="text" id="price" name="price" value="${paymentVo.price }">가격<br><br>
	 	<input type="text" id="startDay" name="startDay" value="${paymentVo.startDay }"><br><br>
	 	<input type="text" id="endDay" name="endDay" value="${paymentVo.endDay }"><br><br>
	 	<input type="text" id="example" name="example" value="example"><br><br>
    </form>
</body>
</html>
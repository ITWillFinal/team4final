<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<input type="hidden" id="return" value="${email }">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	window.onload = function() {
		if ($('#return').val().length > 0) {
			$(opener.document).find('#email').val("${param.e_mail}");
			$(opener.document).find('#chkEmail').val("Y");
			$(opener.document).find('#email').attr('readonly', 'readonly');
			self.close();
		}

	};
	$(function(){
		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});
	});
</script>
<style type="text/css">
.button {
    display: inline-block;
    position: relative;
    margin: 10px;
    padding: 0 20px;
    text-align: center;
    text-decoration: none;
    font: bold 12px/25px Arial, sans-serif;
 
    text-shadow: 1px 1px 1px rgba(255,255,255, .22);
 
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
 
    -webkit-box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
    -moz-box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
    box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
 
    -webkit-transition: all 0.15s ease;
    -moz-transition: all 0.15s ease;
    -o-transition: all 0.15s ease;
    -ms-transition: all 0.15s ease;
    transition: all 0.15s ease;
}
.gray {
    color: #515151;
    background: #d3d3d3; /* Old browsers */
    background: -moz-linear-gradient(top,  #d3d3d3 0%, #8a8a8a 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#d3d3d3), color-stop(100%,#8a8a8a)); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* IE10+ */
    background: linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* W3C */
}

</style>
<body>
	<div style="text-align: center;">

		<c:if test="${empty email }">
			<img alt="이메일"
				src="<c:url value='/resources/images/emailCheck.jpg' /> ">
			<div style="text-align: center;">
				<form action="<c:url value='/member/join_injeung.do' /> "
					method="post">
					<input type="text" id="dice" name="dice" value="${dice }">
					<input type="hidden" id="e_mail" name="e_mail" value="${e_mail }">
					<br>
					<div>
						인증번호 입력 : <input type="text" name="email_injeung" class="onlyNumber"
							placeholder="  인증번호를 입력하세요. ">
					</div>
					<span style="color: red;">(인증번호 일치 시 다음 단계로 진행됩니다.)</span> <br>
					<br>
					<button type="submit" name="submit" id="btSubtmit" class="button gray">인증번호 확인</button>
				</form>
			</div>
		</c:if>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btSubtmit').click(function() {
			if($('#email_id').val().length<1){
				alert('이메일을 입력하세요');
				$('#email_id').focus();
				event.preventDefault();
				return false;
			}
		});
	});

</script>
<body>
	<div style="text-align: center;">
		<form name="frm" action="<c:url value='/member/auth.do' /> " method="post">
			<br>
			<div>
				이메일 : <input type="email" name="e_mail" value="${param.email }" id="email_id"
					placeholder="  이메일주소를 입력하세요. ">
			</div>

			<br> <br>
			<button type="submit" name="submit" id="btSubtmit">이메일 인증받기 (이메일 보내기)</button>
		</form>
	</div>
</body>
</html>

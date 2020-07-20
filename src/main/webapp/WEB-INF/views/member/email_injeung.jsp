<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#email').val("${param.e_mail}");
			$(opener.document).find('#chkEmail').val("Y");
			
			self.close();			
		});
		
	});
	
</script>
<body>
	<c:if test="${empty email }">
		<span style="color: green; font-weight: bold;">입력한 이메일로 받은
			인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span>
		<br>
		<br>
		<br>
		<br>
		<div style="text-align: center;">
			<form action="<c:url value='/member/join_injeung.do' /> "
				method="post">
				<input type="text" id="dice" name="dice" value="${dice }"> 
				<input type="text" id="e_mail" name="e_mail" value="${e_mail }"> <br>
				<div>
					인증번호 입력 : <input type="number" name="email_injeung"
						placeholder="  인증번호를 입력하세요. ">
				</div>

				<br> <br>
				<button type="submit" name="submit">인증번호 전송</button>
			</form>
		</div>
	</c:if>
	<c:if test="${!empty email }">
		<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 이메일입니다. [사용하기]버튼을 클릭하세요</p>
	</c:if>

</body>
</html>
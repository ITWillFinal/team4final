<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/mainstyle.css'/>"/>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmDup]').submit(function() {
			 if($('#user_id').val().length<1){
				alert('아이디를 입력하세요!');
				$('#user_id').focus();
				event.preventDefault();
				return false;
			}
		});
		
		$('#btUse').click(function(){
			$(opener.document).find('#userid1').val("${param.user_id}");
			$(opener.document).find('#chkId').val("Y");
			$(opener.document).find('#userid1').attr('readonly', 'readonly');
			
			self.close();			
		});
		$('.onlyAlphabetAndNumber').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});
	});
	
</script>
</head>
<body>
	<h1>회원 아이디 중복 검사</h1>	
	<form name="frmDup" method="post" 
		action="<c:url value='/member/checkUserid.do'/>">
		
		<label for="user_id">회원 ID</label>
		<input type="text" name="user_id" id="user_id"  class="onlyAlphabetAndNumber"
			value="${param.user_id}">
		<input type="submit" value="아이디 확인" >
		<c:if test="${!empty result }">
			<c:if test="${result==EXIST_ID}">
				<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
			</c:if>
			<c:if test="${result==NON_EXIST_ID}">
				<input type="button" value="사용하기" id="btUse">
				<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
			</c:if>
		</c:if>
	</form>
</body>
</html>






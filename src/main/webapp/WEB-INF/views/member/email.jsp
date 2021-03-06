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
<script type="text/javascript">
	$(function(){
		$('form[name=frm]').submit(function() {
			if($('#email_id').val().length < 2 ){
				alert('이메일을 입력하세요!');
				$('#email_id').focus();
				event.preventDefault();
				return false;
			}else{
				var emailCh = $('#email_id').val();
				$.ajax({
					url : "<c:url value='/email/emailDupCh.do' />",
					type : "get",
					data : "emailCh=" + emailCh,
					dataType : "json",
					async : false,
					success : function(data) {
						if (data > 0) {
							alert('중복된 이메일이 있습니다');
							$('#dupEmail').val("N");
						} else {
							alert('사용 가능한 이메일입니다');
							$('#dupEmail').val("Y");
						}

					},
					error : function(xhr, status, error) {
						alert(status + ", " + error);

					}
				});
				if($('#dupEmail').val() =="N"){
					event.preventDefault();
					return false;
				}
				
				
			}
			
		});//submit
		
		
	});

</script>
<body>
	<div style="text-align: center;">
		<form name="frm" action="<c:url value='/member/auth.do' /> " method="post">
			<br>
			<img alt="이메일" src="<c:url value='/resources/images/email.jpg' /> ">
			<div>
				이메일 : <input type="email" name="e_mail" value="${param.email }" id="email_id"
					placeholder="  이메일주소를 입력하세요. " style="width: 200px;">
			</div>
			<div class="emailDupChLine"></div>
			<input type="hidden" name="dupEmail" id="dupEmail">
			<button type="submit" name="submit" id="btSubtmit" class="button gray">이메일 인증받기 (이메일 보내기)
			</button>
		</form>
	</div>
</body>
</html>

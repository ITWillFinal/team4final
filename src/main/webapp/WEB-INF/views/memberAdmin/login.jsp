<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE JOB+ 관리자</title>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function () {
		
	})
</script>

<style>

div#foot {
    text-align: center;
    padding: 20px 0px;
}
div#all {
	padding: 30px;
    margin: 0 auto;
    margin-top: 10%;
    overflow: hidden;
    width: 870px;
    box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
}
input#a2 {
    border: 0;
    border-bottom: 1px solid darkgray;
    width: 250px;
    height: 50px;
}

#logoDiv{
	float: left;
	width: 55%;
	height: 400px;
}

input[type=submit]{
	width: 77px;
    height: 55px;
    text-align: center;
    border-radius: 0;
    border: 1px solid #fb246a;
    background: #fb246a;
    color: white;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
}

</style>
</head>
<body style="background: aliceblue;">
<main>
	<div id = "all" style="overflow: hidden; background: white;">
		<div style="margin: 0 auto; width: 800px;">
			<div id="logoDiv">
				<a href="<c:url value='/index.do'/>"><img alt="the job 로고" src="<c:url value = '/resources/images/logo/logo.png'/>"
					style="width: 100%; padding-top: 20%;"></a>
			</div>
			<div style="width: 35%; margin: 0 auto; float: right;">
				<div id = "head" style="text-align: center;">
					<h2>THE JOB+ 관리자</h2>
				</div>
				
				<div id = "body">
					<form name = "formLogIn" method = "post" action="<c:url value = '/memberAdmin/adminlogin.do'/>" >
						<div id = "divLogin">
							<div id = "f">
								<p id = "a1">아이디</p>				
								<input id = "a2" type="text" name = userId>
							</div>
							<div id = "s">
								<p id = "a1">비밀번호</p>
								<input id = "a2" type="password" name = "pwd">
							</div>
						</div>
						<div id = "t" style="text-align: center;">
							<input type="submit" value = "로그인">
						</div>
					</form>
				</div>
				<div id = "foot">
					<a href = "<c:url value = '/memberAdmin/register.do'/>">관리자 등록</a>
				</div>
			</div>
		</div>
	</div>

</main>
</body>
</html>


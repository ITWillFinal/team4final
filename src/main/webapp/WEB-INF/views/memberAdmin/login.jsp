<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function () {
		
	})
</script>

<style>
#head{
	border: 1px solid blue;
	font-size: 25px;
    font-weight: bold;
}

#body {
    border: 1px solid red;
    margin-left: 34%;
    margin-right: 34%;
    margin-top: 8%;
    margin-bottom: 2%;
}

div#foot {
    border: 1px solid green;
    margin-left: 30%;
    margin-right: 30%;
    padding-top: 5px;
    padding-bottom: 5px;
    margin-bottom: 4%;
}
div#all {
    margin: 0 auto;
    margin-top: 10%;
}
input#a2 {
    margin-left: 30px;
    height: 26px;
}
input#b2 {
    margin-left: 10px;
    height: 26px;
}
div#f {
    margin-bottom: 10px;
}
div#s {
    margin-bottom: 25px;
}
</style>
<main>
	<div id = "all" style="text-align: center; width:50%; border:1px solid lightgray;">
		<div id = "head" >
			<p>관리자 로그인</p>
		</div>
		
		<div id = "body" style="text-align: left;">
			<form name = "formLogIn" method = "post" action="<c:url value = '/memberAdmin/adminlogin.do'/>" >
				<div id = "f">
					<label id = "a1" for = "userId">ID</label>				
					<input id = "a2" type="text" name = adminId>
				</div>
				<div id = "s">
					<label id = "b1" for = "pwd">PWD</label>
					<input id = "b2" type="text" name = "pwd">
				</div>
				<div id = "t" style="text-align: center;">
					<input type="submit" value = "LogIn">
				</div>
			</form>
		</div>
		<div id = "foot">
			<a href = "<c:url value = '경로 입력해야함'/>">ID 찾기</a>|
			<a href = "<c:url value = '경로 입력해야함'/>">PWD 찾기</a>|
			<a href = "<c:url value = '/memberAdmin/register.do'/>">관리자 등록</a>
		</div>
		<img alt="the job 로고" src="<c:url value = '/resources/images/logo/logo.png'/>"
			style="width: 500px">
	</div>

</main>



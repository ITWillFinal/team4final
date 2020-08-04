<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function () {
		
	})
</script>

<main>
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<div id = "head" style="width: 857px; margin-left: 0px;">
			<p>관리자 로그인</p>
		</div>
		
		<div id = "body">
			<form name = "formLogIn" method = "post" action="<c:url value = '/memberAdmin/adminlogin.do'/>" >
				<label for = "userId">ID</label>				
				<input type="text" name = adminId>
				<label for = "pwd">PWD</label>
				<input type="text" name = "pwd">
				<input type="submit" value = "LogIn">
			</form>
		</div>
		<div id = "foot">
			<a href = "<c:url value = '경로 입력해야함'/>">ID 찾기</a>|
			<a href = "<c:url value = '경로 입력해야함'/>">PWD 찾기</a>|
			<a href = "<c:url value = '/memberAdmin/register.do'/>">관리자 등록</a>
		</div>
	</div>

</main>


<%@ include file="../inc/adminBottom.jsp"%>
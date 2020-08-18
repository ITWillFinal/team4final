<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/top.jsp" %>
<style type="text/css">
 h1{
 	/* text-align: center; */
    font-weight: bold;
    color: #0e1a73;
    font-size: xxx-large;
 }
</style>
	<div style="margin: 4% auto; width: 1000px;">
		<h1 style="margin-left: 30px;">error-code:400</h1>
		<img alt="" src="<c:url value='/resources/images/error.png'/>">
		<div>
		<div style="margin: 30px;">
		<h2 style="text-align: center;font-weight: bold;"><a href="<c:url value='/'/>" style="color: #fb236a;">The Job으로 바로가기</a></h2>
		<br>
		</div>
		</div>
	</div>
<%@ include file="inc/bottom.jsp" %>
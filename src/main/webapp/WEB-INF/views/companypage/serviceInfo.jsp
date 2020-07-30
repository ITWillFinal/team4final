<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/companyTop.jsp" %>
<style>

	hr {
		border:1px solid #FB246A;
		width:100%;
	}
</style>

<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<div style="height:240px; background-color: #0a0a1e;">
			<div style="text-align: center;">
				<br>
				<br>
				<span style="font-size: 20px; font-weight: bold; color: white;">일자리를 더하다 +</span><br>
				<span style="font-size: 35px; font-weight: bold; color: white;">THE JOB</span>
				<span style="font-size: 40px; font-weight: bold; color: #FB246A;">+</span><br>
				<br>
				<span style="font-size: 20px; font-weight: bold; color: white;">사람의 가치를 더하는 더 잡</span>
				<span style="font-size: 30px; font-weight: bold; color: #FB246A;">+</span><br>
			</div>
			
		</div>
		<br>
		<img src="<c:url value='/resources/images/example.png'/>">
		<br><br>				
		<div>
			<span style="font-weight: bold; font-size: 25px;">기업정보관리</span>
			<hr>
		</div>
		
		<div>
			<span style="font-weight: bold; font-size: 25px;">채용관리</span>
			<hr>
		</div>
		
		<div>
			<span style="font-weight: bold; font-size: 25px;">인재정보</span>
			<hr>
		</div>
		
		<div>
			<span style="font-weight: bold; font-size: 25px;">결제관리</span>
			<hr>
		</div>
		
		
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
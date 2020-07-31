<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form name="frmWrite" method="post" action="<c:url value='/companypage/companyWrite.do'/>">
			<span style="font-size: 25px; font-weight: bold;">채용정보등록 - 기간설정</span>
			<hr>
			채용기간을 선택하세요<br>
			1. 상시채용 & 채용시까지 (=> 1달씩 결제 하도록)<br>
			날짜보다는 조금 싼 가격으로 제공, 오늘부터 다음달까지 이용가능			
			
			2. 날짜지정 (=> 날짜를 계산하여 결제 하도록)<br>
			<input type="date" name="cal1" value=""> 부터 
			<input type="date" name="cal2"> 까지 <br>
			
			1번 선택 2번 선택 등 지정 할 때 마다 금액이 바뀔 수있도록 ajax 사용하기
			
			서브밋하면 DB 저장되며 companyHome으로
			
			
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
	
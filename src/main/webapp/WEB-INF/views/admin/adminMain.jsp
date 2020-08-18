<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<style>
 .btn-box.small i{
 	font-size: 40px;
 }
</style>
<div class="btn-controls">
	<div class="btn-box-row row-fluid">
		<a class="btn-box big span4"><i class=" icon-random"></i><b><c:if test="${result == '0' }">결재 정보가 부족합니다.</c:if>
			<c:if test="${result != '0' }">${result }%</c:if></b>
		<p class="text-muted">월간 매출 증감율</p> </a><a 
		class="btn-box big span4"><i class="icon-user"></i><b>${totalToday } 명</b>
		<p class="text-muted">신규 유저</p> </a><a 
		class="btn-box big span4"><i class="icon-money"></i><b>￦<c:if test="${!empty todayPay }"><fmt:formatNumber value="${todayPay }" pattern="#,###"/></c:if>
			<c:if test="${empty todayPay }">0</c:if></b>
		<p class="text-muted">오늘의 수익</p> </a>
	</div>
	<div class="btn-box-row row-fluid">
		<div class="span8">
			<div class="row-fluid">
				<div class="span12">
					<a href="<c:url value = '/gogak/qna/qnaList.do'/>" class="btn-box small span4">
					<i class="icon-envelope"></i><b>1:1 문의사항<br><span style="color: red; font-size: bold">${cnt }</span> </b> </a>
					<a href="<c:url value='/admin/adminMemberManagement.do' />" class="btn-box small span4"><i class="icon-group"></i><b>고객<br><span style="color: blue; font-size: bold">${totalRecordOfAdmin }</span></b></a>
					<a href="<c:url value='/admin/adminNotice.do'/>" class="btn-box small span4"><i class="icon-bullhorn"></i><b>신규 공지<br><span style="color: blue; font-size: bold">0</span></b> </a>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<a href="<c:url value = '/chart/AllChart.do'/>" class="btn-box small span4"><i class="icon-bar-chart"></i><b>Chart</b></a>
					<a href="<c:url value='/payment/paymentList.do' />" class="btn-box small span4"><i class="icon-exchange"></i><b>Expenses</b> </a>
					<a href="#" class="btn-box small span4"><i class="icon-sort-down"></i><b>Bounce Rate</b> </a>
				</div>
			</div>
		</div>
		<div>
			<img alt="" src="<c:url value='/resources/images/ci/ci1.png'/>" style="padding-left: 40px;">
		</div>
	</div>
</div>
<!--/#btn-controls-->
<%@ include file="../inc/adminBottom.jsp"%>
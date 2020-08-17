<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>

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
					<i class="icon-envelope"></i><b>1:1 문의사항<br><span style="color: red; font-size: bold">${cnt }</span> </b> </a><a href="#"
						class="btn-box small span4"><i class="icon-group"></i><b>고객<br><span style="color: blue; font-size: bold">${totalRecordOfAdmin }</span></b>
					</a><a href="#" class="btn-box small span4"><i
						class="icon-exchange"></i><b>Expenses</b> </a>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<a href="#" class="btn-box small span4"><i class="icon-save"></i><b>Total
							Sales</b> </a><a href="#" class="btn-box small span4"><i
						class="icon-bullhorn"></i><b>Social Feed</b> </a><a href="#"
						class="btn-box small span4"><i class="icon-sort-down"></i><b>Bounce
							Rate</b> </a>
				</div>
			</div>
		</div>
		<ul class="widget widget-usage unstyled span4">
			<li>
				<p>
					<strong>Windows 8</strong> <span class="pull-right small muted">78%</span>
				</p>
				<div class="progress tight">
					<div class="bar" style="width: 78%;"></div>
				</div>
			</li>
			<li>
				<p>
					<strong>Mac</strong> <span class="pull-right small muted">56%</span>
				</p>
				<div class="progress tight">
					<div class="bar bar-success" style="width: 56%;"></div>
				</div>
			</li>
			<li>
				<p>
					<strong>Linux</strong> <span class="pull-right small muted">44%</span>
				</p>
				<div class="progress tight">
					<div class="bar bar-warning" style="width: 44%;"></div>
				</div>
			</li>
			<li>
				<p>
					<strong>iPhone</strong> <span class="pull-right small muted">67%</span>
				</p>
				<div class="progress tight">
					<div class="bar bar-danger" style="width: 67%;"></div>
				</div>
			</li>
		</ul>
	</div>
</div>
<!--/#btn-controls-->
<%@ include file="../inc/adminBottom.jsp"%>
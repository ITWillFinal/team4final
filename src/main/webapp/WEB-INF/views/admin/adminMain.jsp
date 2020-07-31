<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>

<div class="btn-controls">
	<div class="btn-box-row row-fluid">
		<a href="#" class="btn-box big span4"><i class=" icon-random"></i><b>65%</b>
			<p class="text-muted">Growth</p> </a><a href="#"
			class="btn-box big span4"><i class="icon-user"></i><b>${totalToday }</b>
			<p class="text-muted">New Users</p> </a><a href="#"
			class="btn-box big span4"><i class="icon-money"></i><b>15,152</b>
			<p class="text-muted">Profit</p> </a>
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
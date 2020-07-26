<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자</title>
<link type="text/css" href="<c:url value='/resources/admin/css/bootstrap.min.css'/>" rel="stylesheet">
<link type="text/css" href="<c:url value='/resources/admin/css/theme.css'/>" rel="stylesheet">
<link type="text/css" href="<c:url value='/resources/admin/css/font-awesome.css'/>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.5.1.js'/>" type="text/javascript"></script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".navbar-inverse-collapse"> <i
					class="icon-reorder shaded"></i></a><a class="brand" href="index.html">THE JOB
				</a>
				<div class="nav-collapse collapse navbar-inverse-collapse">
					<ul class="nav nav-icons">
						<li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
						<li><a href="#"><i class="icon-eye-open"></i></a></li>
						<li><a href="#"><i class="icon-bar-chart"></i></a></li>
					</ul>
					<form class="navbar-search pull-left input-append" action="#">
						<input type="text" class="span3">
						<button class="btn" type="button">
							<i class="icon-search"></i>
						</button>
					</form>
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Dropdown</a></li>
						<li><a href="#">Support </a></li>
						<li><a href="#">Support </a></li>
						
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
		</div>
		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">
						<ul class="widget widget-menu unstyled">
							<li class="active"><a href="index.html"><i
									class="menu-icon icon-dashboard"></i>Dashboard </a></li>
							<li><a href="activity.html"><i
									class="menu-icon icon-bullhorn"></i>공지사항</a></li>
							<li><a href="message.html"><i
									class="menu-icon icon-group"></i>고객관리 <b
									class="label green pull-right"> 11</b> </a></li>
							<li><a href="task.html"><i class="menu-icon icon-tasks"></i>Tasks
									<b class="label orange pull-right"> 19</b> </a></li>
						</ul>
						<!--/.widget-nav-->


						<ul class="widget widget-menu unstyled">
							<li><a href="ui-button-icon.html"><i
									class="menu-icon icon-bold"></i> Buttons </a></li>
							<li><a href="ui-typography.html"><i
									class="menu-icon icon-book"></i>Typography </a></li>
							<li><a href="form.html"><i class="menu-icon icon-paste"></i>Forms
							</a></li>
							<li><a href="table.html"><i class="menu-icon icon-table"></i>Tables
							</a></li>
							<li><a href="charts.html"><i
									class="menu-icon icon-bar-chart"></i>Charts </a></li>
						</ul>
						<!--/.widget-nav-->
						<ul class="widget widget-menu unstyled">
							<li><a class="collapsed" data-toggle="collapse"
								href="#togglePages"><i class="menu-icon icon-cog"> </i><i
									class="icon-chevron-down pull-right"></i><i
									class="icon-chevron-up pull-right"> </i>More Pages </a>
								<ul id="togglePages" class="collapse unstyled">
									<li><a href="other-login.html"><i class="icon-inbox"></i>Login
									</a></li>
									<li><a href="other-user-profile.html"><i
											class="icon-inbox"></i>Profile </a></li>
									<li><a href="other-user-listing.html"><i
											class="icon-inbox"></i>All Users </a></li>
								</ul></li>
							<li><a href="#"><i class="menu-icon icon-signout"></i>Logout
							</a></li>
						</ul>
					</div>
					<!--/.sidebar-->
				</div>
				<!--/.span3-->
				<div class="span9">
					<div class="content">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE JOB-MyPage</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<style>
	#navigation li:nth-child(n+2){
		margin-left: 100px;
	}
</style>

<!-- CSS here -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<!-- 아이콘 태그 -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/nice-select.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/mainstyle.css'/>" />
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>

</head>
<body>
	<header>
		<!-- Header Start -->
		<div
			style="width: 100%; background: #010b1d; height: 30px; text-align: center;">
			<a href="<c:url value="/index.do"/>"> <span
				style="font-weight: bold; color: white;">THE JOB <span
					style="color: #fb246a;">+</span></span>

			</a>
		</div>
		<div class="header-area header-transparrent">
			<div class="headder-top header-sticky">
				<div class="container">
					<div class="row align-items-center">
							<div class="menu-wrapper" style="position: relative;margin: 0 auto;">
								<!-- Main-menu -->
								<div class="main-menu">
									<nav class="d-none d-lg-block">
										<ul id="navigation">
											<li><a href="index.html">MY 홈</a></li>
											<li><a href="about.html">나의 Profile</a></li>
											<li><a href="<c:url value='/resume/resumeMain.do'/>">이력서관리</a></li>
											<li><a href="contact.html">입사지원/요청관리</a></li>
											<li><a href="contact.html">관심기업</a></li>
										</ul>
									</nav>
								</div>

							</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>
	<!-- main page -->
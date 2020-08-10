<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE JOB-MyPage</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	#navigation li:nth-child(n+2){
		margin-left: 80px;
	}
</style>

<!-- CSS here -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<!-- 아이콘 태그 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/nice-select.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>

</head>
<body>
	<header>
		<!-- Header Start -->
		<div
			style="width: 100%; background: #010b1d; height: 30px; text-align: center;">
			<a href="<c:url value="/companypage/companyHome.do"/>"> <span
				style="font-weight: bold; color: white;">THE JOB <span
					style="color: #fb246a;">+</span></span>

			</a>
		</div>
		<div class="header-area header-transparrent">
			<div class="headder-top header-sticky">
				<div class="container">
					<div class="row align-items-center" style="margin-left: 100px;">
							<div class="menu-wrapper" style="position: relative;margin: 0 auto;">
								<!-- Main-menu -->
								<div class="main-menu">
									<nav class="d-none d-lg-block">
										<ul id="navigation">
											<li><a href="<c:url value='/mypage/mypageHome.do?status=${sessionScope.status }'/>">MY 홈</a></li>
											<li><a href="<c:url value='/companypage/MyCompany.do'/>">회사정보</a></li>
											<li><a href="<c:url value='/companypage/employmentNotice/employmentNoticeList.do'/>">채용공고</a></li>
											<li><a href="contact.html">지원자관리</a></li>
										</ul>
									</nav>
								</div>
								<!-- Header-btn -->
								<div class="header-btn d-none f-right d-lg-block" style="margin-left: 100px;">
                                	<a href="<c:url value='/login/logout.do'/>" style="margin-right: 20px; font-size: .8em; color:#252b60; ">로그아웃</a>
                                    <a href="<c:url value='/mypage/mypageHome.do?status=${sessionScope.status }'/>" class="btn head-btn2" style="font-weight: bold;">고객센터</a>
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
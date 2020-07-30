<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE JOB</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">


<!-- CSS here -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 아이콘 태그 -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/nice-select.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/js/jquery-3.5.1.min.js'/>">

<!-- 사이드바 제이쿼리 시작 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
  } );
</script>
<!-- 사이드바 제이쿼리 끝 -->

</head>

<style>
/*사이드바 제이쿼리 스타일*/
.ui-widget-header {
	padding: 0.2em;
}
/*사이드바 제이쿼리 스타일 끝*/

.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
	opacity: 0;
	z-index: 900;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	position: fixed;
	width: 60%;
	padding: 10px;
	max-width: 500px;
	border-radius: 10px;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgba(255, 255, 255, .9);
	/* "delay" the visibility transition */
	-webkit-transition: opacity .5s, visibility 0s linear .5s;
	transition: opacity .5s, visibility 0s linear .5s;
	z-index: 1;
}

.popup:target {
	visibility: visible;
	opacity: 1;
	/* cancel visibility transition delay */
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
}

.popup-close {
	position: absolute;
	padding: 10px;
	max-width: 500px;
	border-radius: 10px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgba(255, 255, 255, .9);
}

.popup .close {
	position: absolute;
	right: 5px;
	top: 5px;
	padding: 5px;
	color: #000;
	transition: color .3s;
	font-size: 2em;
	line-height: .6em;
	font-weight: bold;
}

.popup .close:hover {
	color: #00E5EE;
}

#tabs input {
	border: 0;
	border-bottom: 1px solid darkgray;
	width: 250px;
	height: 50px;
}

#tabs input[type=submit] {
	border: 0;
	background: #fb246a;
	color: white;
}

.totalMenu {
	position: absolute;
	left: -333px;
	width: 138%;
	top: 90%;
	border-top: 5px solid #fb246a;
	display: none;
	background: #f9f9f9;
	z-index: 15;
	overflow: hidden;
}

.totalMenu div {
	float: left;
	border: 1px solid silver;
	border-collapse: collapse;
	padding: 50px;
}

.totalMenu div a {
	color: black;
}

</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs();
    
   	$("#tabs input[type=submit]").hover(function() {
   		$(this).css("background", "#da2461");
	}, function() {
		$(this).css("background", "#fb246a");
	});
   	
   	$('#toggle').click(function() {
	   	$('.totalMenu').slideToggle();
	});
  });
</script>

<body>
	<!-- /import/login.jsp 파일 가져옴 -->
	<%@include file="../import/login.jsp" %>
	
	<!-- 회원가입 선택 -->
	<div id="pop02" class="overlay">
		<div class="popup" style="text-align: center;">
			<a href="#none" class="close">&times;</a><br>
			<div id="tabs">
				<div id="tabs-1">
					<h3>회원가입 선택</h3>
					<br> 
					<a class="btn blue" href="<c:url value='/member/register.do' /> " >일반회원</a>
					<a class="btn red" href="<c:url value='/companypage/member/companyJoin.do' /> ">기업회원</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디 찾기  -->
	<div id="popId" class="overlay">
		<div class="popup" style="text-align: center;">
			<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<form action="<c:url value='/email/find_id.do' /> " method="post">
					<input type="hidden" name="memberType" value="u">
						<div class="w3-center w3-large w3-margin-top">
							<h3>아이디 찾기</h3>
						</div>
						<div>
							<p>
								<label>Email</label> <input class="w3-input" type="email"
									id="findIdByEmail" name="findIdByEmail">
							</p>
							<p class="w3-center">
								<button type="submit" id=findBtn class="btn head-btn1"
									style="font-weight: bold;">find</button>
								<button type="button" onclick="history.go(-1);"
									class="btn head-btn1" style="font-weight: bold;">Cancel</button>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기  -->
	<div id="popPwd" class="overlay">
		<div class="popup" style="text-align: center;">
			<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<form action="<c:url value='/email/find_pwd.do' /> " method="post">
					<input type="hidden" name="memberType" value="u">
						<div class="w3-center w3-large w3-margin-top">
							<h3>비밀번호 찾기</h3>
						</div>
						<div>
							<p>
								<label>ID</label> <input class="w3-input" type="text" id="userid"
									name="userid" required>
							</p>
							<p>
								<label>Email</label> <input class="w3-input" type="email"
									id="findPwdByEmail" name="findPwdByEmail">
							</p>
							<p class="w3-center">
								<button type="submit" id=findBtn class="btn head-btn1"
									style="font-weight: bold;">find</button>
								<button type="button" onclick="history.go(-1);"
									class="btn head-btn1" style="font-weight: bold;">Cancel</button>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디 찾기  -->
	<div id="popId2" class="overlay">
		<div class="popup" style="text-align: center;">
			<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<form action="<c:url value='/email/find_id.do' /> " method="post">
						<input type="hidden" name="memberType" value="c">
						<div class="w3-center w3-large w3-margin-top">
							<h3>아이디 찾기</h3>
						</div>
						<div>
							<p>
								<label>Email</label> <input class="w3-input" type="email"
									id="findIdByEmail" name="findIdByEmail">
							</p>
							<p class="w3-center">
								<button type="submit" id=findBtn class="btn head-btn1"
									style="font-weight: bold;">find</button>
								<button type="button" onclick="history.go(-1);"
									class="btn head-btn1" style="font-weight: bold;">Cancel</button>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기  -->
	<div id="popPwd2" class="overlay">
		<div class="popup" style="text-align: center;">
			<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<form action="<c:url value='/email/find_pwd.do' /> " method="post">
					<input type="hidden" name="memberType" value="c">
						<div class="w3-center w3-large w3-margin-top">
							<h3>비밀번호 찾기</h3>
						</div>
						<div>
							<p>
								<label>ID</label> <input class="w3-input" type="text" id="userid"
									name="userid" required>
							</p>
							<p>
								<label>Email</label> <input class="w3-input" type="email"
									id="findPwdByEmail" name="findPwdByEmail">
							</p>
							<p class="w3-center">
								<button type="submit" id=findBtn class="btn head-btn1"
									style="font-weight: bold;">find</button>
								<button type="button" onclick="history.go(-1);"
									class="btn head-btn1" style="font-weight: bold;">Cancel</button>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<header>
		<!-- Header Start -->
		<div class="header-area header-transparrent">
			<div class="headder-top header-sticky">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-3 col-md-2">
							<!-- Logo -->
							<div class="logo" style="width: 250px;">
								<a href="<c:url value='/index.do'/>"><img
									src="<c:url value='/resources/images/logo/logo.png'/>" alt="" style="width: 90%; margin-bottom: 15px;"></a>
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<div class="menu-wrapper">
								<!-- Main-menu -->
								<div class="main-menu">
									<nav class="d-none d-lg-block">
										<ul id="navigation">
											<li><a id="toggle"> ▤ </a></li>
											<!-- <ul class="submenu">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="single-blog.html">Blog Details</a></li>
                                                    <li><a href="elements.html">Elements</a></li>
                                                    <li><a href="job_details.html">job Details</a></li>
                                                </ul> -->

											<li><a href=<c:url value='/hireinpo/hireinpo.do'/>>채용정보</a></li>
											<li><a href="job_listing.html">HOT 100</a></li>
											<li><a href="<c:url value='/vocation/vocationalTest.do'/>">직업탐색</a></li>
											<li><a
												href="<c:url value='/companypage/companyHome.do'/>">기업페이지</a></li>
											<li><a href="<c:url value = '/gogak/personal/faqList.do'/>">고객센터</a></li>
										</ul>
										<div class="totalMenu">
											<div>
												<a href="about.html">채용정보 ></a> <br> <a
													href="about.html">상세검색</a> <br> <a href="about.html">지역별</a>
												<br> <a href="about.html">직무별</a> <br> <a
													href="about.html">산업별</a> <br> <a href="about.html">기업별</a>

											</div>
											<div>
												<a href="about.html">취업 성공 툴 ></a> <br> <a
													href="about.html">자소서 작성</a> <br> <a href="about.html">학격
													자소서</a> <br> <a href="about.html">합격 스팩</a> <br> <a
													href="about.html">직무 인터뷰</a> <br> <a href="about.html">취업
													후기</a>
											</div>
										</div>
									</nav>
								</div>
								<!-- Header-btn -->
								<div class="header-btn d-none f-right d-lg-block">
									<c:if test="${empty sessionScope.userid }">
										<a href="#pop02" class="btn head-btn1"
											style="font-weight: bold;">회원가입</a> <a href="#pop01"
											class="btn head-btn2" style="font-weight: bold;">로그인</a>
									</c:if>
                                	<c:if test="${!empty sessionScope.userid }">
	                                	<a href="<c:url value='/login/logout.do'/>" style="margin-right: 20px; font-size: .8em; color:#252b60; ">로그아웃</a>
	                                    <a href="<c:url value='/mypage/mypageHome.do?status=${sessionScope.status }'/>" class="btn head-btn2" style="font-weight: bold;">내정보</a>
                                	</c:if>
								</div>
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
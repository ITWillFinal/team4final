<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE JOB</title>
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">


	<!-- CSS here -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
    <!-- 아이콘 태그 -->
    <link rel="stylesheet" href="<c:url value='/resources/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/nice-select.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">

<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>

    <link rel="stylesheet" href="<c:url value='/resources/js/jquery-3.5.1.min.js'/>">

</head>

<style>
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

#tabs input[type=submit]{
    border: 0;
    background: #fb246a;
    color: white;
    
}
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
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
  });
</script>

<body>
      <div id="pop01" class="overlay">
        <div class="popup" style="text-align: center;">
        <a href="#none" class="close">&times;</a><br>
          <div id="tabs">
			  <ul style="border-radius: 0;">
			    <li style="margin-left: 8px;"><a href="#tabs-1" style="width: 220px;">일반회원</a></li>
			    <li><a href="#tabs-2" style="width: 220px">기업회원</a></li>
			  </ul>
			  <div id="tabs-1">
			  	<h3>로그인</h3><br>
			  	<form action="">
				  	<input type="text" placeholder="아이디"><br><br>
				  	<input type="password" placeholder="비밀번호"><br><br>
				  	<input type="submit" value="로그인">
				  	<br><br>
				  	<p>ㅡㅡㅡㅡㅡㅡㅡ다른 계정으로 로그인ㅡㅡㅡㅡㅡㅡㅡ</p>
				  	<!-- 네이버 -->
				  	<div id="naver_id_login" style="text-align:center">
						<a href="${url}">
							<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
						</a>
					</div>
					<!-- 구글 -->
					<div id="google_id_login" style="text-align: center">
					<a href="${google_url}"><img width="230"
						src="${pageContext.request.contextPath}/resources/images/btn_google_signin_dark_normal_web@2x.png" /></a>
				</div>
			  	 </form>
			  </div>
			  <div id="tabs-2">
				  <h3>로그인</h3><br>
				  	<form action="/indx">
					  	<input type="text" placeholder="아이디"><br><br>
					  	<input type="password" placeholder="비밀번호"><br><br>
					  	<input type="submit" value="로그인">
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
                            <div class="logo">
                                <a href="<c:url value='/index.do'/>"><img src="<c:url value='/resources/images/logo/logo.png'/>" alt=""></a>
                            </div>  
                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div class="menu-wrapper">
                                <!-- Main-menu -->
                                <div class="main-menu">
                                    <nav class="d-none d-lg-block">
                                        <ul id="navigation">
                                            <li><a href="index.html">채용정보</a></li>
                                            <li><a href="job_listing.html">Top100 </a></li>
                                            <li><a href="about.html">직업검사</a></li>
                                            <li><a href="<c:url value='/companypage/companyHome.do'/>">Page</a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="single-blog.html">Blog Details</a></li>
                                                    <li><a href="elements.html">Elements</a></li>
                                                    <li><a href="job_details.html">job Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="contact.html">고객센터</a></li>
                                        </ul>
                                    </nav>
                                </div>          
                                <!-- Header-btn -->
                                <div class="header-btn d-none f-right d-lg-block">
                                    <a href="<c:url value='/login/login.do'/>" class="btn head-btn1" style="font-weight: bold;">회원가입</a>
                                    <a href="#pop01" class="btn head-btn2" style="font-weight: bold;">로그인</a>
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

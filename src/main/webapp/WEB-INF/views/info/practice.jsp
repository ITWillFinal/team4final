<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="<c:url value='/resources/css/side.css'/>">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" 
	integrity="sha512-+NqPlbbtM1QqiK8ZAo4Yrj2c4lNQoGv8P79DPtKzj++l5jnN39rHA/xsqn8zE9l0uSoxaCdrOgFs6yjyfbBxSg==" 
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function(){
		$('.nav-toggle').click(function(e) {
			  alert("열기닫기");
			  e.preventDefault();			  
			  $("html").toggleClass("openNav");
			  $(".nav-toggle").toggleClass("active");
		});
	});
</script>

<body>
<div class="primary-nav">
	<button class="hamburger open-panel nav-toggle">
<span class="screen-reader-text">Menu</span>
</button>

	<nav role="navigation" class="menu">

		<a href="#" class="logotype">THE <span>JOB +</span></a>

		<div class="overflow-container" style="background-color: #010b1d;">

			<ul>
				<li><a href="#"> 채용정보</a></li>
				<li><a href="#"> - 채용정보 상세검색</a></li>
				<li><a href="#"> - HOT100</a></li>
				<li><a href="#"> - 직무별 채용정보</a></span></li>
				<li><a href="#"> - 산업별 채용정보</a></span></li>
				<li><a href="#"> - 지역별 채용정보</a></span></li>
				<li><a href="#"> 회원정보</a></span></li>
				<li><a href="#"> - 회원정보수정</a></span></li>
				<li><a href="#"> - 나의프로필</a></span></li>
				<li><a href="#"> 이력서관리</a></span></li>
				<li><a href="#"> - 이력서 등록</a></span></li>
				<li><a href="#"> - 이력서 현황</a></span></li>
				<li><a href="#"> - 이력서 상태설정</a></span></li>
				<li><a href="#"> - 입사요청 현황</a></span></li>
				<li><a href="#"> 고객센터</a></span></li>
				<li><a href="#"> - 공지사항</a></span></li>
				<li><a href="#"> - 자주찾는질문</a></span></li>
				<li><a href="#"> - 1:1 문의</a></span></li>
				<li><a href="#"> - 나의 1:1 문의</a></span></li>
				

			</ul>

		</div>

	</nav>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<style type="text/css">
.naverApi {
	list-style-type: none;
}
</style>

<body>
	<h1>The JOB</h1>
	<hr>
	<br>
	<div>
		<c:choose>
			<c:when test="${sessionId != null }">
				<h2>네이버 아이디 로그인 성공하셨습니다!!</h2>
				<h3>'${sessionId}' 님 환영합니다!</h3>
				<h3>
					<a href="<c:url value='/login/logout.do'/>">로그아웃</a>
				</h3>
			</c:when>
			<c:otherwise>
				<!-- 네이버 로그인 창으로 이동 -->
				<ul class="naverApi">
					<li ><a href="${url}"> <img width="223"
							src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
					</a></li>
					<li><a href="${google_url}"><img width="230"
							src="${pageContext.request.contextPath}/resources/images/btn_google_signin_dark_normal_web@2x.png" /></a>
					</li>
				</ul>

				<form action="login.userdo" method="post" name="frm"
					style="width: 470px;">
					<h2>로그인</h2>
					<input type="text" name="id" id="id" class="w3-input w3-border"
						placeholder="아이디" value="${id}"> <br> <input
						type="password" id="pwd" name="pwd" class="w3-input w3-border"
						placeholder="비밀번호"> <br> <input type="submit"
						value="로그인" onclick="#"> <br>
				</form>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>
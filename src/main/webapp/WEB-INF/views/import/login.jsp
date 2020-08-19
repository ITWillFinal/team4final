<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="pop01" class="overlay">
	<div class="popup" style="text-align: center;">
		<a href="#none" class="close">&times;</a><br>
		<div id="tabs">
			<ul style="border-radius: 0; border: 1px solid #dddddd; background: #e9e9e9; color: #333333; font-weight: bold;">
				<li style="margin-left: 8px;"><a href="#tabs-1"
					style="width: 220px;">일반회원</a></li>
				<li><a href="#tabs-2" style="width: 220px">기업회원</a></li>
			</ul>
			<div id="tabs-1">
				<h3>로그인</h3>
				<br>
				<form action="<c:url value='/login/userLogin.do'/>">
					<input type="text" placeholder="아이디" name="userid"><br>
					<br> <input type="password" placeholder="비밀번호" name="pwd"><br>
					<br>
					<a href="<c:url value='#popId' /> ">
						아이디
					</a>
					/
					<a href="<c:url value='#popPwd' /> ">
						비밀번호
					</a>
					찾기
					<br>
					<br> <input type="submit" value="로그인"> <br>
					<br>
					<span style="text-decoration:line-through">　　　</span>
					<span> 다른 계정으로 로그인 </span>
					<span style="text-decoration:line-through">　　　</span>
					<br><br>
					<!-- 네이버 -->
					<div id="naver_id_login" style="text-align: center">
						<a href="${url}"> <img width="223"
							src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
						</a>
					</div>
					<!-- 구글 -->
					<div id="google_id_login" style="text-align:center"><a href="${google_url}">
					<img width="230" src="<c:url value='/resources/images/googleLogin.png' /> "/></a></div>
					
				</form>
			</div>
			<div id="tabs-2">
				<h3>로그인</h3>
				<br>
				<form action="<c:url value='/login/companyLogin.do'/>">
					<input type="text" placeholder="아이디" name="userid"><br>
					<br> <input type="password" placeholder="비밀번호" name="pwd"><br>
					<br>
					<a href="<c:url value='#popId2' /> ">
						아이디
					</a>
					/
					<a href="<c:url value='#popPwd2' /> ">
						비밀번호 찾기
					</a>
					<br>
					<br> <input type="submit" value="로그인"><br>
					
				</form>
			</div>
		</div>
	</div>
</div>
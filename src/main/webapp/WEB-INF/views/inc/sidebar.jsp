<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- main left sidebar -->
	<div style="float: left; width:250px; margin-left:16%; word-break:break-all; border:1px solid lightgray; font-size: 14px;">
		
		<div style="width:238px; height:200px; margin:5px;">
			<br>
			<div style="text-align: center;">${sessionScope.name } 일반회원님</div>
			<br>
			<div style="text-align: center;">
				<input type="button" value="로그아웃"/>
				<input type="button" value="회원서비스"/>
			</div><br>
			<div style="margin-left:50px;">
				<span>span태그</span><br>
				<span>span태그</span><br>
				<span>span태그</span>
			</div>
		</div>
		<style>
			.ui-widget-header-bar{
				background-color: #2e3752;	
				color: white;
				border-top: 3px solid #fd5a77;
				border-right: 3px solid #13193e;
				border-left: 3px solid #fd5a77;
				border-bottom: 3px solid #13193e;
			}
			
		</style>
		<ul id="menu">
		  <li class="ui-widget-header-bar"><div>채용정보</div></li>
		  <li><div>HOT100</div></li>
		  <li><div>맞춤채용정보</div></li>
		  <li><div>지역별</div></li>
		  <li><div>직업별</div></li>
		  <li class="ui-widget-header-bar"><div>회원정보</div></li>
		  <li><div>회원정보수정</div></li>
		  <li><div>나의프로필</div></li>
		  <li class="ui-widget-header-bar"><div>이력서관리</div></li>
		  <li><div>이력서 등록</div></li>
		  <li><div>이력서 현황</div></li>
		  <li><div>이력서 상태설정</div></li>
		  <li><div>입사요청 현황???</div></li>		  
		  <li class="ui-widget-header-bar"><div>또뭐있지???</div></li>
		  <li><div>직업검사</div></li>
		  <li><div>나의관심기업???</div></li>
		  <li><div>인기기업???</div></li>
		  <li><div>맞춤기업정보???</div></li>
		</ul>		
	</div>
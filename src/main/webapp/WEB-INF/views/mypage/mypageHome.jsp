<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/mypageTop.jsp" %>
<style>
	#addHeadMenu{
		overflow: hidden;
		margin-top: 50px;
		margin-left: 400px;
	}
	#headMenu{
		float: left;
	    width: 150px;
	    height: 150px;
	    background: ;
	    border: 1px solid;
	    margin-left: 95px;
	    text-align: center;
	    border-radius: 80px;
	    padding-top: 28px;
	}
</style>
<div>
	<div id="addHeadMenu">
		<div id="headMenu">
			<i class="far fa-address-card fa-4x"></i></i><br>이력서
		</div>
		<div id="headMenu">
			<i class="far fa-calendar-check fa-4x"></i><br>입사지원
		</div>
		<div id="headMenu">
			<i class="fas fa-hand-holding-usd fa-4x"></i><br>입사지원요청
		</div>
		<div id="headMenu">
			<i class="far fa-star fa-4x"></i></i><br>스크랩
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
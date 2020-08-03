<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/mypageTop.jsp" %>
<script type="text/javascript">
	$(function() {
		$('#addHeadMenu div').hover(function() {
			$(this).css('background', 'skyblue');
		}, function() {
			$(this).css('background', 'white');
		});
	});
</script>
<style>
	#addHeadMenu{
		overflow: hidden;
		margin-top: 50px;
		margin-left: 340px;
		margin-bottom: 100px;
	}
	#headMenu{
		float: left;
	    width: 150px;
	    height: 150px;
	    margin-left: 126px;
	    text-align: center;
	    border-radius: 80px / 80px;
	    padding-top: 25px;
	}
	#headMenu a{
		color: #010b1d;
	}
</style>
<div>
	<div id="addHeadMenu">
		<div id="headMenu">
			<a href="#"><i class="far fa-address-card fa-4x"></i></i><br>
			<span>/10</span><br>
			<span>이력서</span></a>
		</div>
		<div id="headMenu">
			<a href="#"><i class="far fa-calendar-check fa-4x"></i><br>
			<span></span><br>
			<span>입사지원</span></a>
		</div>
		<div id="headMenu">
			<a href="#"><i class="fas fa-hand-holding-usd fa-4x"></i><br>
			<span></span><br>
			<span>입사요청</span></a>
		</div>
		<div id="headMenu">
			<a href="#"><i class="far fa-star fa-4x"></i></i><br>
			<span>${scrap }</span><br>
			<span>스크랩</span></a>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
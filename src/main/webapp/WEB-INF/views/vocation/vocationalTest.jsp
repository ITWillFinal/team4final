<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
	#testDiv{
		margin-top: 150px;
	}
	#aTag{
		background: #252b60;
		display:inline-block;
		width:35%;
		height:95px;
		text-align:center;
		font-size: 1.3em;
		padding-top: 33px;
		box-shadow: 0px 0px 10px 0px rgba(0,0,0,1.15);
	}
	#aTag span{
		font-size: 0.7em;
	}
	#boatImg{
		width: 80px;
	    height: 80px;
	    position: absolute;
	    margin-top: -30px;
	    margin-left: 50px;
	}
</style>
	<div style="text-align: center;" id="testDiv">
		
		<a id="aTag" href="#">직업상담<span>(진로탐험대)</span><img id="boatImg" src="<c:url value='/resources/images/boat.png'/>"><br></a><br><br>
		<span>많은 취준생들이 궁금해 하는 진로, 진학, 학습/적응, 직업 관련 상담사례를 확인할 수 있습니다.</span><br>
		<br><br>
		<a id="aTag" href="#">직업정보</a><br><br>
		<span>500여개 직업에 대한 유용한 정보! 관심 있는 직업에 대한 다양한 정보를확인하세요.</span>
	</div>
	<div style="text-align: center;" id="testDiv">
		<iframe src="//www.career.go.kr/cnet/iframe/CounselExam.do?apiKey=5b3d6fa311bebd2bbca3b56b98e59c75" scrolling="no" name="ce" width="917" height="637" frameborder="0" style="border-width:0px;border-color:white; border-style:solid;"> </iframe>
	</div>
	<div style="text-align: center;" id="testDiv">
		<iframe src="//www.career.go.kr/cnet/iframe/JobDic.do?apiKey=5b3d6fa311bebd2bbca3b56b98e59c75#tab2" scrolling="yes" name="ce" width="1000" height="1080" frameborder="0" style="border-width:0px;border-color:white; border-style:solid;"> </iframe>
	</div>

<%@ include file="../inc/bottom.jsp" %>
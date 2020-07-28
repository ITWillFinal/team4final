<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
	#testDiv{
		margin: 100px 0;
		
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
	
	#vacationImg{
		width: 30%;
		height: auto;
	}
</style>
<script type="text/javascript">
	$(function() {
	})
	
	function openNew() {
		window.open("<c:url value='/vocation/vocationalCounsel.do'/>", 'code', 'width=940, height=660, left=250, top=100, location=no, resizable=yse');
	}
	function openJobInfo() {
		window.open("<c:url value='/vocation/vocationalInfo.do'/>", 'code', 'width=1100, height=900, left=250, top=50, menubar=yes, location=no, resizable=yse, toolbar=yes');
	}
	
</script>
<%@ include file="../inc/sidebar.jsp"%>
<div style="float: left; width: 49%; margin-left: 30px; font-size: 14px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
	<div style="text-align: center;" id="testDiv">
		<img alt="searchImg" src="<c:url value='/resources/images/jobsearch.PNG'/>" id="vacationImg"><br>
		<a id="aTag" href="#" onclick="javascript:openNew()">직업상담<span>(진로탐험대)</span></a><br><br>
		<span>많은 취준생들이 궁금해 하는 진로, 진학, 학습/적응, 직업 관련 상담사례를 확인할 수 있습니다.</span><br>
		<br><br>
		<img alt="searchImg" src="<c:url value='/resources/images/search.PNG'/>" id="vacationImg"><br>
		<a id="aTag" href="#" onclick="javascript:openJobInfo()">직업정보탐색</a><br><br>
		<span>500여개 직업에 대한 유용한 정보! 관심 있는 직업에 대한 다양한 정보를확인하세요.</span>
	</div>
	
</div>
<%@ include file="../inc/bottom.jsp" %>
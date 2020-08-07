<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sidebar.jsp"%>
<style>
	#contentDiv{
		color: black;
		margin: 40px;
		
	}
	#conTotalDiv{
		margin-top: 20px;
		margin-bottom: 50px;
	}
	input[type=button]{
		width: 90px;
	    height: 40px;
	    background: #f7f7f7;
	    border: 0;
	    font-weight: bold;
	    color: black;
	    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
	    cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#btList').click(function() {
			history.back();
		});
	});
	
</script>

<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
	<div id="conTotalDiv">
		<h2>${vo.title }</h2>
		<span>등록일 : <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></span>
		　　　<span>조회수 : ${vo.readcount }</span>
		<hr style="border-top: 1px solid #9e9e9e8c; margin: 10px 0;">
		<div id="contentDiv">
			${vo.content }
		</div>
		<div style="text-align: center;">
			<input type="button" value="글목록" id="btList">
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
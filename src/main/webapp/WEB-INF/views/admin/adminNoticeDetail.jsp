<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="vo" value="${vo }"/>
<style>
	#contentDiv{
		color: black;
		margin: 40px;
	}
	#conTotalDiv{
		margin-top: 20px;
	}
	
	input[type=button]{
		width: 90px;
	    height: 40px;
	    background: #f7f7f7;
	    border: 0;
	    font-weight: bold;
	    color: black;
	    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#btList').click(function() {
			location.href="<c:url value='/admin/adminNotice.do'/>";
		});
		
		$('#btEdit').click(function() {
			location.href="<c:url value='/admin/adminEditNotice.do?noticeNo=${vo.noticeNo}'/>";
		});
	});
	
</script>
<div id="conTotalDiv">
	<h4>공지사항</h4>
	<h2>${vo.title }</h2>
	<span>등록일 : <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></span>
	<hr style="border-top: 1px solid #9e9e9e8c; margin: 10px 0;">
	<div id="contentDiv">
		${vo.content }
	</div>
	<div style="text-align: center;">
		<input type="button" value="글수정" id="btEdit">
		<input type="button" value="글목록" id="btList">
	</div>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
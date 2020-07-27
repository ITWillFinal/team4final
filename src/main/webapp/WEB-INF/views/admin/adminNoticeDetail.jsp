<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<style>
	#contentDiv{
		color: black;
		margin: 40px;
	}
	#conTotalDiv{
		margin-top: 20px;
	}
</style>
<div id="conTotalDiv">
	<h4>공지사항</h4>
	<c:set var="vo" value="${vo }"/>
	<h2>${vo.title }</h2>
	<span>등록일 : <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></span>
	<hr style="border-top: 1px solid #9e9e9e8c; margin: 10px 0;">
	<div id="contentDiv">
		${vo.content }
	</div>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
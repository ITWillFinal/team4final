<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>
<jsp:useBean id="today" class="java.util.Date"/>
<style>
	*{
		box-sizing: border-box;
	}

	.comList{
		width: 980px;
	    height: auto;
	    margin-top: 35px;
	}
	
	.comListTop, .comListContent{
		width: 100%;
		padding: 10px;
	}
	
	.comInfo{
		width: 275px;
		margin: 20px 0;
		margin-right: 40px;
		height:auto;
		float: left;
		border: 2px solid #CCC;
		border-radius: 5px;
		cursor: pointer;
	}
	
	
	.comImage{
		border-bottom:2px solid #ccc;
		height: 220px;
		width: 273px;
		background-repeat: no-repeat;
    	background-size: 273px 220px;
    	background-position: center center;
	}
	
	.comName{
		width: 275px;
		height: 50px;
		font-size: x-large;
		padding: 5px;
	}
</style>
<script type="text/javascript">
	
	$(function() {
		$('.comInfo').click(function(){
			location.href="#";
		});
	});
</script>
<%@ include file="../inc/sidebar.jsp"%>
<div style="float: left; width: 49%; margin-left: 30px; font-size: 14px;">
	<div class="comList">
		<div class="comListTop">
			<h2>기업 목록</h2>
		</div>
		<div class="comListContent">
			<ul>
				<c:forEach var="vo" items="${list }">
					<li class="comInfo">
						<input type="hidden" value="${vo.comCode }"/>
						<div class="comImage" style="background-image: <c:url value=''/>"></div>
						<div class="comName">${vo.comName }</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
	#contentDiv{
		margin-top: 70px;
		margin-bottom: 100px;
		margin-left: 290px;
	    background: #ececec61;
	    width: 1100px;
		overflow: hidden;
	}
	
	#headDiv{
		padding-top: 30px;
	    float: left;
	    padding-left: 30px;
	}
	#headAddDiv{
	    margin-top: 40px;
	    border: 1px solid #cecece;
	    float: right;
	    padding: 4px 5px;
	    text-align: center;
	}
	#infoDiv1{
		padding-top: 10px;
	    padding-left: 30px;
	    width: 40%;
	    float: left;
	}
	#infoDiv2{
		padding-top: 10px;
	    padding-left: 30px;
	    width: 40%;
	    float: left;
	}
	
	td{
		padding-left: 30px;
	}
	#moreDiv{
		padding-top: 10px;
	    padding-left: 30px;
	}
	hr{
		clear: both; 
		padding-top: 33px;"
	}
	a{
		color: #0b1c39;
	}
	#headAdd2{
		margin-top: 40px;
	    margin-left: 17px;
	    float: right;
	    margin-right: 50px
	}
	
</style>
<div id="contentDiv">
	<div id="headDiv">
		<p>${vo.comName }</p>
		<h3 style="font-weight: bold;">${vo.title }</h3>
		<p style="margin-bottom: -15px; font-size: 0.8em;">등록일 : ${vo.regdate }</p>
	</div>
	<div id="headAdd2">
		<a href="#" class="btn head-btn2" style="font-weight: bold; width: 120px; height: 59px;">지원</a>
	</div>
	<div id="headAddDiv">
		<a href="#" style="font-size: 0.9em;"><i class="fa fa-star-o fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true"></i>
		스크랩</a>
	</div>
	<hr>
	<div id="infoDiv1">
		<table>
			<tr>
				<th>경력</th>
				<td>${vo.career }</td>
			<tr>
			<tr>
				<th>학력</th>
				<td>${vo.educationLv }</td>
			<tr>
			<tr>
				<th>근무형태</th>
				<td>${vo.recType }</td>
			<tr>
		</table>
	</div>
	<div id="infoDiv2">
		<table>
			<tr>
				<th>급여</th>
				<td>${vo.pay }</td>
			<tr>
			<tr>
				<th>근무일시</th>
				<td>${vo.workHours }</td>
			<tr>
			<tr>
				<th>근무지역</th>
				<td>${vo.location1 } ${vo.location2 }</td>
			<tr>
		</table>
	</div>
	<hr>
	<div id="moreDiv">
		${vo.recDetail }
	</div>
	<div id="moreDiv">
		<h5>우대사항</h5>
		
		<p>
		<i class="fa fa-leanpub" aria-hidden="true"></i> 
		${vo.preference }
		</p>
	</div>
	<div id="moreDiv">
		<h5>복리후생</h5>
		
		<p>
		<i class="fa fa-gift" aria-hidden="true"></i> 
		${vo.welfare }
		</p>
	</div>
	<div id="moreDiv">
		<h5>근무지 위치</h5>
		<p>
		<i class="fa fa-map-marker" aria-hidden="true"></i>
		 (${vo.zipcode }) ${vo.address } ${vo.addressDetail }
		</p>
	</div>
	<div id="moreDiv">
		<h5>접수기간 및 지원</h5>
		<p>필수 제출 서류 : ${vo.document }</p>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>

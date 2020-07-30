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
		box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
	}
	
	#headDiv{
		padding-top: 30px;
	    float: left;
	    padding-left: 30px;
	}
	#headAddDiv1{
	    margin-top: 40px;
	    border: 1px solid #cecece;
	    float: right;
	    padding: 4px 5px;
	    text-align: center;
	}
	#headAddDiv2{
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
<script type="text/javascript">
	$(function() {
	});
	function scrapSave() {
		$.ajax({
			url:"<c:url value='/scrap/recruitScrap.do'/>",
			type:"get",
			dataType:"text",
			data:"recruitmentCode=${vo.recruitmentCode}",
			success:function(res){
				var io = res;
				if(res == 2){
					$('#headAddDiv2').attr('style','display:none;');
					$('#headAddDiv1').attr('style','display:bolck;');
				}
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	}
	
	function scrapDel() {
		$.ajax({
			url:"<c:url value='/scrap/delRecruitScrap.do'/>",
			type:"get",
			dataType:"text",
			data:"recruitmentCode=${vo.recruitmentCode}",
			success:function(res){
				var io = res;
				if(res == 2){
					$('#headAddDiv1').attr('style','display:none;');
					$('#headAddDiv2').attr('style','display:bolck;');
				}
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	}
	
	function nomember() {
		alert("로그인 이후에 이용 가능합니다.");
	}
</script>
<div id="contentDiv">
	<div id="headDiv">
		<p>${vo.comName }</p>
		<h3 style="font-weight: bold;">${vo.title }</h3>
		<p style="margin-bottom: -15px; font-size: 0.8em;">등록일 : ${vo.regdate }</p>
	</div>
	<div id="headAdd2">
		<a href="#" class="btn head-btn2" style="font-weight: bold; width: 120px; height: 59px;">지원</a>
	</div>
	<c:if test="${sessionScope.userid != null }">
		<div id="headAddDiv1" 
			<c:if test="${result == 0 }">
				style="display: none"
			</c:if>
		>
				<a href="#" onclick="javascript:scrapDel()" style="font-size: 0.9em;"><i class="fa fa-star fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true" id="fullStar"></i>
				스크랩</a>
		</div>
		<div id="headAddDiv2" 
			<c:if test="${result > 0 }">
				style="display: none"
			</c:if>
		>
				<a href="#" onclick="javascript:scrapSave()" style="font-size: 0.9em;"><i class="fa fa-star-o fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true" id="fullStar"></i>
				스크랩</a>
		</div>
	</c:if>
	<c:if test="${sessionScope.userid == null }">
		<div id="headAddDiv2">
				<a href="#" onclick="javascript:nomember()" style="font-size: 0.9em;"><i class="fa fa-star-o fa-2x" style="color: #ffd91f; display: block;" aria-hidden="true" id="fullStar"></i>
				스크랩</a>
		</div>
	</c:if>
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
				<th>성별</th>
				<td>${vo.gender }</td>
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

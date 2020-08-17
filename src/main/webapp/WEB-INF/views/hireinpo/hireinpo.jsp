<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script>
$(function(){
	$( "#hireTabs" ).tabs();
	$('.sido #op').click(function() {
		$('#tdLocation1').val($(this).val());
	});
	$(document).on('click','#sigugunDiv button', function() {
		$('#tdLocation2').val($(this).val());
	});
	$('.jobLarge #op').click(function() {
		$('#tdJob1').val($(this).text());
	});
	$(document).on('click','#jobMiddleDiv button', function() {
		$('#tdJob2').val($(this).text());
	});
	
	$('.induLarge #op').click(function() {
		$('#tdIndu1').val($(this).text());
	});
	$(document).on('click','#induMiddleDiv button', function() {
		$('#tdIndu2').val($(this).text());
	});
	$('#locationLi2 #recType').click(function() {
		$('#tdHireType').val($(this).val());
	});
	$('#locationLi2 #comTy').click(function() {
		$('#tdComType').val($(this).val());
	});
	$('#locationLi2 #eduLv').click(function() {
		$('#tdEdu').val($(this).val());
		$('#tdEdu1').val($(this).text());
	});
	
	$('#reset').click(function() {
		$('td input').val('');
	});
});

$(function() {
	$('#locationLi #op').click(function() {
		$('#tdLocation2').val('');
		var sido = $(this).val();
		$('.sigungu').empty();
		$.ajax({
			url:"<c:url value='/sigugun.do'/>",
			type:"get",
			dataType:"json",
			data:"sido="+sido,
			success:function(res){
				var option = "<div style='width: 224px; overflow-y: scroll; height: 320px;' id='sigugunDiv'>"
				for(var i = 0; i< res.length; i++){
					option += "<button value='"+res[i]+"' class='btn head-btn1' style='width:200px; border: 1px solid white; padding: 22px;'>"+res[i]+"</button>";
				}
				option+="</div>";
				$('.sigungu').append(option);
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
	
	$('.jobLarge #op').click(function() {
		$('#tdJob2').val('');
		var num = $(this).val();
		$('.jobMiddle').empty();
		$.ajax({
			url:"<c:url value='/job/jobMiddle.do'/>",
			type:"get",
			dataType:"json",
			data:"no="+num,
			success:function(res){
				var option = "<div style='width: 274px; overflow-y: scroll; height: 320px;' id='jobMiddleDiv'>"
				for(var i = 0; i< res.length; i++){
					option += "<button value='"+res[i].MIDDLE_NO+"' class='btn head-btn1' style='width:250px; border: 1px solid white; padding: 22px;'>"+res[i].MIDDLE_GROUP+"</button>";
				}
				option+="</div>";
				$('.jobMiddle').append(option);
				
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
	
	$('.induLarge #op').click(function() {
		$('#tdIndu2').val('');
		var num = $(this).val();
		$('.induMiddle').empty();
		$.ajax({
			url:"<c:url value='/job/induMiddle.do'/>",
			type:"get",
			dataType:"json",
			data:"no="+num,
			success:function(res){
				var option = "<div style='width: 274px; overflow-y: scroll; height: 320px;' id='induMiddleDiv'>"
				for(var i = 0; i< res.length; i++){
					option += "<button value='"+res[i].MIDDLE_NO+"' class='btn head-btn1' style='width:250px; border: 1px solid white; padding: 22px;'>"+res[i].MIDDLE_GROUP+"</button>";
				}
				option+="</div>";
				$('.induMiddle').append(option);
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
});

function hireInfo(){
	if($('#tdLocation1').val().length < 1 && $('#tdJob1').val().length < 1 && $('#tdIndu1').val().length < 1 && 
			$('#tdComType').val().length < 1 && $('#tdHireType').val().length < 1 && $('#tdEdu').val().length < 1 && $('#tdRecDetail').val().length < 1){
		alert('최소 1개 이상의 조건을 등록해주세요.');
		return
	}else if($('#tdEdu').val() == ''){
		$('#tdEdu').val(0);
	}
	
	
	$.ajax({
		 url :"<c:url value='/hireinpo/searchHireInfo.do'/>"
		,type:"post"
		,data:$("#hireform").serialize()
		,dataType:"json"
		,success:function(res){
			if(res != null && res != ''){
				makeListJson(res);
			}
			else{
				$("#jobListDiv").html("<h5 style='width: 90%;margin: 0 auto; border: 1px solid #e0e0e08f; margin-top:20px; padding: 50px;'>등록된 채용공고가 없습니다.</h5>");
			}
		}
	    ,error: function(xhr,status, error){
	    	alert(status+"에러발생"+error);
	    }
	});
}

function makeListJson(res){
	var htmlStr = "";
	$(res).each(function(){
		htmlStr += "<div class='single-job-items mb-30' style='width: 90%;margin: 0 auto; border: 1px solid #e0e0e08f; margin-top:20px;'><div class='job-items'><div class='job-tittle'>";
		htmlStr += "<a href='<c:url value='/hireinpo/infoDetail.do?recruitmentCode="+this.recruitmentCode+"'/>'><h4>"+this.title+"</h4></a>";
		htmlStr += "<ul>";
		htmlStr += "<li><a href='<c:url style='background:black;' value='/companypage/showCompanyInfo.do?recruitmentCode="+this.recruitmentCode+"'/>'>"+this.comName+"</a></li>";
		htmlStr += "<li><i class='fa fa-briefcase' aria-hidden='true'></i>"+this.jobType2+"</li>";
		htmlStr += "<li>"+this.pay+"</li>";
		htmlStr += "<ul>";
		htmlStr += "</div></div>";
		htmlStr += "<div class='items-link f-right'>";
		htmlStr += "<a href='<c:url value='/hireinpo/infoDetail.do?recruitmentCode="+this.recruitmentCode+"'/>'>"+this.recType+"</a>";
		htmlStr += "</div></div>";
	});
	$("#jobListDiv").html(htmlStr);
}
</script>
<style>
	#jobListDiv{
		clear: both;
    	padding-top: 25px;
    	margin-bottom: 50px;
	}
	#hireTabs{
		float: left;
		width: 52%;
		height: 377px;
		padding: 0;
	}
	#hireSearch{
		float: right;
		width: 47%;
		border: 1px solid #c5c5c5;
		border-radius: 3px;
		height: 377px;
	}
	
	select option{
		padding: 5px;
		border: 1px solid lightgray;
		border-collapse: collapse;
	}
	select{
		border: 0;
	    width: 230px;
	    text-align: center;
	    background: #f3f3f3;
	}
	
	button#op {
    	width: 200px;
    	padding: 22px;
	}
	#locationLi{
		width: 224px;
	    overflow-y: scroll;
    	height: 322px;
	}
	#locationLi2{
		width: 160px;
    	margin-top: 5px;
    	text-align: center;
    	float: left;
	}
	
	#searchTable th{
		padding-top: 18px;
	    font-size: 1.1em;
	}
	#searchTable td{
		padding-top: 18px;
		padding-left: 20px;
	}
	#searchTable input{
		border: 0;
		width: 188px;
		
	}
	#searchTable tr{
		border-bottom: 1px solid #f3f3f3;
	}
	input[type=button]{
		width: 77px;
	    height: 55px;
	    text-align: center;
	    border-radius: 0;
	    border: 1px solid #fb246a;
	    background: #fb246a;
	    color: white;
	    font-weight: bold;
	    cursor: pointer;
	}
	#reset{
		width: 55px;
	    height: 55px;
	    text-align: center;
	    border-radius: 0;
	    border: 1px solid #fb246a;
	    background: white;
	    color: #fb246a;
	    font-weight: bold;
	    cursor: pointer;
	}
	
	#tdRecDetail{
		background: #eaeaea94;
	    border-radius: 8px;
	    width: 80%;
	    height: 30px;
	    margin-bottom: 2px;
	}
	.ui-tabs .ui-tabs-panel {
		padding: 5px;
	}
	
	button#eduLv {
	    width: 120px;
	    padding: 20px;
	    margin: 2px;
	}

	button#recType {
	    width: 120px;
	    padding: 20px;
	    margin: 2px;
	}
	
	button#comTy {
	    width: 120px;
	    padding: 20px;
	    margin: 2px;
	}
</style>
<%@ include file="../inc/sidebar.jsp"%>
<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
<p style="font-weight: bold;font-size: xx-large;color: #010b1d; margin-top: 26px;">채용정보 상세검색</p>
<hr style="border: 1px solid #fb246a;">
<div id="hireTabs">
	<ul style="border: 1px solid #dddddd; background: #e9e9e9; color: #333333; font-weight: bold;">
		<li><a href="#hireTabs-1"><i class="fa fa-map-marker" aria-hidden="true"></i>　지역</a></li>
		<li><a href="#hireTabs-2"><i class="fa fa-briefcase" aria-hidden="true"></i>　직무</a></li>
		<li><a href="#hireTabs-3"><i class="fa fa-industry" aria-hidden="true"></i>　산업</a></li>
		<li><a href="#hireTabs-4"><i class="fa fa-building-o" aria-hidden="true"></i>　기업형태/고용형태/학력</a></li>
		
	</ul>
	
	<div id="hireTabs-1">
		<div id="locationLi" style="display: inline-block" class="sido">
			<c:forEach var="location" items="${locationList }">
				<button id="op" class="btn head-btn2" value="${location }">${location }</button>
			</c:forEach>
		</div>
		<div style="display: inline-block" class="sigungu">
			
		</div>
	</div>
	
	<div id="hireTabs-2">
		<div id="locationLi" style="display: inline-block" class="jobLarge">
			<c:forEach var="map" items="${jobList }">
           		<button value="${map['LARGE_NO'] }" id="op" class="btn head-btn2">${map['LARGE_GROUP'] }</button>
            </c:forEach>
		</div>
		<div style="display: inline-block" class="jobMiddle">
		
		</div>
	</div>
	
	<div id="hireTabs-3">
		<div id="locationLi" style="display: inline-block" class="induLarge">
			<c:forEach var="map" items="${induList }">
           		<button value="${map['LARGE_NO'] }" id="op" class="btn head-btn2">${map['LARGE_GROUP'] }</button>
            </c:forEach>
		</div>
		<div style="display: inline-block" class="induMiddle">
		
		</div>
	</div>
	
	<div id="hireTabs-4">
		<div id="locationLi2" style="display: inline-block">
			<h5>고용형태</h5>
			<button id="recType" class="btn head-btn2" value="추후협의">추후협의</button>
			<button id="recType" class="btn head-btn2" value="인턴직">인턴직</button>
			<button id="recType" class="btn head-btn2" value="정규직">정규직</button>
			<button id="recType" class="btn head-btn2" value="계약직">계약직</button>
			<button id="recType" class="btn head-btn2" value="프리랜서">프리랜서</button>
			
		</div>
		<div style="display: inline" id="locationLi2">
			<h5>기업형태</h5>
			<button id="comTy" class="btn head-btn2" value="대기업">대기업</button>
			<button id="comTy" class="btn head-btn2" value="공기업">공사/공기업</button>
			<button id="comTy" class="btn head-btn2" value="중견기업">중견기업</button>
			<button id="comTy" class="btn head-btn2" value="중소기업">중소기업</button>
			<button id="comTy" class="btn head-btn2" value="스타트업">스타트업</button>
			<button id="comTy" class="btn head-btn2" value="외국계기업">외국계기업</button>
		</div>
		<div style="display: inline;" id="locationLi2">
			<h5>학력</h5>
			<div style="overflow-y: scroll; height: 275px;">
				<button id="eduLv" class="btn head-btn2" value="0">무관</button>
				<button id="eduLv" class="btn head-btn2" value="1">초등학교</button>
				<button id="eduLv" class="btn head-btn2" value="2">중학교</button>
				<button id="eduLv" class="btn head-btn2" value="3">고등학교</button>
				<button id="eduLv" class="btn head-btn2" value="4">대학(2~3년)</button>
				<button id="eduLv" class="btn head-btn2" value="5">대학(4년)</button>
				<button id="eduLv" class="btn head-btn2" value="6">대학원(석사)</button>
				<button id="eduLv" class="btn head-btn2" value="7">대학원(박사)</button>
			</div>
		</div>
	</div>
</div>
<div id="hireSearch">
	<form name="hireform" id="hireform" method="post">
		<table id="searchTable" style="margin-left: 40px;">
			<tr>
				<th>지역</th>
				<td><input type="text" id="tdLocation1" name="location1" style="width: 40px;" readonly="readonly"><input type="text" id="tdLocation2" name="location2" readonly="readonly"></td>
			</tr>
			<tr>
				<th>직무</th>
				<td><input type="text" id="tdJob1" name="jobType1" style="width: 115px;" readonly="readonly"><input type="text" id="tdJob2" name="jobType2" style="padding-left: 14px;" readonly="readonly"></td>
			</tr>
			<tr>
				<th>산업</th>
				<td><input type="text" id="tdIndu1" name="induType1" style="width: 127px;" readonly="readonly"><input type="text" id="tdIndu2" name="induType2" readonly="readonly"></td>
			</tr>
			<tr>
				<th>기업형태</th>
				<td><input type="text" id="tdComType" name="comType" readonly="readonly"></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><input type="text" id="tdHireType" name="recType" readonly="readonly"></td>
			</tr>
			<tr>
				<th>학력</th>
				<td><input type="text" id="tdEdu1" readonly="readonly"></td>
				<td><input type="hidden" id="tdEdu" name="educationLv" readonly="readonly"></td>
			</tr>
			<tr>
				<th>키워드</th>
				<td><input type="text" id="tdRecDetail" name="recDetail" value="${keyword }" placeholder="　키워드 입력"></td>
			</tr>
		</table>
		<div style="text-align: center; margin-top: 6px;">
			<input type="button" value="초기화" id="reset">
			<input type="button" onClick="hireInfo();" value="상세검색">
		</div>
	</form>
</div>
<div id="jobListDiv">
	<c:if test="${!empty list }">
		<c:forEach var="vo" items="${list }">
			<div class='single-job-items mb-30' style='width: 90%;margin: 0 auto; border: 1px solid #e0e0e08f; margin-top:20px;'>
				<div class="job-items">
					<div class="job-tittle">
						<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>"><h4>${vo.title }</h4></a>
						<ul>
							<li>${vo.comName }</li>
							<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
							<li>${vo.pay }</li>
						</ul>
					</div>
				</div>
				<div class='items-link f-right'>
					<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${vo.recruitmentCode }'/>">${vo.recType }</a>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${empty list }">
		<h5 style='width: 90%;margin: 0 auto; border: 1px solid #e0e0e08f; margin-top:20px; padding: 50px;'>등록된 채용공고가 없습니다.</h5>
	</c:if>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
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
	
	$('#induLarge').click(function() {
		$('#tdIndu1').val($('#induLarge option:selected').text());
	});
	$('#induMiddle').click(function() {
		$('#tdIndu2').val($('#induMiddle option:selected').text());
	});
	$('#recType').click(function() {
		$('#tdHireType').val($('#recType').val());
	});
	$('#comty').click(function() {
		$('#tdComType').val($('#comty').val());
	});
	$('#eduLv').click(function() {
		$('#tdEdu').val($('#eduLv').val());
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
				var option = "<div style='width: 224px; overflow-y: scroll; height: 320px;' id='jobMiddleDiv'>"
				for(var i = 0; i< res.length; i++){
					option += "<button value='"+res[i].MIDDLE_NO+"' class='btn head-btn1' style='width:200px; border: 1px solid white; padding: 22px;'>"+res[i].MIDDLE_GROUP+"</button>";
				}
				option+="</div>";
				$('.jobMiddle').append(option);
				
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
	
	$('#induLarge').click(function() {
		$('#tdIndu2').val('');
		var num = $('#induLarge').val();
		$('#induMiddle').empty();
		$.ajax({
			url:"<c:url value='/job/induMiddle.do'/>",
			type:"get",
			dataType:"json",
			data:"no="+num,
			success:function(res){
				for(var i = 0; i< res.length; i++){
					var option ="<option value='"+res[i].MIDDLE_NO+"'>"+res[i].MIDDLE_GROUP+"</option>";
					$('#induMiddle').append(option);
				}
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
	    	alert("에러발생");
	    }
	});
}

function makeListJson(res){
	var htmlStr = "";
	$(res).each(function(){
		htmlStr += "<div class='single-job-items mb-30' style='width: 90%;margin: 0 auto; border: 1px solid #e0e0e08f; margin-top:20px;'><div class='job-items'><div class='job-tittle'>";
		htmlStr += "<a href='<c:url value='/hireinpo/infoDetail.do?recruitmentCode="+this.recruitmentCode+"'/>'><h4>"+this.title+"</h4></a>";
		htmlStr += "<ul>";
		htmlStr += "<li>"+this.comName+"</li>";
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
    	padding: 0;
	}
	#hireTabs{
		float: left;
		width: 55%;
		height: 377px;
	}
	#hireSearch{
		float: right;
		width: 43%;
		border: 1.4px solid #c5c5c5;
		border-radius: 3px;
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
		width: 161px;
    	margin-left: 6px;
    	text-align: center;
    	float: left;
    	ma
	}
	
	#searchTable th{
		padding-top: 20px;
	    font-size: 1.1em;
	}
	#searchTable td{
		padding-top: 20px;
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
</style>
<%@ include file="../inc/sidebar.jsp"%>
<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
<h2 style="margin-bottom: 22px;">채용정보 상세검색</h2>
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
		<div id="locationLi" style="display: inline-block">
			<select size="10" id="induLarge">
				<c:forEach var="map" items="${induList }">
               		<option value="${map['LARGE_NO'] }">${map['LARGE_GROUP'] }</option>
                </c:forEach>
			</select>
		</div>
		<div style="display: inline-block" id="locationLi">
			<select id="induMiddle" size="10">
				
			</select>			
		</div>
	</div>
	
	<div id="hireTabs-4">
		<div id="locationLi2" style="display: inline-block">
			<h5>고용형태</h5>
			<select id="recType" name="recType" size="7" style="width: 160px">
				<option value="추후협의">추후협의</option>
				<option value="인턴직">인턴직</option>
				<option value="정규직">정규직</option>
				<option value="계약직">계약직</option>
				<option value="프리랜서">프리랜서</option>
			</select>
		</div>
		<div style="display: inline" id="locationLi2">
			<h5>기업형태</h5>
			<select id="comty" name="comty" size="7" style="width: 160px">
				<option value="대기업">대기업</option>
				<option value="공기업">공사/공기업</option>
				<option value="중견기업">중견기업</option>
				<option value="중소기업">중소기업</option>
				<option value="스타트업">스타트업</option>
				<option value="외국계기업">외국계기업</option>
			</select> 
		</div>
		<div style="display: inline" id="locationLi2">
			<h5>학력</h5>
			<select id="eduLv" name="eduLv" size="7" style="width: 160px">
				<option value="무관">무관</option>
				<option value="초등학교">초등학교</option>
				<option value="중학교">중학교</option>
				<option value="고등학교">고등학교</option>
				<option value="대학(2~3년) 졸업">대학(2~3년) 졸업</option>
				<option value="대학(4년) 졸업">대학(4년) 졸업</option>
				<option value="대학원(박사) 졸업">대학원(박사) 졸업</option>
			</select> 
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
				<td><input type="text" id="tdEdu" name="educationLv" readonly="readonly"></td>
			</tr>
			<tr>
				<th>키워드</th>
				<td><input type="text" id="tdRecDetail" name="recDetail" value="${keyword }" placeholder="　키워드 입력"></td>
			</tr>
		</table><br><br>
		<div style="text-align: center;">
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
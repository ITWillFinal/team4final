<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script>
$(function(){
	$( "#hireTabs" ).tabs();
	$('#sido').click(function() {
		$('#tdLocation1').val($('#sido').val());
	});
	$('#sigugun').click(function() {
		$('#tdLocation2').val($('#sigugun').val());
	});
	$('#jobLarge').click(function() {
		$('#tdJob1').val($('#jobLarge option:selected').text());
	});
	$('#jobMiddle').click(function() {
		$('#tdJob2').val($('#jobMiddle option:selected').text());
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
});

$(function() {
	$('#sido').click(function() {
		var sido = $('#sido').val();
		$('#sigugun').empty();
		$.ajax({
			url:"<c:url value='/sigugun.do'/>",
			type:"get",
			dataType:"json",
			data:"sido="+sido,
			success:function(res){
				$('#sigugun').append("<option>전체</option>");
				for(var i = 0; i< res.length; i++){
					var option ="<option value='"+res[i]+"'>"+res[i]+"</option>";
					$('#sigugun').append(option);
				}
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
	
	$('#jobLarge').click(function() {
		var num = $('#jobLarge').val();
		$('#jobMiddle').empty();
		$.ajax({
			url:"<c:url value='/job/jobMiddle.do'/>",
			type:"get",
			dataType:"json",
			data:"no="+num,
			success:function(res){
				$('#jobMiddle').append("<option>전체</option>");
				for(var i = 0; i< res.length; i++){
					var option ="<option value='"+res[i].MIDDLE_NO+"'>"+res[i].MIDDLE_GROUP+"</option>";
					$('#jobMiddle').append(option);
				}
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
	
	$('#induLarge').click(function() {
		var num = $('#induLarge').val();
		$('#induMiddle').empty();
		$.ajax({
			url:"<c:url value='/job/induMiddle.do'/>",
			type:"get",
			dataType:"json",
			data:"no="+num,
			success:function(res){
				$('#induMiddle').append("<option>전체</option>");
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
</script>
<style>
	#hireTabs{
		float: left;
		width: 55%;
		height: 370px;
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
	
	#locationLi{
		width: 200px;
		margin-left: 30px;
	}
	#locationLi2{
		width: 161px;
    	margin-left: 6px;
    	text-align: center;
    	float: left;
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
	input[type=submit]{
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
	input[type=reset]{
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
</style>
<%@ include file="../inc/sidebar.jsp"%>
<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
<h2 style="margin-bottom: 22px;">채용정보 상세검색</h2>
<div id="hireTabs">
	<ul>
		<li><a href="#hireTabs-1"><i class="fa fa-map-marker" aria-hidden="true"></i>　지역</a></li>
		<li><a href="#hireTabs-2"><i class="fa fa-briefcase" aria-hidden="true"></i>　직무</a></li>
		<li><a href="#hireTabs-3"><i class="fa fa-industry" aria-hidden="true"></i>　산업</a></li>
		<li><a href="#hireTabs-4"><i class="fa fa-building-o" aria-hidden="true"></i>　기업형태/고용형태/학력</a></li>
		
	</ul>
	
	<div id="hireTabs-1">
		<div id="locationLi" style="display: inline-block">
			<select size="10" id="sido">
				<option>전체</option>
				<c:forEach var="location" items="${locationList }">
					<option id="op" value="${location }">${location }</option>
				</c:forEach>
			</select>
		</div>
		<div style="display: inline" id="locationLi">
			<select id="sigugun" size="10">
				
			</select>			
		</div>
	</div>
	
	<div id="hireTabs-2">
		<div id="locationLi" style="display: inline-block">
			<select size="10" id="jobLarge">
				<option>전체</option>
				<c:forEach var="map" items="${jobList }">
               		<option value="${map['LARGE_NO'] }">${map['LARGE_GROUP'] }</option>
                </c:forEach>
			</select>
		</div>
		<div style="display: inline" id="locationLi">
			<select id="jobMiddle" size="10">
				
			</select>			
		</div>
	</div>
	
	<div id="hireTabs-3">
		<div id="locationLi" style="display: inline-block">
			<select size="10" id="induLarge">
				<option>전체</option>
				<c:forEach var="map" items="${induList }">
               		<option value="${map['LARGE_NO'] }">${map['LARGE_GROUP'] }</option>
                </c:forEach>
			</select>
		</div>
		<div style="display: inline" id="locationLi">
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
				<option value="무관">무관</option>
				<option value="초등학교">초등학교</option>
				<option value="중학교">중학교</option>
				<option value="고등학교">고등학교</option>
				<option value="대학(2~3년) 졸업">대학(2~3년) 졸업</option>
				<option value="대학(4년) 졸업">대학(4년) 졸업</option>
				<option value="대학원(박사) 졸업">대학원(박사) 졸업</option>
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
	<form action="">
		<table id="searchTable" style="margin-left: 40px;">
			<tr>
				<th>지역</th>
				<td><input type="text" id="tdLocation1" name="location1" style="width: 40px;"><input type="text" id="tdLocation2" name="location2"></td>
			</tr>
			<tr>
				<th>직무</th>
				<td><input type="text" id="tdJob1" name="jobType1" style="width: 115px;"><input type="text" id="tdJob2" name="jobType2" style="padding-left: 14px;"></td>
			</tr>
			<tr>
				<th>산업</th>
				<td><input type="text" id="tdIndu1" name="induType1" style="width: 127px;"><input type="text" id="tdIndu2" name="induType2"></td>
			</tr>
			<tr>
				<th>기업형태</th>
				<td><input type="text" id="tdComType" name="comType"></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><input type="text" id="tdHireType" name="recType"></td>
			</tr>
			<tr>
				<th>학력</th>
				<td><input type="text" id="tdEdu" name="educationLv"></td>
			</tr>
		</table><br><br>
		<div style="text-align: center;">
			<input type="reset" value="초기화">
			<input type="submit" value="상세검색">
		</div>
	</form>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
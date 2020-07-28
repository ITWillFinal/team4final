<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script>
$( function() {
  $( "#hireTabs" ).tabs();
} );

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
		width: 40%;
    	margin: 50px auto;
	}
	select option{
		padding: 5px;
		border: 1px solid lightgray;
		border-collapse: collapse;
	}
	select{
		border: 0;
	    width: 200px;
	    text-align: center;
	    background: #f3f3f3;
	}
	
	#locationLi{
		width: 200px;
	}
	
</style>
<%@ include file="../inc/sidebar.jsp"%>
<div style="float: left; width: 49%; margin-left: 30px; font-size: 14px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->

<div id="hireTabs">
	<ul>
		<li><a href="#hireTabs-1">지역</a></li>
		<li><a href="#hireTabs-2">직무</a></li>
		<li><a href="#hireTabs-3">산업</a></li>
	</ul>
	
	<div id="hireTabs-1">
		<div id="locationLi" style="display: inline-block">
			<select size="10" id="sido">
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
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
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
					var option ="<option value='"+res[i]+"'>"+res[i]+"</option>";
					$('#jobMiddle').append(option);
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
	    width: 100px;
	    text-align: center;
	    background: #f3f3f3;
	}
	
	#locationLi{
		width: 200px;
	}
	
</style>

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
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
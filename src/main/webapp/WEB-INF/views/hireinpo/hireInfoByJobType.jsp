<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#jobType{
		cursor: pointer;
	}
	#jobTypeDiv{
		margin-bottom: 50px;
	}
	button#jobType{
		width: 13%;
		padding: 24px 0px;
		margin-top: 10px;
	}
	
	#jobMiddle button{
		width: 19%;
	    padding: 17px 0px;
	    margin-top: 5px;
	    margin-left: 33px;
	}
	#infoDetail{
		width: 93%;
		margin: 50px 0;
	}
	
</style>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sidebar.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#jobTypeDiv button').click(function() {
			var num = $(this).val();
			$('#infoDetail').empty();
			$('#jobMiddle').empty();
			$('#search').empty();
			$.ajax({
				url:"<c:url value='/job/jobMiddle.do'/>",
				type:"get",
				dataType:"json",
				data:"no="+num,
				success:function(res){
					for(var i = 0; i< res.length; i++){
						var option ="<button class='btn head-btn1' value='"+res[i].MIDDLE_GROUP+"'>"+res[i].MIDDLE_GROUP+"</button>";
						$('#jobMiddle').append(option);
					}
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
		});
		
		$(document).on('click','#jobMiddle button', function() {
			var jobType2 = $(this).val();
			$('#search').append('<button style="color: #565656; border: 0.3px solid #c1c1c1;" value="'+jobType2+'">'+jobType2+' x</button>');
			$.ajax({
				url:"<c:url value='/hireinpo/searchJobMiddleType.do'/>",
				type:"get",
				dataType:"json",
				data:"jobType2="+jobType2,
				success:function(res){
					for(var i = 0; i< res.length; i++){
						var option = '<div id="'+res[i].jobType2+'">'
						option += '<div class="single-job-items mb-30" id="listOne"><div class="job-items"><div class="job-tittle">';
						option += '<a href="<c:url value="/hireinpo/infoDetail.do?recruitmentCode='+res[i].recruitmentCode+'"/>"><h4>'+res[i].title+'</h4></a>';
						option += '<ul><li>'+res[i].comName+'</li><li><i class="fa fa-briefcase" aria-hidden="true"></i>'+res[i].jobType2+'</li><li>'+res[i].pay+'</li>';
						option += '</div></div>';
						option += '<div class="items-link f-right"><a href="<c:url value="/hireinpo/infoDetail.do?recruitmentCode='+res[i].recruitmentCode+'"/>">'+res[i].recType+'</a>';
						option += '</div></div></div>';
						
						$('#infoDetail').append(option);
					}
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
		});
		
		$(document).on('click','#search button', function() {
			var delteId = $(this).val();
			$('#'+delteId).remove();
			$(this).remove();
		});
	});
</script>
<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
	<h2>직무별 채용정보</h2>
	<div id="jobTypeDiv">
		<c:forEach var="map" items="${jobList }">
			<button value="${map['LARGE_NO'] }" id="jobType" class="btn head-btn2">${map['LARGE_GROUP'] }</button>
		</c:forEach>
	</div>
	<div id="jobMiddle">
		
	</div>
	<div style="margin: 32px;" id="search">
	
	</div>
	<div id="infoDetail">
		
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/comMypageTop.jsp" %>
<script type="text/javascript">
	
	$(function(){
		$('.checkAll').change(function(){
			if($(this).is(':checked')){
				$(this).parent().parent().parent().parent().find('.checkMember').prop('checked', true); 
			}else{
				$(this).parent().parent().parent().parent().find('.checkMember').prop('checked', false); 				
			}
		});
		
		$('.checkMember').change(function(){
			if(!$(this).is(':checked')){
				$('.checkAll').prop('checked', false); 
			}
		});
		$('#button1').click(function(){
			var len=$(this).parent().parent().find('.checkMember:checked').length;
			if(len==0){
				alert('요청취소 할 이력서를 체크해주세요');
				return;
			}
			var resumeNoListforDel=[];
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					resumeNoListforDel.push($(this).val());					
				}
			});
			
			$.ajax({
				url:"<c:url value='/companypage/requestDelete.do'/>",
				type:"get",
				data: "resumeNoListforDel="+resumeNoListforDel,
				success:function(res){
					alert(res);
					
					
				},
				error:function(xhr, status, error){
					alert(status+","+error );
					return;
				}
			});
			
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					$(this).parent().parent().remove();
				}						
			});
		});

		$('#button2').click(function(){
			var len=$(this).parent().parent().find('.checkMember:checked').length;
			if(len==0){
				alert('처리완료 할 이력서를 체크해주세요');
				return;
			}
			var resumeNoListforJoin=[];
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					resumeNoListforJoin.push($(this).val());					
				}
			});
			
			$.ajax({
				url:"<c:url value='/companypage/yesToJoin.do'/>",
				type:"get",
				data: "resumeNoListforJoin="+resumeNoListforJoin,
				success:function(res){
					alert(res);
					
				},
				error:function(xhr, status, error){
					alert(status+","+error );
					return;
				}
			});
			
			$(this).parent().parent().find('.checkMember').each(function(){
				if($(this).is(':checked')){
					$(this).parent().parent().remove();
				}						
			});
		});
	
	})
		
	function open_resume(resumeNo){
		window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
				'RESUME','width=980,height=auto,left=0,top=0,location=yes,resizable=false')
	}

</script>
<style type="text/css">
	a{
		color:black;
		font-weight: bold;
	}

	hr{
		border-bottom: 2px dotted#88898c;
	    border-top: 0 none;
	    margin: 20px 0;
	    padding: 0;
	}
	.ST-main{
		margin:0 auto;
		width: 1055px;
		height: auto;
		min-height: 800px;
		margin-bottom: 30px;
	}
	
	.ST-main-top h1{
		font-weight: bold;
	}

	.search-result{
	 	/* display:inline-block; */
		background: white;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		padding: 10px;
		height: 400px;
		width:100%;
		margin-bottom: 15px;
	}
	
	.add-condition{
		display: inline-block;
		/* margin-right: 46px; */
	}

	.add-condition:last-child{
		margin-right: 0;
	}
	
	table{
		display: table;
    	border-collapse: collapse;
    	width: 100%;
	    border: 0;
	    border-left: 1px solid #eaeaea;
	    table-layout: fixed;
	    background-color: #fff;
	    text-align: center;
    	border-top: 2px solid #fb246a;
    	margin-top: 10px;
	}
	
	.tableRow{
		cursor:pointer;
	}
	
	tbody{
		height: 580px;
	}
	
	table th{
	    background: #f7f7f7;
	    border-bottom: 1px solid #eaeaea;
	    border-right: 1px solid #eaeaea;
	    text-align: center;
	    color: #444;
	    font-size: 14px;
	    font-weight: bold;
	    vertical-align: middle;
	    line-height: 14px;
	    height: 40px;
	}
	table td{
	    height: 40px;
	    border-right: 1px solid #eaeaea;
	    border-bottom: 1px solid #eaeaea;
	    color: #444;
	    font-size: 14px;
	    vertical-align: top;
	    line-height: 20px;
	    word-break: break-all;
	    font-family: "Malgun Gothic",dotum,gulim,sans-serif;
	}
	
	.search-result span{
		font-weight: bold;
	}
	
	.bttn1{
		width:100px;
		display: inline-block;
		margin-top: -0.5px;
		cursor: pointer;
	}
	
	.bttn1:hover{
		background: #ced4da;
		border:	1px solid #ced4da;
		color: white;
	}
	#titleSpan{
		margin: 2%;
    	font-size: 1.1em;
	}
</style>
<main>	
		<div class="ST-main">
			<div class="ST-main-top">
					<h1 style="background: white;font-weight: bold;">입사지원 요청관리</h1>
				<hr style="border: 1px solid #fb246a;margin: 30px 0;">
			</div>
				<div class="search-result">
				<div style="height:330px;overflow-y: auto;">
					<span id="titleSpan">입사지원 요청 현황</span>
					<table>
						<caption style="display: none;">입사지원 요청관리 테이블</caption>
							<col width=7%>
							<col width="15%">
							<col width="25%">
							<col width="9%">
							<col width="26%">
							<col width="18%">
						<colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" class="checkAll"></th>
								<th scope="col">이름</th>
								<th scope="col">최종학력</th>
								<th scope="col">경력</th>
								<th scope="col">희망연봉</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list[0] and empty list[1] }">
								<tr>
									<td colspan="6">관리할 입사요청이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list[0] or !empty list[1] }">
							<c:forEach var="waiting" items="${list[0] }">
								<tr>
									<td><input type='checkbox' class='checkMember' value='${waiting.resumeNo }'></td>
									<td class='tableRow' onclick='open_resume(${waiting.resumeNo})'>${waiting.userName }</td>
									<td class='tableRow' onclick='open_resume(${waiting.resumeNo})'>${waiting.finalEdu }</td>
									<td class='tableRow' onclick='open_resume(${waiting.resumeNo})'>
									<c:if test="${waiting.careerYear == '0'}">신입</c:if>
									<c:if test="${waiting.careerYear != '0'}">${waiting.careerYear }년</c:if>
									</td>
									<td class='tableRow' onclick='open_resume(${waiting.resumeNo})'>${waiting.sal }</td>
									<td class='tableRow' onclick='open_resume(${waiting.resumeNo})'>대기중</td>
								<tr>
							</c:forEach>
							<c:forEach var="no" items="${list[1] }">
								<tr>
									<td><input type='checkbox' class='checkMember' value='${no.resumeNo }'></td>
									<td class='tableRow' onclick='open_resume(${no.resumeNo})'>${no.userName }</td>
									<td class='tableRow' onclick='open_resume(${no.resumeNo})'>${no.finalEdu }</td>
									<td class='tableRow' onclick='open_resume(${no.resumeNo})'>${no.careerYear }</td>
									<td class='tableRow' onclick='open_resume(${no.resumeNo})'>${no.sal }</td>
									<td class='tableRow' onclick='open_resume(${no.resumeNo})'>입사거절</td>
								<tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div>
					<input type="button" class="form-control bttn1" value="요청취소" id='button1' style="float: right;"/>
				</div>
				</div>
				<div class="search-result">
				<div style="height:330px;overflow-y: auto;">
					<span id="titleSpan">입사지원 희망 현황</span>
					<table>
						<caption style="display: none;">입사지원 희망 현황 테이블</caption>
							<col width=7%>
							<col width="15%">
							<col width="25%">
							<col width="9%">
							<col width="26%">
							<col width="18%">
						<colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" class="checkAll"></th>
								<th scope="col">이름</th>
								<th scope="col">최종학력</th>
								<th scope="col">경력</th>
								<th scope="col">희망연봉</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list[2] }">
								<tr>
									<td colspan="6">관리할 입사희망 요청이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list[2] }">
							<c:forEach var="yes" items="${list[2] }">
								<tr>
									<td><input type='checkbox' class='checkMember' value='${yes.resumeNo }'></td>
									<td class='tableRow' onclick='open_resume(${yes.resumeNo})'>${yes.userName }</td>
									<td class='tableRow' onclick='open_resume(${yes.resumeNo})'>${yes.finalEdu }</td>
									<td class='tableRow' onclick='open_resume(${yes.resumeNo})'>${yes.careerYear }</td>
									<td class='tableRow' onclick='open_resume(${yes.resumeNo})'>${yes.sal }</td>
									<td class='tableRow' onclick='open_resume(${yes.resumeNo})'>입사희망</td>
								<tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div>
					<input type="button" class="form-control bttn1" value="처리완료" id='button2' style="float: right;"/>
				</div>
				</div>
			</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

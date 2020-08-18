<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 목록</title>
</head>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.readResume').click(function(){
		var $readOk = $(this).parent().parent();
		$.ajax({
			url:"<c:url value='/companypage/readcheck.do'/>",
			type:"get",
			data: "applyCode="+$(this).next().val(),
			success:function(res){
				$readOk.css("background","#cbe7ff");
			},
			error:function(xhr, status, error){
				alert(status+","+error );
			}
		});
	});
	
	$('.choiceStatus').change(function(){
		if(!$(this).val()!="지원중"){	
			if(confirm($(this).parent().next().text()+" 지원자를 "+$(this).val()+" 처리 하시겠습니까?\n처리 결과는 지원자에게 통보됩니다.")){
				var applyStatus = $(this).val();
				var applyCode = $(this).parent().next().next().next().find('input[type=hidden]').val();
				var $resultOk = $(this).parent();
				
				$.ajax({
					url:"<c:url value='/companypage/updateStatus.do'/>",
					type:"get",
					data: "applyStatus="+applyStatus+"&applyCode="+applyCode,
					success:function(res){
						if(res>0){
							alert("처리 완료 되었습니다.");	
							$resultOk.html(applyStatus);
						}else{
							alert("처리에 실패하였습니다. 관리자에게 문의해주세요.");												
						}
					},
					error:function(xhr, status, error){
						alert(status+","+error );
					}
				});
			}
		}
	});
})

function open_resume(resumeNo){
	window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
			'RESUME','width=980,height=auto,left=0,top=0,location=yes,resizable=false')
}
</script>
<style>
table{
	text-align: center;
	border-collapse: collapse;
}
th{
	border-bottom: 3px solid #FB246A;
	text-align: center;
    padding: 14px;
}
td{
	border-bottom: 1px solid #FB246A;
	padding: 13px;
}
</style>
<body>
<h3>${reVo.title } 모집 공고 지원자 현황</h3>
<c:if test="${!empty applyList }">
 총 지원자 <b style="color: #FB246A">${applyList.size() }</b>명
</c:if>
				<div style="height:290px; overflow-y: auto;">
					<table>
						<caption style="display: none;">지원자 현황 테이블</caption>
							<col width=8%>
							<col width=23%>
							<col width=23%>
							<col width=23%>
							<col width=23%>							
						<colgroup>
						<thead>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">합격여부</th>
								<th scope="col">이름</th>
								<th scope="col">지원일</th>
								<th scope="col"><a>이력서 보기</a></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty applyList }">
								<tr>
									<td colspan="5">지원자가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty applyList }">
							<c:set var="no" value="1"/>
							<c:forEach var="map" items="${applyList }">
								<tr 
								<c:if test="${!empty map['READ_CHECK'] }">
									style="background:#cbe7ff";
								</c:if>
								>
									<td>${no }</td>
									<td>
										<c:if test="${map['APPLY_STATUS']=='지원중' }">
										<select class="choiceStatus">
											<option>선택</option>
											<option value="합격">합격</option>
											<option value="불합격">불합격</option>										
										</select>
										</c:if>
									<c:if test="${map['APPLY_STATUS']!='지원중' }">
										${map['APPLY_STATUS'] }																				
									</c:if>									
									</td>
									<td>${map['USER_NAME'] }</td>
									<td>${map['REGDATE'] }</td>
									<c:if test="${map['RESUME_TYPE'] =='0' }">
										<td>
										<a style="cursor: pointer;" class="readResume" onclick="open_resume(${map['RESUME_NO']})">이력서 보기</a>
										<input type="hidden" value="${map['APPLY_CODE'] }">
										</td>
									</c:if>
									<c:if test="${map['RESUME_TYPE'] =='1' }">
										<td><a style="cursor: pointer;" class="readResume" onclick="">이력서 보기</a></td>
									</c:if>
								</tr>
								<c:set var="no" value="${no+1 }"/>								
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
</body>
</html>
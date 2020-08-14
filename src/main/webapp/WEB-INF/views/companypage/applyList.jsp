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

function open_resume(resumeNo){
	window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
			'RESUME','width=980,height=auto,left=0,top=0,location=yes,resizable=false')
}
</script>
<body>
				<div style="height:290px; overflow-y: auto;">
					<table>
						<caption style="display: none;">인재 검색 결과 테이블</caption>
							<col width=25%>
							<col width=25%>
							<col width=25%>
							<col width=25%>							
						<colgroup>
						<thead>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">이름</th>
								<th scope="col">지원일</th>
								<th scope="col"><a>이력서 보기</a></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty applyList }">
								<tr>
									<td colspan="4">지원자가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty applyList }">
							<c:set var="no" value="1"/>
							<c:forEach var="map" items="${applyList }">
								<tr>
									<td>${no }</td>
									<td>${map['USER_NAME'] }</td>
									<td>${map['REGDATE_1'] }</td>
									<c:if test="${map['RESUME_TYPE'] =='0' }">
										<td><a onclick="open_resume(${map['RESUME_NO']})">이력서 보기</a></td>
									</c:if>
									<c:if test="${map['RESUME_TYPE'] =='1' }">
										<td><a onclick="">이력서 보기</a></td>
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
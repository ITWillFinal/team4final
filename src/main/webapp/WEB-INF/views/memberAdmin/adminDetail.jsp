<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#list').click(function() {
			location.href = "<c:url value = '/memberAdmin/adminInfo.do'/>";
		});
		
		$('#edit').click(function() {
			location.href = "<c:url value = '/memberAdmin/adminEdit.do?adminNo=${vo.adminNo}'/>";
		});
	});
</script>


<style>
a {
	color: black;
}

h4{
	margin-top: 5px; 
	font-weight: 800;
}

#outDiv{
    padding: 75px 35px 90px 35px;
	width: 750px;
}
/* 버튼 */
input#delete {
    margin-left: 5px;
    margin-right: 5px;
}
div.bts {
    margin-top: 50px;
}
input#reEdit {
    margin-right: 5px;
}
input#reDel {
    margin-right: 5px;
}

/* 답변 테이블 */
td.c {
    padding-left: 55px;
}
td {
    padding-top: 20px;
}

</style>
	<!-- Id에 따라 top, sidebar, bottom 변경 -->
	<%@ include file="../inc/adminTop.jsp"%>
<main>
	<%-- <%@ include file="../side_inc/company_Sidebar.jsp"%> --%>

	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<h4>-관리자 상세보기-</h4>
		<div style="text-align: center; margin: 5px; /* border: 1px solid lightgray; */">
			<div id="outDiv">
				<table>
					<tr>
						<td>관리자  ID</td>
						<td>${vo.adminId }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${vo.adminName }</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${vo.tel}</td>
					</tr>
					<tr>
						<td>관리등급</td>
						<td>
							<c:if test="${vo.levels==1 }">
								1등급
							</c:if>
							<c:if test="${vo.levels==2 }">
								2등급
							</c:if>
							<c:if test="${vo.levels==3 }">
								3등급
							</c:if>
						</td>
					</tr>
					<tr>
						<td>관리자 등록일</td>
						<td>${vo.regDate}</td>
					</tr>
				</table>
				<input type="button" id = "list" value = "목록으로">
				<input type="button" id = "edit" value = "권한수정">
			</div>
		</div>
	</div>
</main>

<%@ include file="../inc/adminBottom.jsp"%>
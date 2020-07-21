<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/top.jsp"%>
<style>
h2 {
    padding-left: 300px;
    padding-top: 20px;
}
#frm{
    padding-left: 300px;
    padding-top: 30px;
    padding-bottom: 50px;
}
table{
	border-bottom: 1px solid lightgray;
}
th{
	border-bottom: 3px solid lightgray;
	text-align: center;
}
td{
	border-bottom: 1px solid lightgray;
	padding: 5px;
}
a{
	color: black;
}
</style>

<div>
<h2>자주찾는 질문 관리</h2>
	<form id = "frm" action="post">
		<table style="width: 700px;">
			<colgroup>
			   <col style="width:10%;" />
			   <col style="width:30%;" />
			   <col style="width:30%;" />
			   <col style="width:30%;" />
			</colgroup>
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>질문</th>
				<th>답변</th>
			</tr>
			<c:if test="${empty list }">
				<th colspan="4">등록된 자주찾는 질문이 없습니다.</th>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var = "vo" items="${list }">
					<tr>
						<td style="text-align: center;">${vo.fnqNo }</td>
						<td>${vo.category }</td>
						<td>
							<a href
								="<c:url value='/gogak/faqDetail.do?no=${vo.fnqNo}'/>">
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<c:if test = "${fn:length(vo.question)>=30 }">
									${fn:substring(vo.title,0,30)}...
								</c:if>
								<c:if test="${fn:length(vo.question)<30 }">
									${vo.question }							
								</c:if>
							</a>
						</td>
						<td>${vo.answer }</td>
					</tr>
					
					
				</c:forEach>
			</c:if>
		</table>
	</form>
</div>






<%@ include file="../inc/bottom.jsp"%>
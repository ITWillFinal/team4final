<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<style>
	table{
		color: black;
		font-size: 1.2em;
		border-bottom: 1px solid gray;
	}	
</style>
<div>
	<h1>공지사항</h1>
	<table style="width: 95%;">
		<colgroup>
			<col style="width:10%;">
			<col style="width:50%;">
			<col style="width:20%;">
		</colgroup>
		<tr>
			<th>타입</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<tr>
			<c:if test="${empty list }">
				<td colspan="3">등록된 공지사항이 없습니다.</td>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }">
					<td style="text-align: center;">${vo.type }</td>
					<td>${vo.title }</td>
					<td style="text-align: center;"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
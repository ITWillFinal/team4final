<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<div>
	<h1>공지사항</h1>
	<table>
		<colgroup>
			<col>
			<col>
			<col>
		</colgroup>
		<tr>
			<td>타입</td>
			<td>제목</td>
			<td>등록일</td>
		</tr>
		<tr>
			<c:forEach>
				<th></th>
							
			</c:forEach>
		</tr>
	</table>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
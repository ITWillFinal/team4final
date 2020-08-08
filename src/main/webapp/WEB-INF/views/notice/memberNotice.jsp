<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sidebar.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#typeSelect').change(function() {
			$('form[name=frm]').submit();
		});
	});
</script>

<div style="overflow: hidden; width: 1055px; padding-left: 25px; font-size: 14px; margin-top: 10px;">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
	<div>
		<h2 style="margin-left: 20px">공지사항</h2>
		<form action="<c:url value='/notice/memberNotice.do'/>" method="post" name="frm">
			<select id="typeSelect" name="searchKeyword">
				<option value="안내" <c:if test="${keyword == '안내' }">selected="selected"</c:if>>안내</option>
				<option value="오픈" <c:if test="${keyword == '오픈' }">selected="selected"</c:if>>오픈</option>
				<option value="이벤트" <c:if test="${keyword == '이벤트' }">selected="selected"</c:if>>이벤트</option>
				<option value="기타" <c:if test="${keyword == '기타' }">selected="selected"</c:if>>기타</option>
			</select>
		</form>
		<table>
			<colgroup>
				<col style="width:10%;">
				<col style="width:60%;">
				<col style="width:20%;">
			</colgroup>
			<tr>
				<th>타입</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">등록된 공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:set var="idx" value="0"/>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td style="color:#3b38ff; font-weight: bold;">${vo.type }</td>
						<td style="text-align: left;"><a href="<c:url value='/notice/noticeDetail.do?noticeNo=${vo.noticeNo }'/>" style="color: black">${vo.title }</a></td>
						<td style="color:#777777"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<c:set var = "idx" value = "${idx+1 }"/>
				</c:forEach>
			</c:if>
		</table>
		<div id="pagingDiv">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 ◀ -->
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
				◁
			</a>
		</c:if>
		
		<!-- 페이지 번호 1~10 -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">		
			<c:if test="${i!=pagingInfo.currentPage }">
				<span><a href="#" onclick="pageProc(${i})">${i}</a></span>
			</c:if>
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold;">${i}</span>
			</c:if>		
		</c:forEach>
		</div>
		
		<!-- 다음 블럭으로 이동 ▶ -->
		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
				▷
			</a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
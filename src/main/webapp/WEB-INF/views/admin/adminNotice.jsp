<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript">
$(function() {
	$('#chkAll').click(function() {
		$('td input[type=checkbox]').prop('checked', this.checked);		
	});
	
	$('#btAdd').click(function() {
		location.href="<c:url value='/admin/adminAddNotice.do'/>";
	});
	$('#btDel').click(function() {
		var len = $('input[type=checkbox]:checked').length;
		if(len == 0){
			alert("삭제하려는 게시글을 먼저 체크하세요.");
			return;
		}
		
		$('form[name=frmList]').prop("action","<c:url value='/admin/adminNoticeDelete.do'/>");
		$('form[name=frmList]').submit();
		
	});
	
});

function pageProc(curPage){
	location.href="<c:url value='/admin/adminNotice.do?currentPage="+curPage+"'/>";
}
</script>
<style>
	table{
		color: black;
		font-size: 1.2em;
	}
	td{
	}
	tr{
		border-bottom: 1px solid #9a9a9a5e;
		height: 50px;
	}
	#pagingDiv{
	    text-align: center;
	    margin: 20px 0px;
	    font-size: 1.1em;
	}
	#pagingDiv span{
		border: 1px solid;
		padding: 2px 6px;
	}
	#pagingDiv span a{
		color: #444;
	}
	
	input[type=button]{
		width: 90px;
	    height: 40px;
	    background: #f7f7f7;
	    border: 0;
	    font-weight: bold;
	    color: black;
	    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
	}
	
	form[name=frmList]{
		text-align: center;
	}
</style>
<div>
	<h1>공지사항</h1>
	<form name="frmList" method="post" action="<c:url value='/admin/adminNotice.do'/>">
		
		<table style="width: 95%;">
			<colgroup>
				<col style="width:3%;">
				<col style="width:10%;">
				<col style="width:60%;">
				<col style="width:20%;">
				<col style="width:5%;">
			</colgroup>
			<tr style="background:#d6d6d678">
				<th><input type="checkbox" id="chkAll"></th>
				<th>타입</th>
				<th>제목</th>
				<th>등록일</th>
				<th>유형<th>
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
						<td><input type="checkbox" value="${vo.noticeNo }" name="listNotice[${idx }].noticeNo"></td>
						<td style="color:#3b38ff; font-weight: bold;">${vo.type }</td>
						<td style="text-align: left;"><a href="<c:url value='/admin/adminNoticeDetail.do?noticeNo=${vo.noticeNo }'/>" style="color: black">${vo.title }</a></td>
						<td style="color:#777777"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
						<td>${vo.memberType }<td>
					</tr>
					<c:set var = "idx" value = "${idx+1 }"/>
				</c:forEach>
			</c:if>
		</table>
		<div id="pagingDiv">
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
		<input type="button" value="글등록" id="btAdd">
		<input type="button" value="글삭제" id="btDel">
	</form>
	
</div>
<%@ include file="../inc/adminBottom.jsp"%>
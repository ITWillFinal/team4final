<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script src="<c:url value='/editor/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('content',{
			filebrowserUploadUrl:"<c:url value=''/>"
		});
	})
	
</script>
<div>
	<h1>공지사항</h1>
	<form action="<c:url value='/admin/adminAddNotice.do'/>" method="post">
		<select style="width: 12%" id="type" name="type">
			<option value="안내">안내 </option>
			<option value="오픈">오픈 </option>
			<option value="이벤트">이벤트 </option>
			<option value="기타">기타 </option>
		</select>
		<input type="text" style="width: 85%;" id="title" name="title">
		<textarea id="content" name="content"></textarea>
		<input type="submit" value="글등록">
	</form>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
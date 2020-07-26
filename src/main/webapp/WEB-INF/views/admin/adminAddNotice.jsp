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
	<select style="width: 12%">
		<option>안내 </option>
		<option>오픈 </option>
		<option>이벤트 </option>
		<option>기타 </option>
	</select>
	<input type="text" style="width: 85%;">
	<textarea id="content" name="content"></textarea>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
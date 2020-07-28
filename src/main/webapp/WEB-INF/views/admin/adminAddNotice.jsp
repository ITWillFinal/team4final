<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script src="<c:url value='/editor/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('content',{
			filebrowserUploadUrl:"<c:url value=''/>"
		});
		
		$('form[name=frm]').submit(function() {
			if($('#title').val().length < 1){
				alert('제목을 입력해주세요.');
				$('#title').focus();
				event.preventDefault();
			}else if($('#type').val() == '0'){
				alert('유형을 선택해주세요.');
				$('#type').focus();
				event.preventDefault();
			}else if($('#memberType').val() == '0'){
				alert('회원유형을 선택해주세요.');
				$('#memberType').focus();
				event.preventDefault();
			}
		});
		
		$('#btList').click(function() {
			location.href="<c:url value='/admin/adminNotice.do'/>";
		});
	})
</script>
<div>
	<h1>공지사항</h1>
	<form action="<c:url value='/admin/adminAddNotice.do'/>" method="post" name="frm" style="margin-top: 30px;">
		<select style="width: 10%" id="type" name="type">
			<option value="0">유형 </option>
			<option value="안내">안내 </option>
			<option value="오픈">오픈 </option>
			<option value="이벤트">이벤트 </option>
			<option value="기타">기타 </option>
		</select>
		<select style="width: 10%" id="memberType" name="memberType">
			<option value="0">회원유형 </option>
			<option value="U">일반회원 </option>
			<option value="C">기업회원 </option>
		</select>
		<input type="text" style="width: 77%;" id="title" name="title">
		<textarea id="content" name="content"></textarea>
		<input type="submit" value="글 등록">
	</form>
	<input type="button" value="글 목록" id="btList">
</div>
<%@ include file="../inc/adminBottom.jsp"%>
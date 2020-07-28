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
<style>
	input[type=button], input[type=submit]{
		width: 90px;
	    height: 40px;
	    background: #f7f7f7;
	    border: 0;
	    font-weight: bold;
	    color: black;
	    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
	}
</style>
<div>
	<h1>공지사항</h1>
	<form action="<c:url value='/admin/adminEditNotice.do'/>" method="post" name="frm" style="margin-top: 30px; text-align: center;">
		<input type="hidden" value="${vo.noticeNo }" name="noticeNo">
		<select style="width: 10%" id="type" name="type">
			<option value="안내" <c:if test="${vo.type =='안내' }">
				selected="selected"
			</c:if>>안내 </option>
			<option value="오픈" <c:if test="${vo.type =='오픈' }">
				selected="selected"
			</c:if>>오픈 </option>
			<option value="이벤트" <c:if test="${vo.type =='이벤트' }">
				selected="selected"
			</c:if>>이벤트 </option>
			<option value="기타" <c:if test="${vo.type =='기타' }">
				selected="selected"
			</c:if>>기타 </option>
		</select>
		<select style="width: 10%" id="memberType" name="memberType">
			<option value="U" 
			<c:if test="${vo.memberType =='U' }">
				selected="selected"
			</c:if>>일반회원 </option>
			<option value="C"
			<c:if test="${vo.memberType =='C' }">
				selected="selected"
			</c:if>>기업회원 </option>
		</select>
		<input type="text" style="width: 77%;" id="title" name="title" value="${vo.title }">
		<textarea id="content" name="content">${vo.content }</textarea>
		<br>
		<input type="submit" value="글 수정">
		<input type="button" value="글 목록" id="btList">
	</form>
</div>
<%@ include file="../inc/adminBottom.jsp"%>
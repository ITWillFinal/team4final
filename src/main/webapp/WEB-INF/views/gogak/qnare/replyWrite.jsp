<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 댓글달기 -->
	<form name="rere" method="post" action="<c:url value = '/gogak/qnare/replyWrite.do'/>">
		<input type="text" name = "no" value = "${vo.qnaNo }">
		<fieldset>
			<b>댓글</b>
				<div>
					<label for = "rename">이름</label>
					<input type = "text" name = "name">
				</div>
				<div>
					<textarea name="content" cols="40" rows="8" ></textarea>
					<input type="submit" id="resubmit" value="답변등록">
					<input type="reset" value = "취소">
				</div>
		</fieldset>
	</form>
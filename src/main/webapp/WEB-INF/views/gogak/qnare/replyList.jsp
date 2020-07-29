<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(function() {
		$('#reEdit').click(function() {
			location.href = "<c:url value='/gogak/qnare/replyEdit.do?no=${revo.no}'/>";
		});

		$('#reDel').click(function() {
			var str = confirm('${revo.no}번 답변을 삭제하시겠습니까?');

			if (str) {
				//true
				location.href = "<c:url value = '/gogak/qnare/replyDelete.do?no=${revo.no}'/>";
			} else {
				event.preventDefault;
				/* location.href = "<c:url value='/gogak/qnare/qnaDetail.do?no=${revo.no}'/>"; */
			}
		});
	})
</script>
	<form name="rere" method="post" action="<c:url value = '/gogak/qnare/replyList.do'/>">
		<input type="text" name = "qnaNo" value = "${vo.qnaNo }">
		<table>
			<tr>
				<td>작성자</td>
				<td>${revo.name}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${revo.regdate}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${revo.content}</td>
			</tr>
		</table>
		<input type="button" id="reEdit" value="답변수정">
		<input type="button" id="reDel" value="답변삭제">
	</form>
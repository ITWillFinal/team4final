<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function(){
			location.href 
				= "<c:url value='/gogak/faqList.do'/>";	
		});
		
		
	})
	
</script>


<style>
div#outDiv {
    padding-left: 300px;
}
td {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}
input#ddd {
    margin-left: 280px;
    margin-top: 10px;
    margin-bottom: 10px;
}

input#rrr {
    margin-left: 20px;
}
</style>


<div id="outDiv">
	<form name = "frmWrite" method="post" 
		action="<c:url value = '/gogak/faqEdit.do'/>">
		<input type = "text" value = "${vo.fnqNo }" name = "no">
		<table style="width: 700px; border: 1px solid lightgray;">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 80%;" />
			</colgroup>
			<tr>
				<h4>자주 찾는 질문 수정하기</h4>
				<td>카테고리</td>
				<td>
					<input type="text" name = "category"
						value = "${vo.category }">
				</td>
			</tr>
	
			<tr>
				<td>질문</td>
				<td>
					<input type="text" name = "question"
						value = "${vo.question }">
				</td>
			</tr>
	
			<tr>
				<td>답변내용</td>
				<td id = "tdA">
					<textarea rows="7px" cols="50px" name = "answer">${fn:replace(vo.answer , newLine, '<br>')}</textarea>
				</td>
			</tr>
		</table>
		
		<div>
			<input type = "submit" value = "수정" id = "ddd">
			<input type = "button" value = "글목록" id = "rrr">
		</div>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>
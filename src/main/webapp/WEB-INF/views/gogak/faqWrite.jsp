<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>

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
		action="<c:url value = '/gogak/faqWrite.do'/>">
		<table style="width: 700px; border: 1px solid lightgray;">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 80%;" />
			</colgroup>
			<tr>
				<h4>자주 찾는 질문 등록하기</h4>
				<td>카테고리</td>
				<td>
				<!-- vo에서 읽어와서 for돌리기 -->
					<input type="text" name = "category">
					<!-- <select name = "category">
						<option value="a">A</option>
						<option value="b">B</option>
						<option value="c">C</option>
					</select><br> -->
				</td>
			</tr>
	
			<tr>
				<td>질문</td>
				<td><input type="text" name = "question"></td>
			</tr>
	
			<tr>
				<td>답변내용</td>
				<td id = "tdA">
					<textarea rows="7px" cols="50px" name = "answer">
					</textarea>
				</td>
			</tr>
		</table>
		
		<div>
			<input type = "submit" value = "등록" id = "ddd">
			<input type = "button" value = "취소" id = "rrr">
		</div>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>
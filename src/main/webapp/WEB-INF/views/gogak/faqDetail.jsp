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
		
		$('#ddd').click(function(){
			location.href 
				= "<c:url value='/gogak/faqEdit.do?no=${vo.fnqNo}'/>";	
		});
		
		$('#delete').click(function() {
			var str = confirm('${vo.fnqNo}번 글을 삭제하시겠습니까?');
			
			if(str){
				//true
				location.href
					= "<c:url value = '/gogak/faqDelete.do?no=${vo.fnqNo}'/>";
			}else{
				event.preventDefault;
				location.href 
				= "<c:url value='/gogak/faqDetail.do?no=${vo.fnqNo}'/>";
			}
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
    margin-left: 250px;
    margin-top: 10px;
    margin-bottom: 10px;
}

input#rrr {
    margin-left: 20px;
}
input#delete {
    margin-left: 20px;
}
</style>


<div id="outDiv">
	<table style="width: 700px; border: 1px solid lightgray;">
		<colgroup>
			<col style="width: 20%;" />
			<col style="width: 80%;" />
		</colgroup>
		<tr>
			<h4>자주 찾는 질문 상세보기</h4>
			<input type = "text" value = "${vo.fnqNo }" name = "no">
			<td>카테고리</td>
			<hr>
			<td>
				<span>${vo.category }</span>
			<hr>
			</td>
		</tr>

		<tr>
			<td>질문</td>
			<hr>
			<td>
				<span>${vo.question }</span>
			<hr>
			</td>
		</tr>

		<tr>
			<td>답변내용</td>
			<hr>
			<td id = "tdA">
				<span>${fn:replace(vo.answer , newLine, '<br>')}</span>
			<hr>
			</td>
		</tr>
	</table>
	
	<div>
		<input type = "submit" value = "글수정" id = "ddd">
		<input type = "button" value = "글삭제" id = "delete">
		<input type = "button" value = "글목록" id = "rrr">
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
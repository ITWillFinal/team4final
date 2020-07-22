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

tr span, td, p{
	padding-left: 30px;
}

td {
    padding-top: 30px;
}

table{
	
	width: 700px;
	border: 2px ridge lightgray;
}

h4 {
    padding-bottom: 30px;
    padding-top: 40px;
}

.al{
	text-align: right;
}
</style>


<div id="outDiv">
	<h4>자주 찾는 질문 상세보기</h4>
	<input type = "hidden" value = "${vo.fnqNo }" name = "no">
	<table>
		<colgroup>
			<col style="width: 30%;" />
			<col style="width: 70%;" />
		</colgroup>
		<tr>
			<td>
				<p id = "al">
					카테고리
				</p>
			</td>
			<td>
				<span>${vo.category }</span>
			
			</td>
		</tr>

		<tr>
			<td>
				<p id = "al">
					질문
				</p>
			</td>
			<td>
				<span>${vo.question }</span>
			
			</td>
		</tr>
		
		<tr>
			<td>
				<p id = "al">
					답변내용
				</p>
			</td>
			<td id = "tdA">
				<p>
					<% pageContext.setAttribute("newLine", "\r\n"); %>
					${fn:replace(vo.answer, newLine, '<br>')}
				</p>
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
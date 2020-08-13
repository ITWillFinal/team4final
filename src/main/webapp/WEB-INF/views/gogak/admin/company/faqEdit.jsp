<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../../inc/adminTop.jsp"%>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function(){
			location.href 
				= "<c:url value='/gogak/admin/company/faqList.do'/>";	
		});
	})
</script>


<style>
div#outDiv {
    padding-left: 30px;
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
a{
	color: black;
}
input[type=button] {
    width: 60px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 2%;
}
input[type=submit] {
    width: 60px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 2%;
}

body > div.wrapper > div > div > div.span9 > div > main > div {
    box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
}
</style>



<main>
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px; /* border:1px solid lightgray; */">
		<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
		<h2 style = "padding-left: 50px; padding-top: 30px; ">자주찾는 질문 수정하기(기업)</h2>
		</div>
		<div style="margin:5px; /* border:1px solid lightgray; */">

			<div id="outDiv">
				<form name = "frmWrite" method="post" 
					action="<c:url value = '/gogak/admin/company/faqEdit.do'/>">
					<label for ="no">no</label>
					<input type = "hidden" value = "${vo.faqNo }" name = "no">
					<table style="width: 700px; /* border: 1px solid lightgray; */">
						<colgroup>
							<col style="width: 20%;" />
							<col style="width: 80%;" />
						</colgroup>
						<tr>
							<td>카테고리</td>
							<td>
							<!-- vo에서 읽어와서 for돌리기 -->
								<!-- <select name = "category">
									<option value="a">A</option>
									<option value="b">B</option>
									<option value="c">C</option>
								</select><br> -->
								<input type="text" name = "category" class = "tb1"
									value = "${vo.category }">
							</td>
						</tr>
				
						<tr>
							<td>질문</td>
							<td><input type="text" name = "question" class = "tb2"
							value = "${vo.question }"></td>
						</tr>
				
						<tr>
							<td>답변내용</td>
							<td id = "tdA">
								<textarea rows="7px" cols="50px" name = "answer">${fn:replace(vo.answer , newLine, '<br>')}</textarea>
							</td>
						</tr>
					</table>
					
					<div>
						<input type = "submit" value = "글수정" id = "ddd">
						<input type = "button" value = "글목록" id = "rrr">
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../../inc/adminBottom.jsp"%>
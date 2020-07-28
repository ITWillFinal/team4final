<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/adminTop.jsp"%>

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
</style>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function() {
			location.href = "<c:url value = '/gogak/company/faqList.do'/>";
		});
	});
</script>
<main>
	<%@ include file="../side_inc/company_Sidebar.jsp"%>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px; /* border:1px solid lightgray; */">
		<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
		<h2 style = "padding-left: 50px; padding-top: 30px; ">자주찾는 질문 등록하기</h2>
		</div>
		<div style="margin:5px;">

			<div id="outDiv">
				<form name = "frmWrite" method="post" 
					action="<c:url value = '/gogak/company/faqWrite.do'/>">
					<table style="width: 700px;">
						<colgroup>
							<col style="width: 20%;" />
							<col style="width: 80%;" />
						</colgroup>
						<tr>
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
								<textarea rows="7px" cols="50px" name = "answer"></textarea>
							</td>
						</tr>
					</table>
					
					<div>
						<input type = "submit" value = "글등록" id = "ddd">
						<input type = "button" value = "글목록" id = "rrr">
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/adminBottom.jsp"%>
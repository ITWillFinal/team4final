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
				= "<c:url value='/gogak/admin/personal/faqList.do'/>";	
		});
	})
</script>
<style>
div#outDiv {
    padding-left: 11%;
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

#o {
    box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
}
td.a {
    padding-left: 8%;
    padding-right: 10%;
    width: 100%;
}
#outDiv > form > table > tbody > tr:nth-child(3) > td > input[type=text] {
    width: 85%;
}
body > div.wrapper > div > div > div.span9 > div > main > div {
    box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
}
td.b {
    padding-left: 8%;
}
select#category {
    margin-left: 38%;
}
#tdA > textarea {
    width: 85%;
}
</style>

<main>
	<!-- main -->
	<div style="float: left;margin-left:30px; width: 100%; font-size: 14px; /* border:1px solid lightgray; */">
		<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
		<h2 style = "padding-left: 50px; padding-top: 30px; ">자주찾는 질문 수정하기(일반)</h2>
		</div>
		<div style="margin:5px; /* border:1px solid lightgray; */">
			<div id="outDiv">
				<form name = "frmWrite" method="post" 
					action="<c:url value = '/gogak/admin/personal/faqEdit.do'/>">
					<input type = "hidden" value = "${vo.faqNo }" name = "no">
					<table style="width: 100%; /* border: 1px solid lightgray; */">
						<colgroup>
							<col style="width: 20%;" />
							<col style="width: 80%;" />
						</colgroup>
						<tr>
							<td class = "b">카테고리</td>
							<td>
								<select name="category" id = "category">
									<option value="0">선택하세요</option>
									<option value="채용정보"
										<c:if test="${vo.category eq '선택하세요'}">
											selected="selected"
										</c:if>
									>채용정보</option>
									<option value="스크랩 관련"
										<c:if test="${vo.category eq '스크랩 관련'}">
											selected="selected"
										</c:if>
									>스크랩 관련</option>				
									<option value="공지"
										<c:if test="${vo.category eq '공지'}">
											selected="selected"
										</c:if>
									>공지</option>				
									<option value="안내"
										<c:if test="${vo.category eq '안내'}">
											selected="selected"
										</c:if>
									>안내</option>				
									<option value="기타"
										<c:if test="${vo.category eq '기타'}">
											selected="selected"
										</c:if>
									>기타</option>
								</select>
							</td>
						</tr>
				
						<tr>
							<td class = "a" colspan="2">질문</td>
						</tr>
						<tr>
							<td class = "a" colspan="2"><input type="text" name = "question" class = "tb2"
							value = "${vo.question }"></td>
						</tr>
				
						<tr>
							<td class = "a" colspan="2">답변내용</td>
						</tr>
						<tr>
							<td class = "a" colspan="2" id = "tdA">
								<textarea rows="7px" cols="50px" name = "answer">${fn:replace(vo.answer , newLine, '<br>')}</textarea>
							</td>
						</tr>
					</table>
					
					<div id = "bts">
						<input type = "submit" value = "글수정" id = "ddd">
						<input type = "button" value = "글목록" id = "rrr">
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../../inc/adminBottom.jsp"%>
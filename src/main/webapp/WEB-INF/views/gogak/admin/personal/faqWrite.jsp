<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../inc/adminTop.jsp"%>

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
    border: 1px solid lightgray;
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
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function() {
			location.href = "<c:url value = '/gogak/admin/personal/faqList.do'/>";
		});
	});
</script>
<main>
	
	<!-- main -->
	<div style="float: left; margin-left:30px; width: 100%; font-size: 14px; /* border:1px solid lightgray; */">
		<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
		<h2 style = "padding-left: 50px; padding-top: 30px; ">자주찾는 질문 등록하기(개인)</h2>
		</div>
		<div style="margin:5px; /* border:1px solid lightgray; */">
			<div id="outDiv">
				<form name = "frmWrite" method="post" 
					action="<c:url value = '/gogak/admin/personal/faqWrite.do'/>">
					<table style="width: 100%">
						<colgroup>
							<col style="width: 20%;" />
							<col style="width: 80%;" />
						</colgroup>
						<tr>
							<td class = "b">카테고리</td>
							<td>
								<select name="category" id = "category">
									<option value="0">선택하세요</option>
									<option value="채용정보">채용정보</option>
									<option value="스크랩 관련">스크랩 관련</option>				
									<option value="공지">공지</option>				
									<option value="안내">안내</option>				
									<option value="기타">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class = "a" colspan="2">질문</td>
						</tr>
						<tr>
							<td class = "a" colspan = "2"><input type="text" name = "question"></td>
						</tr>
						<tr>
							<td class = "a" colspan="2">답변내용</td>
						</tr>						
						<tr>
							<td class = "a" id = "tdA" colspan="2">
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
<%@ include file="../../../inc/adminBottom.jsp"%>

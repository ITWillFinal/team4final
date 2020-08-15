<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#list').click(function() {
			location.href = "<c:url value = '/memberAdmin/adminInfo.do'/>";
		});
		
		$('#edit').click(function() {
			location.href = "<c:url value = '/memberAdmin/adminEdit.do?adminNo=${vo.adminNo}'/>";
		});
	});
</script>


<style>
a {
	color: black;
}

h2 {
    font-size: 24px;
}

#outDiv{
    padding: 23px 35px 90px 35px;
	width: 750px;
}
/* 버튼 */
input#delete {
    margin-left: 5px;
    margin-right: 5px;
}
div.bts {
    margin-top: 50px;
}
input#reEdit {
    margin-right: 5px;
}
input#reDel {
    margin-right: 5px;
}

/* 답변 테이블 */
td.c {
    padding-left: 55px;
}
td {
    padding-top: 20px;
}

ul {
    list-style: none;
}

li#fst {
    padding-top: 5%;
}

table {
    margin: 0 auto;
    margin-bottom: 11%;
}
td{
	color: black;
}
td.ss {
    padding-left: 136px;
    padding-bottom: 10px;
}
input#edit {
    margin-left: 22px;
}
div#divH2 {
    border-bottom: 4px solid gray;
    margin: 0 auto;
    width: 73%;
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
    padding-bottom: 2%;
}
</style>
	<!-- Id에 따라 top, sidebar, bottom 변경 -->
	<%@ include file="../inc/adminTop.jsp"%>
<main>
	<%-- <%@ include file="../side_inc/company_Sidebar.jsp"%> --%>

	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<ul class = "tabList" style="width: 857px; margin-left: 0px;">
			<li class = "select" style="width: 100%;" id = "fst">
				<div id = "divH2">
					<h2>관리자 정보 상세보기</h2>
				</div>
			</li>
		</ul>
		<div style="text-align: center; margin: 5px; /* border: 1px solid lightgray; */">
			<div id="outDiv">
				<table>
					<tr>
						<td>관리자  ID</td>
						<td class= "ss">${vo.adminId }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td class= "ss">${vo.adminName }</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td class= "ss">${vo.tel}</td>
					</tr>
					<tr>
						<td>관리등급</td>
						<td class= "ss">
							<c:if test="${vo.levels==1 }">
								1등급
							</c:if>
							<c:if test="${vo.levels==2 }">
								2등급
							</c:if>
							<c:if test="${vo.levels==3 }">
								3등급
							</c:if>
						</td>
					</tr>
					<tr >
						<td>관리자 등록일</td>
						<td class= "ss">
							<fmt:formatDate value="${vo.regDate}" pattern="yyyy년 MM월 dd일"/>
						</td>
					</tr>
				</table>
				<input type="button" id = "list" value = "목록으로">
				<input type="button" id = "edit" value = "권한수정">
			</div>
		</div>
	</div>
</main>

<%@ include file="../inc/adminBottom.jsp"%>
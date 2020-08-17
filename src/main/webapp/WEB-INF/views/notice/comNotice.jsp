<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/companySidebar.jsp"%>

<style>
.divList {
    margin-left: 2%;
    margin-right: 2%;
}
table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 3%;
    margin-bottom: 7%;
}
th{
	border-bottom: 3px solid #FB246A;;
	text-align: center;
	font-size: 12pt;
    padding: 5px;
}
div#pagingDiv {
    text-align: center;
}
td{
	border-bottom: 1px solid #FB246A;
	padding: 5px;
}    
select#typeSelect {
    margin-left: -91%;
    width: 93px;
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
a{
	color: black;
}

#upList{
    padding-left: 2%;
    padding-right: 2%;

}

.divPage{
	text-align:center;
    padding-top: 40px;
    padding-bottom: 10px;
}

.divList{
	height: 250px;
}

#bt{
	margin: 10px;
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
div#o {
    border: 1px solid lightgray;
    padding-bottom: 2%;
    margin-top: 2%;
    width: 1000px;
    margin-left: 0.5%;
}
body > div:nth-child(11) > div > h2 {
    font-weight: bold;
    padding-left: 2%;
    padding-top: 3.2%;
}
</style>
<div style="overflow: hidden">
<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
	<div style="float: left; width:70%; margin-left:30px; font-size: 14px; /* border:1px solid lightgray; */">
	<h2>고객센터</h2>
		<div id = "o">
			<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
			<h2 style = "padding-left: 1.8%; padding-top: 3.5%; font-size: 1.8em;">공지사항</h2>
			</div>
			<div style="text-align: center; margin:5px; /* border:1px solid lightgray; */">
				<div id = "list">
					<div id = "upList">
						<form action="<c:url value='/notice/comNotice.do'/>" method="post" name="frm">
						<select id="typeSelect" name="searchKeyword">
							<option value="안내" <c:if test="${keyword == '안내' }">selected="selected"</c:if>>안내</option>
							<option value="오픈" <c:if test="${keyword == '오픈' }">selected="selected"</c:if>>오픈</option>
							<option value="이벤트" <c:if test="${keyword == '이벤트' }">selected="selected"</c:if>>이벤트</option>
							<option value="기타" <c:if test="${keyword == '기타' }">selected="selected"</c:if>>기타</option>
						</select>
						</form>
						<table>
							<colgroup>
								<col style="width:20%;">
								<col style="width:60%;">
								<col style="width:20%;">
							</colgroup>
							<tr>
								<th>타입</th>
								<th>제목</th>
								<th>등록일</th>
							</tr>
							<c:if test="${empty list }">
								<tr>
									<td colspan="5">등록된 공지사항이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list }">
								<c:set var="idx" value="0"/>
								<c:forEach var="vo" items="${list }">
									<tr>
										<td style="color:#3b38ff; font-weight: bold;">${vo.type }</td>
										<td style="text-align: center;"><a href="<c:url value='/notice/noticeDetail.do?noticeNo=${vo.noticeNo }'/>" style="color: black">${vo.title }</a></td>
										<td style="color:#777777"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
									</tr>
									<c:set var = "idx" value = "${idx+1 }"/>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		<div id="pagingDiv">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 ◀ -->
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
				◁
			</a>
		</c:if>
		<!-- 페이지 번호 1~10 -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">		
			<c:if test="${i!=pagingInfo.currentPage }">
				<span><a href="#" onclick="pageProc(${i})">${i}</a></span>
			</c:if>
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold;">${i}</span>
			</c:if>		
		</c:forEach>
		</div>
		<!-- 다음 블럭으로 이동 ▶ -->
		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
				▷
			</a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#rrr').click(function() {
			location.href = "<c:url value='/gogak/qna/qnaList.do'/>";
		});

		$('#ddd').click(function() {
			location.href = "<c:url value='/gogak/qna/qnaEdit.do?no=${vo.qnaNo}'/>";
		});

		$('#delete').click(function() {
			var str = confirm('${vo.qnaNo}번 글을 삭제하시겠습니까?');

			if (str) {
				//true
				location.href = "<c:url value = '/gogak/qna/qnaDelete.do?no=${vo.qnaNo}'/>";
			} else {
				event.preventDefault;
				location.href = "<c:url value='/gogak/qna/qnaDetail.do?no=${vo.qnaNo}'/>";
			}
		});
		
		$('#reDel').click(function() {
			var str = confirm('${revo.no}번 글을 삭제하시겠습니까?');

			if (str) {
				//true
				location.href = "<c:url value = '/gogak/qnare/replyDelete.do?no=${vo.qnaNo}'/>";
			} else {
				event.preventDefault;
				/* location.href = "<c:url value='/gogak/qnare/qnaDetail.do?no=${revo.no}'/>"; */
			}
		});
		
	})
</script>


<style>
a {
	color: black;
}

h4{
	margin-top: 5px; 
	font-weight: 800;
}

h3{
	margin-top: 40px;
	padding-bottom: 60px;
}

#outDiv{
    padding: 75px 35px 90px 35px;
	width: 750px;
}

/* 글내용 */
#divAnswer{
    word-break: break-all;
    /* border: 1px solid blue; */
    margin: 30px;
}

#divH4{
	border-bottom: 2px solid #d1d1d1;
	padding-bottom: 20px;
}

#ab{
	text-align: left;
	margin: 10px 10px 10px 30px;
	color: gray;
    font-size: 1.11em;
}
.ab1{
	padding-right: 10px;
	color: black;
}
.font-color{
	color: gray;
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
#idx{
	width: 66%;
    margin-left: 18%;
    padding-top: 15px;
    padding-bottom: 5px;
    border-radius: 14px;
    background-color: whitesmoke;
    border: none;
    margin-bottom: 70px;
}

p#re {
    margin-left: 22px;
}
div#reli {
    padding-top: 15px;
    padding-left: 20px;
    padding-bottom: 50px;
}
p#rea1 {
    padding-left: 22px;
    padding-top: 15px;
}

/* 답변달기 */
div#resu {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
    padding-bottom: 30px;
}

#cs {
    width: 500px;
    height: 200px;
}
p.rea {
    font-size: 12pt;
    font-weight: 800;
}
div#bts2 {
    margin-left: 44%;
}

/* 리스트 상단 탭 */
ul, li{list-style: none;}
.tabList>li .inTab:hover,
.tabList>li .inTab:focus {text-decoration:underline}

li.select {
    float: left;
    text-align: center;
    padding-top: 15px;
    padding-bottom: 15px;
    font-size: 15pt;
}
#fst{
	border-bottom: 1px solid lightgray;

}
#mid{
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
body > div.wrapper > div > div > div.span9 > div > main > div {
    box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
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

</style>
	<!-- Id에 따라 top, sidebar, bottom 변경 -->
	<%@ include file="../../inc/adminTop.jsp"%>
<main>
	<%-- <%@ include file="../side_inc/company_Sidebar.jsp"%> --%>

	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<ul class = "tabList" style="width: 857px; margin-left: 0px;">
			<li class = "select" style="width: 33%;" id = "fst">
				<a href = <c:url value='/gogak/admin/company/faqList.do'/> style="color: black;">FaQ - 기업</a>
			</li>
			<li class = "select" style="width: 33%;" id = "mid">
				<a href = <c:url value='/gogak/admin/personal/faqList.do'/> style="color: black;">FaQ - 일반</a>
			</li>
			<li class = "select" style="width: 33%;" id = "btm">
				<a href = <c:url value='/gogak/qna/qnaList.do'/> style="color: black;">Q&A</a>
			</li>
			
		</ul>
		<!-- 본문 -->
		<div style="text-align: center; margin: 5px; /* border: 1px solid lightgray; */">
			<div id="outDiv">
				<input type="hidden" value="${vo.qnaNo }" name="no">
				
				<h4>― 1:1 문의게시판 ―</h4>
				<h3>${vo.title}</h3>
				<div id = "idx">
					<p>작성자: ${vo.userId }　　　카테고리: ${vo.category}　　　작성일:<fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
				</div>
				<div style="text-align: left;">
					<div id = "divH4">
						<h4>문의 내용</h4>
					</div>
					<br>
					<div>
						<% pageContext.setAttribute("newLine", "\r\n"); %>
						${fn:replace(vo.content, newLine, '<br>')}
					</div>
				</div>								
				<!-- 댓글(문의 답변) -->
				<div style="padding: 20px; margin-top: 54px;">
					<c:if test="${rst==1}">
							<div id = "reli" style=" text-align: left; background-color: whitesmoke;">
								<input type="hidden" name = "qnaNo" value = "${vo.qnaNo }">
								<p id = "rea1" class = "rea" style="text-align: left">등록된 답변입니다.</p>
								<table style="margin-left: 20px; margin-top: 15px;">
									<tr>
									<td class = "t">작성자</td>
									<td class = "c">${revo.name}</td>
									</tr>
									<tr>
										<td class = "t">등록일</td>
										<td class = "c"><fmt:formatDate value="${revo.regDate}"
											pattern="yyyy-MM-dd HH:mm"/></td>
									</tr>
									<tr>
										<td class = "t">내용</td>
										<td class = "c"><% pageContext.setAttribute("newLine", "\r\n"); %>
											${fn:replace(revo.content, newLine, '<br>')}
										</td>
									</tr>
								</table>
							</div>
						<div class = "bts">
							<input type="button" id="reDel" value="답변삭제">
						</div>
					</c:if>
					<c:if test="${rst==0}">
						<div id = "resu" style=" text-align: left; background-color: whitesmoke;">
							<form name="rere" method="post" action="<c:url value = '/gogak/qnare/replyWrite.do'/>">
								<p class = "rea">답변 등록</p>
								<table>
									<tr>
										<!-- <td>게시글 번호</td> -->
										<td class = "c"><input type="hidden" name = "no" value = "${vo.qnaNo }"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td class = "c"><input type = "text" name = "name" style="height: 27px;"></td>
									</tr>
									<tr>
										<td>답변내용</td>
										<td class = "c"><textarea id = "cs"  name="content"></textarea></td>
									</tr>
								</table>
							<div class = "bts" id = "bts2">
								<input type="submit" value="답변 등록">
							</div>
							</form>
						</div>
					</c:if>
				</div>
				<div style="text-align: center; padding: 35px 0 25px 0;">
						<input type="submit" value="글수정" id="ddd"> 
						<input type="button" value="글삭제" id="delete">
						<input type="button" value="글목록" id="rrr">
				</div>
				<div id = "ab">
					<div>
						<span class = "ab1">다음글</span>
						<c:if test="${empty afterVO.qnaNo }">
							<span class = "font-color">다음 게시글이 없습니다.</span>
						</c:if>
						<c:if test="${!empty afterVO.qnaNo }">
							<a href="<c:url value='/gogak/qna/qnaDetail.do?no=${afterVO.qnaNo}'/>" class = "font-color">
								<c:if test="${fn:length(afterVO.title )>=10 }">
									${fn:substring(afterVO.title,0,10)}...
								</c:if> 
								<c:if test="${fn:length(afterVO.title)<10 }">
									${afterVO.title }							
								</c:if>
							</a>
						</c:if>
					</div>
					<div>
						<span class = "ab1">이전글</span>
						<c:if test="${empty beforeVO.qnaNo }">
							<span class = "font-color">이전 게시글이 없습니다.</span>
						</c:if> 
						<c:if test="${!empty beforeVO.qnaNo }">
							<a href="<c:url value='/gogak/qna/qnaDetail.do?no=${beforeVO.qnaNo}'/>" class = "font-color">
								<c:if test="${fn:length(beforeVO.title )>=10 }">
										${fn:substring(beforeVO.title,0,10)}...
								</c:if> 
								<c:if test="${fn:length(beforeVO.title)<10 }">
									${beforeVO.title }							
								</c:if>
							</a>
						</c:if>
					</div>	
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/adminBottom.jsp"%>
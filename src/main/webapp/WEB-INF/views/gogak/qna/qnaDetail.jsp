<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../inc/adminTop.jsp"%>
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
    border: 1px solid lightgray;
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
	padding-bottom: 60px;
    font-size: 1.11em;
}
.ab1{
	padding-right: 10px;
	color: black;
}
.font-color{
	color: gray;
}




</style>
<main>
	<%-- <%@ include file="../side_inc/company_Sidebar.jsp"%> --%>

	<!-- main -->
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px; /* border: 1px solid lightgray; */">
		<div style="margin: 5px; height: 95px; /* border: 1px solid lightgray; */">
			<h2 style="padding-left: 50px; padding-top: 30px;">1:1 문의 상세보기</h2>
		</div>
		<!-- 본문 -->
		<div style="text-align: center; margin: 5px; /* border: 1px solid lightgray; */">
			<div id="outDiv">
				<input type="hidden" value="${vo.qnaNo }" name="no">
				
				<h4>― 1:1 문의게시판 ―</h4>
				<h3>${vo.title}</h3>
				<div style= "text-align: center; color: lightgray;">
					<p>작성자: ${vo.userId }&nbsp;카테고리: ${vo.categoryNO}&nbsp;작성일:${vo.regDate }</p>
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
			</div>
			<div style="text-align: center; padding: 20px 0 10px 0;">
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
</main>

<%@ include file="../../inc/adminBottom.jsp"%>
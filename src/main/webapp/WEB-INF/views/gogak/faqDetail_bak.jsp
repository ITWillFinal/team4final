<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#rrr').click(function() {
			location.href = "<c:url value='/gogak/faqList.do'/>";
		});

		$('#ddd')
				.click(
						function() {
							location.href = "<c:url value='/gogak/faqEdit.do?no=${vo.faqNo}'/>";
						});

		$('#delete')
				.click(
						function() {
							var str = confirm('${vo.faqNo}번 글을 삭제하시겠습니까?');

							if (str) {
								//true
								location.href = "<c:url value = '/gogak/faqDelete.do?no=${vo.faqNo}'/>";
							} else {
								event.preventDefault;
								location.href = "<c:url value='/gogak/faqDetail.do?no=${vo.faqNo}'/>";
							}
						});
	})
</script>


<style>
td {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
}


tr span, td, p {
	padding-left: 30px;
}

td {
	padding-top: 30px;
	padding: 5px 0 0 0;
}
}

table {
	width: 700px;
	text-align: left;
}
#idxDiv{
	padding: 50px 30px 50px 30px;
	border: 1px solid lightgray;
}


/* 테이블 */
#idx{
	border: 1px solid red;
}
tr{
	border: 1px solid red;
}
td{
	border: 1px solid red;
}

a {
	color: black;
}

#ab {
	border: 1px solid white;
}


.pab {
	font-size: 10pt;
	padding-left: 0;
}

p#pabB {
	padding: 5px 0px 5px 0px;
	margin: 0;
}
.ctd{
	padding-left: 30px;
}
</style>
<main>
	<%@ include file="o_inc/admin_Sidebar.jsp"%>

	<!-- main -->
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px; border: 1px solid lightgray;">
		<div style="margin: 5px; height: 95px; border: 1px solid lightgray;">
			<h2 style="padding-left: 50px; padding-top: 30px;">자주찾는 질문 상세보기</h2>
		</div>
		<div
			style="text-align: center; margin: 5px; border: 1px solid lightgray; height: 500px;">
			<div id="outDiv">
				<input type="hidden" value="${vo.faqNo }" name="no">
				<div id = "idxDiv" style="text-align: left;">
					<table id="idx">
						<colgroup>
							<col style="width: 30%;" />
							<col style="width: 70%;" />
						</colgroup>
						<tr>
							<td class = "ctd">카테고리</td>
							<td class = "ctd">${vo.category }</td>
						</tr>
	
						<tr>
							<td class = "ctd">질문</td>
							<td class = "ctd">${vo.question }</td>
						</tr>
	
						<tr>
							<td class = "ctd">답변내용</td>
							<td class = "ctd">
								<%
									pageContext.setAttribute("newLine", "\r\n");
								%>
								${fn:replace(vo.answer, newLine, '<br>')}
							</td>
						</tr>
					</table>
				</div>

				<div style="text-align: center; padding: 10px 0 10px 0;">
					<input type="submit" value="글수정" id="ddd"> 
					<input type="button" value="글삭제" id="delete">
					<input type="button" value="글목록" id="rrr">
				</div>
				<div>
				<div>
					<div id="next">
						<c:if test="${empty afterVO.faqNo }">
							<span class="pab">다음 게시글이 없습니다.</span>
						</c:if>
						<c:if test="${!empty afterVO.faqNo }">
							<a href="<c:url value='/gogak/faqDetail.do?no=${afterVO.faqNo}'/>">
								<c:if test="${fn:length(afterVO.question )>=10 }">
									${fn:substring(afterVO.question,0,10)}...
								</c:if> 
								<c:if test="${fn:length(afterVO.question)<10 }">
									${afterVO.question }							
								</c:if>
							</a>
						</c:if>
						<span>다음글</span>
					</div>
				</div>
					<div>
						<c:if test="${empty beforeVO.faqNo }">
							<span class="pab" id="pabB">이전 게시글이 없습니다.</span>
						</c:if> 
						<c:if test="${!empty beforeVO.faqNo }">
							<a href="<c:url value='/gogak/faqDetail.do?no=${beforeVO.faqNo}'/>">
								<c:if test="${fn:length(beforeVO.question )>=10 }">
										${fn:substring(beforeVO.question,0,10)}...
								</c:if> 
								<c:if test="${fn:length(beforeVO.question)<10 }">
									${beforeVO.question }							
								</c:if>
							</a>
						</c:if>
						<span>이전글</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../inc/bottom.jsp"%>
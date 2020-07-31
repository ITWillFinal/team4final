<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../../inc/adminTop.jsp"%>
<script type="text/javascript"
	src="<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#rrr').click(function() {
			location.href = "<c:url value='/gogak/admin/company/faqList.do'/>";
		});

		$('#ddd').click(function() {
			location.href = "<c:url value='/gogak/admin/company/faqEdit.do?no=${vo.faqNo}'/>";
		});

		$('#delete').click(function() {
			var str = confirm('${vo.faqNo}번 글을 삭제하시겠습니까?');

			if (str) {
				//true
				location.href = "<c:url value = '/gogak/admin/company/faqDelete.do?no=${vo.faqNo}'/>";
			} else {
				event.preventDefault;
				location.href = "<c:url value='/gogak/admin/company/faqDetail.do?no=${vo.faqNo}'/>";
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
	margin-top: 35px;
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
	margin-bottom: 15px;
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
input#delete {
    margin-left: 5px;
    margin-right: 5px;
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
#mid{
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
#btm{
	border-bottom: 1px solid lightgray;
}


</style>
<main>

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
				<input type="hidden" value="${vo.faqNo }" name="no">
				
				<h4>― 자주 찾으시는 질문 ―</h4>
				<h3>${vo.question }</h3>
				<div style="text-align: left;">
					<div id = "divH4">
						<h4>질문 답변</h4>
					</div>
					<br>
					<div>
						<% pageContext.setAttribute("newLine", "\r\n"); %>
						${fn:replace(vo.answer, newLine, '<br>')}
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
					<c:if test="${empty afterVO.faqNo }">
						<span class = "font-color">다음 게시글이 없습니다.</span>
					</c:if>
					<c:if test="${!empty afterVO.faqNo }">
						<a href="<c:url value='/gogak/admin/company/faqDetail.do?no=${afterVO.faqNo}'/>" class = "font-color">
							<c:if test="${fn:length(afterVO.question )>=10 }">
								${fn:substring(afterVO.question,0,10)}...
							</c:if> 
							<c:if test="${fn:length(afterVO.question)<10 }">
								${afterVO.question }							
							</c:if>
						</a>
					</c:if>
				</div>
				<div>
					<span class = "ab1">이전글</span>
					<c:if test="${empty beforeVO.faqNo }">
						<span class = "font-color">이전 게시글이 없습니다.</span>
					</c:if> 
					<c:if test="${!empty beforeVO.faqNo }">
						<a href="<c:url value='/gogak/admin/company/faqDetail.do?no=${beforeVO.faqNo}'/>" class = "font-color">
							<c:if test="${fn:length(beforeVO.question )>=10 }">
									${fn:substring(beforeVO.question,0,10)}...
							</c:if> 
							<c:if test="${fn:length(beforeVO.question)<10 }">
								${beforeVO.question }							
							</c:if>
						</a>
					</c:if>
				</div>	
			</div>
		</div>
	</div>
</main>

<%@ include file="../../../inc/adminBottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../inc/top.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#rrr').click(function() {
			location.href = "<c:url value='/gogak/personal/faqList.do'/>";
		});

		$('#ddd').click(function() {
			location.href = "<c:url value='/gogak/personal/faqEdit.do?no=${vo.faqNo}'/>";
		});

		$('#delete').click(function() {
			var str = confirm('${vo.faqNo}번 글을 삭제하시겠습니까?');

			if (str) {
				//true
				location.href = "<c:url value = '/gogak/personal/faqDelete.do?no=${vo.faqNo}'/>";
			} else {
				event.preventDefault;
				location.href = "<c:url value='/gogak/personal/faqDetail.do?no=${vo.faqNo}'/>";
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
div#outer {
    border: 1px solid lightgray;
    padding-left: 1%;
    padding-right: 1%;
    margin-bottom: 8%;
    margin-top: 4.5%;
    width: 117.5%;
}
h2 {
    font-weight: bold;
    margin-left: 0%;
    border-bottom: 3px solid #FB246A;
    width: 98%;
    padding-bottom: 2%;
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
<main>
	<%@ include file="../../inc/sidebar.jsp"%>
	<h2 style="margin-left: 20px">고객센터</h2>

	<!-- main -->
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px; /* border: 1px solid lightgray; */">
		<div id = "outer">
			<div style="margin: 5px; height: 95px; /* border: 1px solid lightgray; */">
				<h2 style="padding-left: 7px; padding-top: 30px;">자주찾는 질문 상세보기</h2>
			</div>
			<!-- 본문 -->
			<div style="text-align: center; margin: 5px; /* border: 1px solid lightgray; */ ">
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
						<!-- <input type="submit" value="글수정" id="ddd"> 
						<input type="button" value="글삭제" id="delete"> -->
						<input type="button" value="글목록" id="rrr">
				</div>
				<div id = "ab">
					<div>
						<span class = "ab1">다음글</span>
						<c:if test="${empty afterVO.faqNo }">
							<span class = "font-color">다음 게시글이 없습니다.</span>
						</c:if>
						<c:if test="${!empty afterVO.faqNo }">
							<a href="<c:url value='/gogak/personal/faqDetail.do?no=${afterVO.faqNo}'/>" class = "font-color">
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
							<a href="<c:url value='/gogak/personal/faqDetail.do?no=${beforeVO.faqNo}'/>" class = "font-color">
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
	</div>
</main>

<%@ include file="../../inc/bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function(){
			location.href 
				= "<c:url value='/gogak/faqList.do'/>";	
		});
		
		$('#ddd').click(function(){
			location.href 
				= "<c:url value='/gogak/faqEdit.do?no=${vo.fnqNo}'/>";	
		});
		
		$('#delete').click(function() {
			var str = confirm('${vo.fnqNo}번 글을 삭제하시겠습니까?');
			
			if(str){
				//true
				location.href
					= "<c:url value = '/gogak/faqDelete.do?no=${vo.fnqNo}'/>";
			}else{
				event.preventDefault;
				location.href 
				= "<c:url value='/gogak/faqDetail.do?no=${vo.fnqNo}'/>";
			}
		});
	})
	
</script>


<style>
div#outDiv {
    padding-left: 300px;
    padding-top: 100px;
}
td {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}
input#ddd {
    margin-left: 250px;
    margin-top: 10px;
    margin-bottom: 10px;
}

input#rrr {
    margin-left: 20px;
}
input#delete {
    margin-left: 20px;
}

tr span, td, p{
	padding-left: 30px;
}

td {
    padding-top: 30px;
}

table{
	width: 700px;

}

h2{
	padding-bottom: 30px;
}

.al{
	text-align: right;
}
a{
	color: black;
}
#ab{
	border: 1px solid white;
}
td {
    padding: 5px 0 0 0;
}
.pab {
    font-size: 10pt;
    padding-left: 0;
}
p#pabB {
    padding: 5px 0px 5px 0px;
    margin: 0;
}
</style>


<div id="outDiv">
	<h2>자주 찾는 질문 상세보기</h2>
	<input type = "hidden" value = "${vo.fnqNo }" name = "no">
	<table id = "idx">
		<colgroup>
			<col style="width: 30%;" />
			<col style="width: 70%;" />
		</colgroup>
		<tr>
			<td>
				<p id = "al">
					카테고리
				</p>
			</td>
			<td>
				<span>${vo.category }</span>
			
			</td>
		</tr>

		<tr>
			<td>
				<p id = "al">
					질문
				</p>
			</td>
			<td>
				<span>${vo.question }</span>
			
			</td>
		</tr>
		
		<tr>
			<td>
				<p id = "al">
					답변내용
				</p>
			</td>
			<td id = "tdA">
				<p>
					<% pageContext.setAttribute("newLine", "\r\n"); %>
					${fn:replace(vo.answer, newLine, '<br>')}
				</p>
			</td>
		</tr>
	</table>
	
	<div>
		<input type = "submit" value = "글수정" id = "ddd">
		<input type = "button" value = "글삭제" id = "delete">
		<input type = "button" value = "글목록" id = "rrr">
	</div>
	<div>
		<table id = "ab">
			<colgroup>
				<col style="width: 30%;" />
				<col style="width: 70%;" />
			</colgroup>
			<tr>
				<td>다음글</td>
				<td>
					<div id = "next">
						<c:if test="${empty afterVO.fnqNo }">
							<p class = "pab">다음 게시글이 없습니다.</p>
						</c:if>
						<c:if test="${!empty afterVO.fnqNo }">
							<a href = "<c:url value='/gogak/faqDetail.do?no=${afterVO.fnqNo}'/>">
								<c:if test = "${fn:length(afterVO.question )>=10 }">
									${fn:substring(afterVO.question,0,10)}...
								</c:if>
								<c:if test="${fn:length(afterVO.question)<10 }">
									${afterVO.question }							
								</c:if>
							</a>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td>이전글</td>
				<td>
					<c:if test="${empty beforeVO.fnqNo }">
						<p class = "pab" id = "pabB">이전 게시글이 없습니다.</p>
					</c:if>
					<c:if test="${!empty beforeVO.fnqNo }">
						<a href = "<c:url value='/gogak/faqDetail.do?no=${beforeVO.fnqNo}'/>">
							<c:if test = "${fn:length(beforeVO.question )>=10 }">
									${fn:substring(beforeVO.question,0,10)}...
							</c:if>
							<c:if test="${fn:length(beforeVO.question)<10 }">
								${beforeVO.question }							
							</c:if>
						</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
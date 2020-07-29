<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
.divList{
/*     padding-left: 300px; */
    padding-top: 40px;
    padding-left: 80px;
    padding-bottom: 50px;
    padding-right: 80px;
}
table{
	/* border-bottom: 1px solid lightgray; */
}
th{
	border-bottom: 3px solid #FB246A;;
	text-align: center;
}
td{
	border-bottom: 1px solid #FB246A;
	padding: 5px;
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
a{
	color: black;
}

#list{
	width: 800px;
	height: 700px;
}

#upList{
	 padding-left: 300px;
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

</style>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	$(function () {
		$('input[name=chkAll]').click(function () {
			$('tbody input[type=checkbox]')
			.prop('checked', this.checked);			
		});
			
		$('#btMultiDel').click(function() {
			var len = $('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert("삭제하려는 게시글을 먼저 체크하세요.");
				return;
			}
			
			$('form[name=frmList]')
				.prop("action", "<c:url value = '/gogak/qna/deleteMulti.do'/>");
			
			$('form[name=frmList]').submit();
		});
		
		$('#qnaWrite').click(function() {
			location.href = "<c:url value = '/gogak/qna/qnaWrite.do'/>";
		});
	});
</script>

	<!-- Id에 따라 top, sidebar, bottom 변경 -->
	<%@ include file="../../inc/adminTop.jsp"%>
<main>
	<%-- <%@ include file="../side_inc/company_Sidebar.jsp"%> --%>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px; /* border:1px solid lightgray; */">
		<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
		<h2 style = "padding-left: 50px; padding-top: 30px; ">1:1 문의</h2>
		</div>
		<div style="text-align: center; margin:5px; /* border:1px solid lightgray; */">
		
			<div id = "list">
				<div id = "upList">
					<c:if test="${!empty param.searchKeyword }">
						<p>검색어 : ${param.searchKeyword },
							 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
					</c:if>
					<!-- 페이징 -->
					<form action="<c:url value='/gogak/qna/qnaList.do'/>" 
						name="frmPage" method="post">
						<input type="hidden" name="currentPage">
						<input type="hidden" name="searchCondition" 
							value="${param.searchCondition}">
						<input type="hidden" name="searchKeyword" 
							value="${param.searchKeyword}">	
					</form>
				</div>
			<div>
			<form name="frmList" method="post"
				action="<c:url value = '/gogak/qna/qnaList.do'/>">
				<div class = "divList">
					<table class = "box2" style="width: 700px;">
						<colgroup>
						   <col style="width:10%;" />
						   <col style="width:10%;" />
						   <col style="width:10%;" />
						   <col style="width:10%;" />
						   <col style="width:20%;" />
						   <col style="width:20%;" />
						   <col style="width:20%;" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="chkAll"></th>
								<th>글번호</th>
								<th>구분</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>아이디</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
								<th colspan="4">등록된 1:1 문의가 없습니다.</th>
							</c:if>
							<c:if test="${!empty list }">
								<c:set var = "idx" value = "0"/>
									<c:forEach var = "vo" items="${list }">
										<tr>
											<td style = "text-align: center">
												<input type="checkbox" name="qnaList[${idx }].qnaNo"
													value = "${vo.qnaNo }">
											</td>
											<td style="text-align: center;">${vo.qnaNo }</td>
											<td style="text-align: center;">${vo.status }</td>
											<td style="text-align: center;">${vo.categoryNO }</td>
											<td style="text-align: center;">
												<a href = "<c:url value = '/gogak/qna/qnaDetail.do?no=${vo.qnaNo }'/>">
													<c:if test = "${fn:length(vo.title)>=10 }">
														${fn:substring(vo.title,0,10)}...
													</c:if>
													<c:if test="${fn:length(vo.title)<10 }">
														${vo.title }							
													</c:if>
												</a>
											</td>
											<td style="text-align: center;">${vo.userId }</td>
											<td style="text-align: center;">
												<fmt:formatDate value="${vo.regDate}"
													pattern="yyyy-MM-dd"/>
											</td>
										</tr>
										<c:set var = "idx" value = "${idx+1 }"/>
									</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</form>
			</div>
				<div class="divPage">
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
							<a href="#" onclick="pageProc(${i})">[${i}]</a>
						</c:if>
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color:blue;font-weight:bold; font-size: 12px;">${i}</span>			
						</c:if>		
					</c:forEach>
						
					<!-- 다음 블럭으로 이동 ▶ -->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
							▷
						</a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>
				<div class="divSearch" style="padding-top: 10px">
				   	<form name="frmSearch" method="post" 
				   		action='<c:url value="/gogak/qna/qnaList.do"/>'>
				        <select name="searchCondition" style="height: 27px;">
				            <option value="category" 
				            	<c:if test="${param.searchCondition=='category' }">
				            		selected="selected"
				            	</c:if>
				            >카테고리</option>
				            <option value="question" 
				            	<c:if test="${param.searchCondition=='question' }">
				            		selected="selected"
				            	</c:if>
				            >질문</option>
				            <option value="answer" 
				            	<c:if test="${param.searchCondition=='answer' }">
				            		selected="selected"
				            	</c:if>
				            >답변</option>
				        </select>
					        <input type="text" name="searchKeyword" title="검색어 입력"
					        	value="${param.searchKeyword}">   
							<input type="submit" value="검색"><br>
							<input type="button" id = "qnaWrite" value = "게시글 등록">
							<input type="button" id = "btMultiDel" value="선택한 게시글 삭제"><br><br>
				    </form>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/adminBottom.jsp"%>



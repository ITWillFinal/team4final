<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
th{
	border-bottom: 3px solid #FB246A;;
	text-align: center;
    padding: 14px;
}
td{
	border-bottom: 1px solid #FB246A;
	padding: 13px;
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

.divPage {
	text-align:center;     

}

#bt{
	margin: 20px;
}

input[type="text"] {
    margin-left: 10px;
}
input#btMultiDel {
    margin-left: 5px;
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
tbody {
    font-size: 12px;
    text-align: center;
}
p#info {
    margin-top: 30px;
}
.divList {
    margin-left: 2%;
    margin-right: 2%;
}
th {
    padding-top: 5%;
}
div#o {
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
    width: 9%;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 3%;
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
	<div style="text-align: center; width:850px;">
		<div id = "o" style="margin-top: -11.5px;">
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
			<div style="text-align: center;/* border:1px solid lightgray; */">
			
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
						<table class = "box2" style="width: 100%; margin-top: 45px;">
							<colgroup>
							   <col style="width:10%;" />
							   <col style="width:10%;" />
							   <col style="width:10%;" />
							   <col style="width:15%;" />
							   <col style="width:20%;" />
							   <col style="width:15%;" />
							   <col style="width:20%;" />
							</colgroup>
							<tr>
								<th><input type="checkbox" name="chkAll"></th>
								<th>글번호</th>
								<th>구분</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>아이디</th>
								<th>작성일</th>
							</tr>
							<c:if test="${empty list }">
								<th colspan="7">등록된 1:1 문의가 없습니다.</th>
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
											<td style="text-align: center;">${vo.category }</td>
											<td style="text-align: center;">
												<c:if test="${vo.no != 0 }">
													<a href = "<c:url value = '/gogak/qna/qnaDetail.do?no=${vo.qnaNo }'/>" style="color: black;">
														<c:if test = "${fn:length(vo.title)>=10 }">
															${fn:substring(vo.title,0,10)}...
														</c:if>
														<c:if test="${fn:length(vo.title)<10 }">
															${vo.title }							
														</c:if>
													</a>
												</c:if>
												<c:if test="${vo.no == 0 }">
													<a href = "<c:url value = '/gogak/qna/qnaDetail.do?no=${vo.qnaNo }'/>" style="color: red;">
														<c:if test = "${fn:length(vo.title)>=10 }">
															${fn:substring(vo.title,0,10)}...
														</c:if>
														<c:if test="${fn:length(vo.title)<10 }">
															${vo.title }							
														</c:if>
													</a>
												</c:if>
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
						</table>
						<p id = "info">※ 답변하지 않은 문의는 빨간색 제목으로 표시됩니다.</p>
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
								<a href="#" onclick="pageProc(${i})" style="color: black;">
									[${i}]
								</a>
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
					        <select name="searchCondition" style="height: 27px; width: 98px;">
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
					            <option value="status" 
					            	<c:if test="${param.searchCondition=='status' }">
					            		selected="selected"
					            	</c:if>
					            >구분</option>
					        </select>
						        <input type="text" name="searchKeyword" title="검색어 입력"
						        	value="${param.searchKeyword}"style="height: 27px;">   
								<input type="submit" value="검색"><br>
								<input type="button" id = "qnaWrite" value = "게시글 등록">
								<input type="button" id = "btMultiDel" value="선택한 게시글 삭제"><br><br>
					    </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/adminBottom.jsp"%>



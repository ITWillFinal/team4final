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
div#list {
    width: 1000px;
}
#upList{
	 padding-left: 300px;
}

#bt{
	margin: 20px;
}

input[type="submit"] {
    width: 63px;
    height: 30px;
    margin-bottom: 10px;
    margin-left: 10px;
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
tbody {
    font-size: 12px;
    text-align: center;
}
p#info {
    margin-top: 30px;
}
li#fst {
    margin-top: 4%;
    margin-bottom: 3%;
    font-weight: bold;
    font-size: 30px;
}
a{
	color: black;
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
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	$(function () {
		$('#qnaWrite').click(function() {
			location.href = "<c:url value = '/gogak/qnaC/qnaWrite.do'/>";
		});
	});
</script>

	<!-- Id에 따라 top, sidebar, bottom 변경 -->
	
	<%@ include file="../../inc/companyTop.jsp"%>
<main>
	<%@ include file="../../inc/companySidebar.jsp"%>
	
	<!-- main -->
	<div style=" margin:5px;float: left;">
		<div style="margin-left: 0.5%;">
			<div id="outDiv">
				<h2 style="font-weight: bold;padding-top: 33px; padding-left: 39px;">고객센터</h2>
		<div style="text-align: center; margin:5px; border:1px solid lightgray; margin-left: 21px; margin-top: 16px;">
			<div id = "list">
				<div id = "upList">
					<c:if test="${!empty param.searchKeyword }">
						<p>검색어 : ${param.searchKeyword },
							 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
					</c:if>
					<!-- 페이징 -->
					<form action="<c:url value='/gogak/qnaC/qnaList.do'/>" 
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
				action="<c:url value = '/gogak/qnaC/qnaList.do'/>">
				<div class = "divList">
					<table class = "box2" style="margin-top: 45px;margin-left: 2%;width: 96%;">
						<colgroup>
						   <col style="width:10%;" />
						   <col style="width:15%;" />
						   <col style="width:15%;" />
						   <col style="width:20%;" />
						   <col style="width:20%;" />
						   <col style="width:20%;" />
						</colgroup>
						<tr>
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
										<td style="text-align: center;">${vo.qnaNo }</td>
										<td style="text-align: center;">${vo.status }</td>
										<td style="text-align: center;">${vo.category }</td>
										<td style="text-align: center;">
											<c:if test="${vo.no != 0 }">
												<a href = "<c:url value = '/gogak/qnaC/qnaDetail.do?no=${vo.qnaNo }'/>" style="color: black;">
													<c:if test = "${fn:length(vo.title)>=10 }">
														${fn:substring(vo.title,0,10)}...
													</c:if>
													<c:if test="${fn:length(vo.title)<10 }">
														${vo.title }							
													</c:if>
												</a>
											</c:if>
											<c:if test="${vo.no == 0 }">
												<a href = "<c:url value = '/gogak/qnaC/qnaDetail.do?no=${vo.qnaNo }'/>" style="color: red;">
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
				</div><!-- divList -->
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
				</div> <!--  페이지 번호 끝 -->
				<div id = "divP">
					<p id = "info">※ 답변하지 않은 문의는 빨간색 제목으로 표시됩니다.</p>
				</div>
				<div class="divSearch" style="padding-top: 10px">
				   	<form name="frmSearch" method="post" 
				   		action='<c:url value="/gogak/qnaC/qnaList.do"/>'>
				        <select name="searchCondition" style="height: 27px; width: 98px;">
				            <option value="category" 
				            	<c:if test="${param.searchCondition=='category' }">
				            		selected="selected"
				            	</c:if>
				            >카테고리</option>
				            <option value="title" 
				            	<c:if test="${param.searchCondition=='title' }">
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
					        	value="${param.searchKeyword}"style="height: 27px;">   
							<input type="submit" value="검색"><br>
							<input type="button" id = "qnaWrite" value = "게시글 등록">
				    </form>
				</div>
			</div><!-- divList -->
		</div>
		</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/companyBottom.jsp"%>



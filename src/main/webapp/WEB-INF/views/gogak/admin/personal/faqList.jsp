<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../../inc/adminTop.jsp"%>
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

a{
	color: black;
}

#upList{
	 padding-left: 300px;
}
/* 페이징 */
.divPage {
	text-align:center;     
	margin-top: 70px;
    margin-bottom: 25px;
}

/* 목록 */

/* 등록삭제 버튼 */
#bt {
    margin-top: -1%;
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
	border-right: 1px solid lightgray;
}
#btm{
	border-bottom: 1px solid lightgray;
}
input[type="submit"] {
    width: 63px;
    height: 30px;
    margin-bottom: 10px;
    margin-left: 10px;
}
input[type="text"] {
    margin-left: 10px;
    height: 17px;
}
input#btMultiDel {
    margin-left: 5px;
}
input[type=button] {
    width: 130px;
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
    width: 63px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 3%;
}

div#o {
    box-shadow: 0px 22px 57px 0px rgba(34, 41, 72, 0.30);
}
.divList {
    margin-left: 2%;
    margin-right: 2%;
}
th {
    padding-top: 5%;
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
				.prop("action", "<c:url value = '/gogak/admin/personal/deleteMulti.do'/>");
			
			$('form[name=frmList]').submit();
		});
		
		$('#fnqWrite').click(function() {
			location.href = "<c:url value = '/gogak/admin/personal/faqWrite.do'/>";
		});
	});
</script>
<main>
	
	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<div id = "o" style="margin-top: -11.5px;">
			<ul class = "tabList" style="width: 857px;">
				<li class = "select" style="width: 33%;" id = "fst">
					<a href = <c:url value='/gogak/admin/company/faqList.do'/>>FaQ - 기업</a>
				</li>
				<li class = "select" style="width: 33%;" id = "mid">
					<a href = <c:url value='/gogak/admin/personal/faqList.do'/>>FaQ - 일반</a>
				</li>
				<li class = "select" style="width: 33%;" id = "btm">
					<a href = <c:url value='/gogak/qna/qnaList.do'/>>Q&A</a>
				</li>
				
			</ul>
			<div style="text-align: center; margin:5px; /* border:1px solid lightgray; */">
			
				<div id = "list">
					<div id = "upList">
						<c:if test="${!empty param.searchKeyword }">
							<p>검색어 : ${param.searchKeyword },
								 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
						</c:if>
						<!-- 페이징 -->
						<form action="<c:url value='/gogak/admin/personal/faqList.do'/>" 
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
					action="<c:url value = '/gogak/admin/personal/faqList.do'/>">
					<div class = "divList">
						<table class = "box2" style="width: 100%;">
							<colgroup>
							   <col style="width:10%;" />
							   <col style="width:10%;" />
							   <col style="width:20%;" />
							   <col style="width:30%;" />
							   <col style="width:30%;" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="chkAll"></th>
									<th>글번호</th>
									<th>카테고리</th>
									<th>질문</th>
									<th>답변</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<th colspan="5">등록된 자주찾는 질문이 없습니다.</th>
								</c:if>
								<c:if test="${!empty list }">
									<c:set var = "idx" value = "0"/>
										<c:forEach var = "vo" items="${list }">
											<tr>
												<td style = "text-align: center">
													<input type="checkbox" name="faqlist[${idx }].faqNo"
														value = "${vo.faqNo }">
												</td>
												<td style="text-align: center;">${vo.faqNo }</td>
												<td style="text-align: center;">${vo.category }</td>
												<td style="text-align: center;">
													<a href
														="<c:url value='/gogak/admin/personal/faqDetail.do?no=${vo.faqNo}'/>">
																${vo.question }
													</a>								
												</td>
												<td style="text-align: center;">
													<!-- 제목줄이기 -->
													<c:if test = "${fn:length(vo.answer)>=10 }">
														${fn:substring(vo.answer,0,10)}...
													</c:if>
													<c:if test="${fn:length(vo.answer)<10 }">
														${vo.answer }							
													</c:if>
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
					   		action='<c:url value="/gogak/admin/personal/faqList.do"/>'>
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
					        </select>
						        <input type="text" name="searchKeyword" title="검색어 입력"
						        	value="${param.searchKeyword}">   
								<input type="submit" value="검색"><br>
								<div id = "bt">
									<input type="button" id = "fnqWrite" value = "게시글 등록">
									<input type="button" id = "btMultiDel" value="선택한 게시글 삭제"><br><br>
								</div>
					    </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../../inc/adminBottom.jsp"%>



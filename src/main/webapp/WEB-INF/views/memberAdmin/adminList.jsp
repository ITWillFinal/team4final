<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/adminTop.jsp"%>

<style>
.divList{
    padding-top: 40px;
    padding-left: 80px;
    padding-bottom: 50px;
    padding-right: 80px;
}
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

#list{
	width: 800px;
	height: 700px;
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
.divList{height: 250px;}

/* 등록삭제 버튼 */
#bt{    
	margin-top: 20px;
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
			
		$('#setLevel').click(function() {
			var len = $('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert("관리등급을 변경할 관리자를 먼저 체크하세요.");
				return;
			}
			
			$('form[name=frmList]')
				.prop("action", "<c:url value = '/memberAdmin/setLevel.do'/>");
			
			$('form[name=frmList]').submit();
		});
		
		$('#setLevel').click(function() {
			location.href = "<c:url value = '/memberAdmin/setLevel.do'/>";
		});
	});
</script>
<main>
	
	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<ul class = "tabList" style="width: 857px; margin-left: 0px;">
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
		<div id = "list">
			<div id = "upList">
				<%-- <c:if test="${!empty param.searchKeyword }">
					<p>검색어 : ${param.searchKeyword },
						 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
				</c:if>
				<!-- 페이징 => 관리자에 페이지가 필요한지 확인!-->
				<form action="<c:url value='/gogak/admin/company/faqList.do'/>" 
					name="frmPage" method="post">
					<input type="hidden" name="currentPage">
					<input type="hidden" name="searchCondition" 
						value="${param.searchCondition}">
					<input type="hidden" name="searchKeyword" 
						value="${param.searchKeyword}">	
				</form> --%>
			</div>
		<div>
		<form name="frmList" method="post"
			action="<c:url value = '/gogak/admin/company/faqList.do'/>">
			<div class = "divList">
				<table class = "box2" style="width: 700px; margin-top: 45px;">
					<colgroup>
					   <col style="width:10%;" /><!-- 체크박스 -->
					   <col style="width:10%;" /><!-- 번호 -->
					   <col style="width:20%;" /><!-- ID -->
					   <col style="width:30%;" /><!-- 이름 -->
					   <col style="width:15%;" /><!-- 등급 -->
					   <col style="width:15%;" /><!-- 연락처 -->
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="chkAll"></th>
							<th>번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>관리자 등급</th>
							<th>관리자 연락처</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<th colspan="6">등록된 관리자가 없습니다.</th>
						</c:if>
						<c:if test="${!empty list }">
							<c:set var = "idx" value = "0"/>
								<c:forEach var = "map" items="${list }">
									<tr>
										<td style = "text-align: center">
											<input type="checkbox" name="adminlist[${idx }].adminNo"
												value = "${map['ADMIN_NO'] }">
											<input type="hidden" value = "${map['ADMIN_NO'] }">
										</td>
										<td style="text-align: center;">${map['ADMIN_NO'] }</td>
										<td style="text-align: center;">${map['ADMIN_ID'] }</td>
										<td style="text-align: center;">${map['ADMIN_NAME'] }</td>
										<td style="text-align: center;">${map['LEVEL_NAME'] }</td>
										<td style="text-align: center;">${map['TEL'] }</td>
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
			   		action='<c:url value="/gogak/admin/company/faqList.do"/>'>
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
							<input type="button" id = "setLevel" value = "관리자 등급 설정">
							<input type="button" id = "btMultiDel" value="선택한 관리자 삭제"><br><br>
						</div>
			    </form>
			</div>
		</div>
	</div>
</main>

<%@ include file="../inc/adminBottom.jsp"%>



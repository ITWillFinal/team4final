<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/top.jsp"%>

<style>
h2 {
    padding-left: 300px;
    padding-top: 20px;
}
.divList{
    padding-left: 300px;
    padding-top: 30px;
    padding-bottom: 50px;
}
table{
	border-bottom: 1px solid lightgray;
}
th{
	border-bottom: 3px solid lightgray;
	text-align: center;
}
td{
	border-bottom: 1px solid lightgray;
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

.divSearch{
	padding-left: 450px;
}

.divPage{
	padding-left: 450px;
	text-align:center;
	padding:5px 0 10px 450px;
}

.divList{
	height: 250px;
}

</style>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>


<div id = "list">
	<h2>자주찾는 질문 관리</h2>
	<div id = "upList">
		<c:if test="${!empty param.searchKeyword }">
			<p>검색어 : ${param.searchKeyword },
				 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
		</c:if>
		<!-- 페이징 -->
		<form action="<c:url value='/gogak/faqList.do'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchCondition" 
				value="${param.searchCondition}">
			<input type="hidden" name="searchKeyword" 
				value="${param.searchKeyword}">	
		</form>
	</div>
	<div class = "divList">
		<table class = "box2" style="width: 700px;">
			<colgroup>
			   <col style="width:10%;" />
			   <col style="width:30%;" />
			   <col style="width:30%;" />
			   <col style="width:30%;" />
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>카테고리</th>
					<th>질문</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<th colspan="4">등록된 자주찾는 질문이 없습니다.</th>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var = "vo" items="${list }">
						<tr>
							<td style="text-align: center;">${vo.fnqNo }</td>
							<td style="text-align: center;">${vo.category }</td>
							<td style="text-align: left;">
								<a href
									="<c:url value='/gogak/faqDetail.do?no=${vo.fnqNo}'/>">
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
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 ◀ -->
		<%-- <c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/resources/images/first.JPG'/>" 
					alt="이전 블럭으로 이동">
			</a>
		</c:if>  --%>
		
		<!-- 페이지 번호 1~10 -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">		
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageProc(${i})">[${i}]</a>			
			</c:if>
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold">${i}</span>			
			</c:if>		
		</c:forEach>
			
		<!-- 다음 블럭으로 이동 ▶ -->
		<%-- <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
				<img src="<c:url value='/resources/images/last.JPG'/>" 
					alt="다음 블럭으로 이동">
			</a>
		</c:if> --%>
		<!--  페이지 번호 끝 -->
	</div>
	<div class="divSearch">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/gogak/faqList.do"/>'>
	        <select name="searchCondition">
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
			<input type="submit" value="검색">
	    </form>
	</div>
</div>




<%@ include file="../inc/bottom.jsp"%>
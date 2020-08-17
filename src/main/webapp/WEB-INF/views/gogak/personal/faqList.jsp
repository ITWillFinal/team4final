<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../inc/top.jsp"%>

<style>.divList{
    padding-bottom: 5%;
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
	width:100%
}
#o > div > div {
    border: 1px solid lightgray;
}
/* 페이징 */
.divPage {
    text-align: center;
    margin-top: 3%;
}

/* 목록 */

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
input[type="text"] {
    margin-left: 10px;
    height: 27px;
}
input#btMultiDel {
    margin: 0 auto;
    margin-top: 20px;
}
li#fst {
    padding-top: 5%;
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
input#startDay {
    width: 18%;
}
input#endDay {
    width: 18%;
}
p.rst {
    margin-top: 2%;
    margin-bottom: 2%;
}
.divList {
    padding-left: 2%;
    padding-right: 2%;
}
h2#h2Title {
    margin-left: 31%;
    margin-bottom: 1%;
    font-weight: bold;
}
span#totalPrice {
    color: #FB246A;
}
div#o {
    padding-top: 2%;
}
</style>
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
				alert("삭제하려는 상품을 먼저 체크하세요.");
				return;
			}
			
			$('form[name=frmList]')
				.prop("action", "<c:url value = '/gogak/personal/deleteMulti.do'/>");
			
			$('form[name=frmList]').submit();
		});
		
		$('#fnqWrite').click(function() {
			location.href = "<c:url value = '/gogak/personal/faqWrite.do'/>";
		});
	});
</script>
<main>
	<%@ include file="../../inc/sidebar.jsp"%>
	<div id = "o">
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px; /* border:1px solid lightgray; */">
		<h2 style="margin-left: 18px; font-weight: bold; margin-bottom: 2%;">고객센터</h2>
		<div>
			<div style="margin:5px; height:95px; /* border:1px solid lightgray; */">
			<h2 style = "padding-left: 50px; padding-top: 30px; padding-left: 14px; adding-top: 25px; font-size: 1.8em;">자주찾는 질문</h2>
			</div>
			<div style="text-align: center; margin:5px; /* border:1px solid lightgray; */">
				<div id = "list">
					<div id = "upList">
						<c:if test="${!empty param.searchKeyword }">
							<p>검색어 : ${param.searchKeyword },
								 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
						</c:if>
						<!-- 페이징 -->
						<form action="<c:url value='/gogak/personal/faqList.do'/>" 
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
					action="<c:url value = '/gogak/personal/faqList.do'/>">
					<div class = "divList">
						<table class = "box2" style="width: 100%;">
							<colgroup>
							   <col style="width:20%;" />
							   <col style="width:20%;" />
							   <col style="width:30%;" />
							   <col style="width:30%;" />
							</colgroup>
							<thead>
								<tr>
									<!-- <th><input type="checkbox" name="chkAll"></th> -->
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
									<c:set var = "idx" value = "0"/>
										<c:forEach var = "vo" items="${list }">
											<tr>
												<td style="text-align: center;">${vo.faqNo }</td>
												<td style="text-align: center;">${vo.category }</td>
												<td style="text-align: center;">
													<a href
														="<c:url value='/gogak/personal/faqDetail.do?no=${vo.faqNo}'/>">
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
					   		action='<c:url value="/gogak/personal/faqList.do"/>'>
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
								<!-- <div id = "bt">
									<input type="button" id = "fnqWrite" value = "게시글 등록">
									<input type="button" id = "btMultiDel" value="선택한 게시글 삭제"><br><br>
								</div> -->
					    </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>

<%@ include file="../../inc/bottom.jsp"%>



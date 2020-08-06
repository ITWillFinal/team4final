<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/comMypageTop.jsp"%>


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
	 padding-left: 80px;
}
/* 페이징 */
.divPage {
	text-align:center;     
	margin-top: 70px;
    margin-bottom: 25px;
    width: 1100px;
}

/* 목록 */
.divList{height: 250px;}
/* 리스트 상단 탭 */
ul, li{list-style: none;}
.tabList>li .inTab:hover,
.tabList>li .inTab:focus {text-decoration:underline}

li.select {
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
	
	$('#btMultiDel').click(function() {
		var len = $('tbody input[type=checkbox]:checked').length;
		if(len==0){
			alert("삭제하려는 게시글을 먼저 체크하세요.");
			return;
		}
		
		$('form[name=frmList]')
			.prop("action", "<c:url value = '/companypage/employmentNotice/deleteMulti.do'/>");
		
		$('form[name=frmList]').submit();
	});
	
	$('#deleteNotice').click(function(){
		var result = confirm('Are you sure you want to do this?'); 
		if(result) { //yes 
		}else {
			return false;
		}
		

	});

	
});
</script>
	<main>
		<!-- main -->
		<div style="text-align: center;  margin:0 auto; width:60%; height:800; border:1px solid lightgray;">
			<div id = "list">
				<div id = "upList" style="width: 1000px; margin-top: 50px;">
					<c:if test="${!empty param.searchKeyword }">
						<p>검색어 : ${param.searchKeyword },
							 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
					</c:if>
					<c:if test="${empty param.searchKeyword }">
							 ${pagingInfo.totalRecord}건 검색되었습니다.</p>
					</c:if>
					<!-- 페이징 -->
					<form action="<c:url value='/companypage/employmentNotice/employmentNoticeList.do'/>" 
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
				action="<c:url value = '/companypage/employmentNotice/employmentNoticeList.do'/>">
				<div class = "divList">
					<table class = "box2" style="width: 1000px; margin-top: 45px;">
						<colgroup>
						   <col style="width:3%;" />
						   <col style="width:22%;" />
						   <col style="width:25%;" />
						   <col style="width:15%;" />
						   <col style="width:15%;" />
						   <col style="width:10%;" />
						   <col style="width:10%;" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="chkAll"></th>
								<th>기업명</th>
								<th>제목</th>
								<th>등록일</th>
								<th>모집종료일</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty comRecruitVoList }">
								<th colspan="7">등록된 채용 정보가 없습니다.</th>
							</c:if>
							<c:if test="${!empty comRecruitVoList }">
								<c:set var = "idx" value = "0"/>
									<c:forEach var = "vo" items="${comRecruitVoList }">
										<tr>
											<td style = "text-align: center">
											<input type="checkbox" name="comrRecruitList[${idx }].recruitmentCode"
													value = "${vo.recruitmentCode }">
											</td>
											<td style="text-align: center;">
												<!-- 제목줄이기 -->
												<c:if test = "${fn:length(vo.comName)>=10 }">
													${fn:substring(vo.answer,0,10)}...
												</c:if>
												<c:if test="${fn:length(vo.comName)<10 }">
													${vo.comName }							
												</c:if>
											</td>
											<td style="text-align: center;">
												<!-- 제목줄이기 -->
												<c:if test = "${fn:length(vo.title)>=10 }">
													${fn:substring(vo.title,0,10)}...
												</c:if>
												<c:if test="${fn:length(vo.title)<10 }">
													${vo.title }							
												</c:if>
											</td>
											<td style="text-align: center;">${vo.regdate }</td>
											<td style="text-align: center;">${vo.recDeadline }</td>
											<td style="text-align: center;">
												<a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }' />">수정</a>
											</td>
											<td style="text-align: center;">
												<a href="<c:url value='/companypage/employmentNotice/employmentNoticeDelete.do?recruitmentCode=${vo.recruitmentCode }' />" id="deleteNotice">삭제</a>
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
		<div class="bottomBody" style="margin-top: 320px;">
				<div class="divPage">
					<!-- 페이지 번호 추가 -->
					<!-- 이전 블럭으로 이동 ◀ -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> ◁ </a>
					</c:if>
			
					<!-- 페이지 번호 1~10 -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageProc(${i})">[${i}]</a>
						</c:if>
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-weight: bold; font-size: 12px;">${i}</span>
						</c:if>
					</c:forEach>
			
					<!-- 다음 블럭으로 이동 ▶ -->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> ▷ </a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>
				<div class="divSearch" style="margin-top: 10px; width: 1200px; text-align: center;">
					<form name="frmSearch" method="post"
						action='<c:url value="/companypage/employmentNotice/employmentNoticeList.do"/>'>
						<select name="searchCondition" style="margin-top: 8px;">
							<option value="COM_NAME"
								<c:if test="${param.searchCondition=='COM_NAME' }">
			            		selected="selected"
			            	</c:if>>기업명</option>
							<option value="title"
								<c:if test="${param.searchCondition=='title' }">
			            		selected="selected"
			            	</c:if>>제목</option>
						</select> 
						<input type="text" name="searchKeyword" title="검색어 입력"
							style="margin-top: 8px;" value="${param.searchKeyword}"> <input
							type="submit" value="검색">
							<input type="button" id = "btMultiDel" value="선택한 게시글 삭제" style="margin-bottom: 50px"><br><br>
					</form>
				</div><!-- divPage -->
			</div>
			</div>
		</div>
	</main>
	<br><br><br><br>
<%@ include file="../../inc/companyBottom.jsp"%>
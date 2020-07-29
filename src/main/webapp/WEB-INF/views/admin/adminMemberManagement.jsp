<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../inc/adminTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

<!-- top -->
<script type="text/javascript">
	$(function(){
		function pageFunc(curPage){
			$('input[name=currentPage]').val(curPage);
			$("form[name=frmPage]").submit();
		};
		
		$("tbody #btUpdate").click(function() {
			var userNo = $(this).val();
			window.open(
			"<c:url value='/member/updateUser.do?userNo="
			+ userNo + "'/>", 'chk',
			'width=500,height=400,left=0,top=0,location=yes,resizable=yes');
		});
		
	})//function
		
	
</script>
<style type="text/css">
table{
	border-bottom: 1px solid lightgray;
}
th{
	border-bottom: 3px solid #FB246A;
	text-align: center;
}
td{
	border-bottom: 1px solid #FB246A;
	padding: 5px;
	text-align: center;
}
.divPage{
	text-align: center;
}
</style>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action="<c:url value='#'/>">
	<input type="hidden" name="startDay" value="${param.startDay }">
	<input type="hidden" name="endDay" value="${param.endDay }">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->
<!-- main top end-->

<!-- dateTerm start -->
<%@ include file="../inc/dateTerm.jsp" %>
<!-- dateTerm end -->

<div class="divList">
<table class="box2">
	<colgroup>
		<col style="width:8%" />
		<col style="width:5%" />
		<col style="width:5%" />
		<col style="width:17%" />	
		<col style="width:18%" />	
		<col style="width:15%" />	
		<col style="width:15%" />	
		<col style="width:10%" />	
		<col style="width:%" />	
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">회원번호 </th>
		<th scope="col">아이디 </th>
		<th scope="col">이름 </th>
		<th scope="col">이메일 </th>
		<th scope="col">연락처  </th>
		<th scope="col">가입일  </th>
		<th scope="col">탈퇴일  </th>
		<th scope="col">유저상태   </th>
		<th scope="col">수정   </th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty memberList}">
			<tr>
				<td colspan="9" class="align_center">
					 회원이 없습니다.</td>
			</tr>			
		</c:if>
		<c:if test="${!empty memberList}">		  
		  	<!--게시판 내용 반복문 시작  -->
		  	<c:forEach var="vo" items="${memberList }">		  			  	
				<tr class="align_center">
					<td>${vo.userNo }</td>
					<td>${vo.userid }</td>
					<td>${vo.userName }</td>
					<td>${vo.email }</td>
					<td>${vo.hp }</td>
					<td>
						${vo.regdate }</td>
					<td>
						<c:if test="${!empty vo.outdate }">
							<span style="color:gray">탈퇴한 회 원입니다.</span>
						</c:if>
						<c:if test="${empty vo.outdate }">
							<a href="<c:url value='/member/deleteUser.do?userNo=${vo.userNo }'/>">삭제</a>
						</c:if>
					</td>
					<td>${vo.userStatus }</td>
					<td>
						<button id="btUpdate" value="${vo.userNo }">수정</button>
					</td>
				</tr>
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 ◀ -->
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" 
				alt="이전 블럭으로 이동">
		</a>
	</c:if> 
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
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
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/images/last.JPG'/>" 
				alt="다음 블럭으로 이동">
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/reBoard/list.do"/>'>
        <select name="searchCondition">
            <option value="title" 
            	<c:if test="${param.searchCondition=='title' }">
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content' }">
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="name" 
            	<c:if test="${param.searchCondition=='name' }">
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
</div>


<!-- main bottom -->
<!-- bottom -->
<%@ include file="../inc/adminBottom.jsp"%>
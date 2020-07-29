<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../inc/adminTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- top -->

<script type="text/javascript">
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	};
	
	$(function(){
		$("tbody #btUpdate").click(function() {
			var userNo = $(this).val();
			var userStatus = $('.userStatusForUpdate').val();
			window.open(
			"<c:url value='/admin/adminMemberUpdate.do?userNo="
			+ userNo + "&userStatus="+ userStatus +"'/>", 'chk',
			'width=500,height=400,left=0,top=0,location=yes,resizable=yes');
		});
		
		
	});//function
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

<!-- 페이징 -->
<form action="<c:url value='/admin/adminMemberManagement.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage" >
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="hidden" name="adminStatus" 
		value="${param.adminStatus}">
</form>
<!-- 페이징 처리 form 끝 -->
<!-- main top end-->

<!--  -->
<a href="<c:url value='/admin/adminMemberManagement.do?adminStatus=U'/>">개인</a>
<a href="<c:url value='/admin/adminMemberManagement.do?adminStatus=C'/>">회사</a>

<c:if test="${!empty adminList }">
	<div class="divList" style="margin-top: 100px;">

<table class="box2">
	<colgroup>
		<col style="width:8%" />
		<col style="width:5%" />
		<col style="width:5%" />
		<col style="width:17%" />	
		<col style="width:18%" />	
		<col style="width:15%" />	
		<col style="width:15%" />	
		<col style="width:8%" />	
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
		<c:if test="${empty adminList}">
			<tr>
				<td colspan="9" class="align_center">
					 회원이 없습니다.</td>
			</tr>			
		</c:if>
		<c:if test="${!empty adminList}">		  
		  	<!--게시판 내용 반복문 시작  -->
		  	<c:forEach var="vo" items="${adminList }">		  			  	
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
						<button id="btUpdate" value="${vo.userNo }">수정
						<input type="hidden" class="userStatusForUpdate" value="${vo.userStatus }">
						</button>
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
<div class="divSearch" style="margin-top: 30px; text-align: center;">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/adminMemberManagement.do"/>'>
        <select name="searchCondition" style="margin-top: 8px;">
            <option value="user_id" 
            	<c:if test="${param.searchCondition=='user_id' }">
            		selected="selected"
            	</c:if>
            >아이디</option>
            <option value="user_name" 
            	<c:if test="${param.searchCondition=='user_name' }">
            		selected="selected"
            	</c:if>
            >이름</option>
            <option value="user_status" 
            	<c:if test="${param.searchCondition=='user_status' }">
            		selected="selected"
            	</c:if>
            >유저 상태</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" style="margin-top: 8px;"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
</div>
</c:if>

<!-- 개인 -->
<c:if test="${!empty memberList }">
	<div class="divList" style="margin-top: 100px;">
<table class="box2">
	<colgroup>
		<col style="width:8%" />
		<col style="width:5%" />
		<col style="width:5%" />
		<col style="width:17%" />	
		<col style="width:18%" />	
		<col style="width:15%" />	
		<col style="width:15%" />	
		<col style="width:8%" />	
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
						<button id="btUpdate" value="${vo.userNo }">수정
						<input type="hidden" class="userStatusForUpdate" value="${vo.userStatus }">
						</button>
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
<div class="divSearch" style="margin-top: 30px; text-align: center;">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/adminMemberManagement.do"/>'>
        <select name="searchCondition" style="margin-top: 8px;">
            <option value="userid" 
            	<c:if test="${param.searchCondition=='userid' }">
            		selected="selected"
            	</c:if>
            >아이디</option>
            <option value="userName" 
            	<c:if test="${param.searchCondition=='userName' }">
            		selected="selected"
            	</c:if>
            >이름</option>
            <option value="userStatus" 
            	<c:if test="${param.searchCondition=='userStatus' }">
            		selected="selected"
            	</c:if>
            >유저 상태</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" style="margin-top: 8px;"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
</div>
</c:if>


<!-- 회사 -->
<c:if test="${!empty comList }">
	<div class="divList" style="margin-top: 100px;">
<table class="box2">
	<colgroup>
		<col style="width:8%" />
		<col style="width:5%" />
		<col style="width:5%" />
		<col style="width:17%" />	
		<col style="width:18%" />	
		<col style="width:15%" />	
		<col style="width:15%" />	
		<col style="width:8%" />	
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
		<c:if test="${empty comList}">
			<tr>
				<td colspan="9" class="align_center">
					 회원이 없습니다.</td>
			</tr>			
		</c:if>
		<c:if test="${!empty comList}">		  
		  	<!--게시판 내용 반복문 시작  -->
		  	<c:forEach var="vo" items="${comList }">		  			  	
				<tr class="align_center">
					<td>${vo.cMemberCode }</td>
					<td>${vo.cUserid }</td>
					<td>${vo.cUsername }</td>
					<td>${vo.cEmail }</td>
					<td>${vo.cHp }</td>
					<td>
						${vo.cJoindate }</td>
					<td>
						<c:if test="${!empty vo.cOutdate }">
							<span style="color:gray">탈퇴한 회 원입니다.</span>
						</c:if>
						<c:if test="${empty vo.cOutdate }">
							<a href="<c:url value='/member/deleteUser.do?userNo=${vo.cMemberCode }'/>">삭제</a>
						</c:if>
					</td>
					<td>${vo.cUserStatus }</td>
					<td>
						<button id="btUpdate" value="${vo.cMemberCode }">수정
						<input type="hidden" class="userStatusForUpdate" value="${vo.cUserStatus }">
						</button>
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
<div class="divSearch" style="margin-top: 30px; text-align: center;">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/adminMemberManagement.do"/>'>
        <select name="searchCondition" style="margin-top: 8px;">
            <option value="cUserid" 
            	<c:if test="${param.searchCondition=='cUserid' }">
            		selected="selected"
            	</c:if>
            >아이디</option>
            <option value="cUsername" 
            	<c:if test="${param.searchCondition=='cUsername' }">
            		selected="selected"
            	</c:if>
            >이름</option>
            <option value="cUserStatus" 
            	<c:if test="${param.searchCondition=='cUserStatus' }">
            		selected="selected"
            	</c:if>
            >유저 상태</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" style="margin-top: 8px;"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
</div>
</c:if>
<!-- main bottom -->
<!-- bottom -->
<%@ include file="../inc/adminBottom.jsp"%>
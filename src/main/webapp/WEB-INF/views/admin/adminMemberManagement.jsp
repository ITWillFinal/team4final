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
			var userNo = $(this).find('.btupdate').val();
			var userStatus = $(this).next().val();
			window.open(
			"<c:url value='/admin/adminMemberUpdate.do?userNo="
			+ userNo + "&userStatus="+ userStatus +"'/>", 'chk',
			'width=500,height=500,left=500,top=300,location=yes,resizable=yes');
		});
		
		
	});//function
</script>
<style type="text/css">
table {
    border-bottom: 1px solid lightgray;
    margin-left: 2%;
    margin-right: 2%;
}

th {
	border-bottom: 3px solid #FB246A;
	text-align: center;
}

td {
	border-bottom: 1px solid #FB246A;
	padding: 5px;
	text-align: center;
    height: 50px;
}
.divPage {
    text-align: center;
    margin-top: 5%;
    margin-bottom: 1%;
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
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
#mid{
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
#btm{
	 /* border-bottom: 1px solid lightgray */; 
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
a{
	color: black;
}
</style>
<!-- 페이징 -->
<h2 style="margin-left: 20px">고객관리</h2>
<form action="<c:url value='/admin/adminMemberManagement.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition}"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="adminStatus" value="${param.adminStatus}">
</form>
<!-- 페이징 처리 form 끝 -->
<!-- main top end-->
	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<ul class = "tabList" style="width: 857px; margin-left: 0px;">
			<c:if test="${!empty adminList}">
				<li class = "select" style="width: 33%;" id = "btm">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=A'/>">전체</a>
				</li>
				<li class = "select" style="width: 33%;" id = "mid">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=U'/>">개인</a>
				</li>
				<li class = "select" style="width: 33%;" id = "fst">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=C'/>">회사</a>
				</li>
			</c:if>
			<c:if test="${!empty memberList}">
				<li class = "select" style="width: 33%;" id = "fst">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=A'/>">전체</a>
				</li>
				<li class = "select" style="width: 33%;" id = "btm">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=U'/>">개인</a>
				</li>
				<li class = "select" style="width: 33%;" id = "mid">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=C'/>">회사</a>
				</li>
			</c:if>
			<c:if test="${!empty comList}">
				<li class = "select" style="width: 33%;" id = "fst">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=A'/>">전체</a>
				</li>
				<li class = "select" style="width: 33%;" id = "mid">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=U'/>">개인</a>
				</li>
				<li class = "select" style="width: 33%;" id = "btm">
					<a class="" href="<c:url value='/admin/adminMemberManagement.do?adminStatus=C'/>">회사</a>
				</li>
			</c:if>
			
			
		</ul>
	<div class="divList" style="margin-top: 100px;">
		<table class="box2">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">연락처</th>
					<th scope="col">가입일</th>
					<th scope="col">탈퇴일</th>
					<th scope="col">유저상태</th>
					<th scope="col">수정</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${!empty adminList}">
					<!--게시판 내용 반복문 시작  -->
					<c:forEach var="vo" items="${adminList }">
						<tr class="align_center">
							<td>${vo.userNo }</td>
							<td>${vo.userid }</td>
							<td>${vo.userName }</td>
							<td>${vo.email }</td>
							<td>${vo.hp }</td>
							<td>${vo.regdate }</td>
							<td><c:if test="${!empty vo.outdate }">
									<span style="color: gray">탈퇴한 회원입니다.</span>
								</c:if> 
								<c:if test="${empty vo.outdate }">
									<c:if test="${vo.userStatus == 'U' }">
										<a href="<c:url value='/member/deleteUser.do?userNo=${vo.userNo }'/>">삭제</a>
									</c:if>
									<c:if test="${vo.userStatus == 'C' }">
										<a href="<c:url value='/admin/deleteComUser.do?cMemberCode=${vo.userNo }'/>">삭제</a>
									</c:if>
								</c:if></td>
							<td>${vo.userStatus }</td>
							<td>
							<a href="#" id="btUpdate">수정
								<input type="hidden" class="btupdate" value="${vo.userNo }">
							</a>
								<c:if test="${vo.userStatus == 'U' }">
									<input type="hidden" id="userStatusForUpdate" value="${vo.userStatus }">
								</c:if>
								<c:if test="${vo.userStatus == 'C' }">
									<input type="hidden" id="userStatusForUpdate" value="${vo.userStatus }">
								</c:if>
							</td>
							</tr>	
					</c:forEach>
					<!--반복처리 끝  -->
				</c:when>
				<c:when test="${!empty memberList}">
					<!--게시판 내용 반복문 시작  -->
					<c:forEach var="vo" items="${memberList }">
						<tr class="align_center">
							<td>${vo.userNo }</td>
							<td>${vo.userid }</td>
							<td>${vo.userName }</td>
							<td>${vo.email }</td>
							<td>${vo.hp }</td>
							<td>${vo.regdate }</td>
							<td><c:if test="${!empty vo.outdate }">
									<span style="color: gray">탈퇴한 회원입니다.</span>
								</c:if> <c:if test="${empty vo.outdate }">
									<a
										href="<c:url value='/member/deleteUser.do?userNo=${vo.userNo }'/>">삭제</a>
								</c:if></td>
							<td>${vo.userStatus }</td>
							<td>
							<a href="#" id="btUpdate">수정
								<input type="hidden" class="btupdate" value="${vo.userNo }">
							</a>
								<input type="hidden" id="userStatusForUpdate" value="${vo.userStatus }">
							</td>
						</tr>
						<input type="hidden" class="userStatusForUpdate"
										value="${vo.userStatus }">
					</c:forEach>
					<!--반복처리 끝  -->
				</c:when>
				<c:when test="${!empty comList }">
					<!--게시판 내용 반복문 시작  -->
					<c:forEach var="vo" items="${comList }">
						<tr class="align_center">
							<td>${vo.cMemberCode }</td>
							<td>${vo.cUserid }</td>
							<td>${vo.cUsername }</td>
							<td>${vo.cEmail }</td>
							<td>${vo.cHp }</td>
							<td>${vo.cJoindate }</td>
							<td><c:if test="${!empty vo.cOutdate }">
									<span style="color: gray">탈퇴한 회원입니다.</span>
								</c:if> <c:if test="${empty vo.cOutdate }">
									<a href="<c:url value='/admin/deleteComUser.do?cMemberCode=${vo.cMemberCode }'/>">삭제</a>
								</c:if></td>
							<td>${vo.cUserStatus }</td>
							<td>
							<a href="#" id="btUpdate">수정
								<input type="hidden" class="btupdate" value="${vo.cMemberCode }">
							</a>
								<input type="hidden" id="userStatusForUpdate" value="${vo.cUserStatus }">
							</td>
						</tr>
						<input type="hidden" class="userStatusForUpdate"
										value="${vo.cUserStatus }">
					</c:forEach>
					<!--반복처리 끝  -->
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" class="align_center">회원이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
				
			</tbody>
		</table>
	</div>
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
	<br>
	<a href="<c:url value='/memberExel.do'/>">[엑셀로 다운]</a>
	<div class="divSearch" style="margin-top: 30px; text-align: center;">
		<form name="frmSearch" method="post"
			action='<c:url value="/admin/adminMemberManagement.do"/>'>
			<select name="searchCondition" style="margin-top: 8px;">
				<option value="user_id"
					<c:if test="${param.searchCondition=='user_id' }">
            		selected="selected"
            	</c:if>>아이디</option>
				<option value="user_name"
					<c:if test="${param.searchCondition=='user_name' }">
            		selected="selected"
            	</c:if>>이름</option>
				<option value="user_status"
					<c:if test="${param.searchCondition=='user_status' }">
            		selected="selected"
            	</c:if>>유저
					상태</option>
			</select> <input type="text" name="searchKeyword" title="검색어 입력"
				style="margin-top: 8px;" value="${param.searchKeyword}"> <input
				type="submit" value="검색">
		</form>
	</div>
</div>
<!-- main bottom -->
<!-- bottom -->
<%@ include file="../inc/adminBottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- main left sidebar -->
	<style>
		.ui-widget-header{
			background-color: #2e3752;	
			color: white;
			border-top: 3px solid #fd5a77;
			border-right: 3px solid #13193e;
			border-left: 3px solid #fd5a77;
			border-bottom: 3px solid #13193e;
		}
		
	</style>
	<div style="float: left; width:250px; margin-left:16%; word-break:break-all; border:1px solid lightgray; font-size: 14px; margin-top: 35px;">
		
		<ul id="menu">
		  <li class="ui-widget-header"><div>채용정보</div></li>
		  <li><div><a href="<c:url value='/hireinpo/hireinpo.do'/>">채용정보 상세검색</a> </div></li>
		  <li><div><a href="<c:url value='/hireinpo/hot100.do'/>">HOT100</a></div></li>
		  <li><div><a href="<c:url value='/hireinpo/hireInfoByJobType.do'/>">직무별 채용정보</a></div></li>
		  <li><div><a href="<c:url value='/hireinpo/hireInfoByInduType.do'/>">산업별 채용정보</a></div></li>
		  <li><div><a href="<c:url value='/hireinpo/infoSearchByLocation.do'/>">지역별 채용정보</a></div></li>
		  <li class="ui-widget-header"><div>회원정보</div></li>
		  <li><div>회원정보수정</div></li>
		  <li><div>나의프로필</div></li>
		  <li class="ui-widget-header"><div>이력서관리</div></li>
		  <li><div>이력서 등록</div></li>
		  <li><div>이력서 현황</div></li>
		  <li><div>이력서 상태설정</div></li>
		  <li><div>입사요청 현황</div></li>		  
		  <li class="ui-widget-header"><div>고객센터</div></li>
		  <li><div><a href = "<c:url value = '/notice/memberNotice.do'/>">공지사항</a></div></li>
		  <li><div><a href = "<c:url value = '/gogak/personal/faqList.do'/>">자주 찾는 질문</a></div></li>
		  <li><div><a href = "<c:url value = '/gogak/qnaP/qnaWrite.do'/>">1:1 문의</a></div></li>
		  <li><div><a href = "<c:url value = '/gogak/qnaP/qnaList.do'/>">나의 1:1 문의</a></div></li>
		</ul>		
	</div>
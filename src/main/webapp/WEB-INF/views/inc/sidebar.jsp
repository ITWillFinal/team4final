<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- main left sidebar -->
	<style>		
		#sideMenuDiv {
			border:none;
			background: whitesmoke;	
		}
		
		.MenuHeadDiv {
			height:35px;
			padding: 5px 0px 0px 6px;
		}
		
		.MenuHeadDiv {
			background: #010B1D;
			border-top: 3px solid #FB246A;
			border-left: 3px solid #FB246A;
			color: white;
		}
		
		.MenuHoverDiv {
			height:35px;
			padding: 7.5px 0px 0px 9px;
			border-bottom: 0px;
		}
		
		.MenuHoverDiv a {
			color: black;
		}
				
		.MenuHoverDiv:hover{
			background: lightgray;
		}
		
	</style>
	<div style="float: left; min-height:900px; width:250px; margin-left:16%; word-break:break-all; font-size: 14px; margin-top: 35px;">
		<div id="sideMenuDiv">
			<div class="MenuHeadDiv">채용정보</div>
			<div class="MenuHoverDiv"><a href="<c:url value='/hireinpo/hireinpo.do'/>">채용정보 상세검색</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value='/hireinpo/hot100.do'/>">HOT100</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value='/hireinpo/hireInfoByJobType.do'/>">직무별 채용정보</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value='/hireinpo/hireInfoByInduType.do'/>">산업별 채용정보</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value='/hireinpo/infoSearchByLocation.do'/>">지역별 채용정보</a></div>
			<div class="MenuHeadDiv">회원정보</div>
			<div class="MenuHoverDiv">회원정보수정</div>
			<div class="MenuHoverDiv">나의프로필</div>
			<div class="MenuHeadDiv">이력서관리</div>
			<div class="MenuHoverDiv">이력서등록</div>
			<div class="MenuHoverDiv">이력서현황</div>
			<div class="MenuHoverDiv">이력서상태설정</div>
			<div class="MenuHoverDiv">입사요청현황</div>
			<div class="MenuHeadDiv">고객센터</div>
			<div class="MenuHoverDiv"><a href="<c:url value = '/notice/memberNotice.do'/>">공지사항</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value = '/gogak/personal/faqList.do'/>">자주 찾는 질문</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value = '/gogak/qnaP/qnaWrite.do'/>">1:1 문의</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value = '/gogak/qnaP/qnaList.do'/>">나의 1:1 문의</a></div>
		</div>		
	</div>
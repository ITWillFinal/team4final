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
		
		.MenuHoverDiv {
			height:35px;
			padding: 7.5px 0px 0px 9px;
			border-bottom: 0px;
		}
				
		.MenuHoverDiv:hover{
			background: lightgray;
		}		
		
		.MenuHeadDiv {
			background: #010B1D;
			border-top: 3px solid #FB246A;
			border-left: 3px solid #FB246A;
			color: white;
		}
		
		
		
		.ui-widget-header{
			background-color: #2e3752;	
			color: white;
			border-top: 3px solid #fd5a77;
			border-right: 3px solid #13193e;
			border-left: 3px solid #fd5a77;
			border-bottom: 3px solid #13193e;
		}
		
		.ui-widget.ui-widget-content {
    		border: none;
		}
		
	</style>
	<div style="float: left; width:250px; margin-left:16%; word-break:break-all; font-size: 14px; margin-top: 35px;">
		<div id="sideMenuDiv">
			<div class="MenuHeadDiv">채용정보</div>
			<div class="MenuHoverDiv">채용정보 상세검색</div>
			<div class="MenuHoverDiv">HOT100</div>
			<div class="MenuHoverDiv">직무별 채용정보</div>
			<div class="MenuHoverDiv">산업별 채용정보</div>
			<div class="MenuHoverDiv">지역별 채용정보</div>
			<div class="MenuHeadDiv">회원정보</div>
			<div class="MenuHoverDiv">회원정보수정</div>
			<div class="MenuHoverDiv">나의프로필</div>
			<div class="MenuHeadDiv">이력서관리</div>
			<div class="MenuHoverDiv">이력서등록</div>
			<div class="MenuHoverDiv">이력서현황</div>
			<div class="MenuHoverDiv">이력서상태설정</div>
			<div class="MenuHoverDiv">입사요청현황</div>
			<div class="MenuHeadDiv">고객센터</div>
			<div class="MenuHoverDiv">공지사항</div>
			<div class="MenuHoverDiv">자주찾는질문</div>
			<div class="MenuHoverDiv">1:1 문의</div>
			<div class="MenuHoverDiv">나의 1:1 문의</div>
		</div>
		
		<br><br><br><br>
		
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
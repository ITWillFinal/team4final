<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		
		#aTag{
			
		}
				
		.MenuHoverDiv:hover{
			background: lightgray;
		}
	</style>
	
	<div style="float: left; min-height:900px; width:250px; margin-left:16%; word-break:break-all; font-size: 14px; margin-top: 35px;">
		<div id="sideMenuDiv">
			<div class="MenuHeadDiv">기업정보관리</div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/cMemberEdit.do'/>">회원정보수정</a></div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/MyCompanyEdit.do'/>">회사정보수정</a></div>
			<div class="MenuHoverDiv">기업로고 / 사진관리</div>
	
			<div class="MenuHeadDiv">채용관리</div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/companyWrite.do'/>">채용정보등록</a></div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/employmentNotice/employmentNoticeList.do'/>">진행/마감인채용정보</a></div>
			
			<!-- <div class="MenuHoverDiv"><a href="<c:url value='/companypage/companyResumeUse.do'/>">임시)자사이력서양식사용</a></div> -->
			<!-- <div class="MenuHoverDiv"><a href="<c:url value='/companypage/companyResumeSet.do'/>">임시)자사이력서양식설정</a></div> -->
			
			<div class="MenuHeadDiv">인재정보</div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/applyManagement.do'/>">면접제의요청관리</a></div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/searchTalent.do'/>">맞춤인재정보</a></div>
			
			<div class="MenuHeadDiv">결제관리</div>
			<div class="MenuHoverDiv"><a href = "<c:url value ='/companypage/paymentListC.do'/>">결제내역조회</a></div>
			
			<div class="MenuHeadDiv">고객센터</div>
			<div class="MenuHoverDiv"><a href = "<c:url value = '/notice/comNotice.do'/>">공지사항</a></div>
			<div class="MenuHoverDiv"><a href = "<c:url value = '/gogak/company/faqList.do'/>">자주 찾는 질문</a></div>
			<div class="MenuHoverDiv"><a href = "<c:url value = '/gogak/qnaC/qnaWrite.do'/>">1:1 문의</a></div>
			<div class="MenuHoverDiv"><a href = "<c:url value = '/gogak/qnaC/qnaList.do'/>">나의 1:1 문의</a></div>			
		</div>		
	</div>
	
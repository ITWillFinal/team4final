<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
	<div style="float: left; width:250px; margin-left:16%; word-break:break-all; border:1px solid lightgray; font-size: 14px;">
		
		<ul id="menu">
		  <li class="ui-widget-header"><div>기업정보관리</div></li>
		  <li><div>기업정보수정</div></li>
		  <li><div>기업로고 / 사진관리</div></li>
		  <li class="ui-widget-header"><div>채용관리</div></li>
		  <li><div>채용정보등록</div></li>
		  <li><div>진행중인채용정보</div></li>
		  <li><div>마감된채용정보</div></li>
		  <li><div><a href="<c:url value='/companypage/companyResumeSet.do'/>">자사이력서양식설정</a></div></li>
		  <li class="ui-widget-header"><div>인재정보</div></li>
		  <li><div>입사지원요청관리</div></li>
		  <li><div>면접제의요청관리</div></li>
		  <li><div>맞춤인재정보</div></li>
		  <li class="ui-widget-header"><div>결제관리</div></li>
		  <li><div>결제내역조회</div></li>
		  <li><div>세금계산서발행</div></li>
		  <li class="ui-widget-header"><div>고객센터</div></li>
		  <li><div>자주 찾는 질문</div></li>
		  <li><div>1:1 문의</div></li>
		  <li><div>나의 1:1 문의</div></li>
		</ul>		
	</div>
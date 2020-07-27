<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.ddiv {
    padding-top: 15px;
    padding-left: 46px;
}

</style>

    <!-- main left sidebar -->
	<div style="float: left; width:250px; margin-left:18%; word-break:break-all; /* border:1px solid lightgray; */ font-size: 14px;">
	
		<div style="width:238px; height:200px; margin:5px; /* border: 1px solid lightgray; */">
			<br>
			<div style="text-align: center;">${sessionScope.name } 기업회원님</div>
			<br>
			<div style="text-align: center;">
				<input type="button" value="로그아웃"/>
				<input type="button" value="회원서비스"/>
			</div><br>
			<div style="margin-left:50px;">
				<span>진행중 채용정보 : x건</span><br>
				<span>마감된 채용정보 : x건</span><br>
				<span>총 입사지원자 : x명</span>
			</div>
		</div>
		<div class = "ddiv"style="width:238px; height:120px; margin:5px; /* border: 1px solid lightgray; */">
			<b id = "gogo">고객센터</b><br><br>
			<a href = "<c:url value = '/gogak/company/faqList.do'/>">자주찾는 질문</a><br>
		</div>
		<div class = "ddiv"style="width:238px; height:200px; margin:5px; /* border: 1px solid lightgray; */">
			<b id = "gogo">1:1 문의</b><br><br>
			<!-- 문의게시판 연결 -->
			<a href = "<c:url value = '/gogak/faqList.do'/>">나의 문의</a><br>
			<a href = "<c:url value = '/gogak/faqList.do'/>">문의 게시판</a><br>
		</div>
		
	</div>
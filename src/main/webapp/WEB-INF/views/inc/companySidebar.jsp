<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- main left sidebar -->
	<div style="float: left; width:250px; margin-left:18%; word-break:break-all; border:1px solid lightgray; font-size: 14px;">
	
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
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
		<div style="width:238px; height:100px; margin:5px; border: 1px solid lightgray;">
		기업정보관리<br><br>
		기업정보수정<br>
		기업로고/사진관리
		</div>
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
		채용관리<br><br>		
		채용정보등록<br>
		진행중인채용정보<br>
		마감된채용정보<br>
		</div>
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
		인재정보검색<br><br>		
		입사지원요청관리<br>
		면접제의요청관리<br>
		맞춤인재정보
		</div>
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
		결제관리<br><br>
		결제내역 조회<br>
		세금계산서 발행신청
		</div>
		
	</div>
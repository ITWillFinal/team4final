<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
	  $( function() {
	    $( "#menu" ).menu({
	      items: "> :not(.ui-widget-header)"
	    });
	  } );
	</script>

    <!-- main left sidebar -->
	<div style="float: left; width:250px; margin-left:16%; word-break:break-all; border:1px solid lightgray; font-size: 14px;">
		
		<div style="width:238px; height:200px; margin:5px;">
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
		<style>
			.ui-widget-header:hover{
				background-color: #2e3752;	
				color: white;
				border-top: 3px solid #fd5a77;
				border-right: 3px solid #13193e;
				border-left: 3px solid #fd5a77;
				border-bottom: 3px solid #13193e;
				
			}
		
		</style>
		<ul id="menu">
		  <li class="ui-widget-header"><div>기업정보관리</div></li>
		  <li><div>기업정보수정</div></li>
		  <li><div>기업로고/사진관리</div></li>
		  <li class="ui-widget-header"><div>채용관리</div></li>
		  <li><div>채용정보등록</div></li>
		  <li><div>진행중인채용정보</div></li>
		  <li><div>마감된채용정보</div></li>
		  <li class="ui-widget-header"><div>인재정보</div></li>
		  <li><div>입사지원요청관리</div></li>
		  <li><div>면접제의요청관리</div></li>
		  <li><div>맞춤인재정보</div></li>
		  <li class="ui-widget-header"><div>결제관리</div></li>
		  <li><div>결제내역조회</div></li>
		  <li><div>세금계산서발행</div></li>
		  <li><div>맞춤인재정보</div></li>
		</ul>		
	</div>
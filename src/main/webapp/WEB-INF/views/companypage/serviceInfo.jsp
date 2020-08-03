<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/companyTop.jsp" %>
<style>
		
	hr {
		border:1px solid #FB246A;
		width:100%;
	}
	
	/*JQUERY UI 색깔 분홍색으로 시작*/
	.ui-state-active, .ui-widget-content .ui-state-active,
	.ui-widget-header .ui-state-active, a.ui-button:active,
	.ui-button:active, .ui-button.ui-state-active:hover {
    border: 1px solid #767676;
    background: #fb246a;
    font-weight: normal;
    color: #ffffff;
    }
    /*JQUERY UI 색깔 분홍색으로 끝*/
</style>

<%--JQUERY UI 내용 길이로 컨텐트 길이 설정 시작--%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--JQUERY UI 내용 길이로 컨텐트 길이 설정 끝--%>

<script>
	<%--JQUERY UI 스크립트 시작--%>
	$( function() {
		$( "#accordion" ).accordion({
			heightStyle: "content"
		});
	});
	<%--JQUERY UI 스크립트 끝--%>
</script>


<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<div style="height:240px; background-color: #0a0a1e;">
			<div style="text-align: center;">
				<br>
				<br>
				<span style="font-size: 20px; font-weight: bold; color: white;">일자리를 더하다 +</span><br>
				<span style="font-size: 35px; font-weight: bold; color: white;">THE JOB</span>
				<span style="font-size: 40px; font-weight: bold; color: #FB246A;">+</span><br>
				<br>
				<span style="font-size: 20px; font-weight: bold; color: white;">사람의 가치를 더하는 더 잡</span>
				<span style="font-size: 30px; font-weight: bold; color: #FB246A;">+</span><br>
			</div>			
		</div>
		<br>
		<%-- JQUERY UI ACCORDION 시작 --%>
		<div id="accordion">
			<h3>기업정보관리</h3>
			<div>
				<p>
					THE JOB+ 의 기업회원은 기업정보를 간편하게 입력할 수 있습니다.<br>
					<br>
					구직자들이 자신이 지원하고자 하는 기업이 어떤 기업인지 쉽게 파악할 수 있도록<br>
					<br>
					기업정보를 반드시 입력하여 주시기 바랍니다.<br>
					<br>
					또한 입력하신 기업정보를 통해 더욱 빠르고 강력한 THE JOB+ 의 매칭시스템으로<br>
					<br>
					귀사에 필요한 인재들이 보다 많은 관심을 가질 수 있도록 서비스를 제공하고 있습니다.
				</p>
			</div>
			<h3>채용관리</h3>
			<div>
				<p>
					귀사에 필요한 인재를 구하기 위해 THE JOB+ 에서 채용을 진행하세요.<br>
					<br>
					THE JOB+ 의 구인구직 시스템을 통해 보다 빠르고 정확하게 인재를 구할 수 있습니다.<br>
					<br>
					채용공고를 등록하고 업데이트 하여 기업에 알맞는 인재와 만나보세요.<br>
					<br>
					또한 THE JOB+ 은 자사 이력서 양식을 제공하고 있습니다.<br>
					<br>
					채용공고 등록 시 THE JOB+ 형식의 자사 이력서 선택하고<br>
					<br>
					채용관리를 보다 편하게 진행해 보세요 !					
				</p>
			</div>
			<h3>인재정보</h3>
			<div>
				<p>
					채용공고 등록 후 구직자들의 입사지원이 시작됩니다.<br>
					<br>
					THE JOB+ 의 입사지원 형식을 선택한 경우 면접제의 요청관리가 가능합니다.<br>
					<br>
					THE JOB+ 는 기업에 맞는 인재상을 추천하고 있습니다.<br>
					<br>
					맞춤인재정보를 확인하고 구직자에게 먼저 면접제의를 해 보세요.
				</p>
			
			</div>
			<h3>결제관리</h3>
			<div>
				<p>
					기업회원은 채용공고 등록 시 결제를 요구합니다.<br>
					<br>
					회원님의 결제내역 조회 및 세금계산서 발행을 지원하고 있습니다.
				</p>				
			</div>
		</div>
		<%-- JQUERY UI ACCORDION 끝 --%>
		<br>
		<div style="text-align: center;">
			<img src="<c:url value='/resources/images/example.png'/>">
		</div>
		<br>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
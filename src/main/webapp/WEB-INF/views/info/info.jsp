<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style type="text/css">
	.divForm{
		margin: 0 auto;
		width: 800px;
		height: 700px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.infoTop{
		padding: 30px;
	
	}
	.info_summary{
		font-style: oblique;
		color: red;
		font-size: 25px;
	}
	.info_summary_id{
		font-style: inherit;
		color: #da5050;
		font-size: 25px;
	}
	.info_middle{
		margin-top: 50px;
		
	}
	.info_middle_write{
		margin-left: 50px;
	}
</style>

<div class="divForm">
	<div class="infoTop">
		<c:if test="${empty userid }">
			<span class="info_summary">방문자님 안녕하세요. 저희 The JOB에 관심 가져 주셔서 감사합니다.</span>
		</c:if>
		<c:if test="${!empty userid }">
			<span class="info_summary_id">${userid }님 안녕하세요.<br> 저희 회사를 이용해 주셔서 감사합니다. <br>더 나은 The JOB이 되겠습니다.</span>
		</c:if>
		
		<div class="info_middle">
			<img src="/team4final/resources/images/logo/logo.png" align="left" style="width: 30%; margin-bottom: 15px; padding-right: 30px; padding-bottom: 400px;">
				<div class="info_middle_write ">
					<h3>행복 Bridge, The JOB</h3>
					<span>The JOB은 뜨거운 열정과 사명감, 이용자 중심의 혁신적인 마인드와 도전적인 기술력으로 '사람'과 '일'을 잇는 기업입니다.</span>
					<br><br><br><br>
					
					<h3>대한민국 대표 리크루팅 플랫폼</h3>
					<span>온라인 취업포털 The JOB은 국내 최대량의 공채정보와 유용한 취업 콘텐츠를 정확하고 신속하게 제공합니다. 또, 발전전 기술력으로 구인 - 구직자를 효과적으로 매칭하여 대한민국을 대표하는 
					리크루팅 플랫폼으로 자리매김 했습니다.</span>
					<br><br><br><br>
					
					<h3>사람을 먼저 생각하는 서비스</h3>
					<span>The JOB의 모든 서비스는 사람을 먼저 생각합니다.
					구직자에게는 사회적 성취를 실현하고 행복한 삶의 터전이도리 일자리를, 기업에는 성장을 이끌 핵심인재를 연결합니다.
					기업과 인재의 매칭을 돋는 서비스로 대한민국의 행복지수를 높여 나가고 있습니다.</span>
					<br><br><br><br>
				</div>
			
		</div>
		
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
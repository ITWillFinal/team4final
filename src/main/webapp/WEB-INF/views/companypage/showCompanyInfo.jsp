<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date"/>
<style type="text/css">
	img {
	    width: 100%;
	}
	.form-control {
	    border: none;
	}

	.infoBox{
		border: 1px solid black;
		height: 1080px;
		margin-bottom: 10px;
		padding: 0 70px;
		border-radius: 80px / 80px;
		border: 1px solid #e0e0e08f;
		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
	}
	.info_company_ceo{
	    width: 170px;
		height: 65px;
	    background-color: #d63461;
	    border-radius: 0 0 8px 8px;
		padding: 0 16px;
		font-size: 20px;
		color: white;
		text-align: center;
		padding-top: 16px;
	}
	.info_company_name{
		margin-top: 15px;
		font-size: 25px;
		width:465px; 
		height: 56px;
		
	}
	.info_company_address{
		margin-top: 7px;
	}
	.company_adrees{
		border-right: 2px solid #d63461;
		margin-left: 5px;
		margin-right: 5px;
	}
	.fontBold{
		font-size: 15px;
	    font-weight: bolder;
	}
	.space{
		margin-left: 30px;
	
	}
	.pay_salary{
		margin-top: 15px;
		font-size: 25px;
		width:465px; 
		height: 56px;
	}
	.info_top{
		height: 230px;
	}
	.info_body_title{
		margin-top: 15px;
		font-size: 25px;
		width:465px; 
		height: 56px;
	}
	.fontNormal{
		font-weight: normal;
	}
	.fontBoldA{
		font-weight: bolder;
		margin-right: 31px;
	}
	.hr_c{
		height: 1px;
		background: #b3b3b3;
	}
	.hr_c_title{
		height: 3px;
		background: #b3b3b3;
	}
</style>
<main>
	<div id = "bbk"
		style="float: left; width: 49%; margin-left: 29%; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
		
		<!-- main -->
		<div style="margin: 5px; height: 95px;"><br>
			<h1 style="background: white; padding: 20px; font-weight: bold;">
				${vo.comName } 정보 조회 
			</h1>
		</div>
		<br>
		<hr>
		<form name="frm" method="post" style="margin-top: 50px;" enctype="multipart/form-data" >
			<input type="hidden" name = "comCode" value = ${vo.comCode }>
			<!-- 회사 정보 조회 -->
				<div class="infoBox">
					<section class="info_top">
						<div class="info_company_ceo">
							${vo.ceo}
						</div>
						<div class="info_company_name"  style="float: left">
							<span>${vo.comName}</span>
						</div>
						<div class="salary" >
							<span style="font-size: x-small;">예상평균금액</span><br>
							<c:if test="${!empty comRecruitVo }">
								<span class="pay_salary">${comRecruitVo.pay }</span>
							</c:if>
							<c:if test="${empty comRecruitVo }">
								<span>추후협의</span>
							</c:if>	
						</div>
						<div class="info_company_address" style="clear: both;">
							<c:set var="addressArr" value="${fn:split(vo.address,' ') }" />
							<span class="fontBold">소재지</span><span class="company_adrees"></span>
							<span>${addressArr[0] }</span>
							
							<c:if test="${!empty comRecruitVo }">
								<span class="fontBold space">산업군</span><span class="company_adrees"></span>
								<span>${comRecruitVo.induType1 }</span>
							</c:if>
						</div>
					</section>
					
					<section class="info_body">
						<div class="info_company_body">
							<span class="info_body_title">기업 정보</span>
							<hr class="hr_c_title">
							<div class="company_register_number">
								<span class="fontBoldA">사업자등록번호 : <span class="fontNormal">${vo.comNum}</span></span>
							</div>
							<hr class="hr_c">
							<div class="company_addr">
								<span class="fontBoldA">우편번호 : <span class="fontNormal">(${vo.zipcode}) ${vo.address} ${vo.addressDetail}</span></span>
							</div>
							<hr class="hr_c">
							<div class="company_hp">
								<span class="fontBoldA">내부전화번호 : <span class="fontNormal">${vo.comHp}</span></span>						
							</div>
							<hr class="hr_c">
							<div class="company_comType">
								<span class="fontBoldA">기업형태 : <span class="fontNormal">${vo.comType}</span></span>						
							</div>
							<hr class="hr_c">
							<div class="company_comIndustry">
								<span class="fontBoldA">기업업종 : <span class="fontNormal">${vo.comIndustry}</span></span>						
							</div>
							<hr class="hr_c">
							<div class="company_homepage">
								<c:if test="${empty vo.homepage }">
									<span class="fontBoldA">등록된 홈페이지가 없습니다</span>
								</c:if>
								<c:if test="${!empty vo.homepage }">
									<span class="fontBoldA">홈페이지 : <span class="fontNormal">${vo.homepage}</span></span>
								</c:if>
							</div>
							<hr class="hr_c">
							<div class="company_content">
								<span class="fontBoldA" >사업내용 : </span>
								<div class="company_content_write">
									<span>
										${fn:replace(vo.content , newLine, '<br>')}
									</span>
								</div>
							</div>
							<hr class="hr_c">
														
							<div class="company_image">
								<span class="fontBoldA">기업사진</span></span><br>
								<img class="fontBoldA" src="<c:url value = '/companyInfoImage/${vo.imageURL }'/>">
							</div>
						</div>
					</section>
				</div>
			<!-- 회사 정보 조회 끝 -->
		</form>
	</div>
</main>
<%@ include file="../inc/bottom.jsp" %>
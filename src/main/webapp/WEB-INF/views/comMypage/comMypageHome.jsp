<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/comMypageTop.jsp" %>
<script type="text/javascript">
	$(function() {
		$('#addHeadMenu div').hover(function() {
			$(this).css('background', 'skyblue');
		}, function() {
			$(this).css('background', 'white');
		});
		
		/* 수정하기 창으로 이동 */
		$('.editA').click(function(){
			var result = confirm("수정하시겠습니까?");
			if(result){
				location.href="<c:url value='/companypage/cMemberEdit.do'/> "
			}else{
				return false;
			}
			
		});
		
		$('.editComInfo').click(function(){
			var result = confirm("수정하시겠습니까?");
			if(result){
				location.href="<c:url value='/companypage/MyCompanyEdit.do'/> "
			}else{
				return false;
			}
			
		});
		
	});
</script>
<style>
	#addHeadMenu{
		overflow: hidden;
		margin-top: 50px;
		margin-left: 340px;
		margin-bottom: 100px;
	}
	#headMenu{
		float: left;
	    width: 150px;
	    height: 150px;
	    margin-left: 126px;
	    text-align: center;
	    border-radius: 80px / 80px;
	    padding-top: 25px;
	}
	#headMenu a{
		color: #010b1d;
	}
	#upDiv{
		margin: 90px 0;
	}
	#scrapListDiv{
		margin: 0 auto;
		width: 48%;
		
	}
	#listOne{
		border: 1px solid #e0e0e08f;
		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
	}
	.memberInfo{
		margin-left: 20px;
		width: 490px;
	}    
	.userName{
		font-size: xxx-large
	}
	.editA{
		margin-left: 120px;
		background-color: #fb246a;
		color: white;
		border-style: none;
	}
	.editComInfo{
		margin-left: 120px;
		color: black;
		border-style: none;
	}
</style>
<div>
	<div id="addHeadMenu">
		<div id="headMenu">
			<a href="#"><i class="far fa-address-card fa-4x"></i><br>
			<span>${resumeCount }/10</span><br>
			<span>이력서</span></a>
		</div>
		<div id="headMenu">
			<a href="#"><i class="far fa-calendar-check fa-4x"></i><br>
			<span></span><br>
			<span>입사지원</span></a>
		</div>
		<div id="headMenu">
			<a href="#"><i class="fas fa-hand-holding-usd fa-4x"></i><br>
			<span></span><br>
			<span>입사요청</span></a>
		</div>
		<div id="headMenu">
			<a href="#"><i class="far fa-star fa-4x"></i><br>
			<span>${scrap }</span><br>
			<span>스크랩</span></a>
		</div>
	</div>
	<div id="upDiv">
		<div id="scrapListDiv">
				<h3 style="margin: 40px;">MyProfile</h3>
					<div class="single-job-items mb-30" id="listOne">
						<div class="job-items">
							<div class="job-tittle">
							</div>
							<div class="memberInfo">
								<span class="userName">${comMemberVo.cUsername }</span><span>님</span><span>(${comMemberVo.cGender } ${birth }년생)</span>
									<input class="editA" type="button" value="수정하기">
								<br>
								<span>이메일 : ${comMemberVo.cEmail }</span><br>
								<span>전화번호 : ${comMemberVo.cHp }</span><br>
							</div>
						</div>
					</div>
		</div>
	</div>
	<c:if test="${empty comInfoVo}">
		<div id="upDiv">
			<div id="scrapListDiv">
					<a href="<c:url value='/companypage/companyInfoWrite.do'/> ">
						<h3 style="margin: 40px;">아직 회사 정보를 입력 하지 않으셨습니다. <span style="font-size: small;">(클릭시 자동으로 회사 정보 입력 창으로 이동)</span></h3>
					</a>
						
			</div>
		</div>
	</c:if>
	<c:if test="${!empty comInfoVo}">
		<div id="upDiv">
			<div id="scrapListDiv">
					<h3 style="margin: 40px;">Company Information</h3>
						<div class="single-job-items mb-30" id="listOne">
							<div class="job-items">
								<div class="job-tittle">
									<img src="<c:url value='/companyInfoImage/${comInfoVo.imageURL }'/>" alt="" width="230" align="absmiddle">
								</div>
								<div class="memberInfo">
									<span class="userName">${comInfoVo.comName }</span><span>님</span><span>(${comInfoVo.ceo }사장님)</span>
										<input class="editComInfo" type="button" value="수정하기">
									<br>
									<c:if test="${!empty comInfoVo.homepage }">
										<span>홈페이지 : ${comInfoVo.homepage }</span><br>
									</c:if>
									<c:if test="${empty comInfoVo.homepage }">
										<span>홈페이지 : (미입력)</span><br>
									</c:if>
									<span>전화번호 : ${comInfoVo.comHp }</span><br>
									<span>주소 : ${comInfoVo.zipcode } ${comInfoVo.address } ${comInfoVo.addressDetail }</span><br>
								</div>
							</div>
						</div>
			</div>
		</div>
	</c:if>
	
</div>
<%@ include file="../inc/bottom.jsp" %>
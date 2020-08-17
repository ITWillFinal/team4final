<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/comMypageTop.jsp" %>
<jsp:useBean id="today" class="java.util.Date"/>
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
		
		/* 서비스 연장 */
		$('.extendPeriod').click(function(){
			var recruitmentCode = $('.extendPeriod_recruitmentCode').val();
			var con = confirm("기간 연장하시겠습니까?");
			if(con){
				window.open(
					"<c:url value='/payment/extendPeriod.do?recruitmentCode="+recruitmentCode+"'/>", 'extendPeriod',
					'width=800,height=612,location=no, scrollbars=1, toolbars=no, menubar=no,left=500px,top=100');
			}else{
				return false;
			}
		});
		
	});
</script>
<style>
	#addHeadMenu{
		overflow: hidden;
		width:1120px;
		margin: 50px auto;
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
	.title{
		font-size: xxx-large
	}
	
	#scrapListDiv h3{
		margin: 30px 0;
	}
	
	.bttn1{
		width:100px;
		display: inline-block;
		margin-top: -0.5px;
		cursor: pointer;
		float: right;
	}
	
	.bttn1:hover{
		background: #ced4da;
		border:	1px solid #ced4da;
		color: white;
	}
</style>
<div>
	<div id="addHeadMenu">
		<div id="headMenu" style="margin-left: 120px">
			<a href="<c:url value='/companypage/MyCompany.do'/>"><i class="fas fa-building fa-4x"></i><br>
			<span></span><br>
			<span>회사정보</span></a>
		</div>
		<div id="headMenu">
			<a href="<c:url value='/companypage/employmentNotice/employmentNoticeList.do'/>"><i class="fas fa-paste fa-4x"></i><br>
			<span></span><br>
			<span>공고관리</span></a>
		</div>
		<div id="headMenu">
			<a href="<c:url value='/companypage/searchTalentManagement.do'/>"><i class="fas fa-hand-holding-usd fa-4x"></i><br>
			<span></span><br>
			<span>입사요청</span></a>
		</div>
		<div id="headMenu">
			<a href="<c:url value='/companypage/applyManagement.do'/>"><i class="fas fa-user-plus fa-4x"></i><br>
			<span></span><br>
			<span>지원자관리</span></a>
		</div>
	</div>
	<div id="upDiv">
		<div id="scrapListDiv">
				<h3>회원 정보</h3>
					<div class="single-job-items mb-30" id="listOne">
						<div class="job-items" style="width: 100%">
							<div class="job-tittle">
							</div>
							<div class="memberInfo">
								<span class="userName">${comMemberVo.cUsername }</span><span>님</span><span>(${comMemberVo.cGender } ${birth }년생)</span>
								<br>
								<span>이메일 : ${comMemberVo.cEmail }</span><br>
								<span>전화번호 : ${comMemberVo.cHp }</span><br>
							</div>
						</div>
						<div style="text-align: right;width: 100%">
									<input class="editA form-control bttn1" type="button" value="수정하기">
						</div>
					</div>
		</div>
	</div>
	<c:if test="${empty comInfoVo}">
		<div id="upDiv">
			<div id="scrapListDiv">
					<h3 style="margin: 40px;">
					<a href="<c:url value='/companypage/companyInfoWrite.do'/> ">
						아직 회사 정보를 입력 하지 않으셨습니다. <span style="font-size: small;">(클릭시 자동으로 회사 정보 입력 창으로 이동)</span>
					</a></h3>
						
			</div>
		</div>
	</c:if>
	<c:if test="${!empty comInfoVo}">
		<div id="upDiv">
			<div id="scrapListDiv">
				<h3>회사 정보</h3>
				<div class="single-job-items mb-30" id="listOne">
					<div class="job-items" style="width: 100%">
						<div class="job-tittle">
							<img src="<c:url value='/companyInfoImage/${comInfoVo.imageURL }'/>" alt="" width="230" align="absmiddle">
						</div>
						<div class="memberInfo">
							<span class="userName">${comInfoVo.comName }</span><span>님</span><span>(${comInfoVo.ceo } 대표님)</span>
								
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
					<div style="text-align: right;width: 100%">
							<input class="editComInfo form-control bttn1" type="button" value="수정하기">
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 회사 공고 -->
	<c:set var="check" value="0"/>
	<div id="upDiv">
		<div id="scrapListDiv">
			<h3>현재 진행중인 채용공고</h3>
			<c:if test="${!empty comRecuritListVo}">
				<c:forEach var="vo" items="${comRecuritListVo }">
					<fmt:parseDate var="end" value="${vo.endDate}" pattern="yy/MM/dd" />
					<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
					<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
					<c:if test="${endDate-startDate+1 >= 0}">
						<c:set var="check" value="${check + 1 }"/>
						<div class="single-job-items mb-30" id="listOne">
							
							<div class="job-items">
								<div class="job-tittle">
									<h4><a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">${vo.title }</a></h4>
									<ul>
										<li>${vo.comName }</li>
										<li><i class="fa fa-briefcase" aria-hidden="true"></i>${vo.jobType2 }</li>
										<li>${vo.pay }</li>
									</ul>
								</div>
							</div>
							<c:if test="${endDate-startDate+1 > 0}">
								<div class="items-link f-right">
									<a style="margin-bottom: 3px;" href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정 및 삭제</a>
									<a class="extendPeriod" href="#">기간연장</a>
									<input type="hidden" value="${vo.recruitmentCode }" class="extendPeriod_recruitmentCode">
									<span>지원마감까지 D - ${endDate-startDate+1 }일</span>
								</div>
							</c:if>
							<c:if test="${endDate-startDate+1 == 0}">
								<div class="items-link f-right">
									<a href="<c:url value='/companypage/employmentNotice/companyReWrite.do?recruitmentCode=${vo.recruitmentCode }'/>">수정 및 삭제</a>
									<span>오늘 지원 마감!</span>
								</div>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${check == 0}">
				<div class="single-job-items mb-30" id="listOne">
					<h4>현재 진행중인 채용공고가 없습니다.</h4>
				</div>
			</c:if>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
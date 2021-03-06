<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mypageTop.jsp" %>


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
				location.href="<c:url value='/member/memberEdit.do'/> "
			}else{
				return false;
			}
		});
		
		$('.outBtn').click(function(){
			var result = confirm("회원탈퇴하시겠습니까?");
			if(result){
				location.href="<c:url value='/member/memberOut.do'/>"
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
		margin-bottom: 50px;
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
		margin: 50px 0;
	}
	#scrapListDiv{
		margin: 0 auto;
		width: 900px;
		
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
	/* .editA{
		margin-left: 120px;
		color: black;
		border-style: none;
	} */
	.new{
		background: red;
		bo
	}
	/* .outBtn{
		color: black;
		border-style: none;
	} */
	
	.bttn1{
		width:100px;
		display: inline-block;
		margin-top: -0.5px;
		cursor: pointer;
	}
	
	.bttn1:hover{
		background: #ced4da;
		border:	1px solid #ced4da;
		color: white;
	}
</style>
<div style="min-height: 800px;">
	<div id="addHeadMenu">
		<div id="headMenu">
			<a href="<c:url value='/resume/resumeMain.do'/>"><i class="far fa-address-card fa-4x"></i><br>
			<span>${resumeCount }/10</span><br>
			<span>이력서</span></a>
		</div>
		<div id="headMenu">
			<a href="<c:url value='/member/currentApply.do'/>"><i class="far fa-calendar-check fa-4x"></i><br>
			<span>${applyNum }</span><br>
			<span>지원 현황</span></a>
		</div>
		<div id="headMenu">
			<div class="new"></div>
			<a href="<c:url value='/mypage/requestEmployment.do'/>"><i class="fas fa-hand-holding-usd fa-4x"></i><br>
			<span></span><br>
			<span>입사요청</span></a>
		</div>
		<div id="headMenu">
			<a href="<c:url value='/mypage/mypageScrap.do'/>"><i class="far fa-star fa-4x"></i><br>
			<span>${scrap }</span><br>
			<span>스크랩</span></a>
		</div>
	</div>
	<div id="upDiv">
		<div id="scrapListDiv">
				<h3 style="margin: 20px;">MyProfile</h3>
					<div class="single-job-items mb-30" id="listOne">
						<div class="job-items">
							<div class="job-tittle">
								<img src="<c:url value='/personalMemberProfile/${memberVo.imageURL }'/>" alt="" width="230" align="absmiddle"> 
							</div>
							<div class="memberInfo">
								<span class="userName">${memberVo.userName }</span><span>님</span><span>(${memberVo.gender } ${birth }년생)</span>
																	
								<br><br><br>
								<span>이메일 : ${memberVo.email }</span><br><br>
								<span>전화번호 : ${memberVo.hp }</span><br><br>
								<span>주소 : ${memberVo.zipcode } ${memberVo.address } ${memberVo.addressDetail }</span><br>
							</div>
						</div>
						<div style="text-align: right;width: 100%">
							<input class="form-control bttn1 editA" type="button" value="수정하기">
							<input class="form-control bttn1 outBtn" type="button" value="회원탈퇴">
						</div>
					</div>
		</div>
	</div>
	
</div>
<%@ include file="../inc/bottom.jsp" %>
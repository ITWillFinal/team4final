<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/mypageTop.jsp" %>
<style>
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
		color: black;
		border-style: none;
	}
</style>


<div id="upDiv">
		<div id="scrapListDiv">
				<h3 style="margin: 40px;">지원 현황</h3>
					<div class="single-job-items mb-30" id="listOne">
						<div class="job-items">
							<div class="job-tittle">
								<img src="<c:url value='/personalMemberProfile/${memberVo.imageURL }'/>" alt="" width="230" align="absmiddle"> 
							</div>
							<div class="memberInfo">
								<span class="userName">${memberVo.userName }</span><span>님</span><span>(${memberVo.gender } ${birth }년생)</span>
									<input class="editA" type="button" value="수정하기">
								<br><br><br>
								<span>이메일 : ${memberVo.email }</span><br><br>
								<span>전화번호 : ${memberVo.hp }</span><br><br>
								<span>주소 : ${memberVo.zipcode } ${memberVo.address } ${memberVo.addressDetail }</span><br>
							</div>
						</div>
					</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>
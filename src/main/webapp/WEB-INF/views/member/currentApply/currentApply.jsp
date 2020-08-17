<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/mypageTop.jsp" %>
<jsp:useBean id="today" class="java.util.Date"/>
<script type="text/javascript">
	$(function(){
		$('#applyDiv .applyDelete').click(function(){
			var con = confirm("정말 지원 취소 하시겠습니까?");
			var code = $(this).next().val();
			if(con){
				location.href="<c:url value='/application/applicationDelete.do?applyCode="+ code +"' />";
			}else{
				return false; 
			}
		});
		function open_resume(resumeNo){
			window.open("<c:url value='/companypage/talentResumeDetail.do?resumeNo="+resumeNo+"'/>",
					'RESUME','width=980,height=auto,left=850,top=250,location=yes,resizable=false')
		}
		$('#applyDiv .resumeNo').click(function(){
			var resumeNo = $(this).next().val();
			open_resume(resumeNo);
			
		});
		
		
	});

</script>

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
	.applyEmpty{
		height: 336px;
	
	}
	
	#passOrNot{
		color: white;
	    font-weight: bold;
	}
h1 {
  height: 100px;
}

h1 span {
  position: relative;
  top: 20px;
  display: inline-block;
  animation: bounce .3s ease infinite alternate;
  font-family: 'Titan One', cursive;
  font-size: 80px;
  color: black;
  text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px rgba(0, 0, 0, .4);
}

h1 span:nth-child(2) { animation-delay: .1s; }
h1 span:nth-child(3) { animation-delay: .2s; }
h1 span:nth-child(4) { animation-delay: .3s; }
h1 span:nth-child(5) { animation-delay: .4s; }
h1 span:nth-child(6) { animation-delay: .5s; }
h1 span:nth-child(7) { animation-delay: .6s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #CCC,
                 0 2px 0 #CCC,
                 0 3px 0 #CCC,
                 0 4px 0 #CCC,
                 0 5px 0 #CCC,
                 0 6px 0 #CCC,
                 0 7px 0 #CCC,
                 0 8px 0 #CCC,
                 0 9px 0 #CCC,
                 0 50px 25px rgba(0, 0, 0, .2);
  }
}
</style>
<div id="upDiv">
	<div id="scrapListDiv">
		<c:if test="${!empty list }">
			<h3 style="margin: 40px;">지원 현황</h3>
			<c:forEach var="map" items="${list }">
			
				<fmt:parseDate var="end" value="${map['END_DATE']}" pattern="yy/MM/dd" />
				<fmt:parseNumber value="${end.time / (1000*60*60*24) }" integerOnly="true" var="endDate"/>
				<fmt:parseNumber value="${today.time / (1000*60*60*24) }" integerOnly="true" var="startDate"/>
				<!-- resumeNo 값 -->
				<input type="hidden" value="${map['RESUME_NO']}" name="resumeNo" class="resumeNo">
				
				<div class="single-job-items mb-30" id="listOne">
					<div class="job-items">
						<div class="job-tittle">
							<a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${map["RECRUITMENT_CODE"] }'/>"><h4>${map['TITLE'] }</h4></a>
							<span><c:if test="${map['READ_CHECK'] == 'Y'}">[ 이력서 열람여부 : Y ]</c:if><c:if test="${empty map['READ_CHECK']}">[ 이력서 열람여부 : N ]</c:if></span>
							<ul>
								<li>${map['COM_NAME'] }</li>
								<li><i class="fa fa-briefcase" aria-hidden="true"></i>${map['JOB_TYPE2'] }</li>
								<li>${map['PAY'] }</li>
							</ul>
						</div>
					</div>
						<div class="items-link f-right" id="applyDiv">
							<c:if test="${map['APPLY_STATUS'] == '지원중' }">
								<a class="resumeNo" href="<c:url value='#'/>">${map['APPLY_STATUS'] }</a>
								<input type="hidden" value="${map['RESUME_NO'] }">
								<a class="applyDelete" href="<c:url value='#'/>" style="border: 0; margin: 0; padding: 0; color: #206ef9; background: white;">지원 취소</a>
								<input type="hidden" value="${map['APPLY_CODE'] }">
							</c:if>
							<c:if test="${map['APPLY_STATUS'] == '합격' }">
								<a id="passOrNot" style="background: #1a76ff; border: 1px solid #1a76ff;">합격</a>
							</c:if>
							<c:if test="${map['APPLY_STATUS'] == '불합격' }">
								<a id="passOrNot" style="background: #ff1f1f; border: 1px solid #ff1f1f;">불합격</a>
							</c:if>
							
							<c:if test="${endDate-startDate+1 > 0}">
									<span>지원마감까지 D - ${endDate-startDate+1 }일</span>
							</c:if>
							<c:if test="${endDate-startDate+1 == 0}">
									<span>마감까지 하루 남았습니다!</span>
							</c:if>
							<c:if test="${endDate-startDate+1 < 0}">
									<span>지원이 마감되었습니다.</span>
							</c:if>
						</div>
				</div>
			</c:forEach>
		</c:if>
		
		
		<!--  -->
		
			<c:if test="${empty list }">
				<div class="applyEmpty">
					<h3 style="margin: 40px; padding-bottom: 67px;">현재 지원하신게 없습니다.</h3>
					<a href="<c:url value='/hireinpo/hot100.do' />">
						<h1 style="margin-left: 33px;">
						  <span>지</span>
						  <span>금</span>
						  <span>바</span>
						  <span>로</span>
						  <span>지</span>
						  <span>원</span>
						  <span>!</span>
						</h1>						
					</a>
				</div>
			</c:if>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp" %>
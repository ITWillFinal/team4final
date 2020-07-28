<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/mypageTop.jsp" %>
<style type="text/css">
	.resumeMain{
		width: 80%;
		margin: 0 auto;
	}
	
	.resume-add{
	 	text-align: center; 
	 	margin: 30px;
	}
	
	.resumeList{
	    width: 60%;
	    margin: 10px auto;
	}
	
	.resumeList ul li {
	    margin: 20px;
	    font-size: larger;
	    font-weight: bold;
	    border-bottom: 1px solid;
	    padding: 15px 5px;
	}
	
	.resumeList ul li span{
		float: right;
	}
</style>

	<div class="resumeMain">
		<div class="resume-add">
			<a href="<c:url value='/resume/resumeWrite.do'/>" class="btn head-btn2" style="font-weight: bold; width: 500px;">새로운 이력서 등록하기</a>
		</div>
		<div class="resumeList">
			<ul>
				<li>등록된 이력서가 없습니다.</li>
			<c:if test="${empty resumeList }">
				<li>등록된 이력서가 없습니다.</li>
			</c:if>
			<c:if test="${!empty resumeList }">
				<c:forEach var="resumeVo" items="${resumeList }">
					<li><c:if test="${empty resumeVo.selfIntTitle or resumeVo.selfIntTitle==''}">no title</c:if>
						<c:if test="${!empty resumeVo.selfIntTitle or resumeVo.selfIntTitle!=''}">${resumeVo.selfIntTitle }</c:if>
						<span>${resumeVo.regdate }</span>
					</li>
				</c:forEach>				
			</c:if>
			</ul>
		</div>
	</div>
<%@ include file="../inc/bottom.jsp" %>
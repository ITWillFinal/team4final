<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../inc/companyTop.jsp" %>
<article>
	<div class="divForm">
		<form name="frm1" method="post"
			action="<c:url value='/admin/member/join.do'/>">
			<fieldset>
				<legend>관리자 등록</legend>
				<div>
					<label for="name">기업회원아이디</label> <input type="text" name="name"
						id="name" style="ime-mode: active">
				</div>
				<div>
					<label for="userid">관리자ID</label> <input type="text" name="userid"
						id="userid" style="ime-mode: inactive">&nbsp; <input
						type="button" value="중복확인" id="btChk" title="새창열림">
				</div>
				<div>
					<label for="pwd">비밀번호</label> <input type="Password" name="pwd"
						id="pwd">
				</div>
				<div>
					<label for="pwd2">비밀번호 확인</label> <input type="Password"
						name="pwd2" id="pwd2">
				</div>
				<div>
					<label for="level">레벨</label>&nbsp; <select name="authCode"
						id="level">
						<option value="">선택하세요</option>
						<c:forEach var="vo" items="${list }">
							<option value="${vo.authCode }">${vo.authName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="center">
					<input type="submit" id="wr_submit" value="등록">
				</div>
			</fieldset>

			<input type="text" name="chkId" id="chkId">

		</form>
	</div>
</article>

<%@include file="../../inc/bottom.jsp" %>
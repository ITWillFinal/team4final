<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>
<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
				
		채용공고코드<input type="text" name="recruitmentCode" id="recruitmentCode" value="${vo.recruitmentCode}"><br>
		유저아이디<input type="text" name="userId" id="userId" value="${vo.userId}"><br>
		이름<input type="text" name="name" id="name" value="${vo.name}"><br>
		성별<input type="text" name="gender" id="gender" value="${vo.gender}"><br>
		이메일<input type="text" name="email" id="email" value="${vo.email}"><br>
		전화번호<input type="text" name="hp" id="hp" value="${vo.hp}"><br>
		생년월일<input type="text" name="birth" id="birth" value="${vo.birth}"><br>
		우편번호<input type="text" name="zipcode" id="zipcode" value="${vo.zipcode}"><br>
		주소<input type="text" name="address" id="address" value="${vo.address}"><br>
		상세주소<input type="text" name="addressDetail" id="addressDetail" value="${vo.addressDetail}"><br>
		학력사항<input type="text" name="edu" id="edu" value="${vo.edu}"><br>
		경력사항<input type="text" name="career" id="career" value="${vo.career}"><br>
		자격증<input type="text" name="certificate" id="certificate" value="${vo.certificate}"><br>
		어학능력<input type="text" name="language" id="language" value="${vo.language}"><br>
		수상이력<input type="text" name="award" id="award" value="${vo.award}"><br>
		우대사항<input type="text" name="special" id="special" value="${vo.special}"><br>
		대외활동<input type="text" name="activity" id="activity" value="${vo.activity}"><br>
				
		<textarea>${vo.self1}</textarea><br>
		<textarea>${vo.self2}</textarea><br>
		<textarea>${vo.self3}</textarea><br>
		<textarea>${vo.self4}</textarea><br>
		<textarea>${vo.self5}</textarea>
		
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
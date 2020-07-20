<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<tr>
			<td>
				<center>
					<form action="<c:url value='/member/auth.do' /> " method="post">
						<br>
						<div>
							이메일 : <input type="email" name="e_mail" value="${param.email }"
								placeholder="  이메일주소를 입력하세요. ">
						</div>

						<br> <br>
						<button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
					</form>
			</td>
		</tr>
	</div>
</body>
</html>

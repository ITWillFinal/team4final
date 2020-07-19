<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<label class="control-label">EMAIL</label> <input type="text"
			id="email" name="email" placeholder="이메일을 입력하세요" class="form-control" />
		<button type="button" class="btn btn-info" id="emailBtn">이메일
			발송</button>
		<button type="button" class="btn btn-info" id="emailAuthBtn">이메일
			인증</button>
	</div>
	<input type="text" path="random" id="random" value="${random }" />
</body>
</html>
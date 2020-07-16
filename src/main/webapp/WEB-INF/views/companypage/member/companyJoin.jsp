<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>동영상과 다르게 부트스트랩 적용 Head 부분만 붙이면 됩니다.</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<form action="">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<div class="col-sm-3"></div>

					<div class="col-sm-6">
						<h2>회원가입</h2>
						<form action="RequestJoinProc.jsp" method="post">
							<table class="table table-boardered">
								<tr>
									<th>아이디</th>
									<td><input type="text" class="form-control" name="id"></td>
								</tr>
								<tr>
									<th>패스워드</th>
									<td><input type="password" class="form-control"
										name="pass"></td>
								</tr>

								<tr>
									<th>패스워드확인</th>
									<td><input type="password" class="form-control"
										name="pass2"></td>
								</tr>

								<tr>
									<th>이메일</th>
									<td><input type="email" class="form-control" name="email"></td>
								</tr>

								<tr>
									<th>전화번호</th>
									<td><input type="tel" class="form-control" name="tel"></td>
								</tr>

								<tr>
									<th>당신의 관심분야</th>
									<td><input type="checkbox" name="hobby" value="캠핑">캠핑
										&nbsp;&nbsp; <input type="checkbox" name="hobby" value="등산">등산
										&nbsp;&nbsp; <input type="checkbox" name="hobby" value="영화">영화
										&nbsp;&nbsp; <input type="checkbox" name="hobby" value="독서">독서
										&nbsp;&nbsp;</td>
								</tr>

								<tr>
									<th>당신의 직업은</th>
									<td><select name="job" class="form-control">
											<option value="교사">교사</option>
											<option value="변호사">변호사</option>
											<option value="의사">의사</option>
											<option value="기술사">기술사</option>
									</select></td>
								</tr>


								<tr>
									<th>당신의 연력은</th>
									<td><input type="radio" name="age" value="10">10대
										&nbsp;&nbsp; <input type="radio" name="age" value="20">20대
										&nbsp;&nbsp; <input type="radio" name="age" value="30">30대
										&nbsp;&nbsp; <input type="radio" name="age" value="40">40대
										&nbsp;&nbsp;</td>
								</tr>


								<tr>
									<th>하고 싶은 말</th>
									<td><textarea rows="5" cols="40" name="info"
											class="form-control"></textarea></td>
								</tr>


								<tr>
									<td colspan="2"><input type="submit"
										class="btn btn-primary" value="전송"> <input
										type="reset" class="btn btn-danger" value="취소"></td>
								</tr>


							</table>
						</form>
					</div>

				</div>
			</div>
		</div>
	</form>
</body>
</html>
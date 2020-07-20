<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/companyTop.jsp"%>
<html lang="ko">
<head>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	window.onload = function() {
		function idcheck() {
			var insertId = document.inputForm.id.value;
			alert("아이디는 " + insertId + " 입니다.");
			return;
		}
		function emailcheck() {
			var email1 = document.inputForm.email.value;
			alert("이메일은 " + email + " 입니다.");
			return;
		}

		function joincheck() {
			var sname = document.inputForm.sname.value;
			var gender = document.inputForm.gender.value;
			var birth1 = document.inputForm.birth1.value;
			var birth2 = document.inputForm.birth2.value;
			var birth3 = document.inputForm.birth3.value;
			var Hobbys = [];
			for (var i = 0; i < document.inputForm.hobby.length; i++) {
				if (document.inputForm.hobby[i].checked) {
					Hobbys.push(document.inputForm.hobby[i].value);
				}
			}
			alert("이름 : " + sname + "\n" + "성별:" + gender + "\n" + "생년월일:"
					+ birth1 + "년" + birth2 + "월" + birth3 + "일" + "\n" + "취미:"
					+ Hobbys.join("-"));
			return;
		}

		var checkBtn = document.getElementById("check");
		var checkEmail = document.getElementById("check2");
		var joinBtn = document.getElementById("join");
		addEvent(checkBtn, 'click', idcheck);
		addEvent(checkEmail, 'click', emailcheck);
		addEvent(joinBtn, 'click', joincheck);

	}
</script>
<style type="text/css">
#frm1 {
	margin: 0 auto;
	width: 500px;
}

#join {
	margin-right: auto;
	margin-left: auto;
}
</style>
<title>기업회원 가입</title>
</head>
<body>
	<div id="frm1">
		<form method="post" name="frm1" style="margin-top: 80px;" action="">
			<table width="900px">
				<tr>
					<td><label for="id">아이디 </td>
					<td><input type="text" name="id" id="id" size="20px">
						<input type="button" id="check" value="중복확인"></td>
				</tr>
				<tr>
					<td><label for="sname">닉네임</td>
					<td><input type="text" name="nickname" id="nickname" size="20px">
					</td>
				</tr>
				<tr>
					<td><label for="pwd">비밀번호 </td>
					<td><input type="text" name="pwd" id="pwd" size="20px">
						*영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자</td>
				</tr>
				<tr>
					<td><label for="sname">이름 </td>
					<td><input type="text" name="sname" id="sname" size="20px">
					</td>
				</tr>
				<tr>
					<td>생일/성별</td>
					<td><script type="text/javascript">
						var today = new Date();
						var toyear = parseInt(today.getFullYear());
						var start = toyear;
						var end = toyear - 15;

						document.write("<select name=birth1> ");
						document.write("<option value='2015' selected>");
						for (i = start; i >= end; i--)
							document.write("<option>" + i);
						document.write("</select>년  ");

						document.write("<select name=birth2>");
						document.write("<option value='' selected>");
						for (i = 1; i <= 12; i++)
							document.write("<option>" + i);
						document.write("</select>월  ");

						document.write("<select name=birth3>");
						document.write("<option value='' selected>");
						for (i = 1; i <= 31; i++)
							document.write("<option>" + i);
						document.write("</select>일  </font>");
					</script> <input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여" checked>여</td>
				</tr>
				<tr>
					<td><label for="dong">우편번호 </td>
					<td><input type="text" name="dong" id="dong" size="5">-
						<input type="text" name="dong" id="dong" size="5"> <input
						type="button" id="address" value="우편번호검색"></td>
				</tr>
				<tr>
					<td><label for="home">집주소 </td>
					<td><input type="text" name="home" id="home" size="60">
					</td>
				</tr>
				<tr>
					<td><label for="homeAddress">상세주소 </td>
					<td><input type="text" name="homeAddress" id="homeAddress"
						size="60"></td>
				</tr>
				<tr>
					<td><label for="phone">연락처 </td>
					<td><select id="phone">
							<option value=""></option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
					</select> - <input type="text" name="phone" id="phone" size="10">- <input
						type="text" name="phone" id="phone" size="10"></td>
				</tr>
				<tr>
					<td><label for="email">이메일 </td>
					<td><input type="text" name="email" id="email" size="10">@
						<select id="email2">
							<option value=""></option>
							<option value="1">http://www.google.com</option>
							<option value="2">http://www.naver.com</option>
							<option value="3">http://www.daum.com</option>
					</select> <input type="button" id="check2" value="중복확인"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><select name="hp1" id="hp1" title="휴대폰 앞자리">
							<option value="010">010</option>
				            <option value="011">011</option>
				            <option value="016">016</option>
				            <option value="017">017</option>
				            <option value="018">018</option>
				            <option value="019">019</option>
						</select> 
						-<input type="text" name="hp2" id="hp2" size="4" title="휴대폰 가운데자리">
						-<input type="text" name="hp3" id="hp3" size="4" title="휴대폰 뒷자리">
					</td>
				</tr>
				
			</table>
			<br>
			<br>
			<br> <input type="button" id="join" value="회원가입">
		</form>
	</div>
</body>
</html>

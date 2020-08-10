<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mypageTop.jsp" %>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('addr1').value = roadAddr;

			}
		}).open();

	}
</script>

<style type="text/css">
	.divForm {
		margin: 0 auto;
		width: 800px;
	}
	.spanClass{
		font-size: x-small;
    	color: red;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('form[name=frm]').submit(function() {
			if ($('#chPwd').val() != 'Y') {
				alert('비밀번호가 일치해야 합니다.');
				$("#chPwd").focus();
				event.preventDefault();
			}else if ($('#userName').val().length < 1) {
				alert('이름을 입력하세요');
				$('#userName').focus();
				event.preventDefault();
				return false;
			} else if ($('#nickname').val().length < 1) {
				alert('별명을 입력하세요');
				$('#nickname').focus();
				event.preventDefault();
				return false;
			}else if ($('#birth').val().length < 6 || $('#birth').val().length > 6) {
				alert("주민번호 앞자리를 제대로 입력해주세요");
				$(this).focus();
				event.preventDefault();
				return false;
			}
			
		});
		
		//모달을 전역변수로 선언
		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});
		
		/* email 전송 */
		$('input[name=email]').click(function() {
			var email = $('#email').val();
			window.open("<c:url value='/member/email.do'/>",'emailchk',
			'width=460,height=400,left=0,top=0,location=yes,resizable=yes');
		});
		
		/* 비밀번호 확인 */
		$('#pwd').keyup(function(){
			var pwd = $(this).val();
			$.ajax({
				url:"<c:url value='/member/memberEdit/checkPwd.do' />",
				type : "get",
				data : "pwd=" + pwd,
				dataType : "json",
				success : function(data){
					if(data){
						$('#chPwd').val("");
						$('#chkpwd2').html("비밀번호 확인 되었습니다.").css('color','green');
						$('#chPwd').val("Y");
					}else{
						$('#chPwd').val("");
						$('#chkpwd2').html("비밀번호가 틀렸습니다.").css('color','red');
						$('#chPwd').val("N");
					}
				},
				error : function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
			
		});
		
		
	});
</script>

<body>
	<div class="divForm">
		<form name="frm" method="post" style="margin-top: 100px;"
			action="<c:url value='/member/memberEdit.do' /> "
			enctype="multipart/form-data">
			<div class="form-group" id="divId">
				<legend>회원정보 수정</legend>
				<hr>
				<div class="registerList">
					<div class="form-group" id="divEmail">
						<div class="col-lg-10">
							<label for="inputEmail" class="col-lg-3 control-label">이메일인증</label> 
							<input type="email" class="form-control" id="email"
								name="email" data-rule-required="true" placeholder="이메일"
								maxlength="40" readonly="readonly" value="${memberVo.email }">
						</div>
					</div>
					<div class="col-lg-10">
						<label for="userid1" class="col-lg-2 control-label">아이디</label> <input
							type="text" class="form-control onlyAlphabetAndNumber"
							id="userid1" name="userid"
							placeholder="10자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30" readonly="readonly"
							value="${memberVo.userid }">
					</div>
					<div class="form-group" id="divpwd">
						<div class="col-lg-10">
							<label for="inputpwd" class="col-lg-3 control-label">기존 패스워드</label>
							<span class="spanClass">*변경을 하실려면 패스워드 인증을 하셔야 합니다</span>
							<input type="password" class="form-control" id="pwd" name="pwd"
								data-rule-required="true" placeholder="패스워드" maxlength="30">
							<div id="chkpwd2"
								style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
						</div>
					</div>
					<div class="form-group" id="divName">
						<div class="col-lg-10">
							<label for="inputName" class="col-lg-2 control-label">이름</label>
							<input type="text" class="form-control onlyHangul infobox"
								name="userName" id="userName" data-rule-required="true"
								placeholder="한글만 입력 가능합니다." maxlength="15" value="${memberVo.userName }">
						</div>
					</div>
					<div class="form-group" id="divProfile">
						<div class="col-lg-10">
							<label class="col-lg-3 control-label">프로필 사진</label> <input
								type="file" accept="image/*" name="imageUpload" id="imageUpload" class="infobox"
								placeholder="프로필 사진 업로드"> <img id="image" width="100"
								height="100" alt="Image Preview" style="display: none;">
						</div>
					</div>
					<div class="form-group" id="divNickname">
						<div class="col-lg-10">
							<label for="inputNickname" class="col-lg-2 control-label">별명</label>
							<input type="text" class="form-control" id="nickname"
								name="nickname" data-rule-required="true" placeholder="별명" value="${memberVo.nickname }"
								maxlength="15">
						</div>
					</div>
					<div class="form-group" id="divBirth">
						<div class="col-lg-10">
							<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
							<input type="text" class="form-control onlyNumber infobox"
								id="birth" name="birth" data-rule-required="true"
								placeholder="-를 제외하고 숫자만 입력하세요." maxlength="6" value="${memberVo.birth }">
							<div id="birthCheck"
								style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10">
							<label for="inputph" class="col-lg-2 control-label">성별</label> 
							<select class="form-control" id="gender" name="gender">
								<option value="남자"
									<c:if test="${memberVo.gender == '남자'}">
										selected="selected"
									</c:if>
								>남</option>
								<option value="여자"
									<c:if test="${memberVo.gender == '여자'}">
										selected="selected"
									</c:if>
								>여</option>
							</select>
						</div>
					</div>
					<div class="form-group" id="address">
						<div class="col-lg-10">
							<label for="zipcode" class="col-lg-2 control-label">주소</label> <input
								type="button" onclick="sample4_execDaumPostcode()"
								value="우편번호 찾기"><br> <input type="text"
								class="form-control" id="zipcode" name="zipcode"
								placeholder="우편번호" ReadOnly value="${memberVo.zipcode }">
						</div>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="addr1" name="address"
								placeholder="도로명주소" value="${memberVo.address }">
						</div>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="addressDetail"
								name="addressDetail" placeholder="상세주소" value="${memberVo.addressDetail }">
						</div>
					</div>
					<div class="form-group" id="divph">
						<div class="col-lg-10">
							<label for="inputph" class="col-lg-4 control-label">휴대폰번호</label>
							<input type="tel" class="form-control onlyNumber infobox" id="hp"
								name="hp" data-rule-required="true"
								placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" value="${memberVo.hp }">
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button type="submit" class="btn btn-primary">Sign in</button>
						</div>
					</div>
					<input type="hidden" name="chPwd" id="chPwd">
				</div>
			</div>
		</form>
	</div>
</body>


<%@ include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/comMypageTop.jsp" %>
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
		$('form[name=frmCom]').submit(function() {
			if($('#chPwd').val()!='Y'){
				alert('비밀번호 인증을 하셔야합니다.');
				$("#chPwd").focus();
				event.preventDefault();
			}else if($('#cUsername').val().length<1){
				alert('이름을 입력하세요');
				$('#cUsername').focus();
				event.preventDefault();
				return false;
			}else if($('#cNickname').val().length<1){
				alert('별명을 입력하세요');
				$('#cNickname').focus();
				event.preventDefault();
				return false;
			}else if($('#cBirth').val().length<6){
				alert('생년월일을 제대로 입력하세요');
				$('#cBirth').focus();
				event.preventDefault();
				return false;
			}
		});
		
		
		/* email 전송 */
		$('input[name=cEmail]').click(function(){
			window.open(
			"<c:url value='/companypage/member/email.do'/> ", 'emailchk',
			'width=420,height=300,left=0,top=0,location=yes,resizable=yes');
		});
		
		/* 비밀번호 확인 */
		$('#cPwd').keyup(function(){
			var cPwd = $(this).val();
			$.ajax({
				url:"<c:url value='/companypage/checkPwd.do' />",
				type : "get",
				data : "cPwd=" + cPwd,
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
		
		$('.onlyAlphabetAndNumber').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});

		$(".onlyHangul").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
			}
		});

		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});
		
		$('#cBirth').keyup(function(){
			if($('#cBirth').val().length < 6){
				$('#chkBirth').html("6자리 입력해주세요.").css('color', 'red');
			}else{
				$('#chkBirth').html("");
				
			}
		});
		//cHp
		$('#cHp').keyup(function(){
			if($('#cHp').val().length < 11){
				$('#chkHp').html("전화번호 11자리가 입력되지 않았습니다.").css('color', 'red');
			}else{
				$('#chkHp').html("");
			}
		});
	});

</script>

<body>
	<div class="divForm">
		<form name="frmCom" method="post" style="margin-top: 100px;"
			action="<c:url value='/companypage/cMemberEdit.do' /> "
			enctype="multipart/form-data" >
			<div class="form-group" id="divId">
				<legend>기업 회원 정보 수정</legend>
				<hr>
				<div class="form-group" id="divEmail">
				<div class="col-lg-10">
					<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					<input type="email" class="form-control" id="email" name="cEmail"
						data-rule-required="true" placeholder="이메일" maxlength="40"
						value="${cMemberVo.cEmail }"  readonly="readonly">
				</div>
			</div>
				<div class="col-lg-10">
					<label for="inputId" class="col-lg-2 control-label">아이디</label> 
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="cUserid1" name="cUserid" value="${cMemberVo.cUserid }" readonly="readonly"
						placeholder="아이디 변경은 불가능합니다." maxlength="10">
				</div>
			</div>
			<div class="form-group" id="divpwd">
				<div class="col-lg-10">
					<label for="inputpwd" class="col-lg-3 control-label">패스워드 확인</label> 
					<input type="password" class="form-control" id="cPwd" name="cPwd"
						data-rule-required="true" placeholder="패스워드" maxlength="30">
					<div id="chkpwd2" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>
			<div class="form-group" id="divName">
				<div class="col-lg-10">
					<label for="inputName" class="col-lg-2 control-label">이름</label> <input
						type="text" class="form-control onlyHangul infobox" name="cUsername"
						id="cUsername" data-rule-required="true" placeholder="한글만 입력 가능합니다."
						maxlength="15" value="${cMemberVo.cUsername }">
				</div>
			</div>
			<div class="form-group" id="divNickname">
				<div class="col-lg-10">
					<label for="inputNickname" class="col-lg-2 control-label">별명</label>
					<input type="text" class="form-control" id="cNickname"
						name="cNickname" data-rule-required="true" placeholder="별명"
						maxlength="15" value="${cMemberVo.cNickname }">
				</div>
			</div>
			<div class="form-group" id="divBirth">
				<div class="col-lg-10">
					<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
					<input type="text" class="form-control onlyNumber infobox" 
						id="cBirth" name="cBirth" data-rule-required="true"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="6" value="${cMemberVo.cBirth }">
						<div id="chkBirth" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10">
					<label for="inputph" class="col-lg-2 control-label">성별</label> <select
						class="form-control" id="cGender" name="cGender">
						<option value="남자"
							<c:if test="${cMemberVo.cGender == '남자'}">
								selected="selected"
							</c:if>
						>남</option>
						<option value="여자"
							<c:if test="${cMemberVo.cGender == '여자'}">
								selected="selected"
							</c:if>
						>여</option>
					</select>
				</div>
			</div>
			<div class="form-group" id="divph">
				<div class="col-lg-10">
					<label for="inputph" class="col-lg-4 control-label">휴대폰번호</label> <input
						type="tel" class="form-control onlyNumber infobox" id="cHp"
						name="cHp" data-rule-required="true" value="${cMemberVo.cHp }"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
						<div id="chkHp" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">Sign in</button>
				</div>
			</div>
			<input type="hidden" name="chPwd" id="chPwd">
			<input type="hidden" name="cMemberCode" id="cMemberCode" value="${cMemberVo.cMemberCode }">
		</form>
	</div>
</body>




<%@ include file="../inc/bottom.jsp" %>
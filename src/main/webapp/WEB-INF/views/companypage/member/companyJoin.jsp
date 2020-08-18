<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/companyTop.jsp"%>
<script type="text/javascript">
	$(function() {
		$('form[name=frmCom]').submit(function() {
			if($('#chkEmail').val()!='Y'){
				alert('이메일 인증을 하셔야합니다.');
				$("#chkEmail").focus();
				event.preventDefault();
			}else if($('#cUserid1').val().length<1){
				alert('이름을 입력하세요!');
				$('#cUserid1').focus();
				event.preventDefault();
				return false;
			}else if($('#cPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#cPwd').focus();
				event.preventDefault();
				return false;
			}else if($('#cPwd').val()!=$('#cPwd2').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#cPwd2').focus();
				event.preventDefault();
				return false;
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
			}else if($('#chkId').val()!='Y'){
				alert('아이디 중복확인을 하셔야 합니다.');
				$("#btnChkId").focus();
				event.preventDefault();
			}else if($('#cBirth').val().length<6){
				alert('생년월일을 제대로 입력하세요');
				$('#cBirth').focus();
				event.preventDefault();
				return false;
			}
		});
		
		$('#cPwd2').keyup(function(){
			if($('#cPwd').val()!=$('#cPwd2').val()){
				$('#chkpwd2').html("비밀번호가 같지 않습니다.").css('color', 'red');
			}else{
				$('#chkpwd2').html("비밀번호가 일치합니다.").css('color','green');
			}
		});
		
		$('#cUserid1').keyup(function(){
			if($('#cUserid1').val().length < 4){
				$('#chkId2').html("아이디는 4글자 이상부터 가능합니다").css('color', 'red')
				$('#chkId').val("N");
				
			}else{
				var cUserid1=$('#cUserid1').val();
				console.log(cUserid1);
				
				$.ajax({
					url:"<c:url value='/companypage/member/checkId.do' />",
					type:"get",
					data:"cUserid1=" +cUserid1,
					success:function(res){
						if(res > 0){
							$('#chkId2').html("중복된 아이디가 있습니다").css('color', 'red');
							$('#chkId').val("N");
							
						}else{
							$('#chkId2').html("사용 가능한 아이디입니다").css('color','green');
							$('#chkId').val("Y");
						}
						
					},
					error:function(xhr, status,error){
						alert(status +", " + error);
						
					}
				});
				
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

		//모달을 전역변수로 선언
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");

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
		
		
		$('input[name=cEmail]').click(function(){
			window.open(
			"<c:url value='/companypage/member/email.do'/> ", 'emailchk',
			'width=500,height=500,left=550,top=250,location=yes,resizable=yes');
		});

	});
</script>
<style type="text/css">
.divForm {
	margin: 0 auto;
	width: 1055px;
}

#join {
	margin-right: auto;
	margin-left: auto;
}
legend{
	text-align: center;
}
</style>
<body>
	<div class="divForm">
		<form name="frmCom" method="post" action="<c:url value='/companypage/member/register.do' /> ">
			<div class="form-group" id="divId">
						
			<h1 style="background: white; font-weight: bold;">기업회원가입</h1>
			<hr style="border: 1px solid #fb246a;">
				
				<div class="form-group" id="divEmail">
				<div class="col-lg-10">
					<label for="inputEmail" class="col-lg-2 control-label">*이메일</label>
					<input type="email" class="form-control" id="email" name="cEmail"
						data-rule-required="true" placeholder="이메일" maxlength="40" >
				</div>
			</div>
				<div class="col-lg-10">
					<label for="inputId" class="col-lg-2 control-label">*아이디</label> 
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="cUserid1" name="cUserid"
						placeholder="10자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="10">
					<div id="chkId2" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>
			<div class="form-group" id="divpwd">
				<div class="col-lg-10">
					<label for="inputpwd" class="col-lg-2 control-label">*패스워드</label> 
					<input type="password" class="form-control" id="cPwd" name="cPwd"
						data-rule-required="true" placeholder="패스워드" maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divpwdCh">
				<div class="col-lg-10">
					<label for="inputpwd" class="col-lg-4 control-label">*패스워드
						확인</label> <input type="password" class="form-control" id="cPwd2"
						name="cPwd2" data-rule-required="true" placeholder="패스워드 확인"
						maxlength="30">
						<div id="chkpwd2" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>
			<div class="form-group" id="divName">
				<div class="col-lg-10">
					<label for="inputName" class="col-lg-2 control-label">*이름</label> <input
						type="text" class="form-control onlyHangul infobox" name="cUsername"
						id="cUsername" data-rule-required="true" placeholder="한글만 입력 가능합니다."
						maxlength="15">
				</div>
			</div>
			<div class="form-group" id="divNickname">
				<div class="col-lg-10">
					<label for="inputNickname" class="col-lg-2 control-label">*별명</label>
					<input type="text" class="form-control" id="cNickname"
						name="cNickname" data-rule-required="true" placeholder="별명"
						maxlength="15">
				</div>
			</div>
			<div class="form-group" id="divBirth">
				<div class="col-lg-10">
					<label for="inputBirth" class="col-lg-2 control-label">*생년월일</label>
					<input type="text" class="form-control onlyNumber infobox" 
						id="cBirth" name="cBirth" data-rule-required="true"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="6">
						<div id="chkBirth" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10">
					<label for="inputph" class="col-lg-2 control-label">성별</label> <select
						class="form-control" id="cGender" name="cGender">
						<option value="남자">남</option>
						<option value="여자">여</option>
					</select>
				</div>
			</div>
			<div class="form-group" id="divph">
				<div class="col-lg-10">
					<label for="inputph" class="col-lg-4 control-label">휴대폰번호</label> <input
						type="tel" class="form-control onlyNumber infobox" id="cHp"
						name="cHp" data-rule-required="true"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
						<div id="chkHp" style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10" style="text-align: center;">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</div>
			<input type="hidden" name="chkId" id="chkId">
			<input type="hidden" name="chkEmail" id="chkEmail">
		</form>
	</div>
</body>
<%@ include file="../../inc/bottom.jsp"%>

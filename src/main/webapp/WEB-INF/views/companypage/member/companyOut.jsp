<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/comMypageTop.jsp" %>
<script type="text/javascript">
	$(function(){
		
		$('form[name=frmMember]').submit(function() {
			if($('#chkEmail').val()!='Y'){
				alert('이메일 인증을 하셔야합니다.');
				$("#chkEmail").focus();
				event.preventDefault();
			}else if($('input[type=password]').val()=='') {
				alert('비밀번호를 입력해주세요');
				$("input[type=password]").focus();
				event.preventDefault();				
			}			
		});
		
		$('input[name=cEmail]').click(function(){
			var cEmail = $("#email").val();
			window.open(
			"<c:url value='/companypage/member/email.do?email="+cEmail+"'/> ", 'emailchk',
			'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
		
		$("#infoChk").click(function(){
			if($("#infoChk").is(":checked") == true){
			    $("#addDiv").removeClass("divHide");
			}
			 
			if($("#infoChk").is(":checked") == false){
				$("#addDiv").addClass("divHide");
			}
		});
		
		$(".password").keyup(function(){
			
			if($(this).val()!=''){
				
				$.ajax({
					url : "<c:url value='/companypage/cOutPwdChk.do' />",
					type : "get",
					data : "pwd=" + $("input[type=password]").val(),
					dataType : "json",
					success : function(res) {
						if (res > 0) {
							$(".pwdSpan").html("&nbsp;&nbsp; *비밀번호가 일치합니다").css('color','green');
						} else {
							$(".pwdSpan").html("&nbsp;&nbsp; *비밀번호가 일치하지 않습니다").css('color','red');
						}

					},
					error : function(xhr, status, error) {
						alert(status + ", " + error);
					}
				});
			}else{
				$(".pwdSpan").html("&nbsp;&nbsp; *비밀번호를 입력하세요").css('color','red');
			}
		});
		
	});
	
</script>
<style>

	.btSubmit {
		text-align: center;
		padding: 30px;
	}
	
	.divHide {
		display: none;
	}
	
</style>
<main style="min-height: 600px">
	<div style="width: 1055px; font-size: 14px; margin:0 auto;">
		
		<h1 style="background: white;font-weight: bold;">기업회원탈퇴</h1>
			<hr style="border: 1px solid #fb246a;">
		
		<form name="frmMember" method="post" action="<c:url value='/companypage/member/companyOut.do' />">
			
			<div id="infoDiv">
			<span style="font-size: 20px;">회원탈퇴를 신청하기 전에 아래 안내 사항을 꼭 확인해주세요.</span><br><br>
			
			<span>1. 사용하고 계신 아이디 (아이디)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</span><br><br>
			<span>2. 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</span><br><br>
			<span>3. 탈퇴 후에는 아이디 (아이디)로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</span><br><br>
			<span>4. 서비스에 남아 있는 게시글 등은 탈퇴 후 삭제할 수 없습니다.</span><br><br>
			<input type="checkbox" id="infoChk"> 안내사항을 모두 확인하였으며 이에 동의합니다.<br><br>
			</div>
			<br>
			<div id="addDiv" class="divHide">
				<span>정보를 입력하세요</span><br><br>
				<table>
					<tr>
						<td>아이디 :</td>
						<td><input type="text" class="form-control" readonly value="${vo.cUserid}"></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호 :</td>
						<td><input type="password" class="form-control password" placeholder="비밀번호" name="password"></td>
						<td><span class="pwdSpan" style="font-size: small; color:red;">&nbsp;&nbsp; *비밀번호를 입력하세요</span></td>
					</tr>
					<tr>
						<td>이메일인증 :</td>
						<td><input type="email" style="" class="form-control" id="email" name="cEmail"
						data-rule-required="true" readonly maxlength="40" value="${vo.cEmail}"></td>
						<td></td>
					</tr>
				</table>
			
			</div>
			
			<!-- submit button -->
			<div class="btSubmit" >
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">탈퇴하기</button>
				</div>
			</div>
			<input type="hidden" name="cMemberCode" id="cMemberCode" value="${vo.cMemberCode}">
		</form>
	<input type="hidden" name="chkEmail" id="chkEmail">
	</div>
</main>
</main>
<%@ include file="../../inc/bottom.jsp" %>
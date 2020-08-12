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
		
	});
	
</script>
<style>
	hr {
		height: 3px;
	    background: #da2461;
	}
	
	.btSubmit {
		text-align: center;
		padding: 30px;
	}
	
	.divHide {
		display: none;
	}
	
</style>
<main>

	<div style="float: left; width: 49%; margin-left: 29%; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
		
		
		<div style="margin: 5px; height: 95px;"><br>
			<h1 style="background: white; padding: 20px; font-weight: bold;">회원 탈퇴</h1>
		</div>
		<br>
		<hr style="margin: 5px 0px;">
		<form name="frmCom" method="post" action="<c:url value='/companypage/member/companyOut.do' />">
			
			<div id="infoDiv">
			회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>
			◎사용하고 계신 아이디 (아이디)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
			◎탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br>
			◎탈퇴 후에는 아이디 (아이디)로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
			◎서비스에 남아 있는 게시글 등은 탈퇴 후 삭제할 수 없습니다.<br>
			<input type="checkbox" id="infoChk"> 안내사항을 모두 확인하였으며 이에 동의합니다.<br>
			</div>
			<br><br>
			<div id="addDiv" class="divHide">
				<table>
					<tr>
						<td>아이디 :</td>
						<td><input type="text" readonly value="${vo.cUserid}"></td>
					</tr>
					<tr>
						<td>비밀번호 :</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td>이메일인증 :</td>
						<td><input type="email" class="form-control" id="email" name="cEmail"
						data-rule-required="true" placeholder="이메일" maxlength="40" value="${vo.cEmail}"></td>
						
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
		
	</div>
	
	<input type="hidden" name="chkEmail" id="chkEmail">
</main>
<%@ include file="../../inc/bottom.jsp" %>
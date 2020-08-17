<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#pwd2').keyup(function() {
			if ($('#pwd').val() != $('#pwd2').val()) {
				$('#chkpwd2').html("비밀번호가 같지 않습니다.").css('color', 'red');
			} else {
				$('#chkpwd2').html("비밀번호가 일치합니다.").css('color', 'green');
			}
		});

		$('#userid1').keyup(function() {
			if ($('#userid1').val().length < 4) {
				$('#chkId2').html("아이디는 4글자 이상부터 가능합니다").css('color', 'red');
				$('#chkId').val("N");
			} else {
				var userid1 = $('#userid1').val();
				$.ajax({
					url : "<c:url value='/memberAdmin/register/checkId.do' />",
					type : "get",
					data : "adminId=" + userid1,
					dataType : "json",
					success : function(data) {
						if (data > 0) {
							$('#chkId2')
									.html(
											"중복된 아이디가 있습니다")
									.css('color', 'red');
							$('#chkId').val("N");
						} else {
							$('#chkId2').html(
									"사용 가능한 아이디입니다")
									.css('color',
											'green');
							$('#chkId').val("Y");
						}

					},
					error : function(xhr, status, error) {
						alert(status + ", " + error);

					}
				});
		
			}
		});

		$('form[name=frm]').submit(function() {
			if ($('#userid1').val().length < 1) {
				alert('아이디를 입력하세요!');
				$('#userid1').focus();
				event.preventDefault();
				return false;
			} else if ($('#pwd').val().length < 1) {
				alert('패스워드를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
				return false;
			} else if ($('#pwd').val() != $('#pwd2').val()) {
				alert('패스워드가 일치하지 않습니다.');
				$('#pwd2').focus();
				event.preventDefault();
				return false;
			} else if ($('#userName').val().length < 1) {
				alert('이름을 입력하세요');
				$('#userName').focus();
				event.preventDefault();
				return false;
			} else if ($('#chkId').val() != 'Y') {
				alert('아이디 중복확인을 하셔야 합니다.');
				$("#btnChkId").focus();
				event.preventDefault();
			}


		});
		
				
		//모달을 전역변수로 선언 => 정규식
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
		
				
		
		/* email 전송 */
		/* $('input[name=email]')
				.click(
						function() {
							var email = $('#email').val();
							window
									.open("<c:url value='/member/email.do'/>",
											'emailchk',
											'width=460,height=400,left=0,top=0,location=yes,resizable=yes');
						}); */
		
				
	});
</script>
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

#join {
	margin-right: auto;
	margin-left: auto;
}

legend {
	text-align: center;
}

hr {
	height: 3px;
	background: #da2461;
}
.myForm3 {
    position: relative;
    width: calc(100% - 40px);
    margin: 20px;
    display: inline-block;
}

.label__checkbox {
  display: none;
}

.label__check {
  display: inline-block;
  border-radius: 50%;
  border: 5px solid rgba(0,0,0,0.1);
  background: white;
  vertical-align: middle;
  margin-right: 20px;
  width: 1.5em;
  height: 1.5em;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: border .3s ease;
  
  i.icon {
    opacity: 0.2;
    font-size: ~'calc(1rem + 1vw)';
    color: transparent;
    transition: opacity .3s .1s ease;
    -webkit-text-stroke: 3px rgba(0,0,0,.5);
  }
  
  &:hover {
    border: 5px solid rgba(0,0,0,0.2);
  }
}

.label__checkbox:checked + .label__text .label__check {
  animation: check .5s cubic-bezier(0.895, 0.030, 0.685, 0.220) forwards;
  
  .icon {
    opacity: 1;
    transform: scale(0);
    color: white;
    -webkit-text-stroke: 0;
    animation: icon .3s cubic-bezier(1.000, 0.008, 0.565, 1.650) .1s 1 forwards;
  }
}

.center {
  position: absolute;
  top: 50%; left: 50%;
  transform: translate(-50%,-50%);
}

@keyframes icon {
  from {
    opacity: 0;
    transform: scale(0.3);
  }
  to {
    opacity: 1;
    transform: scale(1)
  }
}

@keyframes check {
  0% {
    width: 1.5em;
    height: 1.5em;
    border-width: 5px;
  }
  10% {
    width: 1.5em;
    height: 1.5em;
    opacity: 0.1;
    background: rgba(0,0,0,0.2);
    border-width: 15px;
  }
  12% {
    width: 1.5em;
    height: 1.5em;
    opacity: 0.4;
    background: rgba(0,0,0,0.1);
    border-width: 0;
  }
  50% {
    width: 1.5em;
    height: 1.5em;
    border: 0;
    opacity: 0.6;
  }
  100% {
    width: 1.5em;
    height: 1.5em;
    border: 0;
    opacity: 1;
  }
}

</style>
<body>
	<div class="divForm">
		<form name="frm" method="post" style="margin-top: 100px;"
			action="<c:url value='/memberAdmin/register.do' /> "
			enctype="multipart/form-data">
			<div class="form-group" id="divId">
				<legend>관리자 등록</legend>
				<hr>
				
				<!-- 약관 동의 끝 -->
				<div class="registerList">
					<div class="col-lg-10">
						<label for="userid1" class="col-lg-2 control-label">아이디</label> <input
							type="text" class="form-control onlyAlphabetAndNumber"
							id="userid1" name="adminId"
							placeholder="10자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
						<div id="chkId2"
							style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
					</div>
					<div class="form-group" id="divpwd">
						<div class="col-lg-10">
							<label for="inputpwd" class="col-lg-2 control-label">패스워드</label>
							<input type="password" class="form-control" id="pwd" name="pwd"
								data-rule-required="true" placeholder="패스워드" maxlength="30">
						</div>
					</div>
					<div class="form-group" id="divpwdCh">
						<div class="col-lg-10">
							<label for="inputpwd" class="col-lg-4 control-label">패스워드
								확인</label> <input type="password" class="form-control" id="pwd2"
								name="pwd2" data-rule-required="true" placeholder="패스워드 확인"
								maxlength="30">
							<div id="chkpwd2"
								style="font-size: 0.8em; margin-left: 10px; margin-top: 5px;"></div>
						</div>
					</div>
					<div class="form-group" id="divName">
						<div class="col-lg-10">
							<label for="inputName" class="col-lg-2 control-label">이름</label>
							<input type="text" class="form-control onlyHangul infobox"
								name="adminName" id="userName" data-rule-required="true"
								placeholder="한글만 입력 가능합니다." maxlength="15">
						</div>
					</div>
					<div class="form-group" id="divph">
						<div class="col-lg-10">
							<label for="inputph" class="col-lg-4 control-label">휴대폰번호</label>
							<input type="tel" class="form-control onlyNumber infobox" id="hp"
								name="tel" data-rule-required="true"
								placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10" style="text-align: center;">
							<button type="submit" class="btn btn-primary">회원가입</button>
						</div>
					</div>
					<input type="hidden" name="chkId" id="chkId">
				</div>
			</div>
		</form>
	</div>
</body>
<%@ include file="../inc/bottom.jsp"%>
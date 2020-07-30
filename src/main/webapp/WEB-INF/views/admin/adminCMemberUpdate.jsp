<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/js/jquery-3.5.1.min.js'/>">
<%
	String update = request.getParameter("update");
	if(update ==null || update.isEmpty()){
		update="";
	}
%>
<script type="text/javascript">
<%if(update !=null && !update.isEmpty()){%>
	window.onload = function() {
		
			opener.parent.location.reload(); 
			self.close();
	};
<%}%>

</script>
<style type="text/css">
.resume_basic .area_title h3.title {
	color: #222;
	font-size: 26px;
	font-weight: bold;
	letter-spacing: -2px;
	line-height: 34px;
}

#pm_contents {
	margin: 0 auto;
	padding: 20px 0 60px;
	width: 1260px;
	letter-spacing: -1px;
	z-index: 20;
}

#container {
	width: auto;
	min-height: 100%;
	background-color: #f8f8f8;
}

.resume_write {
	padding: 50px 0 25px;
	background-color: #fff;
}

.info_row {
	margin-left: 50px;
}

.point {
	margin-left: 5px;
	color: #fc0038;
	font-size: 12px;
	letter-spacing: -1px;
}

.basic {
	margin-bottom: 15px;
}
button {
  padding: 0;
  border: none;
  font: inherit;
  color: inherit;
  background-color: transparent;
  cursor: pointer;
}

button:focus {
  outline: 0;
}

button {
  padding: 10px 20px;
}
.button-five{
  background-color: #FB246A;
  border-radius: 20px;
  color: white;
} 
</style>

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
				document.getElementById('addrress').value = roadAddr;

			}
		}).open();

	}
</script>
<form action="<c:url value='/admin/adminCMemberUpdate.do'/>"
	name="frm" method="post">
	<input type="hidden" name="cMemberCode" value="${comVo.cMemberCode }">
	<div id="container">
		<section id="pm_contents">
			<div class="area_title">
				<h3 class="title">${comVo.cUserid }님의 기본정보</h3>
			</div>
			<div style="width:150; height:150px; float:left;">
							<span>이름</span> <span class="point">필수</span><br><br>
							<span>이메일</span> <span class="point">필수</span><br><br>
							<span>별명</span> <span class="point">필수</span><br><br>
							<span>생년월일</span> <span class="point">필수</span><br><br>
							<span>휴대폰</span>	<br><br>
									
			</div>
			<div style="width:200px; height:150px; float:left;">
				<input type="text" name="cUsername" class="form-control input-lg"
								value="${comVo.cUsername }" placeholder="이름" /><br><br>
				<input type="email" name="cEmail" class="form-control input-lg"
								value="${comVo.cEmail }" placeholder=" 이메일" /><br><br>
				<input type="text" name="cNickname" value="${comVo.cNickname}"
								class=" form-control
								input-lg" placeholder="별명" /><br><br>
				<input type="text" name="cBirth" class="form-control input-lg"
								value="${comVo.cBirth}" placeholder=" 생년월일" /><br><br>
				<input type="number" name="cHp" class="form-control input-lg"
								value="${comVo.cHp}" placeholder=" 휴대폰" />
				<br><br><br>		
				<button type="submit" id="btSubmit" class="button-five">수정하기</button>
			</div>
		</section>
	</div>
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/companyTop.jsp" %>

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
				document.getElementById('address').value = roadAddr;

			}
		}).open();
	};
		
	
</script>

<script type="text/javascript">
	$(function() {
		$('#sido').click(function() {
			var sido = $('#sido').val();
<<<<<<< HEAD
			$('#sigugun').empty();
			$('input[name=location1]').empty();
			$.ajax({
				url:"<c:url value='/sigugun.do'/>",
				type:"get",
				dataType:"json",
				data:"sido="+sido,
				success:function(res){
					for(var i = 0; i< res.length; i++){
						var option ="<option value='"+res[i]+"'>"+res[i]+"</option>";
						$('#sigugun').append(option);
					}
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
			$('input[name=location1]').val(sido);
		});
		
		$('#sigugun').click(function() {
			var sigugun = $('#sigugun').val();
			$('input[name=location2]').empty();
			$('input[name=location2]').val(sigugun);
		});
=======
			alert(sido);
			
		
		$('form[name=formWrite]').submit(function(){
			if($('#title').val()==''){
				alert('제목을 입력하세요');
				$('#title').focus();
				event.preventDefault();
			}else if($('#name').val().length<1){
				alert('이름을 입력하세요');
				$('#name').focus();
				event.preventDefault();
			}else if(!$('#pwd').val()){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}
		});
		
		
		
>>>>>>> sakura
		
	});
</script>


<style>

	tr {
		border: 1px solid lightgray;
	}	
	
	select{
		width:150px;
		text-align: center;
		text-align-last: center;
		
	}
	select option{
		padding: 5px;
	}
	#location{
		border: 0;
	}
	hr {
		border:1px solid #FB246A;
		width:100%;
	}

</style>
<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
			<form name="formWrite" method="post" action="<c:url value='/member/memberOut.do'/>">	
			<span style="font-size: 25px; font-weight: bold;">채용정보등록</span>
			<hr>
			<div style="margin:5px;">
			<span style="font-size: 18px; font-weight: bold;">◎모집내용</span><br><br>
			
			<table style="width: 700px;">
				<colgroup>
					<col style="width:20%;"/>
					<col style="width:80%;" />
				</colgroup>
			
				<tr>
					<td>모집제목</td>
					<td>
						<input type="text" id="title" name="title">						
					</td>
				</tr>
				
				<tr>
					<td>회사명</td>
					<td>
						<input type="text" id="comName" name="comName">
					</td>
				</tr>
				<tr>
					<td>직무</td>
					<td>
						<select id="searchSelect">
							<option>직무</option>
							<option>경영사무</option>
							<option>마케팅-광고</option>
							<option>IT-인터넷</option>
							<option>디자인</option>
							<option>무역유통</option>
							<option>영업-고객상담</option>
							<option>서비스</option>
							<option>연구개발</option>
							<option>생산-제조</option>
							<option>교육</option>
							<option>건설</option>
							<option>의료</option>
							<option>미디어</option>
							<option>전문특수직</option>
                         </select>
					</td>
				</tr>
				<tr>
					<td>산업</td>
					<td>
						<select id="searchSelect">
							<option>산업</option>
							<option>서비스업</option>
							<option>금융업</option>
							<option>IT정보통신업</option>
							<option>판매유통업</option>
							<option>제조업</option>
							<option>화학업</option>
							<option>교육업</option>
							<option>건설업</option>
							<option>의료제약업</option>
							<option>미디어업</option>
							<option>광고업</option>
							<option>문화예술업</option>
							<option>디자인업</option>
						</select>
					</td>
				</tr>
				<!-- 근무지역!!!!! -->
				<tr>
					<td>근무지역</td>
					<td>
<<<<<<< HEAD
						<select id="sido" size="5">
							<c:if test="${!empty list }">
								<c:forEach var="sido" items="${list }">
									<option value="${sido }">${sido }</option>
=======
						<select id="sido">
							<c:if test="${!empty list}">
								<c:forEach var="location" items="${list}">
									<option value="${location}">${location}</option>
>>>>>>> sakura
								</c:forEach>
							</c:if>
						</select>
						<div style="display: inline; margin-left: 10px">
							<select id="sigugun" name="sigugun" size="5">
							
							</select>
						</div>
						<div>
							<input type="text" name="location1" id="location" readonly="readonly">
							<input type="text" name="location2" id="location" readonly="readonly">
						</div>
					</td>
				</tr>
					
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="zipcode" name="zipcode">
						<input type="button" onclick="sample4_execDaumPostcode()" value="선택">
					</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="address" name="address">
					</td>
				</tr>
				
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" id="addressDetail" name="addressDetail">
					</td>
				</tr>
								
		
				<tr>
					<td>근무시간</td>
					<td>
						<input type="text" id="workHours" name="workHours">
					</td>
				</tr>
				
				<tr>
					<td>근무형태</td>
					<td>
						<label><input type="checkbox" value="추후협의">추후협의</label>
						<label><input type="checkbox" value="인턴직">인턴직</label>
						<label><input type="checkbox" value="정규직">정규직</label>
						<label><input type="checkbox" value="계약직">계약직</label>
						<label><input type="checkbox" value="병역특례">병역특례</label>
						<label><input type="checkbox" value="프리랜서">프리랜서</label>
						<input type="text" id="recType" name="recType">
					</td>
				</tr>
				
				<tr>
					<td>급여사항</td>
					<td>
						<select>
							<option value="">선택하세요</option>
							<option value="">추후협의</option>
							<option value="">2000~2200만원</option>
							<option value="">2200~2400만원</option>
							<option value="">2400~2600만원</option>
							<option value="">2600~2800만원</option>
							<option value="">2800~3000만원</option>
							<option value="">3000~3200만원</option>
							<option value="">3200~3400만원</option>
							<option value="">3400~3600만원</option>
							<option value="">3600~3800만원</option>
							<option value="">3800~4000만원</option>
							<option value="">4000~4200만원</option>
							<option value="">4200~4400만원</option>
							<option value="">4400~4600만원</option>
							<option value="">4600~4800만원</option>
							<option value="">4800~5000만원</option>
						</select>
						<input type="text" name="pay" id="pay">
					</td>
				</tr>
						
				<tr>
					<td>복리후생</td>
					<td>
						<label><input type="checkbox">4대보험</label>
						<label><input type="checkbox">격주휴무</label>
						<label><input type="checkbox">경조금</label>
						<label><input type="checkbox">기숙사</label>
						<label><input type="checkbox">석식제공</label>
						<label><input type="checkbox">셔틀버스</label>
						<label><input type="checkbox">식당운영</label>
						<label><input type="checkbox">연차</label>
						<label><input type="checkbox">월차</label>
						<label><input type="checkbox">자녀학자금</label>
						<label><input type="checkbox">장애인우대</label>
						<label><input type="checkbox">주5일근무</label>
						<label><input type="checkbox">중식비</label>
						<label><input type="checkbox">퇴직금</label>
						<input type="text" id="welfare" name="welfare">
					</td>
				</tr>
				
			</table>
			</div>
			<hr>
			
			<div>
				<span style="font-size: 18px; font-weight: bold;">◎자격요건</span><br><br>
			
			<table style="width: 700px; border:1px solid lightgray; border">
				<colgroup>
					<col style="width:20%;" />
					<col style="width:80%;" />
				</colgroup>
				<tr>
					<td>성별</td>
					<td>
						<select>
							<option value="">무관</option>
							<option value="">남자</option>
							<option value="">여자</option>
						</select>
						<input type="text" id="gender" name="gender">
						<br>
						<span>채용에서 남녀를 차별하거나, 여성근로자를 채용할 경우 직무수행에 불필요한 용모, 키, 체중 등의 신체조건, 미혼조건을 제시 또는 요구하는 경우 남녀고용평등법 위반에 따른 500만원 이하의 벌금이 부과될 수 있습니다.</span>
					</td>
				</tr>
				
				<tr>
					<td>나이</td>
					<td>
						<select>
							<option value="">선택</option>
							<option value="">20세이하</option>
							<option value="">21세이하</option>
							<option value="">22세이하</option>
							<option value="">23세이하</option>
							<option value="">24세이하</option>
							<option value="">25세이하</option>
							<option value="">26세이하</option>
							<option value="">27세이하</option>
							<option value="">28세이하</option>
							<option value="">29세이하</option>
							<option value="">30세이하</option>
							<option value="">31세이하</option>
							<option value="">32세이하</option>
							<option value="">33세이하</option>
							<option value="">34세이하</option>
							<option value="">35세이하</option>
							<option value="">40세이하</option>
							<option value="">45세이하</option>
							<option value="">55세이하</option>
							<option value="">60세이하</option>
							<option value="">60세초과</option>
						</select>
						<input type="text" name="age" id="age">
						<br><label><input type="checkbox">무관</label><br>
						모집·채용에서 합리적인 이유 없이 연령제한을 하는 경우는 연령차별금지법 위반에 따른 500만원 이하의 벌금이 부과될 수 있습니다.
					</td>
				</tr>
				
				<tr>
					<td>학력</td>
					<td>
						<select>
							<option value="">선택</option>
							<option value="">초등학교</option>
							<option value="">중학교</option>
							<option value="">고등학교</option>
							<option value="">대학(2~3년) 재학</option>
							<option value="">대학(2~3년) 졸업</option>
							<option value="">대학(4년) 재학</option>
							<option value="">대학(4년) 졸업</option>
							<option value="">대학원(석사) 졸업</option>
							<option value="">대학원(박사) 졸업</option>
						</select>
						<input type="text" id="educationLv" name="educationLv">
						<br><label><input type="checkbox">무관</label>
					</td>
				</tr>
				
				<tr>
					<td>경력</td>
					<td>
						<select>
							<option value="">선택</option>
							<option value="">1년</option>
							<option value="">2년</option>
							<option value="">3년</option>
							<option value="">4년</option>
							<option value="">5년</option>
							<option value="">6년</option>
							<option value="">7년</option>
							<option value="">8년</option>
							<option value="">9년</option>
							<option value="">10년</option>
							<option value="">11년</option>
							<option value="">12년</option>
							<option value="">13년</option>
							<option value="">14년</option>
							<option value="">15년</option>
							<option value="">16년</option>
							<option value="">17년</option>
							<option value="">18년</option>
							<option value="">19년</option>
							<option value="">20년</option>
							<option value="">21년</option>
							<option value="">22년</option>
							<option value="">23년</option>
							<option value="">24년</option>
							<option value="">25년</option>
							<option value="">26년</option>
							<option value="">27년</option>
							<option value="">28년</option>
							<option value="">29년</option>
							<option value="">30년</option>
							<option value="">30년 이상</option>
						</select>
						<input type="text" id="career" name="career">
						<br><label><input type="checkbox">무관</label>
					</td>
				</tr>
				
				<tr>
					<td>우대조건</td>
					<td>
						<label><input type="checkbox">국가유공자</label>
						<label><input type="checkbox">보훈대상자</label>
						<label><input type="checkbox">고용촉진장려금대상자</label>
						<label><input type="checkbox">장애인</label>
						<label><input type="checkbox">취업보호대상자</label>
						<label><input type="checkbox">영어가능자</label>
						<label><input type="checkbox">일본어가능자</label>
						<label><input type="checkbox">중국어가능자</label>
						<label><input type="checkbox">독일어가능자</label>
						<label><input type="checkbox">프랑스어가능자</label>
						<label><input type="checkbox">스페인어가능자</label>
						<label><input type="checkbox">러시아어가능자</label>
						<label><input type="checkbox">컴퓨터활용능력우수자</label>
						<label><input type="checkbox">엑셀고급능력보유자</label>
						<label><input type="checkbox">CAD능숙자</label>
						<label><input type="checkbox">MAC능숙자</label>
						<label><input type="checkbox">학점우수</label>
						<label><input type="checkbox">MBA</label>
						<label><input type="checkbox">2교대근무가능자</label>
						<label><input type="checkbox">3교대근무가능자</label>
						<label><input type="checkbox">해외근무가능자</label>
						<label><input type="checkbox">병역특례</label>
						<label><input type="checkbox">차량소지자</label>
						<input type="text" id="preference" name="preference">
					</td>
				</tr>
				</table>
			</div>
			<hr>
			<div>
			<span style="font-size: 18px; font-weight: bold;">◎상세모집내용</span><br><br>
			<textarea id="recDetail" name="recDetail" rows="20" cols="97"></textarea>
			</div>
			<hr>
			<div>
				<span style="font-size: 18px; font-weight: bold;">◎접수방법</span><br><br>
				<table style="width: 700px; border:1px solid lightgray">
					<colgroup>
						<col style="width:20%;" />
						<col style="width:80%;" />
					</colgroup>
					<tr>
						<td>접수기간</td>
						<td>
							<input type="date" id="recDeadline" name="recDeadline">까지
							<label><input type="checkbox">상시모집</label>
							<label><input type="checkbox">채용시까지</label>
						</td>
					</tr>
					<tr>
						<td>제출서류</td>
						<td>
							<label><input type="checkbox">이력서</label>
							<label><input type="checkbox">자기소개서</label>
							<label><input type="checkbox">졸업증명서</label>
							<label><input type="checkbox">주민등록등본</label>
							<label><input type="checkbox">성적증명서</label>
							<label><input type="checkbox">경력증명서</label>
							<input type="text" name="document" id="document">
						</td>
					</tr>
					<tr>
						<td>전형방법</td>
						<td>
							<label>1차<input type="text"></label>
							<label>2차<input type="text"></label>
							<label>3차<input type="text"></label>
							<label>4차<input type="text"></label>
										
						</td>
					</tr>

				</table>
				</div>
				<hr>
				<div style="width: 700px; text-align: center;">
					<input type="submit" value="채용정보 등록하기">
				</div><br>
				
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
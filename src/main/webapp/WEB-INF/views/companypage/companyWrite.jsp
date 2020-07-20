<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>

<main>
	<!-- main left sidebar -->
	<div style="float: left; width:250px; margin-left:340px; word-break:break-all; border:1px solid lightgray; font-size: 14px;">
	
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
			<br>
			<div style="text-align: center;">xxx 기업회원님</div>
			<br>
			<div style="text-align: center;">
				<input type="button" value="로그아웃"/>
				<input type="button" value="회원서비스"/>
			</div><br>
			<div style="margin-left:50px;">
				<span>진행중 채용정보 : x건</span><br>
				<span>마감된 채용정보 : x건</span><br>
				<span>총 입사지원자 : x명</span>
			</div>
		</div>
		<div style="width:238px; height:100px; margin:5px; border: 1px solid lightgray;">
		기업정보관리<br><br>
		기업정보수정<br>
		기업로고/사진관리
		</div>
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
		채용관리<br><br>		
		채용정보등록<br>
		진행중인채용정보<br>
		마감된채용정보<br>
		받은문자관리<br>
		보낸문자관리
		</div>
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
		인재정보검색<br><br>		
		인재정보스크랩<br>
		입사지원요청관리<br>
		면접제의요청관리<br>
		맞춤인재정보
		</div>
		<div style="width:238px; height:200px; margin:5px; border: 1px solid lightgray;">
		결제관리<br><br>
		결제내역 조회<br>
		세금계산서 발행신청
		</div>
		
		
	</div>
	
	
	<!-- main right -->
	<div style="float: left; width:60%; margin-left:30px; font-size: 14px; border:1px solid lightgray">
		
		<div style="margin:5px; height:95px; border:1px solid lightgray">
		위쪽 가로 긴 구역
		</div>
		
		
		<div style="margin:5px; border:1px solid lightgray">
			<form>
			<div>
				<span>채용정보등록</span><br><br>
			</div>
			<div>
			<span>◎모집내용</span><br><br>
			
			<table class="" style="width: 700px;">
				<colgroup>
					<col style="width:20%; background: whitesmoke; border:1px solid lightgray;" />
					<col style="width:80%;" />
				</colgroup>
			
				<tr style="border:1px solid lightgray;">
					<td>모집제목</td>
					<td>
						<input type="text">
					</td>
				</tr>
				
				<tr style="border:1px solid lightgray;">
					<td>회사명</td>
					<td>
						<input type="text">
					</td>
				</tr>
				
				<tr>
					<td>모집직종</td>
					<td>
						<select>
							<option value="">선택</option>
							<option value="">사무</option>
							<option value="">영업</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>근무지역</td>
					<td>
						<select>
							<option value="">선택</option>
							<option value="">서울</option>
							<option value="">인천</option>
							<option value="">수원</option>
							<option value="">부천</option>
							<option value="">성남</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>담당업무</td>
					<td>
						<input type="text">
					</td>
				</tr>
							
				<tr>
					<td>모집인원</td>
					<td>
						<input type="text">
					</td>
				</tr>
				
				<tr>
					<td>근무형태</td>
					<td>
						<label><input type="checkbox">추후협의</label>
						<label><input type="checkbox">인턴직</label>
						<label><input type="checkbox">정규직</label>
						<label><input type="checkbox">계약직</label>
						<label><input type="checkbox">병역특례</label>
						<label><input type="checkbox">프리랜서</label>
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
					</td>
				</tr>
			</table>
			</div>
			
			
			
			
			
			<div>
			<br><span>◎자격요건</span><br><br>
			
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
						</select><br>
						<span>채용에서 남녀를 차별하거나, 여성근로자를 채용할 경우 직무수행에 불필요한 용모, 키, 체중 등의 신체조건, 미혼조건을 제시 또는 요구하는 경우 남녀고용평등법 위반에 따른 500만원 이하의 벌금이 부과될 수 있습니다.</span>
					</td>
				</tr>
				
				<tr>
					<td>나이</td>
					<td>
						<input type="text"> 세 이상 ~ <input type="text"> 세 이하
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
					</td>
				</tr>
				</table>
			</div>
			
			<div>
			<br><span>◎상세모집내용</span><br><br>
			<textarea rows="20" cols="97"></textarea>
			</div>
			
			<div>
			<br><span>◎접수방법 및 담당자</span><br><br>
				<table style="width: 700px; border:1px solid lightgray">
					<colgroup>
						<col style="width:20%;" />
						<col style="width:80%;" />
					</colgroup>
					<tr>
						<td>접수기간</td>
						<td>
							<input type="date">까지
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
						</td>
					</tr>
					<tr>
						<td>전형방법</td>
						<td>
							<label>1차<input type="text"></label>
							<label>2차<input type="text"></label>
							<label>3차<input type="text"></label>
						</td>
					</tr>
					<tr>
						<td>접수방법</td>
						<td>
							<label><input type="checkbox">이메일</label>
							<label><input type="checkbox">온라인접수</label>
							<label><input type="checkbox">직접방문</label>
							<label><input type="checkbox">우편접수</label>
							<label><input type="checkbox">당사홈페이지</label>				
						</td>
					</tr>
					
					<tr>
						<td>이력서양식</td>
						<td>
							<label><input type="checkbox">온라인 이력서</label>
							<label><input type="checkbox">지원자 자유 양식</label>
							<label><input type="checkbox">자사 입사지원서 양식</label>
						</td>
					</tr>
				
				</table><br>
				</div>
				
				<div style="width: 700px; text-align: center;">
					<input type="submit" value="채용정보 등록하기">
				</div><br>
				
			</form>
		</div>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>
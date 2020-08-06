<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp"%>
<script type="text/javascript">
	
	$(function(){
		$("input:text[numberOnly]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$(".add-condition").hide();
		
		$('.jobTypeSel').change(function(){
			
			if($(this).val()==""){
				$(".add-condition").slideUp();
				$('tbody').html("");
			}else{
				var jobtype = "";
				var sal = "";
				var careerYear = 0;
				var location;
				var table="";
				$(".add-condition").slideDown();				
				$.ajax({
					url:"<c:url value='/companypage/searchTalentResume.do'/>",
					type:"get",
					data:"jobtype="+$('.yorn-chk').is(":checked"),
					success:function(res){
						if(res=="Y"){
							$('.YorN').text("이력서 공개");
						}else if(res=="N"){
							$('.YorN').text("이력서 비공개");						
						}
					},
					error:function(xhr, status, error){
						alert(status+","+error );
					}
				});
				
				$('tbody').html();
			}
		});
	})

</script>
<style type="text/css">
	hr{
		border-bottom: 2px dotted#88898c;
	    border-top: 0 none;
	    margin: 20px 0;
	    padding: 0;
	}
	.ST-main{
		width: 900px;
		height: auto;
		padding: 15px;
	}
	
	.ST-main-top{
		border-bottom: 3px solid #fd5a77;
		margin-bottom: 20px;
	}
	
	.ST-main-top h1{
		font-weight: bold;
	}
	
	.select-condition{
		background: #dedede9e;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		padding: 10px;
		margin-bottom: 30px
	}
	
	.selectWidth-250px{
		width: 250px;
	}
	
	.search-result{
		background: #dedede9e;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		padding: 10px;
		height: 350px;
		margin-bottom: 30px;
		background-image:url("<c:url value='/resources/images/logo/logo.png'/>");
		background-repeat:no-repeat;
		background-size:70% 55%;
		background-position: center center; 
	}
	
	.add-condition{
		display: inline-block;
		margin-right: 46px;
	}

	.add-condition:last-child{
		margin-right: 0;
	}
	
	table{
		display: table;
    	border-collapse: collapse;
    	width: 100%;
	    border: 0;
	    border-left: 1px solid #eaeaea;
	    table-layout: fixed;
	    background-color: #fff;
	    text-align: center;
	    margin-top: 15px;
    	border-top: 2px solid #666;
	}
</style>
<main>
	<%@ include file="../inc/companySidebar.jsp"%>
	<div
		style="float: left; width: 49%; margin-left: 30px; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->		
		<div class="ST-main">
			<div class="ST-main-top">
				<h1>인재 검색</h1>
			</div>
			<div class="ST-main-content">
				<div class="select-condition">
	                <select class="form-control jobTypeSel">
	                		<option value="">직종을 선택하세요.</option>
			                <option value="정보보안" >정보보안</option>
			                <option value="AS/카센터/주유" >AS/카센터/주유</option>
			                <option value="판매/유통" >판매/유통</option>
			                <option value="신문/잡지/언론사" >신문/잡지/언론사</option>
			                <option value="보험/증권/카드" >보험/증권/카드</option>
			                <option value="부동산/임대/중개" >부동산/임대/중개</option>
			                <option value="병원/의료/약국" >병원/의료/약국</option>
			                <option value="통역/번역" >통역/번역</option>
			                <option value="공연/예술/문화" >공연/예술/문화</option>
			                <option value="우편업" >우편업</option>
			                <option value="식품가공/개발" >식품가공/개발</option>
			                <option value="기계/설비/자동차" >기계/설비/자동차</option>
			                <option value="정부/공공기관/공기업" >정부/공공기관/공기업</option>
			                <option value="공증/법률/특허" >공증/법률/특허</option>
			                <option value="반도체/광학/LCD" >반도체/광학/LCD</option>
			                <option value="포털/인터넷/컨텐츠" >포털/인터넷/컨텐츠</option>
			                <option value="웹에이젼시" >웹에이젼시</option>
			                <option value="웨딩/이벤트" >웨딩/이벤트</option>
			                <option value="섬유/의류/패션" >섬유/의류/패션</option>
			                <option value="보안/경호/안전" >보안/경호/안전</option>
			                <option value="렌탈/임대" >렌탈/임대</option>
			                <option value="택배/물류" >택배/물류</option>
			                <option value="기타서비스업" >기타서비스업</option>
			                <option value="은행/금융서비스" >은행/금융서비스</option>
			                <option value="구인구직/채용서비스" >구인구직/채용서비스</option>
			                <option value="전기/전자/제어" >전기/전자/제어</option>
			                <option value="가구/목재/제지" >가구/목재/제지</option>
			                <option value="조선/항공/우주" >조선/항공/우주</option>
			                <option value="관광/항공" >관광/항공</option>
			                <option value="제약/건강관리/바이오" >제약/건강관리/바이오</option>
			                <option value="솔루션/SI/ERP/CRM" >솔루션/SI/ERP/CRM</option>
			                <option value="생활용품/소모품" >생활용품/소모품</option>
			                <option value="헤드헌팅/인력공급" >헤드헌팅/인력공급</option>
			                <option value="학원/어학원" >학원/어학원</option>
			                <option value="IT/정보기술" >IT/정보기술</option>
			                <option value="호텔/여행" >호텔/여행</option>
			                <option value="금속/재료/철강/요업" >금속/재료/철강/요업</option>
			                <option value="대출/캐피탈" >대출/캐피탈</option>
			                <option value="유아/유치원" >유아/유치원</option>
			                <option value="네트워크/통신/모바일" >네트워크/통신/모바일</option>
			                <option value="화장품/뷰티" >화장품/뷰티</option>
			                <option value="인테리어/조경" >인테리어/조경</option>
			                <option value="농업/어업/광업" >농업/어업/광업</option>
			                <option value="etc" >기타</option>
                      </select>
                      <hr>
                      <select class="form-control selectWidth-250px add-condition">
								<option value="">최대 연봉을 선택해 주세요</option>
								<option value="1400">1,400만원</option>
								<option value="1600">1,600만원</option>
								<option value="1800">1,800만원</option>
								<option value="2000">2,000만원</option>
								<option value="2200">2,200만원</option>
								<option value="2400">2,400만원</option>
								<option value="2600">2,600만원</option>
								<option value="2800">2,800만원</option>
								<option value="3000">3,000만원</option>
								<option value="3200">3,200만원</option>
								<option value="3400">3,400만원</option>
								<option value="3600">3,600만원</option>
								<option value="3800">3,800만원</option>
								<option value="4000">4,000만원</option>
								<option value="5000">5,000만원</option>
								<option value="6000">6,000만원</option>
								<option value="7000">7,000만원</option>
								<option value="8000">8,000만원</option>
								<option value="9000">9,000만원</option>
								<option value="10000">1억원 이상</option>
                      </select>
                      <input type="text" name="" class="form-control selectWidth-250px add-condition"
	                     	 placeholder="최소 경력 연차를 입력하세요" numberOnly/>
					  <select class="form-control selectWidth-250px add-condition" name="">
								<option value="">지역을 선택해 주세요</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="광주">광주</option>
								<option value="대구">대구</option>
								<option value="대전">대전</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="경남">경남</option>
								<option value="경북">경북</option>
								<option value="전남">전남</option>
								<option value="전북">전북</option>
								<option value="충남">충북</option>
								<option value="제주">제주</option>
								<option value="전국">전국</option>
								<option value="세종">세종</option>
							</select>
				</div>	
				<div class="search-result">
					<table>
						<caption style="display: none;">인재 검색 결과 테이블</caption>
							<col width="10%">
							<col width="10%">
							<col width="5%">
							<col width="25%">
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="5%">
							<col width="5%">
						<colgroup>
						<thead>
							<tr>
								<th scope="col">이름(나이)</th>
								<th scope="col">최종학력</th>
								<th scope="col">경력</th>
								<th scope="col">제목</th>								
								<th scope="col">희망연봉</th>
								<th scope="col">직종1</th>
								<th scope="col">직종2</th>
								<th scope="col">지역1</th>
								<th scope="col">지역2</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 사이드바이용에필요함 맨밑에 div -->
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

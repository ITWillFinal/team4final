<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<style type="text/css">
	*{
		box-sizing: border-box;
	}
	
	input[type=radio]:checked {
  		background: #fb246a;
	}
	
	select[value=""]{
		color:#dfdfdf;
	}
	
	.form-control{
		width: 95%;
	}
	
	.resume-main{
		width: 60%;
		margin: 0 auto;
		height: auto;
		background: #f8f8f8;
	}
	
	.info-box{
		padding: 15px 30px;
		background: #f8f8f8;
		border-bottom: 1px solid #ccc;
	}
	
	.info-box-content{
		display: none;
	}
	
	.photh{
		width: 130px;
		height: 180px;
		position: absolute;
		border: 1px solid;
		right: 30px;
    	top: 15%r;
	}
	
	.edu{
		text-align: center;
		overflow: hidden;
		height: auto;
	}
	
	.educationBt{
		width: 200px;
	    border: 1px solid #ccc;
	    background-color: rgba(0,0,0,0);
	    color: #ccc;
	    margin-right: -5px;
	    margin-bottom:-1px;
	    height: 60px;
	    padding: 5px;
	}
	
	.edu-info{
		display: none;
		text-align: left;
	}
	
	.selectHandU{
		display: none;
	}
	
	.control-label{
		margin-top: .5rem;
	}
	
	.col-lg-10{
		margin: 0 auto;
	}
	
	.term input[type=text]{
		width: 233px;
		display: inline-block;
	}
	
	.term .col-130px{
		 width: 130px;
		 display: inline-block;
	}
	
	.university, .highschool{
		display: none;
	}
	
	.career{
		text-align: center;
		overflow: hidden;
		height: auto;
	}

	.careerBt{
		width: 200px;
	    border: 1px solid #ccc;
	    background-color: rgba(0,0,0,0);
	    color: #ccc;
	    margin-right: -5px;
	    margin-bottom:-1px;
	    height: 60px;
	    padding: 5px;
	}

	.career-info{
		display: none;
		text-align: left;
		margin-bottom:30px;
		padding-bottom:30px;
		border-bottom: 1px solid #fb246a;
	}	
	
	.rank-position{
		position: absolute;
	    border: 1px solid;
	    height: auto;
	    top: -290px;
	    width: 500px;
	    left: 190px;
	    background: white;
	    padding: 25px 30px 15px 30px;
	    font-size: 12px;
	    display: none;
	}

	.rank-position h5{
		font-weight: bold;
	}
	
	.rank-position table{
   		margin: 15px 5px;
   		border-collapse: collapse;
    	width: 430px;
    	text-align: center;
	}
	
	.rank-position table td{
		border: 1px solid #eaeaea;
	}
	
	.rank-position table td:nth-child(1) {
		background: #f7f7f7;
		font-size: 13px;
	}

	.rank-position table td:nth-child(2) {
		text-align:left;		
		padding: 5px;
	}

	.rank-position table input[type=radio]{
		margin: 0 3px;
	}

	.rank-position table tr:nth-child(1) {
		border-top: 1px solid;
	}
	
	.r-k-ck{
		width: 80px;
		margin: 3px 0;
		display: inline-block;
	}
	
	.btRp{
		width: 60px;
	    border: 1px solid #fb246a;
	    background-color: #fb246a;
	    color: white;
	    height: 30px;
	    padding: 5px;
	}
	
	.career-addBt{
		width: 130px;
	    border: 1px solid #fb246a;
	    background-color: #fb246a;
	    color: white;
	    height: 40px;
	    padding: 5px;
	}
	
	.career-addDiv{
		text-align: right;
		margin-top: 30px;
		display: none;
	} 
</style>
<script type="text/javascript">
	$(function(){
		$(".info-box-head").hover(function(){
			$(this).css("background","#ccc");
		},function(){
			$(this).css("background","none");			
		});
		
		$('.info-box-head').click(function(){
			if($(this).next().css("display")=="none"){
				$(this).next().slideDown();				
			}else{
				$(this).next().slideUp();								
			}
		});
		
		$('.educationBt').click(function(){
			$('.educationBt').css('background','rgba(0,0,0,0)');
			$('.educationBt').css('color','#ccc');
			$('.educationBt').css('border','1px solid #ccc');

			$(this).css('background','#fb246a');
			$(this).css('color','white');
			$(this).css('border','1px solid #fb246a');
			
			$(".edu").find("hr").css("visibility","visible");
			$('.edu-info').slideDown();
			
			if($(this).val()=="고등학교 졸업"){
				$(".highschool").slideDown();
				$(".university").slideUp();
				$(".selectHandU").show();
			}else if($(this).val()=="대학·대학원 이상 졸업"){				
				$(".highschool").slideUp();
				$(".university").slideDown();
				$(".selectHandU").show();
			}else{
				$(".highschool").slideUp();
				$(".university").slideUp();				
				$(".selectHandU").hide();
			}
					
			var school = $(this).val().substring(0,$(this).val().indexOf(" "));
			$('.edu-info').find('h5').text(school+" 정보 입력");
		});
		
		$('.startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		$('.endDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		$('#major').change(function(){
			if($(this).val()=="직접입력"){
				$('#majorEtc').slideDown();	
			}else{
				$('#majorEtc').slideUp();					
			}
		});
		
		$(".careerBt").click(function(){
			$('.careerBt').css('background','rgba(0,0,0,0)');
			$('.careerBt').css('color','#ccc');
			$('.careerBt').css('border','1px solid #ccc');

			$(this).css('background','#fb246a');
			$(this).css('color','white');
			$(this).css('border','1px solid #fb246a');
			
			if($(this).val()=="경력"){
				$(".career-info").slideDown();
				$(".career-addDiv").slideDown();
				$(".career").find("hr").css("visibility","visible");
			}else{
				$(".career-info").slideUp();				
				$(".career-addDiv").slideUp();
				$(".career").find("hr").css("visibility","hidden");
			}
		});
		
		$('#leave').change(function(){
			if($(this).val()=="직접입력"){
				$('#leaveEtc').slideDown();	
			}else{
				$('#leaveEtc').slideUp();					
			}
		});
		
		$('.rpChoice').click(function(){
			$('.rank-position').css("display","block");
		});
		
		$('input[name=etc]').change(function(){
			$('input[name=rank]').removeAttr('checked');
			$('input[name=position]').removeAttr('checked');
			if($(this).val()=="직접입력"){
				$('#rankEtc').removeAttr("disabled");
				$('#rankEtc').focus();				
			}else{
				$('#rankEtc').attr("disabled","disabled");	
				$('#rankEtc').val("");
			}
		});
		$('input[name=rank]').change(function(){
			$('input[name=etc]').removeAttr('checked');
			$('#rankEtc').attr("disabled","disabled");				
			$('#rankEtc').val("");
		});
		$('input[name=position]').change(function(){
			$('input[name=etc]').removeAttr('checked');
			$('#rankEtc').attr("disabled","disabled");				
			$('#rankEtc').val("");
		});
		
		$('input[value=완료]').click(function(){
			var rpValue="";
			if($('input[name=etc]:checked').val()=='임시직/프리랜서'){
				rpValue='임시직/프리랜서';
			}else if($('input[name=etc]:checked').val()=='직접입력'){
				if($('#rankEtc').val().length<1){
					alert("직급을 입력해주세요.");
					$('#rankEtc').focus();
					return;
				}else{
					rpValue=$('#rankEtc').val();					
				}
			}else{
				if($('input[name=rank]:checked').is(':checked')==false){
					alert("직급을 선택해주세요.");
					return;
				}else{
					rpValue=$('input[name=rank]:checked').val();
					if($('input[name=position]:checked').is(':checked')==true)
					rpValue=rpValue+"/"+$('input[name=position]:checked').val();
				}
			}
			$(".rpChoice").val(rpValue);
			$('.rank-position').css("display","none");
		});
		
		$('input[value=취소]').click(function(){
			$('.rank-position').css("display","none");			
		});

		$('input[value=초기화]').click(function(){
			$('input[name=etc]').removeAttr('checked');
			$('input[name=rank]').removeAttr('checked');
			$('input[name=position]').removeAttr('checked');
			$('#rankEtc').val("");
		});
		
		$(".career-addBt").click(function(){
			var $addCareer = $('#career-add').clone();
			$(".career-addDiv").before($addCareer);
			/* $(".info-box-content").append($addCareer); */
		});
	});
</script>
<body>
	<div class="resume-main">
		<form name="frmResume" method="post" action="">
		<div class="info-box">
			<div class="info-box-head">
				<h3>기본 정보</h3>
			</div>
			<div class="info-box-content">
				<div class="col-lg-10">
					<div class="photh">
					</div>	
					<label class="col-lg-2 control-label">이름 : ()</label><br><br>
					<label class="col-lg-2 control-label">생년월일 : </label><br><br>
					<label class="col-lg-2 control-label">연락처 : </label><br><br>	
					<label class="col-lg-2 control-label">이메일 : </label><br><br>	
					<label class="col-lg-2 control-label">우편번호 : </label><br><br>
					<label class="col-lg-2 control-label">주소 : </label><br><br>
					<label class="col-lg-2 control-label">상세주소 : </label><br>
					<a href="#">기본 정보 수정하기</a> <!-- 회원정보 수정 -->
				</div>
			</div>
		</div>
		<div class="info-box">
			<div class="info-box-head">
				<h3>학력사항</h3>
			</div>
			<div class="info-box-content edu">
				<input class="educationBt" type="button" value="초등학교 졸업"/>
				<input class="educationBt" type="button" value="중학교 졸업"/>
				<input class="educationBt" type="button" value="고등학교 졸업"/>
				<input class="educationBt" type="button" value="대학·대학원 이상 졸업"/>
				<hr style="border-bottom-color: #fb246a; visibility:hidden;" >
				<div class="edu-info">
					<h5></h5>
					<div class="col-lg-10 university">
							<label for="local" class="col-lg-2 control-label">*대학</label> 
							<select class="form-control" name="">
								<option value="대학(2,3년)">대학(2,3년)</option>
								<option value="대학교(4년)">대학교(4년)</option>
								<option value="대학원(석사)">대학원(석사)</option>
								<option value="대학원(박사)">대학원(박사)</option>
							</select>
					</div>
					<div class="col-lg-10">
							<label for="shcoolName" class="col-lg-2 control-label">*학교명</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								id="shcoolName" name="schoolName"
								placeholder="학교명 입력" maxlength="15">
					</div>
					<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">*지역</label> 
							<select class="form-control" id="local" name="local">
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
								<option value="해외">해외</option>
							</select>
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">*재학기간</label>
						<div>
							<input type="text" class="form-control startDay" name="startDay" id="startDay" readonly="readonly"/> 
							<select class="form-control col-130px" name="">
								<option value="입학">입학</option>
								<option class="selectHandU" value="편입">편입</option>
							</select>
							<span style="margin:0 40px;">-</span>
							<input type="text" class="form-control endDay" name="endDay" id="endDay" readonly="readonly"/>
							<select class="form-control col-130px" name="">
								<option value="졸업">졸업</option>
								<option class="selectHandU" value="재학중">재학중</option>
								<option class="selectHandU" value="휴학중">휴학중</option>
								<option class="selectHandU" value="수료">수료</option>
								<option value="중퇴">중퇴</option>
								<option class="selectHandU" value="자퇴">자퇴</option>
								<option class="selectHandU" value="졸업예정">졸업예정</option>
							</select>
						</div>
					</div>
					<div class="col-lg-10 highschool">
							<label for="local" class="col-lg-2 control-label">전공 계열</label> 
							<select class="form-control" name="">
								<option value="">전공계열 선택</option>
								<option value="이과계열">이과계열</option>
								<option value="문과계열">문과계열</option>
								<option value="전문(실업)계">전문(실업)계</option>
								<option value="예체능계">예체능계</option>
								<option value="특성화/마이스터고">특성화/마이스터고</option>
								<option value="특수목적고">특수목적고</option>
							</select>
					</div>
					<div class="col-lg-10 university">
							<label for="local" class="col-lg-2 control-label">*전공</label> 
							<select class="form-control" id="major" name="">
								<option value="어문학">어문학</option>
								<option value="영어/영문">영어/영문</option>
								<option value="중어/중문">중어/중문</option>
								<option value="일어/일문">일어/일문</option>
								<option value="국어/국문">국어/국문</option>
								<option value="인문과학">인문과학</option>
								<option value="사회과학">사회과학</option>
								<option value="상경계열">상경계열</option>
								<option value="경제/경영">경제/경영</option>
								<option value="회계학">회계학</option>
								<option value="법학계열">법학계열</option>
								<option value="사범계열">사범계열</option>
								<option value="종교학">종료학</option>
								<option value="생활과학">생활과학</option>
								<option value="예/체능">예/체능</option>
								<option value="자연과학계열">자연과학계열</option>
								<option value="농수산/해양/축산">농수산/해양/축산</option>
								<option value="수학/통계학">수학/통계학</option>
								<option value="물리/천문/기상학">물리/천문/기상학</option>
								<option value="화학/생물">화학/생물</option>
								<option value="공학계열">공학계열</option>
								<option value="전기/전자/정보통신공학">전기/전자/정보통신공학</option>
								<option value="컴퓨터/시스템공학">컴퓨터/시스템공학</option>
								<option value="금속/비금속공학">금속/비금속공학</option>
								<option value="생명/화학/환경/바이오">생명/화학/환경/바이오</option>
								<option value="도시/토목/건축공학">도시/토목/건축공학</option>
								<option value="에너지/원자력공학">에너지/원자력공학</option>
								<option value="산업/자동차/우주공학">산업/자동차/우주공학</option>
								<option value="기계/조선/항공공학">기계/조선/항공공학</option>
								<option value="신소재/재료/섬유공학">신소재/재료/섬유공학</option>
								<option value="식품/유전/안전공학">식품/유전/안전공학</option>
								<option value="의학계열">의학계열</option>
								<option value="직접입력">직접입력</option>
							</select>
							<input type="text" class="form-control onlyAlphabetAndNumber"
								id="majorEtc" name=""
								placeholder="전공계열 직접입력" maxlength="15" style="display:none;">
							<input type="text" class="form-control onlyAlphabetAndNumber"
								 name=""
								placeholder="전공학과 입력" maxlength="15">
					</div>
					<div class="col-lg-10 university">
							<label for="local" class="col-lg-2 control-label">주/야간</label> 
							<select class="form-control" name="">
								<option value="주간">주간</option>
								<option value="야간">야간</option>
							</select>
					</div>
					<div class="col-lg-10 university">
							<label for="local" class="col-lg-2 control-label">학점</label> 
							<select class="form-control col-130px" name="">
								<option value="">기준학점선택</option>
								<option value="4.0">4.0</option>
								<option value="4.3">4.3</option>
								<option value="4.5">4.5</option>
								<option value="5.0">5.0</option>
								<option value="7.0">7.0</option>
								<option value="100">100</option>
							</select>
							<input type="text" class="form-control" name="" placeholder="학점 입력"/> 
					</div>
					<div class="col-lg-10 university">
							<label for="shcoolName" class="col-lg-2 control-label">논문&졸업작품</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								id="shcoolName" name="schoolName"
								placeholder="학위논문 및 졸업작품 입력" maxlength="50">
					</div>
				</div>
			</div>
		</div>
		<div class="info-box">
			<div class="info-box-head">
				<h3>경력사항</h3>
			</div>
			<div class="info-box-content career">
				<input class="careerBt" type="button" value="신입"/>
				<input class="careerBt" type="button" value="경력"/>
				<hr style="border-bottom-color: #fb246a; visibility: hidden;">
				<div class="career-info" id="career-add">
					<div class="col-lg-10">
							<label for="shcoolName" class="col-lg-2 control-label">*회사명</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name=""
								placeholder="회사명 입력" maxlength="15">
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">*재직기간</label>
						<div>
							<input type="text" class="form-control startDay" name="" readonly="readonly"/> 
							<span style="margin:0 40px;">-</span>
							<input type="text" class="form-control endDay" name="" readonly="readonly"/>
							<select class="form-control col-130px" name="">
								<option value="졸업">퇴사</option>
								<option value="재직중">재직중</option>
							</select>
						</div>
					</div>
					<div class="col-lg-10">
							<label for="" class="col-lg-2 control-label">퇴사사유</label> 
							<select class="form-control" id="leave" name="">
								<option value="">퇴사사유 선택</option>
								<option value="업직종 전환">업직종 전환</option>
								<option value="근무조건">근무조건</option>
								<option value="경영악화">경영악화</option>
								<option value="계약만료">계약만료</option>
								<option value="출산/육아">출산/육아</option>
								<option value="학업">학업</option>
								<option value="육아">육아</option>
								<option value="개인사정">개인사정</option>
								<option value="직접입력">직접입력</option>
							</select>
							<input type="text" class="form-control onlyAlphabetAndNumber"
								id="leaveEtc" name=""
								placeholder="퇴사사유 직접입력" maxlength="50" style="display:none;">
					</div>
					<div class="col-lg-10">
							<label for="" class="col-lg-2 control-label">*직급/직책</label> 
							<input type="text" class="form-control rpChoice" name="" readonly="readonly" 
							placeholder="선택하기"/> 
							<div class="rank-position">
								<h5>직급/직책 선택하기</h5>
								<table>
									<colgroup>
										<col style="width:20%;" />
										<col style="width:80%;" />
									</colgroup>
									<tr>
										<td>직급(필수)</td>
										<td>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="인턴/수습"/>인턴/수습
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="사원"/>사원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="주임"/>주임
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="계장"/>계장										
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="대리"/>대리
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="과장"/>과장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="차장"/>차장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="부장"/>부장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="감사"/>감사
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="이사"/>이사
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="상무"/>상무
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="전무"/>전무
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="부사장"/>부사장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="사장"/>사장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="임원"/>임원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="연구원"/>연구원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="주임연구원"/>주임연구원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="선임연구원"/>선임연구원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="책임연구원"/>책임연구원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="수석연구원"/>수석연구원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="rank" value="연구소장"/>연구소장
											</div>
										</td>
									</tr>
									<tr>
										<td>직책(선택)</td>
										<td>
											<div class="r-k-ck">
												<input type="radio" name="position" value="팀원"/>팀원
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="팀장"/>팀장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="실장"/>실장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="총무"/>총무
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="지점장"/>지점장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="지사장"/>지사장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="파트장"/>파트장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="그룹장"/>그룸장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="센터장"/>센터장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="매니저"/>매니저
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="본부장"/>본부장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="사업부장"/>사업부장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="원장"/>원장
											</div>
											<div class="r-k-ck">
												<input type="radio" name="position" value="국장"/>국장
											</div>
										</td>
									</tr>
								</table>
								<div class="r-k-ck" style="width: 110px">
									<input type="radio" name="etc" value="임시직/프리랜서" style="margin: 0 3px"/>임시직/프리랜서
								</div>
								<div class="r-k-ck">
									<input type="radio" name="etc" value="직접입력" style="margin: 0 3px"/>직접입력
								</div>
								<input type="text" id="rankEtc" disabled="disabled">
								<div style="text-align: center; margin-top: 20px">
									<input type="button" class="btRp" value="완료"/>
									<input type="button" class="btRp" value="취소"/>
									<input type="button" class="btRp" value="초기화"/>								
								</div>
							</div>
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="" style="display: inline-block;"
								placeholder="년차 입력" maxlength="2">
					</div>	
					<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">근무지역</label> 
							<select class="form-control" id="local" name="local">
								<option value="">근무지역 선택</option>
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
								<option value="해외">해외</option>
							</select>
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">연봉</label>
						<div>
							<input type="text" class="form-control" name="" placeholder="연봉입력"/> 
							<select class="form-control col-130px" name="">
								<option value="만원">만원</option>
								<option value="달러">달러</option>
								<option value="엔">엔</option>
							</select>
						</div>
					</div>
					<div class="col-lg-10">
							<label for="shcoolName" class="col-lg-2 control-label">담당업무</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name=""
								placeholder="담당업무 입력" maxlength="15">
					</div>	
				</div>
				<div class="career-addDiv">
					<input class="career-addBt" type="button" value="경력 추가하기"/>
				</div>			
			</div>
		</div>
		<div class="info-box">
			<div class="info-box-head">
				<h3></h3>
			</div>
			<div class="info-box-content">
			</div>
		</div>
		</form>
	</div>
</body>
<%@ include file="../inc/bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<style type="text/css">
	*{
		box-sizing: border-box;
	}
	
	body{
		overflow: auto;
	}
	
	.infoinfo{
		max-width: 80%;
	}
	
	form[name=frmResume]{
		margin-bottom: 50px;
		background: #f7f7f79e;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
	}
	
	textarea { 
		overflow-y:hidden;
		resize: none;
	}
	
	.info-box-content .member-edit{
		color: #fb246a;
		position: absolute;
    	top: -15px;
    	left: 30px;
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
		width: 1200px;
		margin: 0 auto;
		height: auto;
		background: #f8f8f8;
	}
	
	.info-box{
		padding: 15px 30px;
		background: #f8f8f8;
		border-bottom: 1px solid #ccc;
	}
	
	.photo{
		background-image:url("<c:url value='/personalMemberProfile/${memberVo.imageURL}'/>");
		background-repeat:no-repeat;
		background-size:100% 100%;
		width: 130px;
		height: 180px;
		position: absolute;
		right: 30px;
    	top: 15%r;
	}
	
	.month-picker, .month-picker-end{
		width: 240px;
		height: 150px;
		padding: 15px;
		border: 1px solid black;
		text-align: center;
		position: absolute;
		top: -115px;
		background: white;
	}

	.month-picker-end{
  	  left: 475px;
	}
	
	.month-picker-month{
		padding-right: 10px;
	}
	
	.year-prev,.year-next{
		float: left;
		color:#cacbcc;
		margin: 0 20px;
	}
	.year-prev:hover,.year-next:hover{
		color:black;
	}

	.year-prev{
		float: left;
	}

	.year-next{
		float: right;
	}
	
	.month-picker-month a{
		margin: 5px;
	    width: 35px;
	    display: inline-block;
	    text-align: right;
	    color:black;
	}
	
	.month-picker-month a:hover{
		background: #fb246a;
		color: white;
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
	
	.career-subBt{
		width: 130px;
	    border: 1px solid #fb246a;
	    background-color: #fb246a;
	    color: white;
	    height: 40px;
	    padding: 5px;
	   	display: none;
	   	position: absolute;
    	right: 0px;
    	top: -30px;
	}
	
	.career-addDiv{
		text-align: right;
		margin-top: 30px;
		display: none;
	} 
	
	.info-box-nullOk-head h3{
		display: inline-block;
		margin-right: 10px;
	}
	
	.nullOk-top{
		margin-top:15px;
		margin-bottom:20px;
		border-top: 1px solid #fb246a;
		padding-top: 20px;
		display: none;
	}
	
	.nullOk-chk{
		width: 20px;
    	height: 20px;
	}

	.addDiv{
		text-align: right;
		margin-top: 30px;
		display: none;
	} 
	
	.addBt{
		width: 130px;
	    border: 1px solid #fb246a;
	    background-color: #fb246a;
	    color: white;
	    height: 40px;
	    padding: 5px;
	}
	
	.subBt{
		width: 130px;
	    border: 1px solid #fb246a;
	    background-color: #fb246a;
	    color: white;
	    height: 40px;
	    padding: 5px;
	   	display: none;
	   	position: absolute;
    	right: 0px;
    	top: -20px;
	}
	
	.bt-sub, .bt-return{
		width: 250px;
		
	    border: 1px solid #fb246a;
	    background-color: #fb246a;
	    color: white;
	    height: 70px;
	    padding: 5px;
	}
	
	footer{
		width: 1900px;
	}
	
	.jobEtc{
		display: none;
	}
	
	/* 체크박스 => 토글 슬라이더 */
	.switch {
	position: relative;
	display: inline-block;
	width: 30px;
	height: 17px;
	}
	.switch input {
		opacity: 0;
		width: 0;
		height: 0;	
	}
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #ccc;
		-webkit-transition: .4s;
		transition: .4s;
	}
	.slider:before {
		position: absolute;
		content: "";
		height: 13px;
		width: 13px;
		left:2px;
		bottom: 2px;
		background-color: white;
		-webkit-transition: .4s;
		transition: .4s;	
	}
	input:checked + .slider {
		background-color: #fb246a;
	}
	input:focus + .slider {
		box-shadow: 0 0 1px #fb246a;
	}
	input:checked + .slider:before {
		-webkit-transform: translateX(13px);
		-ms-transform: translateX(13px);
		transform: translate(13px);
	}
	.slider.round {
		border-radius: 17px;
	}
	.slider.round:before {
		border-radius: 50%;
	}
</style>
<script type="text/javascript">
	$(function(){
		var school="";
		var careerBt="";
		
		$("input:text[numberOnly]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});

		$("input:text[numberOnly2]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9.]/g,""));
		});


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
		
		$('.nullOk-chk').change(function(){
			if($(this).is(":checked")){
				$(this).parent().parent().parent().find(".nullOk-top").slideDown();				
				$(this).parent().parent().parent().find(".addDiv").slideDown();				
			}else{
				$(this).parent().parent().parent().find(".nullOk-top").slideUp();								
				$(this).parent().parent().parent().find(".addDiv").slideUp();				
			}
		});
		
		$('.educationBt').click(function(){
			$('input[name=finalEdu]').val($(this).val());
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
				$('input[name=major-uni]').removeClass('not-null-input');
			}else if($(this).val()=="대학·대학원 이상 졸업"){				
				$(".highschool").slideUp();
				$(".university").slideDown();
				$(".selectHandU").show();
				$('input[name=major-uni]').addClass('not-null-input');
			}else{
				$(".highschool").slideUp();
				$(".university").slideUp();				
				$(".selectHandU").hide();
				$('input[name=major-uni]').removeClass('not-null-input');
			}
					
			school = $(this).val().substring(0,$(this).val().indexOf(" "));
			$('.edu-info').find('h5').text(school+" 정보 입력");
		});
		

		$('.startDay').click(function(){
			var monthPicker="";
			monthPicker +="<div class='month-picker removeThis'>";
			monthPicker +="<div class='month-picker-year removeThis'>";
			monthPicker +="<a href='#' class='year-prev removeThis'>◀</a>";
			monthPicker +="<span>2020</span><span>년</span>";
			monthPicker +="<a href='#' class='year-next removeThis'>▶</a></div>"
			monthPicker +="<div class='month-picker-month removeThis'>";
			monthPicker +="<a href='#' class='month-choice removeThis'>1월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>2월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>3월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>4월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>5월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>6월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>7월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>8월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>9월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>10월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>11월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>12월</a></div></div>";
			$(this).after(monthPicker);			
			
			if($(this).val().length>0){
				var yyyy =$(this).val().substring(0,4);
				var mm = Number($(this).val().substring(4,6));
				$(this).next().find('span:eq(0)').text(yyyy);
				$(this).next().find('a').each(function(){
					var mm_check;
					if($(this).text().length>2){
						mm_check = Number($(this).text().substring(0,2));
					}else{
						mm_check = Number($(this).text().substring(0,1));						
					}
					if(mm==mm_check){
						$(this).css("color","white").css("background","#fb246a");
					}
				});
			}
		});
		
		$('.endDay').click(function(){
			var monthPicker="";
			monthPicker +="<div class='month-picker-end removeThis'>";
			monthPicker +="<div class='month-picker-year removeThis'>";
			monthPicker +="<a href='#' class='year-prev removeThis'>◀</a>";
			monthPicker +="<span>2020</span><span>년</span>";
			monthPicker +="<a href='#' class='year-next removeThis'>▶</a></div>"
			monthPicker +="<div class='month-picker-month removeThis'>";
			monthPicker +="<a href='#' class='month-choice removeThis'>1월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>2월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>3월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>4월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>5월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>6월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>7월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>8월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>9월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>10월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>11월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>12월</a></div></div>";
			$(this).after(monthPicker);	
			
			if($(this).val().length>0){
				var yyyy =$(this).val().substring(0,4);
				var mm = Number($(this).val().substring(4,6));
				$(this).next().find('span:eq(0)').text(yyyy);
				$(this).next().find('a').each(function(){
					var mm_check;
					if($(this).text().length>2){
						mm_check = Number($(this).text().substring(0,2));
					}else{
						mm_check = Number($(this).text().substring(0,1));						
					}
					if(mm==mm_check){
						$(this).css("color","white").css("background","#fb246a");
					}
				});
			}
		});
		
		$('.passDay').click(function(){
			var monthPicker="";
			monthPicker +="<div class='month-picker removeThis'>";
			monthPicker +="<div class='month-picker-year removeThis'>";
			monthPicker +="<a href='#' class='year-prev removeThis'>◀</a>";
			monthPicker +="<span>2020</span><span>년</span>";
			monthPicker +="<a href='#' class='year-next removeThis'>▶</a></div>"
			monthPicker +="<div class='month-picker-month removeThis'>";
			monthPicker +="<a href='#' class='month-choice removeThis'>1월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>2월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>3월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>4월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>5월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>6월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>7월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>8월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>9월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>10월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>11월</a>";
			monthPicker +="<a href='#' class='month-choice removeThis'>12월</a></div></div>";
			$(this).after(monthPicker);		
			
			if($(this).val().length>0){
				var yyyy =$(this).val().substring(0,4);
				var mm = Number($(this).val().substring(4,6));
				$(this).next().find('span:eq(0)').text(yyyy);
				$(this).next().find('a').each(function(){
					var mm_check;
					if($(this).text().length>2){
						mm_check = Number($(this).text().substring(0,2));
					}else{
						mm_check = Number($(this).text().substring(0,1));						
					}
					if(mm==mm_check){
						$(this).css("color","white").css("background","#fb246a");
					}
				});
			}
		});
		
		$(document).on("click",".year-prev",function(e){
				e.preventDefault();
				$(this).next().text(Number($(this).next().text())-1);	
		});

		$(document).on("click",".year-next",function(e){
				e.preventDefault();
				$(this).prev().prev().text(Number($(this).prev().prev().text())+1);	
		});
		
		$(document).on("click",".month-choice",function(e){
				e.preventDefault();
				var yyyyMM ="";
				yyyyMM += $(this).parent().parent().find('.month-picker-year').find('span:eq(0)').text();
				if($(this).text().length==2){
					yyyyMM+= "0"+$(this).text().substring(0,1);					
				}else{
					yyyyMM+= $(this).text().substring(0,2);										
				}
				$(this).parent().parent().prev().val(yyyyMM);
				$(this).parent().parent().remove();
				
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
			
			careerBt = $(this).val();
			
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
		
		$('.leave').change(function(){
			if($(this).val()=="직접입력"){
				$(this).parent().find('.leaveEtc').slideDown();	
			}else{
				$(this).parent().find('.leaveEtc').slideUp();					
			}
		});
		
		$('.rpChoice').click(function(){
			$(this).parent().find(".rank-position").css("display","block");
		});
		
		$('input[name=etc]').change(function(){
			$(this).parent().parent().find('input[name=rank]').removeAttr('checked');
			$(this).parent().parent().find('input[name=position]').removeAttr('checked');
			if($(this).val()=="직접입력"){
				$(this).parent().parent().find('#rankEtc').removeAttr("disabled");
				$(this).parent().parent().find('#rankEtc').focus();				
			}else{
				$(this).parent().parent().find('#rankEtc').attr("disabled","disabled");	
				$(this).parent().parent().find('#rankEtc').val("");
			}
		});
		
		$('input[name=rank]').change(function(){
			$(this).parent().parent().parent().parent().parent().parent().find('input[name=etc]').removeAttr('checked');
			$(this).parent().parent().parent().parent().parent().parent().find('input[name=position]').removeAttr('checked');
			$(this).parent().parent().parent().parent().parent().parent().find('#rankEtc').attr("disabled","disabled");				
			$(this).parent().parent().parent().parent().parent().parent().find('#rankEtc').val("");
		});
		
		$('input[name=position]').change(function(){
			$(this).parent().parent().parent().parent().parent().parent().find('input[name=etc]').removeAttr('checked');
			$(this).parent().parent().parent().parent().parent().parent().find('#rankEtc').attr("disabled","disabled");				
			$(this).parent().parent().parent().parent().parent().parent().find('#rankEtc').val("");
		});
		
		$('input[value=완료]').click(function(){
			var rpValue="";
			if($(this).parent().parent().find('input[name=etc]:checked').val()=='임시직/프리랜서'){
				rpValue='임시직/프리랜서';
			}else if($(this).parent().parent().find('input[name=etc]:checked').val()=='직접입력'){
				if($(this).parent().parent().find('#rankEtc').val().length<1){
					alert("직급을 입력해주세요.");
					$(this).parent().parent().find('#rankEtc').focus();
					return;
				}else{
					rpValue=$(this).parent().parent().find('#rankEtc').val();					
				}
			}else{
				if($(this).parent().parent().find('input[name=rank]:checked').is(':checked')==false){
					alert("직급을 선택해주세요.");
					return;
				}else{
					rpValue=$(this).parent().parent().find('input[name=rank]:checked').val();
					if($(this).parent().parent().find('input[name=position]:checked').is(':checked')==true)
					rpValue=rpValue+"/"+$(this).parent().parent().find('input[name=position]:checked').val();
				}
			}
			$(this).parent().parent().parent().find(".rpChoice").val(rpValue);
			$(this).parent().parent().parent().find(".rank-position").css("display","none");
		});
		
		$('input[value=취소]').click(function(){
			$(this).parent().parent().parent().find('.rank-position').css("display","none");			
		});

		$('input[value=초기화]').click(function(){
			$(this).parent().parent().find('input[name=etc]').removeAttr('checked');
			$(this).parent().parent().find('input[name=rank]').removeAttr('checked');
			$(this).parent().parent().find('input[name=position]').removeAttr('checked');
			$(this).parent().parent().find('#rankEtc').val("");
			$(this).parent().parent().find('#rankEtc').attr("disabled","disabled");
		});
		
		$(".career-addBt").click(function(){
			var $addCareer = $('#career-add').clone(true);
			$addCareer.removeAttr('id');
			$addCareer.find("input[type=text]").val("");
			$addCareer.find("input[type=radio]").removeAttr('checked');
			$addCareer.find('#rankEtc').attr("disabled","disabled");
			$addCareer.find('.rank-position').css("display","none");
			
			$(".career-addDiv").before($addCareer);
			$('.career-info:not(:eq(0))').find(".career-subBt").css("display","block");
			
		});
		
		$(".career-subBt").click(function(){
			$(this).parent().parent().remove();
		});
		
		$('.taAuto').keyup(function(){
			$(this).css('height', 'auto' );
	        $(this).height( this.scrollHeight-11 );
		});
		
		$(".addBt").click(function(){
			var $addContent = $(this).parent().parent().find('.info-box-content:eq(0)').clone(true);
			$addContent.find("input[type=text]").val("");
			$addContent.find("textarea").val("");
			$addContent.find("textarea").height(35.25);
			$addContent.find("input[type=radio]").removeAttr('checked');
			$(this).parent().parent().find(".addDiv").before($addContent);
			$(this).parent().parent().find('.info-box-content:not(:eq(0))').find(".subBt").css("display","block");
			
		});
		
		$(".subBt").click(function(){
			$(this).parent().parent().remove();
		});
		
		$('.jobSel').change(function(){
			if($(this).val()=="etc"){
				$(this).next().slideDown();
			}else{
				$(this).next().slideUp();
			}
		});
		
		$(".bt-sub").click(function(){
			var escape = false;
			//event.preventDefault();
			
			$('.jobType').each(function(){
				if($(this).parent().find('.jobSel').val()=="etc"){
					$(this).val($(this).parent().find('.jobEtc').val());
				}else{
					$(this).val($(this).parent().find('.jobSel').val());
				}
			});
			
			if($('input[name=finalEdu]').val()=="대학·대학원 이상 졸업"){
				$('input[name=uni]').val($('select[name=unisel]').val());
				$('input[name=eduScore]').val($("input[name=grade]").val()+"/"+$('select[name=gradeSel]').val());				
				if($("select[name=majorSel]").val()=="직접입력"){
					$('input[name=major]').val($('input[name=majorSelEtc]').val()+":"+$('input[name=major-uni]').val());					
				}else{
					$('input[name=major]').val($("select[name=majorSel]").val()+":"+$('input[name=major-uni]').val());										
				}
			}else if($('input[name=finalEdu]').val()=="고등학교 졸업"){
				$('input[name=major]').val($('select[name=major-high]').val());
			}
			
			
			$('input[name=eduPeriod]').val($('select[name=schoolStartDaySel]').val()+":"+$("input[name=schoolStartDay]").val()+" ~ "+
					$('select[name=schoolEndDaySel]').val()+":"+$("input[name=schoolEndDay]").val());
			
			var careerCount=0;
			$(".career-info").each(function(){
				if(escape){
					return false;
				}
				if(careerBt=="신입"){
					$(".career-info:not(:eq(0))").remove();
					$(".career-info").find(".careerCompany").val("신입");
					
					$('.edu-info').find('.not-null-input').each(function(){
						if($(this).val()==""){
							alert("필수 요소를 입력해 주세요");
							$(this).focus();
							event.preventDefault();
							escape = true;
							return false;
						}
					})
				}else{
					$('.not-null-input').each(function(){
						if($(this).val()==""){
							alert("필수 요소를 입력해 주세요");
							$(this).focus();
							event.preventDefault();
							escape = true;
							return false;
						}
					})
				}
				$(".info-box-nullOk-head").each(function(){
					if(escape){
						return false;
					}
					if($(this).find('.nullOk-chk').is(':checked')){
						$(this).parent().find('.nullOk-top').each(function(){
							var addContent = $(this).prev().find("h3").text();
							if(addContent!="희망 근무조건"){
								if($(this).find('input[type=text]').val()==""){
									alert(addContent+"의 입력사항을 모두 입력해주세요. ");
									$(this).attr("tabindex",-1).focus();
									event.preventDefault();
									escape = true;
									return false;
								}else if($(this).find('select').val()==""){
									alert(addContent+"의 입력사항을 모두 입력해주세요. ");
									$(this).attr("tabindex",-1).focus();
									event.preventDefault();
									escape = true;
									return false;							
								}else if($(this).find('textarea').val()==""){
									alert(addContent+"의 입력사항을 모두 입력해주세요. ");
									$(this).attr("tabindex",-1).focus();
									event.preventDefault();
									escape = true;
									return false;
								}
							}
						});						
					}
				});
				
				$(this).find('input[name]').each(function(){
					if(escape){
						return false;
					}
					var name = $(this).attr("name");
					
					if(name.indexOf("[")>0){
						name=name.substring(0,name.indexOf("[")+1)+careerCount+name.substring(name.indexOf("[")+1);
						$(this).removeAttr("name").attr("name",name);
					}
				});
				$(this).find('select[name]').each(function(){
					if(escape){
						return false;
					}
					var name = $(this).attr("name");
					
					if(name.indexOf("[")>0){
						name=name.substring(0,name.indexOf("[")+1)+careerCount+name.substring(name.indexOf("[")+1);
						$(this).removeAttr("name").attr("name",name);
					}
				});
				
				careerCount = careerCount +1;
				$(this).find(".careerPeriod").val("입사:"+$(this).find("input[name=companyStartDay]").val()+" ~ "+
						$(this).find('select[name=companyEndDaySel]').val()+":"+$(this).find("input[name=companyEndDay]").val());
				
				if($(this).find("select[name=reasonSel]").val()=="직접입력"){
					$(this).find(".careerReason").val($(this).find('input[name=leaveEtc]').val());		
				}else{
					$(this).find(".careerReason").val($(this).find('select[name=reasonSel]').val());				
				}
				
				$(this).find(".careerSal").val($(this).find('input[name=salary]').val()+$(this).find('select[name=salarySel]').val());	
				
			});
			
			$('.activity').find('.nullOk-top').each(function(){
				$(this).find('.actPeriod').val($(this).find("input[name=activityStartDay]").val()+" ~ "+$(this).find("input[name=activityEndDay]").val());
			});
			
			$('.popol').find('input[name=potPeriod]').val($(".popol").find("input[name=popolStartDay]").val()+" ~ "+
					$(".popol").find("input[name=popolEndDay]").val());
			
			$(".info-box-nullOk-head").each(function(){
				if(escape){
					return false;
				}
				if($(this).find('.nullOk-chk').is(':checked')){
					var count=0;
					
					$(this).parent().find(".isListVo").each(function(){
						$(this).find('input[name]').each(function(){
							var name = $(this).attr("name");
							
							if(name.indexOf("[")>0){
								name=name.substring(0,name.indexOf("[")+1)+count+name.substring(name.indexOf("[")+1);
								$(this).removeAttr("name").attr("name",name);
							}
						});
						$(this).find('select[name]').each(function(){
							var name = $(this).attr("name");
							
							if(name.indexOf("[")>0){
								name=name.substring(0,name.indexOf("[")+1)+count+name.substring(name.indexOf("[")+1);
								$(this).removeAttr("name").attr("name",name);
							}
						});
						$(this).find('textarea[name]').each(function(){
							var name = $(this).attr("name");
							
							if(name.indexOf("[")>0){
								name=name.substring(0,name.indexOf("[")+1)+count+name.substring(name.indexOf("[")+1);
								$(this).removeAttr("name").attr("name",name);
							}
						});
						
						count = count+1;
					});					
				}else{
					if(!$(this).hasClass("no-remove")){
						$(this).parent().find('.nullOk-top').remove();						
					}
				}
			});

		});
		
		$('.bt-return').click(function(){
			location.href="<c:url value='/resume/resumeMain.do'/>"
		});
	});
</script>
<body>
	<div class="resume-main">
		<h1 style="background: white;padding: 20px 0;font-weight: bold;">이력서 작성
			<span style="font-size: 14px; color: #777; padding-left: 30px;">* 필수가 아닌항목은 체크해제시 적용되지 않습니다.</span></h1>
		<form name="frmResume" method="post" action="<c:url value='/resume/resumeWrite.do'/>"
			enctype="multipart/form-data">
		<input type="hidden" name="userNo" value="${memberVo.userNo }">
		<div class="info-box">
			<div class="info-box-head">
				<h3>기본 정보 ▼</h3>
			</div>
			<div class="info-box-content">
				<div class="col-lg-10" style="margin-top: 20px;">
					<div class="photo">
					</div>	
					<label class="col-lg-2 control-label infoinfo">이름 :${memberVo.userName } 
					(${memberVo.gender})</label><br><br>
					<label class="col-lg-2 control-label infoinfo">생년월일 : ${memberVo.birth }</label><br><br>
					<label class="col-lg-2 control-label infoinfo">연락처 : ${memberVo.hp }</label><br><br>	
					<label class="col-lg-2 control-label infoinfo">이메일 : ${memberVo.email }</label><br><br>	
					<label class="col-lg-2 control-label infoinfo">우편번호 : ${memberVo.zipcode }</label><br><br>
					<label class="col-lg-2 control-label infoinfo">주소 : ${memberVo.address }</label><br><br>
					<label class="col-lg-2 control-label infoinfo">상세주소 : ${memberVo.addressDetail }</label><br>
					<a href="#" class="member-edit">기본 정보 수정하기</a> <!-- 회원정보 수정 -->
				</div>
			</div>
		</div>
		<div class="info-box">
			<div class="info-box-head">
				<h3>*학력사항 ▼</h3>
			</div>
			<div class="info-box-content edu">
				<input class="educationBt" type="button" value="초등학교 졸업"/>
				<input class="educationBt" type="button" value="중학교 졸업"/>
				<input class="educationBt" type="button" value="고등학교 졸업"/>
				<input class="educationBt" type="button" value="대학·대학원 이상 졸업"/>
				<hr style="border-bottom-color: #fb246a; visibility:hidden;" >
				<div class="edu-info">
					<input type="hidden" name="finalEdu">
					<h5></h5>
					<div class="col-lg-10 university">
							<input type="hidden" name="uni"/>
							<label for="local" class="col-lg-2 control-label">*대학</label> 
							<select class="form-control" name="unisel">
								<option value="대학(2,3년)">대학(2,3년)</option>
								<option value="대학교(4년)">대학교(4년)</option>
								<option value="대학원(석사)">대학원(석사)</option>
								<option value="대학원(박사)">대학원(박사)</option>
							</select>
					</div>
					<div class="col-lg-10">
							<label for="shcoolName" class="col-lg-2 control-label">*학교명</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber not-null-input"
								name="uniName"
								placeholder="학교명 입력" maxlength="15">
					</div>
					<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">*지역</label> 
							<select class="form-control not-null-input" name="eduLocation">
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
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">*재학기간</label>
						<div>
							<input type="hidden" name="eduPeriod"/>
							<input type="text" class="form-control startDay not-null-input" name="schoolStartDay" readonly="readonly"/> 
							<select class="form-control col-130px" name="schoolStartDaySel">
								<option value="입학">입학</option>
								<option class="selectHandU" value="편입">편입</option>
							</select>
							<span style="margin:0 40px;">-</span>
							<input type="text" class="form-control endDay not-null-input" name="schoolEndDay" readonly="readonly"/>
							<select class="form-control col-130px" name="schoolEndDaySel">
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
					<input type="hidden" name="major"/>
					<div class="col-lg-10 highschool">
							<label for="local" class="col-lg-2 control-label">전공 계열</label> 
							<select class="form-control" name="major-high">
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
							<select class="form-control" id="major" name="majorSel">
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
								id="majorEtc" name="majorSelEtc"
								placeholder="전공계열 직접입력" maxlength="15" style="display:none;">
							<input type="text" class="form-control onlyAlphabetAndNumber"
								placeholder="전공학과 입력" maxlength="15" name="major-uni">
					</div>
					<div class="col-lg-10 university">
							<input type="hidden" name="eduScore"/>
							<label for="local" class="col-lg-2 control-label">학점</label> 
							<select class="form-control col-130px" name="gradeSel">
								<option value="">기준학점선택</option>
								<option value="4.0">4.0</option>
								<option value="4.3">4.3</option>
								<option value="4.5">4.5</option>
								<option value="5.0">5.0</option>
								<option value="7.0">7.0</option>
								<option value="100">100</option>
							</select>
							<input type="text" class="form-control" name="grade" placeholder="학점 입력" numberOnly2/> 
					</div>
				</div>
			</div>
		</div>
		<div class="info-box">
			<div class="info-box-head">
				<h3>*경력사항 ▼</h3>
			</div>
			<div class="info-box-content career">
				<input class="careerBt" type="button" value="신입"/>
				<input class="careerBt" type="button" value="경력"/>
				<hr style="border-bottom-color: #fb246a; visibility: hidden;">
				<div class="career-info" id="career-add">
					<div class="col-lg-10">
						<input class="career-subBt" type="button" value="경력 삭제하기"/>
					</div>
					<div class="col-lg-10">
							<label for="shcoolName" class="col-lg-2 control-label">*회사명</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber careerCompany not-null-input"
								name="careerItems[].careerCompany"
								placeholder="회사명 입력" maxlength="15">
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">*재직기간</label>
						<input type="hidden" name="careerItems[].careerPeriod" class="careerPeriod "/>
						<div>
							<input type="text" class="form-control startDay not-null-input" name="companyStartDay" readonly="readonly"/> 
							<span style="margin:0 105px;">-</span>
							<input type="text" class="form-control endDay not-null-input" name="companyEndDay" readonly="readonly"/>
							<select class="form-control col-130px" name="companyEndDaySel">
								<option value="퇴사">퇴사</option>
								<option value="재직중">재직중</option>
							</select>
						</div>
					</div>
					<div class="col-lg-10">
							<input type="hidden" name="careerItems[].careerReason" class="careerReason"/>
							<label for="" class="col-lg-2 control-label">퇴사사유</label> 
							<select class="form-control leave" name="reasonSel">
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
							<input type="text" class="form-control onlyAlphabetAndNumber leaveEtc"
								name="leaveEtc"
								placeholder="퇴사사유 직접입력" maxlength="50" style="display:none;">
					</div>
					<div class="col-lg-10">
							<label for="" class="col-lg-2 control-label">*직급/직책</label> 
							<input type="text" class="form-control rpChoice careerRank not-null-input" name="careerItems[].careerRank" readonly="readonly" 
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
							<input type="text" class="form-control onlyAlphabetAndNumber careerYear not-null-input"
								name="careerItems[].careerYear" style="display: inline-block;" numberOnly
								placeholder="년차 입력" maxlength="2">
					</div>	
					<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">근무지역</label> 
							<select class="form-control careerLocation" name="careerItems[].careerLocation">
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
							</select>
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">연봉</label>
						<div>
							<input type="hidden" name="careerItems[].careerSal" class="careerSal"/>
							<input type="text" class="form-control" name="salary" placeholder="연봉입력" numberOnly/> 
							<select class="form-control col-130px" name="salarySel">
								<option value="만원">만원</option>
								<option value="달러">달러</option>
								<option value="엔">엔</option>
							</select>
						</div>
					</div>
					<div class="col-lg-10">
							<label for="shcoolName" class="col-lg-2 control-label">담당업무</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber task"
								name="careerItems[].task"
								placeholder="담당업무 입력" maxlength="15">
					</div>	
				</div>
				<div class="career-addDiv">
					<input class="career-addBt" type="button" value="경력 추가하기"/>
				</div>			
			</div>
		</div>
		<div class="info-box hope">
			<div class="info-box-nullOk-head no-remove">
				<h3>희망 근무조건</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top">
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">연봉</label> 
							<select class="form-control" name="sal">
								<option value="회사내규에 따름">회사내규에 따름</option>
								<option value="1,400 만원 이하">1,400 만원 이하</option>
								<option value="1,400~1,600만원">1,400~1,600만원</option>
								<option value="1,600~1,800만원">1,600~1,800만원</option>
								<option value="1,800~2,000만원">1,800~2,000만원</option>
								<option value="2,000~2,200만원">2,000~2,200만원</option>
								<option value="2,200~2,400만원">2,200~2,400만원</option>
								<option value="2,400~2,600만원">2,400~2,600만원</option>
								<option value="2,600~2,800만원">2,600~2,800만원</option>
								<option value="2,800~3,000만원">2,800~3,000만원</option>
								<option value="3,000~3,200만원">3,000~3,200만원</option>
								<option value="3,200~3,400만원">3,200~3,400만원</option>
								<option value="3,400~3,600만원">3,400~3,600만원</option>
								<option value="3,600~3,800만원">3,600~3,800만원</option>
								<option value="3,800~4,000만원">3,800~4,000만원</option>
								<option value="4,000~5,000만원">4,000~5,000만원</option>
								<option value="5,000~6,000만원">5,000~6,000만원</option>
								<option value="6,000~7,000만원">6,000~7,000만원</option>
								<option value="7,000~8,000만원">7,000~8,000만원</option>
								<option value="8,000~9,000만원">8,000~9,000만원</option>
								<option value="9,000~1억원">9,000~1억원</option>
								<option value="1억원 이상">1억원 이상</option>
								<option value="면접 후 결정">면접 후 결정</option>
							</select>
					</div>

				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">근무 지역1</label> 
							<select class="form-control" name="location1">
								<option value="">근무 지역1 선택 안함</option>
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
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">근무 지역2</label> 
							<select class="form-control" name="location2">
								<option value="">근무 지역2 선택 안함</option>
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
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">직종1</label> 
							<select name="hopeJobtype1" class="form-control jobSel">
		                		<option value="">희망 직종을 선택하세요</option>
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
	                      <input type="text" name="job1Etc" class="form-control jobEtc onlyAlphabetAndNumbers"
	                     	 placeholder="희망 직종을 입력하세요"/>
							<input type="hidden" class="form-control onlyAlphabetAndNumber jobType"
								name="jobtype1" maxlength="30">
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">직종2</label> 
							<select name="hopeJobtype2" class="form-control jobSel">
		                		<option value="">희망 직종을 선택하세요</option>
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
	                      <input type="text" name="job2Etc" class="form-control jobEtc onlyAlphabetAndNumber jobType"
	                      	placeholder="희망 직종을 입력하세요"/>
							<input type="hidden" class="form-control onlyAlphabetAndNumber jobType"
								name="jobtype2" maxlength="30">
					</div>
			</div>
		</div>
		<div class="info-box activity">
			<input type="hidden" name="activity">
			<div class="info-box-nullOk-head">
				<h3>대외활동</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top isListVo">
				<div class="col-lg-10">
						<input class="subBt" type="button" value="삭제하기"/>
				</div>
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">활동구분</label> 
							<select class="form-control" name="activeItems[].activity">
								<option value="">활동구분 선택</option>
								<option value="교내활동">교내활동</option>
								<option value="인턴">인턴</option>
								<option value="자원봉사">자원봉사</option>
								<option value="동아리">동아리</option>
								<option value="아르바이트">아르바이트</option>
								<option value="사회활동">사회활동</option>
								<option value="수행과제">수행과제</option>
								<option value="해외연수">해외연수</option>
								<option value="교육이수내역">교육이수내역</option>
							</select>
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">기관/장소</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="activeItems[].actPlace"
								placeholder="기관/장소 입력" maxlength="30">
					</div>
					<div class="col-lg-10 term">
						<input type="hidden" class="actPeriod" name="activeItems[].actPeriod"/>
						<label for="term" class="col-lg-2 control-label">활동기간</label>
						<div>
							<input type="text" class="form-control startDay" name="activityStartDay" readonly="readonly"/> 
							<span style="margin:0 105px;">-</span>
							<input type="text" class="form-control endDay" name="activityEndDay" readonly="readonly"/>
						</div>
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">활동내용</label> 
							<textarea rows="1" cols="50" class="form-control taAuto" 
							placeholder="활동내용 입력" name="activeItems[].actContent"></textarea>
					</div>
			</div>
			<div class="addDiv">
					<input class="addBt" type="button" value="추가하기"/>
			</div>		
		</div>
		<div class="info-box">
			<div class="info-box-nullOk-head">
				<h3>자격증</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top isListVo">
				<div class="col-lg-10">
						<input class="subBt" type="button" value="삭제하기"/>
				</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">자격증명</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="certifyItems[].certifyName"
								placeholder="자격증명 입력" maxlength="30">
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">발행처/기관</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="certifyItems[].certifyPlace"
								placeholder="발행처/기관 입력" maxlength="30">
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">취득일</label>
						<div>
							<input type="text" class="form-control passDay" name="certifyItems[].certifyGetDate" readonly="readonly"/> 
						</div>
					</div>
			</div>
			<div class="addDiv">
					<input class="addBt" type="button" value="추가하기"/>
			</div>		
		</div>
		<div class="info-box">
			<div class="info-box-nullOk-head">
				<h3>어학</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top isListVo">
				<div class="col-lg-10">
						<input class="subBt" type="button" value="삭제하기"/>
				</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">언어</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="languageItems[].kinds"
								placeholder="언어 입력" maxlength="30">
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">시험종류</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="languageItems[].testName"
								placeholder="시험종류 입력" maxlength="30">
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">점수</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="languageItems[].langScore"
								placeholder="점수 입력" maxlength="30">
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">급수</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="languageItems[].rating"
								placeholder="급수 입력" maxlength="30">
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">취득일</label>
						<div>
							<input type="text" class="form-control passDay" name="languageItems[].langGetDate" readonly="readonly"/> 
						</div>
					</div>
			</div>
			<div class="addDiv">
					<input class="addBt" type="button" value="추가하기"/>
			</div>	
		</div>
		<div class="info-box">
			<div class="info-box-nullOk-head">
				<h3>수상내역/공모전</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top isListVo">
				<div class="col-lg-10">
						<input class="subBt" type="button" value="삭제하기"/>
				</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">수상명</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="awardItems[].awardName"
								placeholder="수상명 입력" maxlength="30">
					</div>
					<div class="col-lg-10">
							<label class="col-lg-2 control-label">수여기관</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="awardItems[].awardCom"
								placeholder="수여기관 입력" maxlength="30">
					</div>
					<div class="col-lg-10 term">
						<label for="term" class="col-lg-2 control-label">수상/공모일</label>
						<div>
							<input type="text" class="form-control passDay" name="awardItems[].awardGetDate" readonly="readonly"/> 
						</div>
					</div>
			</div>
			<div class="addDiv">
					<input class="addBt" type="button" value="추가하기"/>
			</div>		
		</div>
		<div class="info-box special">
			<input type="hidden" name="special"/>
			<div class="info-box-nullOk-head">
				<h3>취업 우대사항</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top">
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">장애여부</label> 
							<select class="form-control" name="disable">
								<option value="비대상">비대상</option>
								<option value="대상">대상</option>
							</select>
				</div>
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">보훈대상</label> 
							<select class="form-control" name="affair">
								<option value="비대상">비대상</option>
								<option value="대상">대상</option>
							</select>
				</div>
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">병역대상</label> 
							<select class="form-control" name="military">
								<option value="대상아님">대상아님</option>
								<option value="군필">군필</option>
								<option value="미필">미필</option>
								<option value="면제">면제</option>
								<option value="복무중">복무중</option>
							</select>
				</div>
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">고용지원금 대상</label> 
							<select class="form-control" name="sFund">
								<option value="비대상">비대상</option>
								<option value="대상">대상</option>
							</select>
				</div>
			</div>	
		</div>
		<div class="info-box popol">
			<input type="hidden" name="portfolio"/>
			<div class="info-box-nullOk-head">
				<h3>포트폴리오</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top">
				<div class="col-lg-10">
							<label for="local" class="col-lg-2 control-label">파일찾기</label> 
							<input type="file" name="upfile"/> 
				</div>
				<div class="col-lg-10 term">
						<input type="hidden" name="potPeriod"/>
						<label for="term" class="col-lg-2 control-label">작업기간</label>
						<div>
							<input type="text" class="form-control startDay" name="popolStartDay" readonly="readonly"/> 
							<span style="margin:0 105px;">-</span>
							<input type="text" class="form-control endDay" name="popolEndDay" readonly="readonly"/>
						</div>
				</div>
				<div class="col-lg-10">
							<label class="col-lg-2 control-label">작업툴</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="potTools"
								placeholder="작업툴 입력" maxlength="30">
				</div>
				<div class="col-lg-10">
							<label class="col-lg-2 control-label">작업인원</label> 
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="workers"
								placeholder="작업인원 입력" maxlength="3">
				</div>	
				<div class="col-lg-10">
							<label class="col-lg-2 control-label">작품소개</label> 
							<textarea rows="1" cols="50" class="form-control taAuto" 
							placeholder="작품 소개 입력" name="intro"></textarea>
				</div>	
			</div>	
		</div>
		<div class="info-box self-int">
			<div class="info-box-nullOk-head no-remove">
				<h3>자기소개서</h3>
				<label class="switch">
					<input type="checkbox" class="nullOk-chk" />
					<span class="slider round"></span>
				</label>
			</div>
			<div class="info-box-content nullOk-top">
				<div class="col-lg-10">
							<input type="text" class="form-control onlyAlphabetAndNumber"
								name="selfIntTitle"
								placeholder="자기소개서 제목" maxlength="20">
				</div>
				<div class="col-lg-10">
							<textarea rows="1" cols="50" class="form-control" 
							placeholder="자기소개서 내용" style="height: 300px" name="selfInt"></textarea>
				</div>
			</div>
		</div>
		<div style="text-align:center; padding: 20px;">
			<input class="bt-sub" type="submit" value="이력서 저장"/>
			<input class="bt-return" type="button" value="돌아가기"/>
		</div>
		</form>
	</div>
</body>
<%@ include file="../inc/bottom.jsp"%>
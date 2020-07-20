<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
	*{
		box-sizing: border-box;
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
	
	.edu{
		text-align: center;
		overflow: hidden;
		height: 120px;
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
		});
	});
</script>
<body>
	<div class="resume-main">
		<div class="info-box">
			<div class="info-box-head">
				<h3>기본 정보</h3>
			</div>
			<div class="info-box-content">
				<label>이름 : ()</label><br><br>	
				<label>생년월일 : </label><br><br>	
				<label>연락처 : </label><br><br>	
				<label>이메일 : </label><br><br>	
				<label>우편번호 : </label><br><br>	
				<label>주소 : </label><br><br>	
				<label>상세주소 : </label>
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
			</div>
		</div>
		<div class="info-box">
			<div class="info-box-head">
				<h3>학력사항</h3>
			</div>
			<div class="info-box-content">
				<label>이름 : ()</label><br><br>	
				<label>생년월일 : </label><br><br>	
				<label>연락처 : </label><br><br>	
				<label>이메일 : </label><br><br>	
				<label>우편번호 : </label><br><br>	
				<label>주소 : </label><br><br>	
				<label>상세주소 : </label>
			</div>
		</div>
	</div>
</body>
<%@ include file="../inc/bottom.jsp"%>
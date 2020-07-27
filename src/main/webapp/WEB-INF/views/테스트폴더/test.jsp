<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
</head>
<body>
<script type="text/javascript">
$(function(){
	var edu = "";
	if(school=="고등학교"){
				edu=school+"#"+$("input[name=schoolName]").val()+"#"+$("select[name=schoolLocal]").val()+
				"#"+$('select[name=schoolStartDaySel]').val()+":"+$("input[name=schoolStartDay]").val()+" ~ "+
				$('select[name=schoolEndDaySel]').val()+":"+$("input[name=schoolEndDay]").val()+"#"+
				$("select[name=major-high]").val();
			}else if(school=="대학·대학원"){
				var major="";
				var grade="";
				
				if($('select[name=majorSel]').val()=="직접입력"){
					major=$("input[name=majorSelEtc]").val()+"-"+$("input[name=major]").val()
				}else{
					major=$("select[name=majorSel]").val()+"-"+$("input[name=major]").val()
				}
				
				if($("input[name=grade]").val()=="" || $('select[name=gradeSel]').val()==""){
					grade="";
				}else{
					grade=$("input[name=grade]").val()+"/"+$('select[name=gradeSel]').val();
				}
				
				edu=school+"#"+$('select[name=curriculum]').val()+"#"+$("input[name=schoolName]").val()+"#"+$("select[name=schoolLocal]").val()+
				"#"+$('select[name=schoolStartDaySel]').val()+":"+$("input[name=schoolStartDay]").val()+" ~ "+
				$('select[name=schoolEndDaySel]').val()+":"+$("input[name=schoolEndDay]").val()+"#"+
				major+"#"+$('select[name=day-night]').val()+"#"+grade;
			}else{
				edu=school+"#"+$("input[name=schoolName]").val()+"#"+$("select[name=schoolLocal]").val()+
				"#"+$('select[name=schoolStartDaySel]').val()+":"+$("input[name=schoolStartDay]").val()+" ~ "+
				$('select[name=schoolEndDaySel]').val()+":"+$("input[name=schoolEndDay]").val();
			}
	$('input[name=education]').val(edu);
	
	var career="";
	
	if(careerBt=="신입"){
		career="신입";
	}else{
		$(".career-info").each(function(){
			var leave="";
			if($(this).find('select[name=leave]').val()=="직접입력"){
				leave=$(this).find('input[name=leaveEtc]').val();
			}else{
				leave=$(this).find('select[name=leave]').val();
			}
			var sal="";
			if(!$(this).find("input[name=salary]").val()==""){
				sal = $(this).find("input[name=salary]").val()+$(this).find('select[name=salarySel]').val();
			}
			
			career += $(this).find('input[name=company]').val()+"#"+
			"입사:"+$(this).find("input[name=companyStartDay]").val()+" ~ "+
			$(this).find('select[name=companyEndDaySel]').val()+":"+$(this).find("input[name=companyEndDay]").val()+"#"+
			leave+"#"+$(this).find("input[name=rank-position]").val()+"/"+$(this).find("input[name=career-year]").val()+"년차"+"#"+
			$(this).find("select[name=careerlocal]").val()+"#"+sal+"#"+$(this).find("input[name=responsibilities]").val()+"<br>";
		});
	}
	
	$('input[name=career]').val(career);
	
	if(!$('.hope').find('.nullOk-chk').is(":checked")){
		$('.hope').find('select[name=sal]').val("");
		$('.hope').find('select[name=location1]').val("");
		$('.hope').find('select[name=location2]').val("");
		$('.hope').find('input[name=jobType1]').val("");
		$('.hope').find('input[name=jobType2]').val("");
	}
	
	var activity = "";
	if($(".activity").find('.nullOk-chk').is(":checked")){
		$(".activity").find(".info-box-content").each(function(){
			activity+=$(this).find('select[name=activitySel]').val()+"#"+
			$(this).find("input[name=activityAgency]").val()+"#"+
			$(this).find("input[name=activityStartDay]").val()+" ~ "+$(this).find("input[name=activityEndDay]").val()+"#"+
			$(this).find("textarea[name=activityContent]").val()+"<br>";
		});
	}
	$('input[name=activity]').val(activity);
	
	var special=""
	if($(".special").find('.nullOk-chk').is(":checked")){
		special += "보훈대상:"+$(".special").find("select[name=special1]").val()+"#"+
		"병역대상:"+$(".special").find("select[name=special2]").val()+"#"+
		"고용지원금 대상:"+$(".special").find("select[name=special3]").val();
	}
	$('input[name=special]').val(special);
	
	var portfolio=""
	if($(".popol").find('.nullOk-chk').is(":checked")){
		portfolio += $(".popol").find("input[name=popolStartDay]").val()+" ~ "+
		$(".popol").find("input[name=popolEndDay]").val()+"#"+
		$(".popol").find("input[name=popolTool]").val()+"#"+$(".popol").find("input[name=popolTeam]").val()+"#"+
		$(".popol").find("textarea[name=popolInt]").val()
	}
	$('input[name=portfolio]').val(portfolio);
	
	if(!$('.self-int').find('.nullOk-chk').is(":checked")){
		$('.self-int').find('input[name=selfIntTitle]').val("");
		$('.self-int').find('textarea[name=selfInt]').val("");
	}
	///////
	
	$('.educationBt').click(function(){
		$('input[name=finalEdu]').val($(this).val());
	})

	if($('input[name=finalEdu]').val()=="대학·대학원 이상 졸업"){
		$('input[name=uni]').val($('select[name=unisel]').val());
		$('input[name=major]').val($('input[name=major-uni]').val());
		$('input[name=eduScore]').val($("input[name=grade]").val()+"/"+$('select[name=gradeSel]').val());
		
		
	}else if($('input[name=finalEdu]').val()=="고등학교 졸업"){
		$('input[name=major]').val($('input[name=major-high]').val());
		
	}
	
	$('input[name=eduPeriod]').val($('select[name=schoolStartDaySel]').val()+":"+$("input[name=schoolStartDay]").val()+" ~ "+
			$('select[name=schoolEndDaySel]').val()+":"+$("input[name=schoolEndDay]").val());
	
	
	$(this).find(".careerPeriod").val("입사:"+$(this).find("input[name=companyStartDay]").val()+" ~ "+
			$(this).find('select[name=companyEndDaySel]').val()+":"+$(this).find("input[name=companyEndDay]").val());
	
	if($(this).find("select[name=reasonSel]").val()=="직접입력"){
		$(this).find(".careerReason").val($(this).find('input[name=leaveEtc]').val());		
	}else{
		$(this).find(".careerReason").val($(this).find('select[name=reasonSel]').val());				
	}
	
	$(this).find(".careerSal").val($(this).find('input[name=salary]').val()+$(this).find('select[name=salarySel]').val());
	
	
	$addCareer.find(".careerCompany").removeAttr("name").attr("name","careerItems["+careerCount+"].careerCompany");
	$addCareer.find(".careerPeriod").removeAttr("name").attr("name","careerItems["+careerCount+"].careerPeriod");
	$addCareer.find(".careerReason").removeAttr("name").attr("name","careerItems["+careerCount+"].careerReason");
	$addCareer.find(".careerRank").removeAttr("name").attr("name","careerItems["+careerCount+"].careerRank");
	$addCareer.find(".careerYear").removeAttr("name").attr("name","careerItems["+careerCount+"].careerYear");
	$addCareer.find(".careerLocation").removeAttr("name").attr("name","careerItems["+careerCount+"].careerLocation");
	$addCareer.find(".careerSal").removeAttr("name").attr("name","careerItems["+careerCount+"].careerSal");
	
	$(this).find('input').each(function(){
		if($(this).attr("name").indexOf("[")>0){
			var name = $(this).attr("name");
			name=name.substring(0,name.indexOf("["))+careerCount+name.substring(name.indexOf("["));
			console.log(name);
		}
	})
	
	$('.activity').find('.nullOk-top').each(function(){
		$(this).find('.actPeriod').val($(this).find("input[name=activityStartDay]").val()+" ~ "+$(this).find("input[name=activityEndDay]").val());
	});
});
</script>
<div class="month-picker">
	<div class="month-picker-year">
		<a href="#" class="year-prev">◀</a>
		<span>2020</span><span>년</span>
		<a href="#" class="year-next">▶</a>
	</div>
	<div class="month-picker-month">
		<a href="#">1월</a>
		<a href="#">2월</a>
		<a href="#">3월</a>
		<a href="#">4월</a>
		<a href="#">5월</a>
		<a href="#">6월</a>
		<a href="#">7월</a>
		<a href="#">8월</a>
		<a href="#">9월</a>
		<a href="#">10월</a>
		<a href="#">11월</a>
		<a href="#">12월</a>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var edu = "";
	if(school=="고등학교"){
				edu=school+"#"+$("input[name=schoolName]").val()+"#"+$("input[name=schoolLocal]").val()+
				"#"+$('select[name=schoolStartDaySel]').val()+" : "+$("input[name=schoolStartDay]").val()+"~"+
				$('select[name=schoolEndDaySel]').val()+" : "+$("input[name=schoolEndDay]").val()+"#"+
				$("input[name=major-high]").val();
			}else if(school=="대학·대학원"){
				var major="";
				if($('select[name=majorSel]').val()=="직접입력"){
					major=$("input[name=majorSelEtc]").val()+"-"+$("input[name=major]").val()
				}else{
					major=$("select[name=majorSel]").val()+"-"+$("input[name=major]").val()
				}
				edu=school+"#"+$('select[name=curriculum]').val()+"#"+$("input[name=schoolName]").val()+"#"+$("input[name=schoolLocal]").val()+
				"#"+$('select[name=schoolStartDaySel]').val()+" : "+$("input[name=schoolStartDay]").val()+"~"+
				$('select[name=schoolEndDaySel]').val()+" : "+$("input[name=schoolEndDay]").val()+"#"+
				major+"#"+$('select[name=day-night]').val()+"#"+$("input[name=grade]").val()+"/"+$('select[name=gradeSel]').val();
			}else{
				edu=school+"#"+$("input[name=schoolName]").val()+"#"+$("select[name=schoolLocal]").val()+
				"#"+$('select[name=schoolStartDaySel]').val()+" : "+$("input[name=schoolStartDay]").val()+"~"+
				$('select[name=schoolEndDaySel]').val()+" : "+$("input[name=schoolEndDay]").val();
			}
	
			$(".career-info").each(function(){
				var leave="";
				if($(this).find('select[name=leave]').val()=="직접입력"){
					leave=$(this).find('input[name=leaveEtc]').val();
				}else{
					leave=$(this).find('select[name=leave]').val();
				}
				
				career = $(this).find('input[name=company]').val()+"#"+
				"입사 : "+$(this).find("input[name=companyStartDay]").val()+"~"+
				$(this).find('select[name=companyEndDaySel]').val()+" : "+$(this).find("input[name=companyEndDay]").val()+"#"+
				leave+"#"+$(this).find("input[name=rank-position]").val()+"/"+$(this).find("input[name=career-year]").val()+"#"+
				$(this).find("input[name=careerlocal]").val()+"#"+$(this).find("input[name=salary]").val()+$(this).find('select[name=salarySel]').val()+
				+"#"+$(this).find("input[name=responsibilities]").val();
			});
			
			activity+=$(this).find('select[name=activitySel]').val()+"#"+
			$(this).find("input[name=activityAgency]").val()+"#"+
			$(this).find("input[name=activityStartDay]").val()+" ~ "+$(this).find("input[name=activityEndDay]").val()+
			$(this).find("textarea[name=activityContent]").val()+"<br>";
			
			special += "보훈대상:"+$(".activity").find("select[name=special1]").val()+"#"+
			"병역대상:"+$(".activity").find("select[name=special2]").val()+"#"+
			"고용지원금 대상:"+$(".activity").find("select[name=special3]").val();

			portfolio += $(".popol").find("input[name=popolStartDay]").val()+" ~ "+
			$(".popol").find("input[name=popolEndDay]").val()+"#"+
			$(".popol").find("input[name=popolTool]").val()+"#"+$(".popol").find("input[name=popolTeam]").val()+"#"+
			$(".popol").find("textarea[name=popolInt]").val()
			
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$.ajax({
			 url :"http://inspct.career.go.kr/openapi/test/questions?apikey=5b3d6fa311bebd2bbca3b56b98e59c75&q=6"
			,dataType:"json"
			,success:function(jsonStr){
				$("#list").html("");
				var errCode = jsonStr.SUCC_YN;
				var errDesc = jsonStr.ERROR_REASON;
				if(errCode != "Y"){
					alert(errCode+"="+errDesc);
				}else{
					makeListJson(jsonStr);
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		});
	});
	
	function makeListJson(jsonStr){
		var htmlStr = "";
		var num = 1;
		$(jsonStr.RESULT).each(function(){
			htmlStr += "<div style='border: 1px solid; width: 50%;'>";
			htmlStr += "<p>"+ num +"번 " +this.question+"</p>";
			htmlStr += "<input type='radio' value='"+this.answerScore01+"' name='"+num+"'>"+this.answer01
			htmlStr += "<input type='radio' value='"+this.answerScore02+"' name='"+num+"'>"+this.answer02
			htmlStr += "<p>"+ this.answer01 + ": " +this.answer03+"</p>";
			htmlStr += "<p>"+ this.answer02 + ": " +this.answer04+"</p>";
			htmlStr += "</div>";
			num = num+1;
		});
		$("#list").html(htmlStr);
	}
</script>
</head>
<body>

</body>
</html>
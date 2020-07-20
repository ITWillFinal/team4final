<%@page import="com.fnq.model.FnqVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tbinclude/top.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
	String sb = request.getParameter("sb");
	List<FnqVO>list = (List)request.getAttribute("list");
%>
<style>
#firstSpan {
	color: red;
}

#secondSpan {
	color: navy;
}

#ddd { /* 답변 */
	background: sky-blue;
}

h3 {
}

#ui-id-1 {
	background: white;
	border: 2px solid gray;
}
#ui-id-2 {
	background: white;
	border: 2px solid gray;
}
#ui-id-3 {
	background: white;
	border: 2px solid gray;
}
#ui-id-4 {
	background: white;
	border: 2px solid gray;
}
#ui-id-5 {
	background: white;
	border: 2px solid gray;
}
#ui-id-6 {
	background: white;
	border: 2px solid gray;
}
#ui-id-7 {
	background: white;
	border: 2px solid gray;
}
#ui-id-8 {
	background: white;
	border: 2px solid gray;
}
#ui-id-9 {
	background: white;
	border: 2px solid gray;
}
#ui-id-10 {
	background: white;
	border: 2px solid gray;
}
</style>
<script>
	$(function() {
		$("#accordion").accordion({
			 heightStyle: "content"
		});
		$('#search').click(function() {
			if($('#sb').val()==''){
				alert('검색어를 입력해 주세요.');
				$(this).focus();
				event.preventDefault();
			}else{
				var q = $('#sb').val();
				location.href = "<%=request.getContextPath()%>/project/fnqSerch.do?sb="+q;
			}
		});
		

	});	
</script>

<div id = "maindiv">
	<form method="post" name = "frmList" action="<%=request.getContextPath() %>/project/fnqSerch.do">
		<div id = "serchBox">
			<label for = "sb">Travel Maker 고객센터입니다. 무엇을 도와드릴까요?</label><br>
			<input type = "text" name = "sb" title = "검색어 입력 " value = "<%=sb%>"><span>
			<input type = "submit" value = "검색" id = "search"></span>
		</div>
		<div id="accordion">
			<%if(list==null || list.isEmpty()){ %>
				<h3>
					<span id="firstSpan">------</span>&nbsp;&nbsp;&nbsp;&nbsp; 
					<span id="secondSpan">-----------</span>
				</h3>
			<%}else{ %>
				<%for(int i=0 ; i<list.size() ; i++){ 
					FnqVO vo = list.get(i);%>
				<h3>
					<span id="firstSpan"><%=vo.getCategory() %></span>&nbsp;&nbsp;&nbsp;&nbsp; 
					<span id="secondSpan"><%=vo.getQuestion() %></span>
				</h3>
				<div id="ddd">
				<p><%=vo.getAnswer() %></p>
			</div>
				<%} %>
				
			<%} %>
			
		</div>

	</form>
</div>
<a href = "<%=request.getContextPath()%>/project/askList.do">1:1 문의사항</a>
<%@ include file="../tbinclude/bottom.jsp"%>
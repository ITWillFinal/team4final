<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>

<script type = "text/javascript">
	function pageProc(curPage) {
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	$(function() {
		
		$("#accordion").accordion({
			 heightStyle: "content"
		});
		
		$('input[type=submit]').click(function() {
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


<div>
	<h2>THE JOB 고객센터 입니다.</h2>
	<form action="<%=request.getContextPath()%>/project/fnq.do"
		name="frmPage" method="post"></form>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchKeyword" value="${param.searchKeyword }">
	<div id="serchBox">
		<label for="sb">Travel Maker 고객센터입니다. 무엇을 도와드릴까요?</label><br>
		<input type="text" name="sb" id="sb" placeholder="검색어를 입력해주세요."
			value="<%=ss%>">
		<span>
		<input type="submit" value="확인"></span>
	</div>
	<div id="accordion">
		<%
			if (list == null || list.isEmpty()) {
		%>
		<h3>
			<span id=".....">------</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
				id="게시글이 존재하지 않습니다">-----------</span>
		</h3>
		<%
			} else {
		%>
		<%
			for (int i = 0; i < list.size(); i++) {
			FnqVO vo = list.get(i);
		%>
		<h3>
			<span id="firstSpan"><%=vo.getCategory()%></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="secondSpan"><%=vo.getQuestion()%></span>
		</h3>
		<div id="ddd">
			<p><%=vo.getAnswer()%></p>
		</div>
		<%
			}
		%>
		<%
			}
		%>
	</div>


</div>



<%@ include file="../inc/bottom.jsp"%>
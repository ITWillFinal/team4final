<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminTop.jsp" %>

<!DOCTYPE html>
<style>
.divList{
    padding-top: 40px;
    padding-left: 80px;
    padding-bottom: 50px;
    padding-right: 80px;
}
th{
	border-bottom: 3px solid #FB246A;;
	text-align: center;
    padding: 14px;
}
td{
	border-bottom: 1px solid #FB246A;
	padding: 13px;
}

a{
	color: black;
}

#list{
	width: 800px;
	height: 700px;
}

#upList{
	 padding-left: 300px;
}
/* 페이징 */
.divPage {
	text-align:center;
	margin-top: 70px;
	margin-bottom: 25p;
}

/* 목록 */
.divList{height: 250px;}

/* 등록삭제 버튼 */
#bt{    
	margin-top: 20px;
}

/* 리스트 상단 탭 */
ul, li{list-style: none;}
.tabList>li .inTab:hover,
.tabList>li .inTab:focus {text-decoration:underline}

li.select {
    float: left;
    text-align: center;
    padding-top: 15px;
    padding-bottom: 15px;
    font-size: 15pt;
}
#mid{
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
#btm{
	border-bottom: 1px solid lightgray;
}
input[type="submit"] {
    width: 63px;
    height: 30px;
    margin-bottom: 10px;
    margin-left: 10px;
}
input[type="text"] {
    margin-left: 10px;
    height: 17px;
}
input#btMultiDel {
    margin: 0 auto;
    margin-top: 20px;
}
li#fst {
    padding-top: 5%;
}

</style>
<script type="text/javascript">
	$(function() {
		$('#selectLV').change(function() {
			$('#lvHidden').val($('#selectLV').val());
			$('#noHidden').val($('#adminNo').val());
		});
		
		$('#btMultiDel').click(function() {
			var len = $('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert("삭제하려는 관리자를 먼저 체크하세요.");
				return;
			}
			
			$('form[name=frmList]')
				.prop("action", "<c:url value = '/memberAdmin/deleteMulti.do'/>");
			$('form[name=frmList]').submit();
		});
		
		
		$('input[name=chkAll]').click(function () {
			$('tbody input[type=checkbox]')
			.prop('checked', this.checked);			
		});
		
		$('td input[type=button]').click(function() {
			var lv = $("#selectLV option:selected").val();
			
			$.ajax({
				url:"<c:url value='/memberAdmin/updateMulti2.do'/>",
				type:"post",
				data: $('form[name=frmList]').serialize(),
				dataType:"json",
				success:function(res){
					if(res.cnt>0){
						location.href="<c:url value = '/memberAdmin/adminInfo.do'/>";
					}
				},
				error:function(xhr, status,error){
					alert(status +", " + error);
				}
			});	
			
		});
			
		/* $('#btMultiAdd').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len>1){
				alert('권한변경은 한번에 한 계정만 할 수 있습니다.');
				return;
			}
			$('form[name=frmList]').prop("action", "<c:url value='/memberAdmin/updateMulti.do'/>");
			$('form[name=frmList]').submit();
		}); */
		
	});//document.ready
	
	function boardList(curPage){
		$("input[name=currentPage]").val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<main>
	
	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<ul class = "tabList" style="width: 857px; margin-left: 0px;">
			<li class = "select" style="width: 100%;" id = "fst">
				<h2>관리자 관리</h2>
			</li>
		</ul>
	
	<form name="frmPage" method="post" 
		action="<c:url value='/memberAdmin/adminInfo.do'/>">
		<input type="hidden" name="levelName" 	value="${param.levelName}">
		<input type="hidden" name="currentPage">	
	</form>
	
	<form name="frmList" method="post" 
		action="<c:url value='/memberAdmin/adminInfo.do'/>">
	<div class="divList">
		<table style=" width='700';" class="box2" >
			<colgroup>
			   <col style="width:5%;" />
			   <col style="width:10%;" />
			   <col style="width:15%;" />
			   <col style="width:20%;" />
			   <col style="width:20%;" />
			   <col style="width:25%;" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="chkAll"></th>
					<th>번호</th>
					<th>ID</th>
					<th>이름</th>
					<th>연락처</th>
					<th>관리 등급</th>
				</tr>
			</thead>
			<tbody>  
				<c:if test="${empty list }">
					<tr>
						<td colspan="7">등록된 관리자가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:set var = "idx" value = "0"/>
						<c:forEach var = "vo" items="${list }">
							
							<tr>
								<td style = "text-align: center">
									<input type="checkbox" name="malist[${idx }].adminNo"
										value = "${vo.adminNo}" id = "ckbox">
									<input type="hidden" name = "adminNo" id = "adminNo" value = "${vo.adminNo }">
									<input type="hidden" name = "adminId" value = "${vo.adminId }">
									<input type="hidden" name = "adminName" value = "${vo.adminName }">
									<input type="hidden" name = "tel" value = "${vo.tel }">
									<input type="hidden" name = "level" value = "${vo.levels }">
									<input type="hidden" name = "regDate" value = "${vo.regDate }">
								</td>
								<td>${vo.adminNo }</td>
								<td>${vo.adminId }</td>
								<td><a href = "<c:url value = '/memberAdmin/adminDetail.do?adminNo=${vo.adminNo }'/>">${vo.adminName }</a></td>
								<td>${vo.tel }</td>
								<td>
									<c:if test="${vo.levels==1}">1급</c:if>
									<c:if test="${vo.levels==2}">2급</c:if>
									<c:if test="${vo.levels==3}">3급</c:if>
								</td>
							</tr>
							<c:set var = "idx" value = "${idx+1 }"/>
						</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->		
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="boardList(${pagingInfo.firstPage-1})">			
			    <img src='<c:url value="/resources/images/first.JPG" />'  border="0">	</a>
		</c:if>
						
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold">${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">						
				<a href="#" onclick="boardList(${i})">
					[${i }]
				</a>
			</c:if>		
		</c:forEach>
		
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="boardList(${pagingInfo.lastPage+1})">			
				<img src="<c:url value="/resources/images/last.JPG" />" border="0">
			</a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
	<div class = "divRight">
		<input type="button" id = "btMultiDel" value="선택한 관리자 삭제"><br><br>
	</div>	
</form>
</div>
</main>

<%@ include file="../inc/adminBottom.jsp"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/companyTop.jsp"%>

<style>
.divList{
    padding-top: 40px;
    padding-left: 80px;
    padding-bottom: 5%;
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
}

#upList{
	 padding-left: 300px;
}
/* 페이징 */
.divPage {
    text-align: center;
    margin-top: 3%;
}

/* 목록 */

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
input[type=submit] {
    width: 60px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 2%;
}
input#startDay {
    width: 18%;
}
input#endDay {
    width: 18%;
}
p.rst {
    margin-top: 2%;
    margin-bottom: 2%;
}
.divList {
    padding-left: 2%;
    padding-right: 2%;
}
h2#h2Title {
    margin-left: 30%;
    margin-bottom: 1%;
}
span#totalPrice {
    color: #FB246A;
}
</style>	
<script type="text/javascript">

	$(function () {
		$('#startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
		});
	});	
	
	$(function () {
		$('#endDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
		});
		
		$('.btWeek').click(function(){
			$.setDate(7, 'd'); //1주일전
		})
		$('.btMonth1').click(function(){
			$.setDate(1, 'm'); //1개월전
		})
		$('.btMonth3').click(function(){
			$.setDate(3, 'm'); //3개월전
		})
		
	});
	
	$.setDate = function(term, type){
		var arr = $('#endDay').val().split("-");  //2020-07-20
		var d = new Date(arr[0], arr[1]-1, arr[2]);
		
		if(type=='d'){
			d.setDate(d.getDate()-term); //7일전 날짜			
		}else if(type=='m'){
			d.setMonth(d.getMonth()-term); //1개월전이나 3개월전 날짜			
		}
		
		$('#startDay').val($.findDate(d));
	}
	
	$.findDate=function(date){
		return date.getFullYear() +"-" 
			+ $.formatDate(date.getMonth()+1) 
			+"-" + $.formatDate(date.getDate());
	}
	
	$.formatDate = function(d){
		if(d<10){
			return "0"+d;
		}else{
			return d;
		}
	}
	
	function pageFunc(curPage){
		$('#currentPage').val(curPage);
		$("form[name=frmPage]").submit();
	}
</script>

<!-- 본문 시작 -->
<main>
	<%@ include file="../inc/companySidebar.jsp"%>
	<h2 id = "h2Title">기업회원 결제 내역</h2>
	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray; margin-left:30%;">
		<ul class = "tabList" style="width: 857px; margin-left: 0px;">
			<li class = "select" style="width: 100%;" id = "fst">
			</li>
		</ul>
	<form name="frmPage" method="post" 
		action="<c:url value='/companypage/paymentListC.do'/>">
		<input type="hidden" name="startDay" value="${param.startDay }">
		<input type="hidden" name="endDay" value="${param.endDay }">
		<input type="hidden" id="currentPage" name = "currentPage">	
	</form>

	<form name="frmList" method="post" 
		action="<c:url value='/companypage/paymentListC.do'/>" >
		<!-- 조회기간 include -->
		
	<div class="divList">
	<table class="box2"
		summary="기업회원의 결제 내역으로 결제한 기업회원의 기본정보와 결제 정보를 제공합니다..">
		<colgroup>
			<col style="width:13%" /><!-- 기업 회원번호 -->
			<col style="width:9%" /><!-- 기업 ID-->
			<col style="width:17%" /><!-- 기업 이름-->
			<col style="width:11%" /><!-- 기업 회원이름 -->
			<col style="width:14%" /><!-- 시작일-->
			<col style="width:14%" /><!-- 종료일-->
			<col style="width:10%" /><!-- 결제일-->
			<col style="width:12%" /><!-- 결제금액-->
		</colgroup>
		<thead>
		  <tr>
		    <th scope="col">결제번호</th>
			<th scope="col">기업 ID</th>
			<th scope="col">기업명</th>
			<th scope="col">회원명</th>
			<th scope="col">공고시작일</th>
			<th scope="col">공고종료일</th>
			<th scope="col">결제일</th>
			<th scope="col">결제금액</th>
		  </tr>
		</thead> 
		<tbody>
			<c:if test="${empty list }">
				<tr class="align_center">
					<td colspan="8">결제 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">		
				<!-- 반복 시작 -->
				<c:set var = "totalPrice" value = "0"/>
				<c:forEach var="map" items="${list }">
					<c:set var = "sum" value = "${map['PRICE'] }"/>
						<tr class="align_center">
							<td>${map['RECRUITMENT_CODE']}</td>
							<td>${map['C_USERID']}</td>
							<td>${map['COM_NAME']}</td>
							<td>${map['C_USERNAME']}</td>
							<td>${map['START_DATE']}</td>
							<td>
								<c:set var = "endDate" value = "${map['END_DATE'] }"/>
								${fn:substring(endDate,2,4)}/${fn:substring(endDate,5,7)}/${fn:substring(endDate,8,10)}
							</td>
							<td>${map['REGDATE']}</td>
							<td>
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${map['PRICE']}"/>
							</td>
						</tr>
					<c:set var = "totalPrice" value = "${totalPrice + sum}"/>
				</c:forEach>
				<!-- 반복 끝 -->
			</c:if>
	</tbody>
	</table>
	</div>

		<div class="divPage">		
			<!-- 페이지 번호 추가 -->		
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">			
				    <img src='<c:url value="/resources/images/first.JPG" />'  border="0">	</a>
			</c:if>
							
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<span style="color:blue;font-weight:bold">${i }</span>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">						
					<a href="#" onclick="pageFunc(${i})">
						[${i }]
					</a>
				</c:if>
			</c:forEach>
				
			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">			
					<img src="<c:url value="/resources/images/last.JPG" />" border="0">
				</a>
			</c:if>
			<!--  페이지 번호 끝 -->
		</div>
		<div>
			<c:if test="${pagingInfo.totalRecord > 0 }">
				<p class = "rst" style="font-size: 1.0em">
					${param.startDay } ~ ${dateSearchVO.endDay } 까지의 결제내역은
					${pagingInfo.totalRecord } 건입니다.<br>
					기간 내 총 판매금액은 
					<span id = "totalPrice">
						<fmt:formatNumber type="number" maxFractionDigits="3"
							value="${totalPrice}"/>
					</span>원 입니다.
				</p>
			</c:if>
			<c:if test="${pagingInfo.totalRecord == 0 }">
				<p class = "rst"  style="font-size: 1.0em">
					${param.startDay } ~ ${dateSearchVO.endDay } 까지의 결제내역이 없습니다.
				</p>
			</c:if>
			<%@include file = "../inc/dateTerm.jsp" %>
			<input type="submit" class = "bts" value="조회" >
			<br>
			
		</div>
	</form>

</div>
</main>

<%@ include file="../inc/companyBottom.jsp"%>
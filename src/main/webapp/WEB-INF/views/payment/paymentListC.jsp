<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/js/jquery-ui.min.css'/>"> 
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	
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
		$('input[name=currentPage]').val(curPage);
		$("form[name=frmPage]").submit();
	}
</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action="<c:url value='/shop/order/orderList.do'/>">
	<input type="text" name="startDay" value="${param.startDay }">
	<input type="text" name="endDay" value="${param.endDay }">
	<input type="text" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->

<h2>주문 내역/ 배송현황</h2>
<p style="font-size: 1.0em">${sessionScope.userName }님의 주문내역입니다.</p>
<br>
<form name="frm1" method="post" 
	action="<c:url value='/shop/order/orderList.do'/>" >
	<!-- 조회기간 include -->
	<%@include file = "../../inc/dateTerm.jsp" %>
	<input type="submit" value="조회" >
</form>
<br>
<c:if test="${pagingInfo.totalRecord > 0 }">
	<p style="font-size: 1.0em">
		${param.startDay } ~ ${dateSearchVO.endDay }까지의 주문내역 총
		${pagingInfo.totalRecord } 건입니다.
	</p>
</c:if>
<div class="divList">
<table class="box2"
	summary="주문 내역에 관한 표로써, 주문번호, 주문일자, 상품명/가격/수량,주문총금액,배송현황,취소/교환/반품에 대한 정보를 제공합니다.">
	<caption>주문 내역</caption>
	<colgroup>
		<col style="width:9%" />
		<col style="width:12%" />
		<col style="width:40%" />
		<col style="width:12%" />
		<col style="width:12%" />	
		<col style="width:14%" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">주문번호</th>
		<th scope="col">주문일자</th>
		<th scope="col">상품명/가격/수량</th>
		<th scope="col">주문총금액</th>
		<th scope="col">배송현황</th>
		<th scope="col">취소/교환/반품</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty list }">
			<tr class="align_center">
				<td colspan="6">주문 내역이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">		
			<!-- 반복 시작 -->
			<c:forEach var="orderAllVo" items="${list }">
				<tr class="align_center">
					<td>${orderAllVo.orderVo.orderNo }</td>
					<td>
						<fmt:formatDate value="${orderAllVo.orderVo.orderDate }"
							pattern="yyyy-MM-dd"/>
					</td>
					<td class="align_left">
						<c:forEach var="map" 
							items="${orderAllVo.orderDetailsList }">
							<P>
								<img src="<c:url value='/pd_images/${map["IMAGEURL"] }'/>" 
									alt="${map['PRODUCTNAME'] }" width="40" align = "absmiddle">
								${map['PRODUCTNAME'] }
								<b><fmt:formatNumber value="${map['SELLPRICE'] }" 
									pattern="#,###"/></b>원 / ${map['QUANTITY'] }개
							</P>
						</c:forEach>
					</td>
					<td class="align_right">
						<fmt:formatNumber value="${orderAllVo.orderVo.totalPrice }"
							pattern="#,###" />원</td>
					<td>${orderAllVo.orderVo.deliveryStatus }</td>
					<c:set var='status' 
						value="${orderAllVo.orderVo.deliveryStatus }"/>
					<td>
						<c:if test="${status=='입금확인중' || status=='결제완료' }">
							<a href="#">[취소]</a>					
						</c:if>					
						<c:if test="${status=='배송완료' }">
							<a href="#">[교환/반품]</a>					
						</c:if>
						<c:if test="${status=='배송중' }">
							<a href="#">[배송현황]</a>					
						</c:if>															
					</td>					
				</tr>
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




<%@ include file="../../inc/bottom.jsp" %>
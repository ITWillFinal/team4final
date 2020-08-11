<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<%@ include file="../inc/comMypageTop.jsp" %>
<script type="text/javascript">
$(function(){
	
	$('#edit').click(function() {
		location.href = "<c:url value = '/companypage/MyCompanyEdit.do?comCode=${vo.comCode}'/>";
	});
	
});//function
</script>
<style type="text/css">
hr{
	height: 3px;
    background: #da2461;

}
.btSubmit{
	text-align: center;
	padding: 30px;
}
img {
    width: 100%;
    margin-left: 2%;
}
.form-control {
    border: none;
}

/* 라벨 */
label.col-sm-3.control-label {
    font-size: 10pt;
    color: gray;
}
input[type="text"] {
    font-weight: bold;
}
label.col-sm-3.control-label {
    margin-top: 2%;
}
#bbk > form > div.form-horizontal > div:nth-child(2) {
    margin-top: -3%;
}
input[type="text"] {
    border-style: none;
}
</style>
<main>
	<div id = "bbk"
		style="float: left; width: 49%; margin-left: 29%; font-size: 14px;">
		<!-- 사이드바이용에필요함 맨밑에 div 닫을것 -->
		
		<!-- main -->
		<div style="margin: 5px; height: 95px;"><br>
			<h1 style="background: white; padding: 20px; font-weight: bold;">
				[${vo.comName }] 정보 조회 
			</h1>
		</div>
		<br>
		<hr>
		<form name="frm" method="post" style="margin-top: 50px;" enctype="multipart/form-data" >
		<div class="form-horizontal">
			<input type="hidden" name = "comCode" value = ${vo.comCode }>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comName"
						name="comName" value = "${vo.comName}" ReadOnly
						style="background-color: white; font-weight: bold">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">대표자명 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="ceo"
						name="ceo" value = "${vo.ceo}" ReadOnly
						style="background-color: white; font-weight: bold">
				</div>
			</div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">사업자등록번호 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="comNum"
						name="comNum" value = "${vo.comNum }" ReadOnly
						style="background-color: white; font-weight: bold">
				</div>
			</div>
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label">주소<span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="zipcode" name="zipcode"
						placeholder="우편번호" ReadOnly value = "${vo.zipcode}" ReadOnly
						style="background-color: white; font-weight: bold">
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="address" name="address"
						placeholder="도로명주소" value = "${vo.address }" ReadOnly
						style="background-color: white; font-weight: bold">
				</div>
				<div class="col-sm-9 form-input">
					<input type="text" class="form-control" id="addressDetail"
						name="addressDetail" placeholder="상세주소" value = "${vo.addressDetail }" ReadOnly
						style="background-color: white; font-weight: bold">
				</div>
				<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">회사 사진 
				</label>
				<div class="col-sm-9 form-input">
					<img alt="${vo.comName } 이미지" src="<c:url value = '/companyInfoImage/${vo.imageURL }'/>">
				</div>
				<div class="col-sm-9 form-input">
					<img id="image" width="100" height="100" alt="Image Preview" style="display: none;">
				</div>
			</div>
			</div>
			<div class="form-group">
					<label for="inputUser" class="col-sm-3 control-label">회사 내부 전화 번호 <span>*</span>
					</label>
					<div class="col-sm-9 form-input">
						<input type="text" class="form-control" id="comHp"name="comHp"maxlength="11" 
							value = "${vo.comHp }" ReadOnly style="background-color: white; font-weight: bold">
					</div>
			</div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 형태 <span>*</span></label>
            		<div class="col-sm-9 form-input">
            			<input type="text" value = "${vo.comType }"readonly="readonly"
						style="background-color: white; font-weight: bold; margin-left: 2%;">
                  	</div>
	        </div>
			<div class="form-group">
	        	<label for="select_type" class="col-sm-3 control-label">회사 업종  <span>*</span></label>
	            	<div class="col-sm-9 form-input">
	            		<input type="text" value = "${vo.comIndustry}" readonly="readonly"
						style="background-color: white; font-weight: bold; margin-left: 2%;">
                    </div>	
 	        </div>
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">주요 사업 내용 <span>*</span>
				</label>
				<div class="col-sm-9 form-input">
					<textarea rows="8" cols="20" name = "content" readonly="readonly"
						style="width: 570px; margin-left: 2%;">${fn:replace(vo.content , newLine, '<br>')}</textarea>
				</div>
			</div>	
			<div class="form-group">
				<label for="inputUser" class="col-sm-3 control-label">홈페이지
				</label>
				<div class="col-sm-9 form-input">
					<c:if test="${empty vo.homepage }">
						<input type="text" value = "등록된 홈페이지가 없습니다." readonly="readonly"
							style="background-color: white; font-weight: bold; width: 100%; margin-left: 2%;">
					</c:if>
					<c:if test="${!empty vo.homepage }">
						<input type="text" value = "${vo.homepage }" readonly="readonly"
							style="background-color: white; font-weight: bold; width: 100%; margin-left: 2%;">
					</c:if>
				</div>
			</div>
		<!-- main end -->
		</div>
		<div class="btSubmit">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="button" id = "edit" class="btn btn-primary">수정</button>
			</div>
		</div>
		</form>
		<!-- submit button -->
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
div#outDiv {
    padding-left: 30px;
}
td {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}
input#ddd {
    margin-left: 280px;
    margin-top: 10px;
    margin-bottom: 10px;
}

input#rrr {
    margin-left: 20px;
}
</style>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/editor/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function() {
			location.href = "<c:url value = '/gogak/qna/qnaList.do'/>";
		});
		CKEDITOR.replace('content',{
			filebrowserUploadUrl:"<c:url value=''/>"
		});
	});
</script>

	<!-- Id에 따라 top, sidebar, bottom 변경 -->
	<%@ include file="../../inc/adminTop.jsp"%>
<main>
	<%-- <%@ include file="../side_inc/company_Sidebar.jsp"%> --%>
	
	<!-- main -->
	<div style="text-align: center; margin:5px; width:850px; border:1px solid lightgray;">
		<div style="margin:5px;">
			<div id="outDiv">
				<form name = "frmWrite" method="post" 
					action="<c:url value = '/gogak/qna/qnaWrite.do'/>"enctype="multipart/form-data">
					<!-- 조정필요 -->
					<!-- <div id = "divH">
						<label for="status">기업/일반</label>
						<input type="text" name = "status" >
						<label for="userId">아이디</label>
						<input type="text" name = "userId" >
						<label for="userNo">유저번호</label>
						<input type="text" name = "userNo" >
					</div> -->
					<div id = "idx" style="border: 1px solid lightgray">
						<h4>― 1:1 문의 하기 ―</h4>
						<div class = "notice" style="border: 1px solid lightgray">
							<p>1:1 문의 게시판 운영 원칙</p>
							<ul>
								<li>1:1 문의 게시판은 표현의 자유와 표현의 다양성을 존중합니다. 동시에 타인의 권리를 침해하거나 명예를 훼손하는 내용은 제한합니다. 방송통신심의위원회의 '정보통신에 관한 심의 규정', 한국인터넷자율정책기구의 '정책규정' 등을 기반으로 문제 게시물은 삭제될 수 있습니다. 자극적이고 혐오스러운 내용, 비속어, 폭력적 내용, 특정 대상을 비하하거나 차별을 조장하는 내용, 개인정보 유출을 비롯해 타인의 권리를 침해하는 내용, 반복되는 내용, 허위사실 등은 삭제나 숨김 처리될 수 있습니다.</li>
								<li>문의글 게시 후 법정공휴일을 제외한 운영업일 기준 1~3일 내에 관리자의 답변이 등록됩니다.</li>
								<li>답변이 완료된 문의는  수정 및 삭제가 불가능합니다. 최초 문의 취지와 다른 내용으로 변경되는 것을 방지하여 작성자의 의견을 보호하기 위한 조치이니 신중하게 작성하여 주시기 바랍니다.</li>
							</ul>
						</div>
						<div class = "notice" style="border: 1px solid lightgray">
							<p>1:1 문의 게시판 작성 요령 안내</p>
							<ul>
								<li>새 문의글 작성 시, 내용을 대표하는 제목 및 관련 분야를 선택하신 후 내용을 입력해주시면 됩니다.</li>
								<li>문의 내용의 주요 키워드가 포함된 카테고리를 선택하시면 정확한 답변을 드리는데에 도움이 됩니다.</li>
							</ul>
						</div>
						<div>
							<div>
								<p>문의제목</p>
								<input type="text" name = "title">
							</div>
							<div>
								<p>카테고리</p>
								<input type="text" name = "categoryNO">
							</div>
							<div>
								<p>문의내용</p>
								<textarea rows="7px" cols="50px" name = "content"></textarea>
							</div>
							<div>
								<p>파일업로드</p>
								<input multiple="multiple" type="file" name="file" />
							</div>
						</div>
					</div>
					
					<div>
						<input type = "submit" value = "글등록" id = "ddd">
						<input type = "button" value = "글목록" id = "rrr">
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/adminBottom.jsp"%>
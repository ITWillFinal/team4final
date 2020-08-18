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
select.ind {
    width: 37%;
}
input#rrr {
    margin-left: 20px;
}
div#bts {
    margin-left: 40%;
    margin-bottom: 7%;
}
#idx > div:nth-child(4) > table > tbody > tr:nth-child(3) > td:nth-child(2) > input {
    width: 100%;
}
.notice {
    width: 96%;
    margin: 0 auto;
    background-color: whitesmoke;
    padding: 3%;
}
#idx > div:nth-child(2) {
    margin-bottom: 3%;
}
#idx > div:nth-child(2) > p {
    font-size: 16px;
    font-weight: bold;
}
#idx > div:nth-child(3) > p {
    font-size: 16px;
    font-weight: bold;
}
table {
    margin: 0 auto;
    width: 800px;
    margin-top: 6%;
    margin-bottom: 6%;
}
tr {
    text-align: left;
}
.lis {
    list-style: circle;
    margin-left: 2%;
}
input[type=button] {
    width: 63px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 5%;
}
input[type=submit] {
    width: 63px;
    height: 30px;
    background: #f7f7f7;
    border: 0;
    color: black;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.15);
    margin-top: 2%;
    margin-left: 1%;
    margin-bottom: 5%;
}
div#idx {
    border: 1px solid lightgray;
	margin-top: 2%;
    margin-left: -1%;
    width: 1000px;
}
input[type=button] {
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
</style>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/editor/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function() {
			location.href = "<c:url value = '/gogak/qnaP/qnaList.do'/>";
		});
		CKEDITOR.replace('content',{
			filebrowserUploadUrl:"<c:url value='/admin/insertImage.do'/>"
		});
	});
</script>

	<%@ include file="../../inc/top.jsp"%>
<main>
	<%@ include file="../../inc/sidebar.jsp"%>
	
	<!-- main -->
<div style=" margin:5px; width:850px;  float: left;">
		<div style="margin-left: 0.5%;">
			<div id="outDiv">
				<h2 style="font-weight: bold; padding-top: 33px; padding-left: 10px;">고객센터</h2>
				<form name = "frmWrite" method="post" 
					action="<c:url value = '/gogak/qnaP/qnaWrite.do'/>">
					<div id = "idx">
						<h4 style="text-align:center; padding-top: 8%; font-weight: bold; font-size: 28px; margin-top: 5%; margin-bottom: 10%;">― 1:1 문의 ―</h4>
						<div class = "notice" >
							<p style="text-align:center;" >1:1 문의 게시판 운영 원칙</p>
							<ul>
								<li class = "lis">1:1 문의 게시판은 표현의 자유와 표현의 다양성을 존중합니다.</li>
								<li class = "lis">동시에 타인의 권리를 침해하거나 명예를 훼손하는 내용은 제한합니다.</li>
								<li class = "lis">방송통신심의위원회의 '정보통신에 관한 심의 규정', 한국인터넷자율정책기구의 '정책규정' 등을 기반으로 문제 게시물은 삭제될 수 있습니다.</li>
								<li class = "lis">자극적이고 혐오스러운 내용, 비속어, 폭력적 내용, 특정 대상을 비하하거나 차별을 조장하는 내용, 개인정보 유출을 비롯해 타인의 권리를 침해하는 내용, 반복되는 내용, 허위사실 등은 삭제나 숨김 처리될 수 있습니다.</li>
								<li class = "lis">문의글 게시 후 법정공휴일을 제외한 운영업일 기준 1~3일 내에 관리자의 답변이 등록됩니다.</li>
								<li class = "lis">답변이 완료된 문의는  수정 및 삭제가 불가능합니다.</li>
								<li class = "lis">최초 문의 취지와 다른 내용으로 변경되는 것을 방지하여 작성자의 의견을 보호하기 위한 조치이니 신중하게 작성하여 주시기 바랍니다.</li>
							</ul>
						</div>
						<div class = "notice" >
							<p style="text-align:center;" >1:1 문의 게시판 작성 요령 안내</p>
							<ul>
								<li class = "lis">새 문의글 작성 시, 내용을 대표하는 제목 및 관련 분야를 선택하신 후 내용을 입력해주시면 됩니다.</li>
								<li class = "lis">문의 내용의 주요 키워드가 포함된 카테고리를 선택하시면 정확한 답변을 드리는데에 도움이 됩니다.</li>
							</ul>
						</div>
						<div>
							<table>
								<colgroup>
								   <col style="width:30%;" />
								   <col style="width:70%;" />
								</colgroup>
								<tr>
									<td class = "in"><p>작성자</p></td>
									<td><input type = "text" class = "ind" id = "userId" name = "userId" value = "${userid}" disabled  /></td>
								</tr>
								<tr>
									<td class = "in" style="width: 130px;"><p>카테고리</p></td>
									<td>
										<select name = "category" class = "ind">
											<option value = "채용">채용</option>
											<option value = "사이트 이용">사이트 이용</option>
											<option value = "로그인 문제">로그인 문제</option>
											<option value = "기타문의">기타문의</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class = "in"><p>문의제목</p></td>
									<td><input type="text" class = "ind" name = "title" value = "${vo.title}"></td>
								</tr>
								
								<tr>
									<td class = "in" colspan="4"><textarea rows="7px" cols="50px" name = "content">${vo.content }</textarea></td>
								</tr>
							</table>
						</div>
						<div id = "bts">
							<input type = "submit" value = "글등록" id = "ddd">
							<input type = "button" value = "글목록" id = "rrr">
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/companyBottom.jsp"%>
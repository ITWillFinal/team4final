<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
a {
	color: black;
}

h4{
	margin-top: 5px; 
	font-weight: 800;
}
select.ind {
    width: 37%;
}
#idx > div:nth-child(5) > table > tbody > tr:nth-child(3) > td:nth-child(2) > input{
    width: 100%;
}
h3{
	margin-top: 40px;
	padding-bottom: 60px;
}

/* 글내용 */
#divAnswer{
    word-break: break-all;
    /* border: 1px solid blue; */
    margin: 30px;
}

#divH4{
	border-bottom: 2px solid #d1d1d1;
	padding-bottom: 20px;
}

#ab{
	text-align: left;
	margin: 10px 10px 10px 30px;
	color: gray;
    font-size: 1.11em;
}
.ab1{
	padding-right: 10px;
	color: black;
}
.font-color{
	color: gray;
}
/* 버튼 */
input#delete {
    margin-left: 5px;
    margin-right: 5px;
}
div.bts {
    margin-top: 50px;
}
input#reEdit {
    margin-right: 5px;
}
input#reDel {
    margin-right: 5px;
}

/* 답변 테이블 */
td.c {
    padding-left: 55px;
}
td {
    padding-top: 20px;
}
#idx{
	width: 66%;
    margin-left: 18%;
    padding-top: 15px;
    padding-bottom: 5px;
    border-radius: 14px;
    background-color: whitesmoke;
    border: none;
    margin-bottom: 70px;
}

p#re {
    margin-left: 22px;
}
div#reli {
    padding-top: 15px;
    padding-left: 20px;
    padding-bottom: 50px;
}
p#rea1 {
    padding-left: 22px;
    padding-top: 15px;
}

/* 답변달기 */
div#resu {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
    padding-bottom: 30px;
}

#cs {
    width: 500px;
    height: 200px;
}
p.rea {
    font-size: 12pt;
    font-weight: 800;
}
div#bts2 {
    margin-left: 44%;
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
.lis {
    list-style: circle;
    margin-left: 2%;
    text-align: left;
}
.notice {
    width: 96%;
    margin: 0 auto;
    background-color: whitesmoke;
    padding: 3%;
}
#outDiv > form > div:nth-child(2) {
    margin-bottom: 3%;
}
#outDiv > form > div:nth-child(2) > p{
    font-size: 16px;
    font-weight: bold;
}
#outDiv > form > div:nth-child(3) > p{
    font-size: 16px;
    font-weight: bold;
}
</style>
<script type="text/javascript" 
	src = "<c:url value = '/resources/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/editor/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#rrr').click(function() {
			location.href = "<c:url value = '/gogak/qnaC/qnaList.do'/>";
		});
		CKEDITOR.replace('content',{
			filebrowserUploadUrl:"<c:url value=''/>"
		});
	});
</script>

	<%@ include file="../../inc/companyTop.jsp"%>
<main>
	<%@ include file="../../inc/companySidebar.jsp"%>
	
	<!-- main -->
	<div style=" margin:5px; width:850px;  float: left;">
		<div style="margin-left: 0.5%;">
			<div id="outDiv">
				<h2 style="font-weight: bold;padding-left: 40px; padding-top: 33px;">고객센터</h2>
		<div style="text-align: center; margin: 5px; border: 1px solid lightgray;margin-left: 22px;margin-top: 1.9%;width: 1000px;padding-top: 8%;padding-left: 8%; padding-right: 8%; padding-bottom: 10%;">
			<div id="outDiv">
				<form name = "frmWrite" method="post"  action="<c:url value = '/gogak/qnaC/qnaEdit.do'/>">
						<h4 style="text-align:center; font-size: 24px; margin-top: 10%; margin-bottom: 10%; font-weight: bold">― 1:1 문의 글 수정 ―</h4>
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
							<input type="hidden" id = "qnaNo" name = "qnaNo" value = "${vo.qnaNo}">
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
							<input type = "submit" value = "글수정" id = "ddd">
							<input type = "button" value = "글목록" id = "rrr">
						</div>
				</form>
			</div>
			</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../../inc/companyBottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sidebar.jsp"%>
<style>
a {
	color: black;
}

h4{
	margin-top: 5px; 
	font-weight: 800;
}

h3{
	margin-top: 40px;
	padding-bottom: 60px;
}

#outDiv{
    padding: 75px 35px 90px 35px;
	width: 100%;
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
div#mainDiv {
    margin-left: 1.8%;
    margin-top: 0.35%;
    width: 871px;
}
body > h2 {
    margin-left: 31.7%;
    margin-top: 1.7%;
    font-weight: bold;
}
#outDiv > div:nth-child(3) > div:nth-child(3) {
    margin-bottom: 7%;
}
</style>

<script type="text/javascript">
	$(function() {
		$('#btList').click(function() {
			history.back();
		});
	});
	
</script>
<h2>공지사항</h2>
<div id = "mainDiv" style="text-align: center; border:1px solid lightgray; float: left;">
	<!-- 본문 -->
	<div style="text-align: center; margin: 5px; /* border: 1px solid lightgray; */">
		<div id="outDiv">
			<h3>${vo.title}</h3>
			<div id = "idx">
				<p>작성일:<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm"/>　　　조회수 : ${vo.readcount }</p>
			</div>
			<div style="text-align: left;">
				<div id = "divH4">
					<h4>문의 내용</h4>
				</div>
				<br>
				<div>
					<% pageContext.setAttribute("newLine", "\r\n"); %>
					${fn:replace(vo.content, newLine, '<br>')}
				</div>
			</div>		
			<div style="text-align: center;">
				<input type="button" value="글목록" id="btList">
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
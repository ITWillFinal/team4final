<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/aboutSidebar.jsp" %>
<style type="text/css">
	hr {
		border:1px solid #FB246A;
		width:100%;
	}

	.div1 {
		float: left;
		margin-left: 3%;
		border: 1px dotted gray;
		height: 420px;
		width: 420px;
		text-align: center;
		background: whitesmoke;
	}

	.div2 {
		float: right;
		margin-right: 3%;
		border: 1px dotted gray;
		height: 420px;
		width: 420px;
		text-align: center;
		background: whitesmoke;
		padding-left: 10px;
	}

	.div3 {
		clear: both;
	}

	.img {
	  display: block;
	  max-width:400px;
	  max-height:400px;
	  width: auto;
	  height: auto;
	}

	a {
		color: black;
	}

.bttn1{
		width:150px;
		margin-left:130px;
		margin-top: -0.5px;
		cursor: pointer;
		
	}
	
	.bttn1:hover{
		background: #ced4da;
		border:	1px solid #ced4da;
		color: white;
	}
</style>
<main>
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px;">
		<div style="margin:5px;">
			<span style="font-size: 25px; font-weight: bold;">CI소개</span>
			<hr>

			<div>
				<div class="div1">
					<div style="margin-top: 60px;">
					<img src="<c:url value='/resources/images/ci/ci1.png'/>">
					</div>
					<div style="margin-top: 30px;" >
						<br>
						<a href="<c:url value='/resources/images/ci/ci1.png'/>" download>
							<input type="button" id="btn1" class="form-control bttn1" value="다운로드1 (.png)">
						</a>

					</div>
				</div>
				<div class="div2">
					<div style="margin-top: 44px;">
						<div>
							<img class="img" src="<c:url value='/resources/images/ci/ci2.png'/>">
							<br>
							<a href="<c:url value='/resources/images/ci/ci2.png'/>" download>
								<input type="button" id="btn2" class="form-control bttn1" value="다운로드2 (.png)">
							</a>
						</div>
					<br>
						<div>
							<img class="img" src="<c:url value='/resources/images/ci/ci3.png'/>" >
							<br>
							<a href="<c:url value='/resources/images/ci/ci3.png'/>" download>
								<input type="button" id="btn3" class="form-control bttn1" value="다운로드3 (.png)">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="div3">
			</div>
			<br>
		</div>

	</div>
</main>
<%@ include file="../inc/bottom.jsp" %>

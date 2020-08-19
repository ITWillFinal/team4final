<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- main left sidebar -->
	<style>
		#sideMenuDiv {
			border:none;
			background: whitesmoke;	
		}
		
		.MenuHeadDiv {
			height:35px;
			padding: 5px 0px 0px 6px;
		}
		
		.MenuHeadDiv {
			background: #010B1D;
			border-top: 3px solid #FB246A;
			border-left: 3px solid #FB246A;
			color: white;
		}
		
		.MenuHoverDiv {
			height:35px;
			padding: 7.5px 0px 0px 9px;
			border-bottom: 0px;
		}
		
		.MenuHoverDiv a {
			color: black;
		}
				
		.MenuHoverDiv:hover{
			background: lightgray;
		}
	</style>

	<div style="float: left; min-height:900px; width:250px; margin-left:16%; word-break:break-all; font-size: 14px; margin-top: 35px;">
		<div id="sideMenuDiv">
			<div class="MenuHeadDiv">THE JOB+</div>
			<div class="MenuHoverDiv"><a href="<c:url value='/info/info.do'/>">회사소개</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value='/info/ciPage.do'/>">회사 CI</a></div>
			<div class="MenuHoverDiv"><a href="<c:url value='/aboutThejob/thejobLocation.do'/>">회사위치</a></div>
		</div>		
	</div>
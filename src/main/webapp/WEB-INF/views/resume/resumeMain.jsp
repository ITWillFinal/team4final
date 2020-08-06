<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/mypageTop.jsp" %>
<script src="<c:url value='/resources/js/html2canvas.js'/>"></script>
<script src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<style type="text/css">
	*{
		box-sizing: border-box;
	}
	

	.resumeMain{
		width: 1020px;
		margin: 0 auto;
		background: #f7f7f79e;
   		box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.28);
		padding: 50px; 
		margin-bottom: 70px;
		margin-top: 50px;
	}
	
	.resume-desc{
		font-size: small;
	    color: #8f9294;
	    padding: 10px 40px;
	}
	
	.resume-desc ul li{
		list-style: disc;
	}
	
	.resume-add a{
	 	text-align: center; 
	 	margin: 0 auto;
	 	width: 900px;
	 	font-weight: bold;
	 	display: block;
	 	margin: 30px auto;
	}
	
	.resumeList{
	    width: 900px;
	    margin: 10px auto;
	}
	
	.resumeList ul li {
	    font-size: larger;
	    font-weight: bold;
	    height: 160px;
	}
	
	.resumeList ul li a{
		color: #000;
		font-size: 1.1em
	}
	
	.resumeList ul li .regdate{
		position: relative;
	    top: 40px;
	    left: 25px;
	    color: #989696;
	    font-weight: normal;
	    font-size: 13px;
	}
	
	.resumeList ul li .regdate a{
		color: #989696;
	    font-weight: normal;
	    font-size: 13px;
	}
	
	.resume-info{
		background:white;
	    /* margin: 20px; */
    	font-size: larger;
    	font-weight: bold;
    	border: 1px solid #aeaeae;
	    height: 150px;
    	padding: 40px 25px 5px;
    }

    
    .delResume{
    	position: relative;
    	top: 35px;
    	left: 580px;
    }
    
    .resume-info-career{
    	font-size: 15px;
 		font-weight: lighter;
    }
    
    .repResume{
    	border: 3px solid #fb246a;
    }
    
    /* 체크박스 => 토글 슬라이더 */
	.switch {
	margin-top:10px;
	position: relative;
	display: inline-block;
	width: 30px;
	height: 17px;
	}
	.switch input {
		opacity: 0;
		width: 0;
		height: 0;	
	}
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #ccc;
		-webkit-transition: .4s;
		transition: .4s;
	}
	.slider:before {
		position: absolute;
		content: "";
		height: 13px;
		width: 13px;
		left:2px;
		bottom: 2px;
		background-color: white;
		-webkit-transition: .4s;
		transition: .4s;	
	}
	input:checked + .slider {
		background-color: #fb246a;
	}
	input:focus + .slider {
		box-shadow: 0 0 1px #fb246a;
	}
	input:checked + .slider:before {
		-webkit-transform: translateX(13px);
		-ms-transform: translateX(13px);
		transform: translate(13px);
	}
	.slider.round {
		border-radius: 17px;
	}
	.slider.round:before {
		border-radius: 50%;
	}
	
	.YorN{
		color: #989696;
	    font-weight: normal;
	    font-size: 13px;
	    position: relative;
    	top: -11px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$('.yorn-chk').change(function(){
			$.ajax({
				url:"<c:url value='/resume/resumeYorn.do'/>",
				type:"get",
				data:"yorn="+$('.yorn-chk').is(":checked"),
				success:function(res){
					if(res=="Y"){
						$('.YorN').text("이력서 공개");
					}else if(res=="N"){
						$('.YorN').text("이력서 비공개");						
					}
				},
				error:function(xhr, status, error){
					alert(status+","+error );
				}
			});
		});
		
		$('.delResume').click(function(){
			if(!confirm("이력서를 삭제하시겠습니까? \n삭제한 이력서는 복구할 수 없습니다.")){
				event.preventDefault();	
			}
		})
		
		/* $('.delResume').click(function(){
			var $removeLi=$(this).parent();
			$.ajax({
				url:"<c:url value='/resume/resumeDelete.do'/>",
				type:"get",
				data:"resumeNo="+$(this).next().val(),
				success:function(res){
					if(res=="1"){
						$removeLi.remove();
						alert("이력서를 삭제 했습니다.");
					}else{
						alert("이력서 삭제에 실패했습니다.");
					}
				},
				error:function(xhr, status, error){
					alert(status+","+error );
				}
			})
		}); */
	});
</script>
	<div class="resumeMain">
		<h1>이력서 현황</h1>
		<div class="resume-desc">
		<ul>
			<li>이력서는 <b>최대 10건</b>까지 등록 가능합니다.</li>
			<li>삭제된 이력서는 <b>복구</b>할 수 없습니다.</li>
			<li>이력서 공개 설정은 <b>1개의 이력서만 가능</b>합니다.</li>
		</ul>
		</div>
		<div class="resumeList">
			<ul>
			<c:if test="${empty resumeList }">
				등록된 이력서가 없습니다.
			</c:if>
			<c:if test="${!empty resumeList }">
				<span>총 <b style="color: #fb246a;">${resumeList.size() }</b>건</span>
				<div>
					<c:if test="${!empty resumeNo }">
					<c:forEach var="i" begin="0" end="${resumeList.size() }">
						<c:if test="${resumeList[i]['RESUME_NO']==resumeNo }">
							<c:set var="idx" value="${i }"/>
						</c:if>
					</c:forEach>
					<li>
						<span class="regdate">수정 : ${resumeList[idx]['REGDATE'] } | <a href="<c:url value='/resume/setRepResume.do'/>">대표 이력서 해제</a></span>
						<div class="resume-info repResume">
							<a href="<c:url value='/resume/resumeDetail.do?resumeNo=${resumeList[idx]["RESUME_NO"] }'/>">(대표)
							<c:if test="${empty resumeList[idx]['SELF_INT_TITLE'] or resumeList[idx]['SELF_INT_TITLE']==''}">no title</c:if>
							<c:if test="${!empty resumeList[idx]['SELF_INT_TITLE'] or resumeList[idx]['SELF_INT_TITLE']!=''}">${resumeList[idx]['SELF_INT_TITLE'] }</c:if>
							 </a>
							 <div class="resume-info-career">
						 		<c:if test="${resumeList[idx]['CAREER_COMPANY']=='신입' }">
						 			신입
						 		</c:if>
						 		<c:if test="${resumeList[idx]['CAREER_COMPANY']!='신입' }">
							 		경력
						 		</c:if>
						 		| ${resumeList[idx]['SAL'] }
							 </div>
							 <label class="switch">
								<input type="checkbox" class="yorn-chk"  
								<c:if test="${yorn=='Y' }">
								 	checked="checked"
								</c:if>/>
								<span class="slider round"></span>
							</label>
							<c:if test="${yorn=='N' }">
							 	<span class="YorN">이력서 비공개</span>
							</c:if>
							<c:if test="${yorn=='Y' }">
							 	<span class="YorN">이력서 공개</span>
							</c:if>
						</div>
					</li>
					</c:if>
					<c:if test="${empty resumeNo }">
						대표 이력서를 설정해주세요.${resumNo }
					</c:if>
				</div>
				<c:forEach var="resumeMap" items="${resumeList }">
					<c:if test="${resumeMap['RESUME_NO']!=resumeNo }">
						<li>
							<span class="regdate">수정 : ${resumeMap['REGDATE'] } | <a href="<c:url value='/resume/setRepResume.do?resumeNo=${resumeMap["RESUME_NO"] }'/>">대표 이력서 설정</a></span>
							<a href="<c:url value='/resume/resumeDelete.do?resumeNo=${resumeMap["RESUME_NO"]}'/>" class="delResume">x</a>
							<input type="hidden" value="${resumeMap['RESUME_NO']}"/>
							<div class="resume-info">
								<a href="<c:url value='/resume/resumeDetail.do?resumeNo=${resumeMap["RESUME_NO"] }'/>">
								<c:if test="${empty resumeMap['SELF_INT_TITLE'] or resumeMap['SELF_INT_TITLE']==''}">no title</c:if>
								<c:if test="${!empty resumeMap['SELF_INT_TITLE'] or resumeMap['SELF_INT_TITLE']!=''}">${resumeMap['SELF_INT_TITLE'] }</c:if>
								 </a>
								 <div class="resume-info-career">
								 	<c:if test="${resumeMap['CAREER_COMPANY']=='신입' }">
								 		신입
								 	</c:if>
								 	<c:if test="${resumeMap['CAREER_COMPANY']!='신입' }">
								 		경력
								 	</c:if>
								 	| ${resumeMap['SAL'] }
								 </div>
							</div>
						</li>
					</c:if>
				</c:forEach>				
			</c:if>
			</ul>
		</div>
		<c:if test="${resumeList.size() < 10}">
			<div class="resume-add">
					<a href="<c:url value='/resume/resumeWrite.do'/>" class="btn head-btn2">새로운 이력서 등록하기</a>
			</div>
		</c:if>
	</div>
<%@ include file="../inc/bottom.jsp" %>
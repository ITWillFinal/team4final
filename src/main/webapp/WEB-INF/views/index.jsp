<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/top.jsp" %>

<style>
	#searchSelectDiv{
	    margin-left: 30px;
	}
	#searchSelectDiv a{
		margin-left: 25px;
	    margin-bottom: 15px;
	    font-size: 1em;
	}
	
	#inputSubmit{
            height: 60px;
            border: 0;
    }
	
</style>

<main>
<!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider slider-height d-flex align-items-center"
                    style="background-image: url('${pageContext.request.contextPath}/resources/images/hero/h1_hero.jpg');">
                    <div class="container">
                        <form action="">
                            <div class="row" id="searchSelectDiv">
                                <a href="<c:url value='/hireinpo/infoSearchByLocation.do'/>" class="btn head-btn2" style="font-weight: bold;">지역별</a>
                                <a href="#pop01" class="btn head-btn2" style="font-weight: bold;">직업별</a>
                                <a href="#pop01" class="btn head-btn2" style="font-weight: bold;">산업별</a>
                            </div>
                                <!-- Search Box -->
                               
							<div style="display: flex; margin-left: 10px;">
							    <div style="box-shadow: 0px 6px 29px 0px rgba(36, 43, 94, 0.08); padding-left: 20px; width: 430px;margin-left: 20px;">
							        <input type="text" placeholder="원하는 직업을 입력해주세요!"
							            style="width: 95%;" id="inputSubmit">
							    </div>
							    <input type="submit" value="검색" style="background: #fb246a; width: 100px; color: #ffffff; font-weight: bold;" id="inputSubmit">
							</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
   
    <!-- Featured_job_start -->
    <section class="featured-job-area feature-padding">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>현재 인기있는 채용공고</span>
                        <h2>채용 TOP 5</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <!-- single-job-content -->
                    <c:if test="${!empty reVo }">
	                    <c:forEach var="map" items="${reVo }">
		                    <div class="single-job-items mb-30">
		                        <div class="job-items">
		                            <div class="company-img">
		                                <a href="job_details.html"></a>
		                            </div>
		                            <div class="job-tittle">
		                                <a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${map["RECRUITMENT_CODE"] }'/>"><h4>${map["TITLE"] }</h4></a>
		                                <ul>
		                                    <li>${map["COM_NAME"] }</li>
		                                    <li><i class="fas fa-map-marker-alt"></i>${map["JOB_TYPE2"] }</li>
		                                    <li>${map["PAY"] }</li>
		                                </ul>
		                            </div>
		                        </div>
		                        <div class="items-link f-right">
		                            <a href="<c:url value='/hireinpo/infoDetail.do?recruitmentCode=${map["RECRUITMENT_CODE"] }'/>">${map["REC_TYPE"] }</a>
		                            <span>${map["REGDATE"] }</span>
		                        </div>
		                    </div>
	                    </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured_job_end -->
    <!-- How  Apply Process Start-->
    <div class="apply-process-area apply-bg pt-150 pb-150" data-background="assets/img/gallery/how-applybg.png">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle white-text text-center">
                        <span>THE JOB 이용방법</span>
                        <h2 style="color: #28395a">검색부터 취직까지</h2>
                    </div>
                </div>
            </div>
            <!-- Apply Process Caption -->
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-process text-center mb-30">
                        <div class="process-ion">
                            <span class="flaticon-search"></span>
                        </div>
                        <div class="process-cap">
                           <h5>1. 직업 검색</h5>
                           <p><br>인기있는 대기업부터 매력만점 강소기업까지!<br></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-process text-center mb-30">
                        <div class="process-ion">
                            <span class="flaticon-curriculum-vitae"></span>
                        </div>
                        <div class="process-cap">
                           <h5>2. 원하는 기업에 지원</h5>
                           <p>이제는 찾아 가지 말고<br> 기업이 모셔가게 하는 Job Finder!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-process text-center mb-30">
                        <div class="process-ion">
                            <span class="flaticon-tour"></span>
                        </div>
                        <div class="process-cap">
                           <h5>3. 취직</h5>
                           <p><br>Job Finder에서 Life Job으로!<br></p>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </div>
    <!-- How  Apply Process End-->
</main>

<%@ include file="inc/bottom.jsp" %>
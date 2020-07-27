<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/top.jsp" %>

<style>
	#searchSelect{
		margin-left: 30px;
	    height:. 55px;
	    font-size: 1.1em;
	    font-weight: bold;
	    background: #ffffff;
	    width: 11%;
	    border: 1px solid #fb246a;
	    color: #fb246a;
	    text-align-last: center;
	    margin-bottom: 10px;
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
                                <select id="searchSelect" style="margin-left: 70px;">
                                    <option>지역</option>
                                    <option>서울특별시</option>
                                    <option>경기도</option>
                                    <option>인천광역시</option>
                                    <option>세종시</option>
                                    <option>충청남도</option>
                                    <option>충청북도</option>
                                    <option>대전광역시</option>
                                    <option>광주광역시</option>
                                    <option>전라남도</option>
                                    <option>전라북도</option>
                                    <option>대구광역시</option>
                                    <option>경상북도</option>
                                    <option>경상남도</option>
                                    <option>부산광역시</option>
                                    <option>울산광역시</option>
                                    <option>강원도</option>
                                    <option>제주도</option>
                                </select>
                                <select id="searchSelect">
                                    <option>직무</option>
                                    <option>경영사무</option>
                                    <option>마케팅-광고</option>
                                    <option>IT-인터넷</option>
                                    <option>디자인</option>
                                    <option>무역유통</option>
                                    <option>영업-고객상담</option>
                                    <option>서비스</option>
                                    <option>연구개발</option>
                                    <option>생산-제조</option>
                                    <option>교육</option>
                                    <option>건설</option>
                                    <option>의료</option>
                                    <option>미디어</option>
                                    <option>전문특수직</option>
                                </select>
                                <select id="searchSelect">
                                    <option>산업</option>
                                    <option>서비스업</option>
                                    <option>금융업</option>
                                    <option>IT정보통신업</option>
                                    <option>판매유통업</option>
                                    <option>제조업</option>
                                    <option>화학업</option>
                                    <option>교육업</option>
                                    <option>건설업</option>
                                    <option>의료제약업</option>
                                    <option>미디어업</option>
                                    <option>광고업</option>
                                    <option>문화예술업</option>
                                    <option>디자인업</option>
                                </select><br>
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
    <!-- slider Area End-->
    <!-- Our Services Start -->
    <!-- <div class="our-services section-pad-t30">
        <div class="container"> -->
            <!-- Section Tittle -->
            <!-- <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>FEATURED TOURS Packages 피쳐뚜레스팤카지스</span>
                        <h2>Browse Top Categories </h2>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-contnet-center">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-tour"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Design & Creative</a></h5>
                            <span>(653)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-cms"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Design & Development</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-report"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Sales & Marketing</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-app"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Mobile Application</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-helmet"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Construction</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-high-tech"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Information Technology</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-real-estate"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Real Estate</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-content"></span>
                        </div>
                        <div class="services-cap">
                           <h5><a href="job_listing.html">Content Writer</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- More Btn -->
            <!-- Section Button -->
            <!-- <div class="row">
                <div class="col-lg-12">
                    <div class="browse-btn2 text-center mt-50">
                        <a href="job_listing.html" class="border-btn2">Browse All Sectors</a>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Our Services End -->
   
    <!-- Featured_job_start -->
    <section class="featured-job-area feature-padding">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>현재 인기있는 채용공고</span>
                        <h2>채용 TOP 10</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <!-- single-job-content -->
                    <div class="single-job-items mb-30">
                        <div class="job-items">
                            <div class="company-img">
                                <a href="job_details.html"></a>
                            </div>
                            <div class="job-tittle">
                                <a href="job_details.html"><h4>Digital Marketer</h4></a>
                                <ul>
                                    <li>Creative Agency</li>
                                    <li><i class="fas fa-map-marker-alt"></i>Athens, Greece</li>
                                    <li>$3500 - $4000</li>
                                </ul>
                            </div>
                        </div>
                        <div class="items-link f-right">
                            <a href="job_details.html">Full Time</a>
                            <span>7 hours ago</span>
                        </div>
                    </div>
                    <!-- single-job-content -->
                    <div class="single-job-items mb-30">
                        <div class="job-items">
                            <div class="company-img">
                                <a href="job_details.html"></a>
                            </div>
                            <div class="job-tittle">
                                <a href="job_details.html"><h4>Digital Marketer</h4></a>
                                <ul>
                                    <li>Creative Agency</li>
                                    <li><i class="fas fa-map-marker-alt"></i>Athens, Greece</li>
                                    <li>$3500 - $4000</li>
                                </ul>
                            </div>
                        </div>
                        <div class="items-link f-right">
                            <a href="job_details.html">Full Time</a>
                            <span>7 hours ago</span>
                        </div>
                    </div>
                     <!-- single-job-content -->
                    <div class="single-job-items mb-30">
                        <div class="job-items">
                            <div class="company-img">
                                <a href="job_details.html"></a>
                            </div>
                            <div class="job-tittle">
                                <a href="job_details.html"><h4>Digital Marketer</h4></a>
                                <ul>
                                    <li>Creative Agency</li>
                                    <li><i class="fas fa-map-marker-alt"></i>Athens, Greece</li>
                                    <li>$3500 - $4000</li>
                                </ul>
                            </div>
                        </div>
                        <div class="items-link f-right">
                            <a href="job_details.html">Full Time</a>
                            <span>7 hours ago</span>
                        </div>
                    </div>
                     <!-- single-job-content -->
                    <div class="single-job-items mb-30">
                        <div class="job-items">
                            <div class="company-img">
                                <a href="job_details.html"></a>
                            </div>
                            <div class="job-tittle">
                                <a href="job_details.html"><h4>Digital Marketer</h4></a>
                                <ul>
                                    <li>Creative Agency</li>
                                    <li><i class="fas fa-map-marker-alt"></i>Athens, Greece</li>
                                    <li>$3500 - $4000</li>
                                </ul>
                            </div>
                        </div>
                        <div class="items-link f-right">
                            <a href="job_details.html">Full Time</a>
                            <span>7 hours ago</span>
                        </div>
                    </div>
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
                           <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.</p>
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
                           <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.</p>
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
                           <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.</p>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </div>
    <!-- How  Apply Process End-->
</main>

<%@ include file="inc/bottom.jsp" %>
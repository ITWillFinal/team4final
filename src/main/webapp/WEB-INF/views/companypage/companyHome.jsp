<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>
<main>
	<!-- slider Area End-->
	<!-- Our Services Start -->
	<div class="our-services section-pad-t30">
	    <div class="container">
	        <!-- Section Tittle -->
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="section-tittle text-center">
	                    <span>The Job의 더 편리한 기능</span>
	                    <h2>THE JOB QUICK MENU</h2>
	                </div>
	            </div>
	        </div>
	        <div class="row d-flex justify-contnet-center">
	       		<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
	                <div class="single-services text-center mb-30">
	                    <div class="services-ion">
	                        <a href="<c:url value='/companypage/companyWrite.do'/>"><span class="flaticon-report"></span></a>
	                    </div>
	                    <div class="services-cap">
	                       <h5><a href="<c:url value='/companypage/companyWrite.do'/>">공고등록</a></h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
	                <div class="single-services text-center mb-30">
	                    <div class="services-ion">
	                        <a href="<c:url value='/companypage/searchTalent.do'/>"><span class="flaticon-tour"></span></a>
	                    </div>
	                    <div class="services-cap">
	                       <h5><a href="<c:url value='/companypage/searchTalent.do'/>">인재검색</a></h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
	                <div class="single-services text-center mb-30">
	                    <div class="services-ion">
	                        <a href="<c:url value='/companypage/employmentNotice/employmentNoticeList.do'/>"><span class="flaticon-content"></span></a>
	                    </div>
	                    <div class="services-cap">
	                       <h5><a href="<c:url value='/companypage/employmentNotice/employmentNoticeList.do'/>">채용공고관리</a></h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
	                <div class="single-services text-center mb-30">
	                    <div class="services-ion">
	                        <a href="<c:url value='/companypage/applyManagement.do'/>"><span class="flaticon-search"></span></a>
	                    </div>
	                    <div class="services-cap">
	                       <h5><a href="<c:url value='/companypage/applyManagement.do'/>">지원자관리</a></h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
	                <div class="single-services text-center mb-30">
	                    <div class="services-ion">
	                        <a href="<c:url value='/companypage/companyInfoWrite.do' />"><span class="flaticon-real-estate"></span></a>
	                    </div>
	                    <div class="services-cap">
	                       <h5><a href="<c:url value='/companypage/companyInfoWrite.do' />">회사정보등록</a></h5>
	                    </div>
	                </div>
	                
	            </div>
	            
	        </div>
	        <!-- More Btn -->
	        <!-- Section Button -->
	        
	    </div>
	</div>
	<!-- Our Services End -->  
</main>

<%@ include file="../inc/bottom.jsp" %>
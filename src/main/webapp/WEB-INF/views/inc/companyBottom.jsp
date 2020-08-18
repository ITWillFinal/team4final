<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#txtDiv{
		margin-top: 27px;
	}
</style>
<%@ include file="chatbot.jsp" %>
<footer class="foot">
    <!-- Footer Start-->
    <div class="footer-area footer-bg footer-padding" style="clear:both;">
        <div class="container">
          
           <!--  -->
           <div class="row footer-wejed justify-content-between">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <!-- logo -->
                    <div class="footer-logo mb-20">
                    <a href="<c:url value='/memberAdmin/login.do'/>"><img src="<c:url value='/resources/images/logo/bottomLogo.png'/>" alt="" style="width: 90%;"></a>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5" id="txtDiv">
                <div class="footer-tittle-bottom">
                   <span>Best</span>
                    <p>Job Info Place</p>
                </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5" id="txtDiv">
                    <div class="footer-tittle-bottom">
                        <span>Many</span>
                        <p>Talented Hunter</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5" id="txtDiv">
                    <!-- Footer Bottom Tittle -->
                    <div class="footer-tittle-bottom">
                         <span>Special</span>
                        <p>Human Resources</p>
                    </div>
                </div>
           </div>
        </div>
    </div>
    <!-- footer-bottom area -->
    <div class="footer-bottom-area footer-bg">
        <div class="container">
            <div class="footer-border">
                 <div class="row d-flex justify-content-between align-items-center">
                     <div class="col-xl-10 col-lg-10 ">
                         <div class="footer-copy-right">
                             <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy; <b style="color: white;">THE JOB+</b> Corp. All Right Reserved
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                         </div>
                     </div>
                     
                 </div>
            </div>
        </div>
    </div>
    <!-- Footer End-->
</footer>

</body>
</html>
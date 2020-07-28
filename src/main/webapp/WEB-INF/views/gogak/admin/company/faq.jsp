<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" 
   href="<c:url value='/resources/js/jquery-ui.min.css'/>"> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   function pageProc(curPage) {
      $('input[name=currentPage]').val(curPage);
      $('form[name=frmPage]').submit();
   }
   $(function() {
      
      $("#accordion").accordion({
          heightStyle: "content"
      });
      
      $('input[type=submit]').click(function() {
         if($('#sb').val()==''){
            alert('검색어를 입력해 주세요.');
            $(this).focus();
            event.preventDefault();
         }else{
            var q = $('#sb').val();
            location.href = "<%=request.getContextPath()%>/project/fnqSerch.do?sb="+q;
         }
      });
      
   });
</script>
<style>
#firstSpan {
   color: red;
}

#secondSpan {
   color: navy;
}

#ddd { /* 답변 */
   background: sky-blue;
}

h3 {
}

#ui-id-1 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-2 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-3 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-4 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-5 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-6 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-7 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-8 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-9 {
   background: skyblue;
   border: 2px solid gray;
}
#ui-id-10 {
   background: skyblue;
   border: 2px solid gray;
}
#span{
   color: blue;
}

#aa{
   color: black;
   padding-left: 300px;
}

h2{
   padding-left: 300px;
}

div #accordion{
   padding-left: 300px;
   width: 1200px;
}


</style>

<div>
   <h2>THE JOB 고객센터 입니다.</h2>
   <div id="accordion">
      <c:if test="${empty list }">
         <h3>서버 </h3>
         <p>점검중 입니다.</p>
      </c:if>
      <c:if test="${!empty list }">
         <c:forEach var = "vo" items="${list }">
            <h3>${vo.category } &nbsp;&nbsp;&nbsp;<span id = "span">${vo.question }</span></h3>
            <div>
                <p> ${vo.answer }</p>
            </div>
         </c:forEach>
      </c:if>
   </div>
   <a href="<c:url value ='/gogak/faqWrite.do'/>" id = "aa">faq 쓰기</a>
   <a href="<c:url value ='/gogak/faqList.do'/>" id = "aa">faq 목록</a>
</div>




<%@ include file="../../../inc/bottom.jsp"%>
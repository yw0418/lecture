<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/auth.jsp"/>  
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 수강신청 페이지 -->
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
   $(document).ready(function() {
	  $("#create").on("click", function(){
		 $.ajax({
			data: {"signLectureNo" : $("input[name='signLectureNo']").val()},
			url: "${contextPath}/board/appLectureOne",
			type: "POST",
			success: function(data){
				alert("수강신청이 완료되었습니다.");
				window.location = '${contextPath}/board/myStudy';
			},
			error: function(){
				alert("error");
			}
		 });
	  });
	  
	  $("#del").on("click", function(){
		  $.ajax({
			  data: {"lectureNo" : $("input[name='signLectureNo']").val()},
			  url: "${contextPath}/board/delOne",
			  type: "POST",
		      success: function(data){
		    	  alert("삭제되었습니다!");
		    	  window.location = '${contextPath}/board/teacherList';
		      },
		      error: function(){
		    	  alert("error!");
		      }
		  });
	  });
	  
	  $("#back").on("click", function(){
		  
		window.location = '${contextPath}/board/appLecture';
	  });
	  
	$("#readForm").on("click", function(fileNo){
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value", fileNo);
		formObj.submit();
	});
	  
		
  }); 
  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2 style="text-align: center;">강의 상세보기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의 상세보기</div>
    <div class="panel-body">
       <form id="frm" method="post">
       <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
            <tr>
             <td style="width: 110px; vertical-align: middle;">제목</td>
             <td>${list.title}</td>
             <td style="width: 110px; vertical-align: middle;">현재인원</td>
             <td>${list.nowPeople}</td>
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">작성자</td>
             <td>${list.name}</td>
             <td style="width: 110px; vertical-align: middle;">모집인원</td>
             <td>${list.maxPeople}</td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">작성일자</td>
             <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.lectureDate}"/></td>
            </tr>
           <tr>
			<td style="width: 110px; vertical-align: middle;">내용
			<input type="hidden" name="signLectureNo" value="${list.lectureNo }">
			
			</td>
           </tr>
       </table> 
       </form>
	
		<form id = "readForm" name = "readForm">
        <div class="form-group" style="border: 1px solid #dbdbdb;">
        <input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
        <input type="hidden" name="lectureNo" value="${list.lectureNo }">
			<c:forEach var="file" items="${file}">
				<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE})<br>
			</c:forEach>
		</div> 
		</form>
		
       	<p>${list.content }</p>  
    </div>
    <div class="panel-footer">
    	<c:if test="${auth eq 'student' }">
    	<div style="text-align: center;">
    	<button id="create" class="btn btn-primary btn-sm">수강 신청하기</button>
    	<button id="back" class="btn btn-primary btn-sm">목록 돌아가기</button>
    	</div>
    	</c:if>
    	 <c:if test="${auth eq 'teacher' }">
    	 <div style="text-align: center;">
    	<button id="del" class="btn btn-primary btn-sm pull-center">삭제하기</button>
    	<button id="up" onclick="location.href='${contextPath}/board/updateStudy?lectureNo=${list.lectureNo }'" class="btn btn-primary btn-sm pull-center">수정하기</button>
    	</div>
    	</c:if>
    </div>
  </div>
</div>

</body>
</html>
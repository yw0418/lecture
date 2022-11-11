<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  	$(function (){
	    $("#create").on("click",function(){
	        //alert('hi');
			$.ajax({
	        	url : "${contextPath}/board/addForm",
	     	    type : "POST",
	    	    dataType : "json",
	    	    data: $('#frm').serialize(),
	            success: function(data){
	                location.href="board/appLecture";
	            },
	            error: function(){  alert("신규등록 error");
	        });
	    });
	}); 
  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2>수강신청</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의 상세보기</div>
    <div class="panel-body">
       <form id="frm" method="post">
       <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;"">
            <tr>
             <td style="width: 110px; vertical-align: middle;">제목</td>
             <td>${list.title}</td>
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">작성자</td>
             <td>${list.name}</td>
             <td style="width: 110px; vertical-align: middle;">작성일자</td>
             <td>${list.name}</td>
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">현재인원</td>
             <td>${list.nowPeople}</td>
             <td style="width: 110px; vertical-align: middle;">모집인원</td>
             <td>${list.maxPeople}</td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">작성일자</td>
             <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.lectureDate}"/></td>
            </tr>
           <tr>
			<td style="width: 110px; vertical-align: middle;">내용</td>
           </tr>
       </table> 
       </form>  
       	<p>${list.content }</p>  
    </div>
    <div class="panel-footer">
    	<button id="create" class="btn btn-primary btn-sm">수강신청하기</button>
    </div>
  </div>
</div>

</body>
</html>
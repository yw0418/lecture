<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  	$(document).ready(function(){
  		$("#passMessage").on("click", function(){
  			$("input[type=checkbox]:checked").each(function(){
  				//alert($(this).val());
  			});
  			
  			document.frm.submit(); // 전송
  		});
  	});
  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2>수강신청</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의목록</div>
    <div class="panel-body">
    <form name="frm" action="${contextPath}/user/join" method="post">
       <table class="table table-bordered table-hover">
          <tr>     	
          	<td text align='center'>선택</td>
          	<td text align='center'>제목</td>
            <td text align='center'>작성자</td>
            <td text align='center'>현재인원</td>
            <td text align='center'>모집인원</td>
          </tr>
		  <c:forEach var="list" items="${lectList}">
           <tr>
           	<td><input type="checkbox" value="${list.lectureNo }" /></td>
           	<td><a href="contentList?lectureNo=${list.lectureNo}">${list.title}</a></td>
			<td>${list.name}</td>
            <td>${list.nowPeople}</td>
            <td>${list.maxPeople}</td>
           </tr>
          </c:forEach>
       </table>    
       <input id="passMessage" type="button" class="btn btn-primary btn pull-center" value="수강신청하기"/>
      </form>
    </div>
    <div class="panel-footer">footer</div>
  </div>
</div>

</body>
</html>
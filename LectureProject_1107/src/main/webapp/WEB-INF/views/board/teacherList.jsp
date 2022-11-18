<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 교사의 등록강의 -->
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2>나의 등록강의(교사)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의목록</div>
    <div class="panel-body">
       <table class="table table-bordered table-hover">
          <tr>     	
          	<td text align='center'>제목</td>
            <td text align='center'>작성자</td>
            <td text align='center'>작성일자</td>
            <td text align='center'>현재인원</td>
            <td text align='center'>모집인원</td>
          </tr>
		  <c:forEach var="list" items="${list}">
           <tr>
           	<td><a href="contentList?lectureNo=${list.lectureNo}">${list.title}</a></td>
           	<td>${list.name}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.lectureDate}"/></td>
            <td>${list.nowPeople}</td>
            <td>${list.maxPeople}</td>
           </tr>
          </c:forEach>
       </table>   
    </div>
    <div class="panel-footer"><p>${member.id}님 환영 합니다.</p></div>
    
  </div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 가입요청 -->
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
  <h2>가입요청</h2>
  <div class="panel panel-default">
    <div class="panel-heading">가입요청</div>
    <div class="panel-body">
       <table class="table table-bordered table-hover">
          <tr>
            <td>번호</td>
            <td>이름</td>
            <td>아이디</td>
            <td>작성일</td>
            <td>조회수</td>
          </tr>

       </table>    
       <a href="boardForm.do" class="btn btn-primary btn-sm">승인</a>
    </div>
    <div class="panel-footer">footer</div>
  </div>
</div>

</body>
</html>
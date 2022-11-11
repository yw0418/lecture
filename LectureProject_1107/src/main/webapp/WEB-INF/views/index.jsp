<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){

  });  
  </script>
</head>
<body>
<div class="container">
<jsp:include page="common/header.jsp"/>      
  <div class="panel panel-default">
  	    	<c:if test="${id != null }">
			<div>
				<p>${id}님 환영 합니다.</p>
			</div>
			</c:if>
			<c:if test="${msg == false}">
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
    <div>
       <img src="${contextPath}/resources/images/640.jpg" style="width: 100%; height: 620px;"/>
    </div>
    <div class="panel-body">
		<ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		  <!--  
		  <li><a data-toggle="tab" href="#menu1">게시판</a></li>
		  <li><a data-toggle="tab" href="#menu2">공지사항</a></li>
		  -->
		</ul>		
		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active">
		    <h3>HOME</h3>
		    <p>학사관리 프로그램입니다.</p>
		  </div>
		  <!-- 
		  <div id="menu1" class="tab-pane fade">
		    <h3>게시판</h3>
		    <p>Some content in menu 1.</p>
		  </div>
		  <div id="menu2" class="tab-pane fade">
		    <h3>공지사항</h3>
		    <p>Some content in menu 2.</p>
		  </div>
		   -->
		</div>		
    </div>
    <div class="panel-footer">유예원 / https://github.com/yw0418/lecture</div>
  </div>
</div>
 
	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>   
	 
</body>
</html>
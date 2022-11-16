<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="auth.jsp"/>  
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    
      <ul class="nav navbar-nav">

      	<c:if test='${auth eq "student" }'>
      		<li><a href="${contextPath}/board/appLecture">수강신청</a></li>
      		<li><a href="${contextPath}/board/myStudy">나의 수강목록</a></li> 
     	</c:if>
        <c:if test='${auth eq "teacher" }'>
       		<li><a href="${contextPath}/board/addStudy">강의등록</a></li>
       		<li><a href="${contextPath}/board/teacherList">내 등록강의</a></li>
        </c:if>
        <c:if test='${auth eq "admin" || auth eq null }'>  
         	<li><a href="${contextPath}/board/appLecture">수강신청</a></li>
      		<li><a href="${contextPath}/user/adminList">학생/교사정보</a></li>         
       		<li><a href="${contextPath}/board/reqList">가입요청</a></li> 
      	</c:if>
      	        <c:if test='${auth eq null }'>  
         	<li><a href="${contextPath}/board/appLecture">수강신청</a></li>
      		<li><a href="${contextPath}/board/myStudy">나의 수강목록</a></li>
      		<li><a href="${contextPath}/board/addStudy">강의등록</a></li>
       		<li><a href="${contextPath}/board/teacherList">내 등록강의</a></li>
      		<li><a href="${contextPath}/user/adminList">학생/교사정보</a></li>         
       		<li><a href="${contextPath}/board/reqList">가입요청</a></li> 
      	</c:if>
      </ul>
	  <%if (session.getAttribute("id")==null){%>
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/user/loginForm"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	            <li><a href="${contextPath}/user/join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
	      </ul>
	  <%} %>
      <%if (session.getAttribute("id")!=null){%>
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/user/userUpdateForm"><span class="glyphicon glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
	            <li><a href="${contextPath}/user/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>            
	  <%} %>
	      </ul>

    </div>
  </div>
</nav>
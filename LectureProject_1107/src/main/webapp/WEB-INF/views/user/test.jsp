<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    function idCheck(){
        var id=$("#id").val();
        $.ajax({
     	   url : "${contextPath}/user/idCheck",
     	   type : "get",
     	   data : { "id" : id},
     	   success : function(result){
 				 //중복유무 출력(result="1" : 사용할수있는 아이디, "0" : 사용할수없는 아이디)
     		    if(result=="1"){
     			  $("#checkMessage").html("사용할 수 있는 아이디입니다.");
     			  $("#checkType").attr("class","modal-content panel-success");
     		   }else{
     			  $("#checkMessage").html("사용할 수 없는 아이디입니다."); 
     			  $("#checkType").attr("class","modal-content panel-warning");
     		   }
     		   $("#myModal").modal("show"); 
     	   },    	   
     	   error : function(){ alert("에러!!!!"); }    	   
        });    	
     } 
   

    function passwordCheck(){
    	var memPassword1=$("#password").val();
    	var memPassword2=$("#password2").val();
    	if(memPassword1 != memPassword2){
    		$("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
    	}else{
    		$("#passMessage").html("");
    	}   	
    }
    
    function goInsert(){
    	document.frm.submit(); // 전송
    }
  </script>
</head>
<body>
<div class="container">
  <jsp:include page="../common/header.jsp"/> 
  	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action='${contextPath}/user/joinForm' method='post' modelAttribute="vo">
						<div class="form-group">
							<form:label path="id">이름</form:label>
							<form:input path="id" class='form-control'/>
							<p>${errormsg}</p>
						</div>

						<div class="form-group">
							<div class="text-right">
								<form:button class='btn btn-primary'>정보수정</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>

</div>
</body>
</html>
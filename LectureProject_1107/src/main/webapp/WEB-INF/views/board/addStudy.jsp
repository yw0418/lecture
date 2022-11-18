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
	$(document).ready(function() {
		
		$("#goInsert").on("click", function(){
			
			alert("!!");
			
			$.ajax({
				data : {
					"title" : $("#title").val(),
					"content" : $("#content").val(),
					"maxPeople" : $("#maxPeople").val()
					},
				url : "${contextPath}/board/addStudy",
				type : "POST",
				dataType : "json",
				success : function(){
					alert("강의등록이 완료되었습니다.");
				},
			 	error : function(){
			 		alert("error");
			 	}
			});
		});
	});
  
  </script>
</head>
<body>
<div class="container">
  <jsp:include page="../common/header.jsp"/> 
  <h2>강의등록</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의등록</div>
    <div class="panel-body">
      <form name="frm">
        <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">이름</td>
             <td><input type="hidden" id="name" name="name" value="${name}"/>${name}</td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">강의명</td>
             <td colspan="2"><input id="title" name="title" class="form-control" type="text" maxlength="20" placeholder="강의명을 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">정원</td>
             <td colspan="10"><input id="maxPeople" name="maxPeople" class="form-control" type="text" maxlength="20" placeholder="정원을 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">강의내용</td>
             <td colspan="10"><input id="content" name="content" class="form-control" type="text" maxlength="300" placeholder="강의 소개글을 입력하세요."/></td>            
           </tr>
            <tr>
             <td colspan="3" style="text-align: center;">
                <input type="button" class="btn btn-primary pull-center" value="강의 등록하기" id="goInsert"/>
             </td>             
           </tr>
         </table>
      </form>    
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
    <div class="panel-footer"></div>
  </div>
</div>
</body>
</html>
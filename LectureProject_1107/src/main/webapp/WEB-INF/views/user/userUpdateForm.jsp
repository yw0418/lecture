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
  var code = "";      //이메일전송 인증번호 저장위한 코드
  
  function authCheck(){
  	   var inputCode = $("#mailcheck").val();        // 입력코드    
  	    var checkResult = $("#mailMessage");    // 비교 결과     
  	    
  	    if(inputCode != code){                          
  	        checkResult.html("인증번호가 일치하지않습니다.");
  	    }
  	    else{
  	    	checkResult.html("");
      	}   
   }
 
  /* 인증번호 이메일 전송 */
	function mailCheck(){
		var email = $("#mail").val();		
		var checkBox = $("#checkBox");
		
		alert("메일이 전송되었습니다.");
	    $.ajax({
          type:"GET",
	        url:"${contextPath}/user/mailCheck?email=" + email,
	        success:function(data){
	            //console.log("data : " + data);
	            code = data;
	           }
	    });
  }
   
  function goInsert(){
  	var name=$("#name").val();
  	var phone=$("#phone").val();
  	var mail=$("#mail").val();
  	var mailcheck=$("#mailcheck").val();
  	
  	if(name=="" || phone=="" || mail=="" || mailcheck ==""){
  		alert("모두 입력해주세요.");
  		return false;
  	}else if(mailcheck != code){
  		alert("인증번호가 일치하지 않습니다.");
  		return false;
  	}
  	
  	document.frm.submit(); // 전송
  }
  </script>
</head>
<body>
<div class="container">
  <jsp:include page="../common/header.jsp"/> 
  <h2>회원정보 수정</h2>
  <div class="panel panel-default">
    <div class="panel-heading">회원정보수정</div>
    <div class="panel-body">
      <form name="frm" action="${contextPath}/user/userUpdate" method="post">
        <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td><input type="hidden" id="id" name="id" value="${list.id}"/>${list.id}</td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">이름</td>
             <td colspan="2"><input id="name" name="name" class="form-control" type="text" maxlength="20" value="${list.name}" placeholder="이름을 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">전화번호</td>
             <td colspan="2"><input id="phone" name="phone" class="form-control" type="text" maxlength="11" placeholder="전화번호를 입력하세요." value="${list.phone }"/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">이메일</td>
             <td><input id="mail" name="mail" class="form-control" type="text" maxlength="40" placeholder="이메일을 입력하세요." value="${list.mail }"/></td>   
             <td style="width: 110px;"><button type="button" class="btn btn-primary btn-sm" onclick="mailCheck()">인증요청</button></td>    
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">인증번호</td>
              <td colspan="2"><input id="mailcheck" class="form-control" onkeyup="authCheck()" type="text" maxlength="11" placeholder="인증번호를 입력하세요."/></td>           
           </tr>
           <tr>
           <td></td>
           <td colspan="2"><span id="mailMessage" style="color: red"></span></td>
           </tr>
            <tr>
             <td colspan="3" style="text-align: center;">
                <input type="button" class="btn btn-primary pull-center" value="수정" onclick="goInsert()"/>
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
    <div class="panel-footer">footer</div>
  </div>
</div>
</body>
</html>
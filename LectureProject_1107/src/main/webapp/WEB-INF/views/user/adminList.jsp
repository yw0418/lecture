<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 전체가입자 정보 페이지 -->
  <title>Bootstrap Example</title>
    <style>
		html,body {
		  font-family: Helvetica, Arial, sans-serif;
		  margin: 0;
		}
		.panel-faq-container {
		  margin-bottom: -16px
		}
		.panel-faq-title {
		  font-weight: bold;
		  color: #9A2EFE;
		  cursor: pointer;
		}
		.panel-faq-answer {
		  height: 0;
		  overflow: hidden;
		  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
		  왜? 닫기 버튼을 누를 때 변화가 티남 */
		  transition: all 1s;
		}
		#btn-all-close {
		  margin-bottom: 10px;
		  background-color: #726996;
		  border: none;
		  color: #fff;
		  cursor: pointer;
		  padding: 10px 25px;
		  float: right;
		}
		#btn-all-close:hover {
		  background-color: yellow;
		  color: #000;
		  transition: all 0.35s;
		}
		.active {
		  display: block;
		  /* 높이를 정해줘야지만 transition이 적용됨 */
		  height: 300px;
		}
		    }
  </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  window.onload = function(){
	  // panel-faq-container
	  var panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  var panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // btn-all-close
	  var btnAllClose = document.querySelector("#btn-all-close");
	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}
  </script>
  
</head>
<body>


<div class="container">
<jsp:include page="../common/header.jsp"/> 	
    <h3 style="text-align: center; padding-top: 50px;">
   		 회원정보
    </h3>
    <button id="btn-all-close">모두 닫기</button>
    <br>
    <table class="table table-bordered table-striped table-dark table-hover">
      <thead class="thead-light text-center">
        <tr>
          <th style="text-align: center;">권한</th>
          <th style="text-align: center;">이름</th>
          <th style="text-align: center;">가입일</th>
        </tr>
      </thead>
      <tbody class="text-center">
        
        <c:forEach var="list" items="${userList}">
        <tr>
          <td>${list.SUBNM}</td>
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title" style="text-align: center;">${list.NAME}</p>
              <div class="panel-faq-answer">
                <p>아이디 : ${list.ID}</p>
                <p>메일 : ${list.MAIL}</p>
              </div>
            </div>
          </td>
          <td>${list.REGDTM}</td>
        </tr>
        </c:forEach>
               
<!--         <tr class="bg-info">
          <td colspan=4 class="text-left">자주 묻는 질문 총 합계</td>
        </tr> -->
      </tbody>
    </table>
  </div>
</body>
</html>
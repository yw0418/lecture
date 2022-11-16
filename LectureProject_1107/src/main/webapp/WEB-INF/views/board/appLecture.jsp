<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {
			if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});
		
		  /* $("input[type='button']").click(function() {
			    // 체크한 항목을 담을 배열 선언
			    var arr = [];
			    // 체크한 항목만 취득
			    var color = $("input[name='chk']:checked");
			    $(color).each(function() {
			    	arr.push($(this).val());
			    });

				$("input[name='arrLectureNo']").val(arr);
				
			    document.frm.submit();
		  }); */
		  
		  $("#addLecture").on("click", function(e){
			 e.preventDefault();
		    var arr = [];
		    var arrCheckedLecture = $("input[name='chk']:checked");
		    $(arrCheckedLecture).each(function() {
		    	arr.push($(this).val());
		    });
		    
		    alert(arr);
			 
			 $.ajax({
				data: {
					"signUserNo" : $("input[name='signUserNo']").val(),
					"arr" : arr
				},
				url: "${contextPath}/board/appLecture",
				type: "POST",
				dataType: "json",
				success: function(data){
					alert("success : " + data.a);
				},
				error: function(){
					alert("error");
				}
			 });
		  });
	});
		


	//document.frm.submit(); // 전송
  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2>수강신청</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의목록</div>
    <div class="panel-body">
    <form name="frm" action="#">
       <table class="table table-bordered table-hover">
          <tr>     	
          	<td text align='center'><input type="checkbox" id="cbx_chkAll" /></td>
          	<td text align='center'>제목</td>
            <td text align='center'>작성자</td>
            <td text align='center'>현재인원</td>
            <td text align='center'>모집인원</td>
            <td text align='center'>신청</td>
          </tr>
		  <c:forEach var="list" items="${lectList}">
           <tr>
           	<td text align='center'>
           		<input type="checkbox" name="chk" value="${list.lectureNo }" />
           		<input type="hidden" id="signLectureNo" name="signLectureNo" value="${list.lectureNo }"/>
           		<input type="hidden" id="signUserNo" name="signUserNo" value="${loginId.userNo }"/>
           		<input type="hidden" name="arrLectureNo" />
           	</td>
           	<td><a href="contentList?lectureNo=${list.lectureNo}">${list.title}</a></td>
			<td>${list.name}</td>
            <td>${list.nowPeople}</td>
            <td>${list.maxPeople}</td>
            <td text align='center'><input id="passMessage" type="button" class="btn btn-primary btn-sm" value="신청"/></td>
           </tr>
          </c:forEach>
       </table>    
       <input id="addLecture" type="button" class="btn btn-primary btn pull-center" value="수강신청하기"/>
      </form>
    </div>
    <div class="panel-footer">footer</div>
  </div>
</div>

</body>
</html>
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
    <style>
  .find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}
	</style>
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
		
		  $("#aprv").on("click", function(e){
			 e.preventDefault();
		    var arr = [];
		    var arrCheckedLecture = $("input[name='chk']:checked");
		    $(arrCheckedLecture).each(function() {
		    	arr.push($(this).val());
		    });
		    
			 
			 $.ajax({
				data: {
					"arr" : arr
				},
				url: "${contextPath}/board/reqList",
				type: "POST",
				dataType: "json",
				success: function(data){
					alert("승인되었습니다.");
					window.location = '${contextPath}/board/reqList';
				},
				error: function(){
					alert("error");
				}
			 });
		  });
		  
		  $("#refuse").on("click", function(e){
				 e.preventDefault();
			    var arr = [];
			    var arrCheckedLecture = $("input[name='chk']:checked");
			    $(arrCheckedLecture).each(function() {
			    	arr.push($(this).val());
			    });
			    
				 
				 $.ajax({
					data: {
						"arr" : arr
					},
					url: "${contextPath}/board/refuse",
					type: "POST",
					dataType: "json",
					success: function(data){
						alert("반려되었습니다.");
						window.location = '${contextPath}/board/reqList';
					},
					error: function(){
						alert("error");
					}
				 });
			  });
	});
  
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="reqList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2 style="text-align: center;">사용자정보</h2>
  <div class="panel panel-default">
    <div class="panel-heading">가입요청</div>
    <div class="panel-body">

    <form name="frm" action="#">
       <table class="table table-bordered table-hover">
          <tr>     	
          	<td text align='center'><input type="checkbox" id="cbx_chkAll" /></td>
          	<td text align='center'>이름</td>
            <td text align='center'>아이디</td>
            <td text align='center'>권한</td>
            <td text align='center'>전화번호</td>
            <td text align='center'>이메일</td>
            <td text align='center'>승인여부</td>
          </tr>
		  <c:forEach var="list" items="${userlist}">
           <tr>
           	<td text align='center'>
           		<input type="checkbox" name="chk" value="${list.USERNO }" />
           	</td>
           	<td style="text-align: center;">${list.NAME}</td>
			<td style="text-align: center;">${list.ID}</td>
            <td style="text-align: center;">${list.SUBNM}</td>
            <td style="text-align: center;">${list.PHONE}</td>
            <td style="text-align: center;">${list.MAIL}</td>
            <td style="text-align: center;">${list.APRVNM}</td>
           </tr>
          </c:forEach>	
       </table>
       
       	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="reqList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="reqList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="reqList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
       <br>
      <div class="find-btn">
      <input id="aprv" type="button" class="btn btn-primary btn pull-center find-btn1"  value="승인하기"/>
      <input id="refuse" type="button" class="btn btn-primary btn pull-center find-btn1" value="반려하기"/>
      </div>
      </form>
    </div>

  </div>
</div>

</body>
</html>
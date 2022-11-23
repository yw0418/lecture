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
	
	li {list-style: none; float: left; padding: 6px;}
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
  
  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2 style="text-align: center;">사용자정보</h2>
  <div class="panel panel-default">
    <div class="panel-heading">가입요청</div>
    <div class="panel-body">

    <form name="frm" action="#" method="get" role="form">
    
   <div class="search">
    <select name="searchType">
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>이름</option>
      <option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>아이디</option>
    </select>
    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
   </div>
   <br>
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
        <c:choose>
            <c:when test="${list.APRVNM eq '대기' }"> 
				<input type="checkbox" name="chk" value="${list.USERNO }" />
            </c:when>
            <c:otherwise>
                <input type="checkbox" name="chk" value="${list.USERNO }" disabled/>
            </c:otherwise>
        </c:choose>
           		
           	</td>
           	<td style="text-align: center;">${list.NAME}</td>
			<td style="text-align: center;">${list.ID}</td>
            <td style="text-align: center;">${list.AUTHNM}</td>
            <td style="text-align: center;">${list.PHONE}</td>
            <td style="text-align: center;">${list.MAIL}</td>
            <td style="text-align: center;">${list.APRVNM}</td>
           </tr>
          </c:forEach>	
       </table>
       
       	<div style="display: block; text-align: center;">		
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="reqList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="reqList${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="reqList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
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
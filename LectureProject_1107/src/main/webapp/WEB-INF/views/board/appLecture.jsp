<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../common/auth.jsp"/> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 수강신청 페이지 -->
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <style>
  .find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}

	li {list-style: none; float: left; padding: 6px;}
	</style>
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
		
		  $("#addLecture").on("click", function(e){
			 e.preventDefault();
		    var arr = [];
		    var arrCheckedLecture = $("input[name='chk']:checked");
		    $(arrCheckedLecture).each(function() {
		    	arr.push($(this).val());
		    });
		    
			 
			 $.ajax({
				data: {
					"signUserNo" : $("input[name='signUserNo']").val(),
					"arr" : arr
				},
				url: "${contextPath}/board/appLecture",
				type: "POST",
				dataType: "json",
				success: function(data){
					
					alert("수강신청이 완료되었습니다.");
					window.location = '${contextPath}/board/myStudy';
				},
				error: function(){
					alert("error");
				}
			 });
		  });
	});
	
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="boardList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
    $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   

  </script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/> 
  <h2 style="text-align: center;">수강신청</h2>
  <div class="panel panel-default">
    <div class="panel-heading">강의목록</div>
    <div class="panel-body">

    <form name="frm" action="#" role="form" method="get">
    <div class="search">
    <select name="searchType">
      <option value="t"<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>교사명</option>
      <option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    </div>
    <br>
       <table class="table table-bordered table-hover">
          <tr>     	
          	<td text align='center'><input type="checkbox" id="cbx_chkAll" /></td>
          	<td text align='center'>제목</td>
            <td text align='center'>교사명</td>
            <td text align='center'>현재인원</td>
            <td text align='center'>모집인원</td>
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
			<td style="text-align: center;">${list.name}</td>
            <td style="text-align: center;">${list.nowPeople}</td>
            <td style="text-align: center;">${list.maxPeople}</td>
           </tr>
          </c:forEach>	
       </table>
       <div class="find-btn">    
       <c:if test="${auth eq 'student' }">
       <input id="addLecture" type="button" class="btn btn-primary btn pull-center find-btn1" value="수강신청하기"/>
       </c:if>
       </div>
      </form>
    </div>
    <!-- <div class="panel-footer"></div> -->
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="appLecture${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="appLecture${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="appLecture${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>

  </div>
</div>

</body>
</html>
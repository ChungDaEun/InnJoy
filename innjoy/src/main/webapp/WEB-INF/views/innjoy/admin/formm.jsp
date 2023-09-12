<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$$(document).ready(function(){

	});
</script>
</head>

<body>

<div class="container">
	
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="ijuser" items="${ijList}">
									<tr>
										<td>${ijuser.user_id}</td>
										<td>${ijuser.user_id}</td>
										<td>${ijuser.user_id}</td>
									</tr>
		</c:forEach>
    </tbody>
	</table>    
    
</div>
</body>
</html>
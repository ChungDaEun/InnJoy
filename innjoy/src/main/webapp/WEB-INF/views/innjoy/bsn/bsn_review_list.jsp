<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@include file="../header/buser_header.jsp"%> 
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
   value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
</script>

<link rel="stylesheet" href="${path}/assets/css/bsn_regi.css">
</head>
<body>
<c:set var="bsn_id" value="${sessionScope.bsn_id}" />
<div class="bsn_regi_form">

   <div class="bsn_header_title">

      <h2> 후기 관리 </h2>
   </div>
</div>
<div id="board-list" style="padding-top:30px;">
	<div class="container">
	    <table class="board-table">
	        <thead>
	        <tr>
	            <th scope="col" class="th-num">숙소번호</th>
	            <th scope="col" class="th-title">숙소명</th>
	            <th scope="col" class="th-loc">위치</th>
	            <th scope="col" class="th-moveLink"></th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach var="bsn" items="${bsnuser}">
	        <tr>
	            <td>${bsn.product.pro_id}</td>
	            <th><a>${bsn.product.pro_name}</a></th>
	            <td>${bsn.product.pro_loc }</td>
	            <td style="cursor:pointer;" 
	            onclick="detail(${bsn.product.pro_id})">후기관리이동</td>
	        </tr>
	        </c:forEach>
	        </tbody>
	    </table>
	</div>
</div>
<%@ include file="../header/footer.jsp" %>  
<script>
function detail(pro_id) {
	location.href = "${path}/prdReviewList?pro_id=" + pro_id
}
</script>
</body>
</html>
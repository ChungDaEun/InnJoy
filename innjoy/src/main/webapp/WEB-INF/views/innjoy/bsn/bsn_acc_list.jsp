<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="../header/buser_header.jsp" %>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
   value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${path}/assets/css/bsn_regi.css">
<style>
.bsn_image-container {
   width: 300px;
   height: 300px;
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 20px 0;
   box-sizing: border-box;
   overflow: hidden;
 }

 .bsn_image-container img {
   width: auto;
   height: 300px;
 }
</style>
</head>
<body>
<c:set var="bsn_id" value="${sessionScope.bsn_id}" />
<div class="bsn_regi_form">
   <div class="bsn_header_title">
      <h2> 숙소 등록 현황 </h2>
   </div>
</div>
<div id="productContainer">
    <c:forEach var="bsn" items="${bsnuser}" varStatus="loopStatus">
        <c:if test="${loopStatus.index % 3 == 0}">
            <div class="bsn_regi_row">
        </c:if>
        
        <div class="bsn_regi_columm">
            <div class="bsn_image-container">
                <img onclick="detail(${bsn.product.pro_id})"
                	src="${path}/assets/img/bsn/${bsn.pro_img.pfname}" alt="숙소 이미지"
                	style="border-radius:10px; cursor:pointer;">
            </div>
            <span onclick="detail(${bsn.product.pro_id})"
            		style="font-weight:bold; font-size:1.3rem;
            				cursor:pointer; padding-top:10px;">${bsn.product.pro_name}</span>
            <span>${bsn.product.pro_loc}</span>
        </div>
        
        <c:if test="${loopStatus.index % 3 == 2 || loopStatus.last}">
            </div>
        </c:if>
    </c:forEach>

<script type="text/javascript">
function detail(pro_id) {
	//if(confirm("상세화면이동")){
	location.href = "${path}/roomList?pro_id=" + pro_id
	//}
}


var productDivs = document.querySelectorAll('.bsn_regi_columm');
var productContainer = document.getElementById('productContainer');
var productGroup = null;

for (var i = 0; i < productDivs.length; i++) {
    if (i % 3 === 0) {
        productGroup = document.createElement('div');
        productGroup.className = 'bsn_regi_row';
        productContainer.appendChild(productGroup);
    }
    
    productGroup.appendChild(productDivs[i]);
}
</script>

<%@ include file="../header/footer.jsp" %>  
</body>
</html>
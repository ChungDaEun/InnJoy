<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div class="bsn_regi_form">
   <div class="bsn_header_title">
   <a href="javascript:window.history.back();">
		<img src="${path}/assets/img/bsn/backbutton.svg"
		style="width:30px; height:30px;">	
	</a>
      <h2> 숙소 등록 세부 정보 </h2>
   </div>
</div>
   <div class="bsn_regi_columm">
   <label for="pro_id"></label> 
	<input name="pro_id" type="hidden"
	value="${bsnprdInfo.pro_id}" id="pro_id" required>
   <div class="bsn_align_center">
      <img src="${path}/assets/img/bsn/${bsnprdInfo.pfname}"
      style="width:800px; height:300px; border-radius:10px;" alt="숙소 이미지">
   </div>
      <span style="padding-left:100px; font-size:1.5rem; font-weight:bold;">${bsnprdInfo.pro_name}</span>
      <span style="padding-left:100px; color:#0152cc;">${bsnprdInfo.pro_loc}</span>
      <span style="padding-left:100px; cursor:pointer;"
      onclick="moveReview(${bsnprdInfo.pro_id})">후기관리로 이동》</span>
   </div>
   <div id="roomContainer">
   <c:forEach var="room" items="${roomList}" varStatus="loopStatus">
   <c:if test="${loopStatus.index % 3 == 0}">
            <div class="bsn_regi_row">
        </c:if>
   <div class="bsn_regi_columm">
		<img onclick="detail(${room.room_id})" style="width:300px;
			height:300px; cursor:pointer; padding-bottom:10px;
			border-radius:10px;"
		src="${path}/assets/img/bsn/${room.rfname}" alt="객실 이미지">
		<span>객실명 : ${room.room_name}</span>
		<span>인원 : ${room.min_cnt }(기준인원)/${room.max_cnt }(최대인원)</span>
		<span>객실 가격 : <fmt:formatNumber value="${room.room_price}" type="number"
			pattern="###,###원" /></span>
		<span onclick="detail(${room.room_id})"
		style="cursor:pointer; font-weight: bold; padding-top:10px;">객실정보 상세보기</span>
	</div>
	<c:if test="${loopStatus.index % 3 == 2 || loopStatus.last}">
            </div>
        </c:if>
   </c:forEach>
<script type="text/javascript">
function detail(room_id) {
	location.href = "${path}/roomDetail?room_id=" + room_id 
}
function moveReview(pro_id){
	location.href = "${path}/prdReviewList?pro_id=" + pro_id
}

var roomDivs = document.querySelectorAll('.bsn_regi_columm');
var roomContainer = document.getElementById('roomContainer');
var roomGroup = null;

for (var i = 0; i < productDivs.length; i++) {
    if (i % 3 === 0) {
        roomGroup = document.createElement('div');
        roomGroup.className = 'bsn_regi_row';
        roomContainer.appendChild(roomGroup);
    }
    
    roomGroup.appendChild(roomDivs[i]);
}
</script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>

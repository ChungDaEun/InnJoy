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

<script>
$(document).ready(function() {
   $(".deleteReplyBtn").on("click", function() {
      var roomId = $(this).data("room-id");
      console.log("roomId:", roomId); 
      console.log("Type of roomId:", typeof roomId); 
      
      if (confirm("객실을 정말로 삭제 하시겠습니까?")) {
         deleteReply(roomId);
      }
   });

   function deleteReply(roomId) {
      console.log("Deleting reply with roomId:", roomId); // Log the deletion process
      $.ajax({
         type: "delete",
         url: "${path}/deleteRoom?room_id=" + roomId,
         dataType: "number",
         success: function(result) {
            console.log("Delete success. Result:", result); // Log the success and result
            if (result === "success") {
               alert("삭제가 완료되었습니다.");
               history.back();
            }
         },
         error: function(result) {
            console.log("Delete error. Result:", result); // Log the error and result
            alert("삭제가 완료되었습니다.");
            history.back();
            location.reload();
         }
         
      });
   }
});
</script>
<style type="text/css">
.warningButton{
		width:100px;
		height:30px;
		padding:5px;
		font-weight: bold;
		border-radius:5px;
		font-size: 15px;
		background-color:#8B0000;
		color:aliceblue;
	}
</style>
<link rel="stylesheet" href="${path}/assets/css/bsn_regi.css">
</head>
<body>

<div class="bsn_regi_form">


   <div class="bsn_header_title">
   <div class="bsn_left_align">
	<a href="javascript:window.history.back();">
		<img src="${path}/assets/img/bsn/backbutton.svg"
		style="width:30px; height:30px;">	
	</a>
   </div>
      <h2> 객실 세부 정보 </h2>
   </div>
   
</div>
	<label for="room_id"></label> 
		<input name="room_id" type="hidden"
		value="${roomDetail.room_id}" id="room_id" required>
   <div class="bsn_regi_columm">
   <div class="bsn_align_center">
      <img style="width:800px; height:300px;"
		src="${path}/assets/img/bsn/room/${roomDetail.rfname}" alt="객실 이미지">
   </div>
      <span style="padding-left:100px;">객실명 : ${roomDetail.room_name }</span>
      <div class="bsn_regi_columm">
	      <span style="padding-left:100px;">객실가격 : 
	      	<fmt:formatNumber value="${roomDetail.room_price}" type="number" pattern="###,###원" /></span>
	      <span style="padding-left:100px;">침대구성 : ${roomDetail.bed_cnt }</span>
	      <span style="padding-left:100px;">객실구조</span>
	      <span style="padding-left:100px;">흡연유무 : ${roomDetail.smoking }</span>
	      <span style="padding-left:100px;">${roomDetail.min_cnt }(기준인원)/${roomDetail.max_cnt }(최대인원)</span>
	      <span style="padding-left:100px;">체크인시간 : ${roomDetail.checkin }</span>
	      <span style="padding-left:100px;">체크아웃시간 : ${roomDetail.checkout }</span>
      </div>
      <div class="bsn_regi_row" style="justify-content: flex-start; margin-top:10px;padding-left:100px;">
	<p>
   <button class="warningButton deleteReplyBtn" data-room-id="${roomDetail.room_id}" data-pro-id="${bsnuser.pro_id}">삭제하기</button>
	</p>
	
	</div>
   </div>
   
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
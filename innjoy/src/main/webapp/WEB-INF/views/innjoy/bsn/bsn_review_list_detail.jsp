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

<script type="text/javascript">
</script>

<link rel="stylesheet" href="${path}/assets/css/bsn_regi.css">
<style>
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.4);
    }
    
    .bsn_modal-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 2px solid #B0CC69;
        width: 500px;
        max-height: 70%; /* 최대 높이 지정 */
        overflow-x: hidden; /* 가로 스크롤 숨김 */
        overflow-y: auto; /* 세로 스크롤만 표시 */
    }
    
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    .bsn_regi_row > div {
        width: 300px; /* 각 컨텐츠의 너비 조정 */
    }
    .warningButton{
		width:100px;
		height:50px;
		padding:10px;
		font-weight: bold;
		border-radius:5px;
		font-size: 18px;
		background-color:#8B0000;
		color:aliceblue;
	}
    .resetButton{
		width:100px;
		height:50px;
		padding:10px;
		font-weight: bold;
		border-radius:5px;
		font-size: 18px;
	}
	.nextBtn{
		width:100px;
		height:50px;
		padding:10px;
		font-weight: bold;
		border-radius:5px;
		font-size: 18px;
	}
</style>
</head>
<body>
<div class="bsn_regi_form">

   <div class="bsn_header_title">
      <a href="javascript:window.history.back();">
		<img src="${path}/assets/img/bsn/backbutton.svg"
		style="width:30px; height:30px;">	
	</a>
      <h2> 후기 관리 </h2>
   </div>
</div>
   <div class="bsn_regi_columm">
   <div class="bsn_align_center">
      <img src="${path}/assets/img/bsn/${bsnprdInfo.pfname}"
      	style="width:800px; height:300px; border-radius:10px;"
		alt="숙소 이미지">
   </div>
      <span style="padding-left:100px;font-size:1.5rem; font-weight:bold;">${bsnprdInfo.pro_name }</span>
    <input type="hidden" id="pro_id" value="${bsnprdInfo.pro_id }">
      <span style="padding-left:100px;color:#0152cc;">${bsnprdInfo.pro_loc }</span>
      <span style="padding-left:100px; cursor:pointer;"
      onclick="moveProdInfo(${bsnprdInfo.pro_id})">숙소상세정보로 이동》</span>
   </div>
   <c:forEach var="brm" items="${prdReviewList}">
   <div class="bsn_regi_columm" style="border-bottom:1px solid rgb(230, 230, 230);">
   	<div class="bsn_regi_row" style="overflow-x: auto;">
	<c:if test="${not empty brm.fname}">
   <img src="${path}/assets/img/bsn/${brm.fname}" style="border-radius:10px; width:300px; height:300px; margin-right:10px;">
</c:if>
	</div>
		<div style="border:none; margin-bottom:10px; margin-top:10px;">
		<span>${brm.user_id} |  
		<fmt:formatDate value="${brm.rev_time }" 
    		pattern="yyyy년 MM월 dd일 HH:mm:ss" />
		</span>
		</div>
		<div class="bsn_regi_textareaStyle" style="border:none; border-radius: 0.4rem;
    background-color: rgba(230, 230, 230, 0.5);
    padding: 2rem;
		margin-bottom:30px;" readonly>${brm.review_det }</div>
	<div class="bsn_regi_columm" style="border-radius: 0.4rem;
    background-color: rgba(176, 204, 105, 0.5);
    padding: 2rem;">
    	<input type="hidden" value="${brm.review_id }"/>
    	<input type="hidden" value="${brm.rv_com_id }" id="rv_com_id"/>
    	<div class="bsn_regi_columm" style="padding:0px;">
    	<div class="bsn_regi_row" style="margin-bottom:10px; box-sizing: border-box;">
    		<span style="font-weight:bold; font-size:1.3rem;">숙소답변&nbsp;&nbsp;</span>
    		<span>
    		<fmt:formatDate value="${brm.rv_com_time }" 
    		pattern="yyyy년 MM월 dd일 HH:mm:ss" />
    		</span>
    	</div>
    	<div>
    		${brm.rv_com_det }
    	</div>
    	</div>
	</div>
	<div class="bsn_regi_row" style="justify-content: flex-start; margin-top:10px;">
	<p>
	<button class="nextBtn" id="nextBtn"
    data-fname="${brm.fname}"
    data-userid="${brm.user_id}"
    data-revtime="${brm.rev_time}"
    data-reviewdet="${brm.review_det}"
    data-reviewid="${brm.review_id}"
    onclick="openModal(this)"
    style="margin-right:20px;">답글달기</button>
	</p>
	<p>
   <c:if test="${brm.rv_com_id != 0}">
   <button class="warningButton deleteReplyBtn" data-rv-com-id="${brm.rv_com_id}">삭제하기</button>
   </c:if>
</p>
	
	</div>
	</div>
	</c:forEach>
<!-- 모달 창 -->
<form method="post" 
action="${path}/insertBsnReview"
enctype="multipart/form-data" 
class="validation-form" novalidate>
<input type="hidden" name="pro_id" value="${param.pro_id }">
<div id="myModal" class="modal">
    <div class="bsn_modal-content">
    <div style="display:flex; justify-content: flex-end;">
    	<span class="close" onclick="closeModal()">&times;</span>
    </div>
    <div class="bsn_regi_columm">
		<div class="bsn_regi_row">
		<input type="hidden" id="modalUserId"/>
		<input type="hidden" id="modalRevTime" /> 
		<input type="hidden" id="modalReviewId"/>
		<input type="hidden" name="review_id" id="review_id" value="">
		</div>
		<textarea class="bsn_regi_textareaStyle" style="width:400px; border:1px solid black; min-height: 100px;"
			placeholder="답글 입력" name="rv_com_det" id="rv_com_det" value="${param.rv_com_det}"></textarea>
		<div class="bsn_regi_columm" id="bsn_resetBtn">
			<div class="bsn_regi_row" style="justify-content: flex-start">
			<p>
			<button class="nextBtn" id="nextBtn"
				style="margin-right:20px;" type="submit">등록하기</button>
			</p>
			<p>
			<button class="resetButton" id="resetButton" onclick="closeModal()" type="button">취소</button>
			</p>
			</div>
		</div>
	</div>
    </div>
</div>
</form>
<script>
$(document).ready(function() {
   $(".deleteReplyBtn").on("click", function() {
      var rvComId = $(this).data("rv-com-id");
      //console.log("rvComId:", rvComId); 
      //console.log("Type of rvComId:", typeof rvComId); 
      
      if (confirm("삭제 하시겠습니까?")) {
         deleteReply(rvComId);
      }
   });

   function deleteReply(rvComId) {
      console.log("Deleting reply with rvComId:", rvComId); // Log the deletion process
      $.ajax({
         type: "delete",
         url: "${path}/deleteBsnReview?rv_com_id=" + rvComId,
         dataType: "text",
         success: function(result) {
            console.log("Delete success. Result:", result); // Log the success and result
            if (result === "success") {
               alert("삭제가 완료되었습니다.");
               location.reload();
            }
         },
         error: function(result) {
            //console.log("Delete error. Result:", result); // Log the error and result
            alert("답글 삭제가 완료되었습니다.");
        	 location.reload();
         }
      });
   }
});

function moveProdInfo(pro_id){
	location.href = "${path}/roomList?pro_id=" + pro_id
}

$(document).ready(function() {
	var pro_id = "${param.pro_id}"
	
	console.log(parseInt($("#pro_id").text()));
	console.log("parseInt($('#pro_id').text()) 타입 : "+typeof parseInt($("#pro_id").text()));
	console.log("$('#pro_id').text() 타입 : "+typeof $("#pro_id").text());

    var pro_id = parseInt(pro_id);
    console.log(pro_id);
    console.log(typeof pro_id);
    var msg = "${msg}";

    if (!isNaN(pro_id)) {
        // pro_id가 유효한 숫자인 경우
        if (msg.indexOf("등록") !== -1) {
            if (confirm(msg + "\n 조회화면으로 이동 하시겠습니까?")) {
                location.href = "${path}/prdReviewList?pro_id=" + pro_id;
            }
        }
    } else {
        // pro_id가 유효한 숫자가 아닌 경우에 대한 처리
        console.error("pro_id 값이 유효하지 않습니다.");
        console.error(pro_id);
        // 혹은 다른 처리를 추가할 수 있습니다.
    }
});

function openModal(button) {
    var user_id = button.getAttribute("data-userid");
    var rev_time = button.getAttribute("data-revtime");
    var review_det = button.getAttribute("data-reviewdet");
    var review_id = button.getAttribute("data-reviewid");
    
    document.getElementById("myModal").style.display = "block";
    
    document.getElementById("modalUserId").textContent = user_id;
    //document.getElementById("modalFname").src = "${path}/assets/" + fname; // 이미지 경로 설정
    document.getElementById("modalRevTime").textContent = rev_time;
    //document.getElementById("modalReviewDet").textContent = review_det;
    document.getElementById("modalReviewId").textContent = review_id;
    document.getElementById("review_id").value = review_id;
    document.getElementById("pro_id").value = pro_id;
}

// 모달 닫기 함수
function closeModal() {
    document.getElementById("myModal").style.display = "none";
}

</script>
<%@include file="../header/footer.jsp"%>
</body>
</html>
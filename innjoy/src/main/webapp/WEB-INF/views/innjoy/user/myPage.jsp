<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="meta description">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sbudeobyvn&submodules=geocoder"></script>

<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
   rel="stylesheet">

<link rel="stylesheet" href="${path}/assets/css/vendor.css">
<link rel="stylesheet" href="${path}/assets/css/style.css">
<style type="text/css">
input[type=radio] {
   display: none;
}

input[type=radio]+label {
   display: inline-block;
   cursor: pointer;
   height: 50px;
   width: 130px;
   border: 1px solid #869c51;
   line-height: 50px;
   text-align: center;
   font-weight: bold;
   font-size: 13px;
}

input[type=radio]+label {
   background-color: #fff;
   color: #869c51;
}

input[type=radio]:checked+label {
   background-color: #869c51;
   color: #fff;
}

#joinBox input, #joinBox button, #profile_info {
   font-size: 10pt;
}

#joinBox button {
   background-color: #869c51;
   color: #fff;
}

#title_join {
   margin-bottom: 150px;
   font-size: 20pt;
}

.joinForm {
   padding-top: 20px;
}
#textArea{
   height: 10rem;
   resize: none;
}
#detail {
   height: 17rem;
   resize: none;
}
</style>

<%@include file="../header/user_header.jsp"%>
</head>

<body>
<script type="text/javascript">
   $(document).ready(function(){
      $("#reviewBtn").hide()
      $("#recommBtn").hide()
   })
   
      // 리뷰 작성 여부 확인
      function checkReview(resId){
         console.log("resId: " + resId)
         $.ajax({
               type: "POST",
               url: "/check/review",
               data: "resId="+resId,
               dataType: "text",
               success: function (rs) {
                  var button = document.getElementById('reviewBtn');
                  console.log(rs) 
                  if(rs == "true"){
                     button.disabled = true;
                  }else{
                     button.disabled = false;
                  }
               },
               error: function (err) {
                 console.log(err);
                 alert("error: 관리자에게 문의해주세요.");
               }
             })
      }
   
   
</script>
   <div class="container">

      <!-- Outer Row -->
      <div class="row justify-content-center">

         <div class="col-xl-8 col-lg-12 col-md-9 col-mt-10" id="joinBox">
            <div class="card o-hidden border-0 shadow-lg my-5">
               <div class="card-body p-0">
                  <!-- Nested Row within Card Body -->
                  <div class="row">
                     <div class="col-lg-6 d-none d-lg-block" style="diplay: flex;">
                        <img src="${path}/upload/짱구.jpg" style="width: 100%;" />
                     </div>
                     <div class="col-lg-6">
                        <div class="p-4">
                           <div class="text-center"></div>
                           <h5>나의 정보</h5>
                           <br>
                           <p id="profile_info">아이디 : ${userInfo.userId}</p>
                           <p id="profile_info">이름 : ${userInfo.userName}</p>
                           <p id="profile_info">닉네임 : ${userInfo.nName}</p>
                           <p id="profile_info">전화번호 : ${userInfo.userPhone}</p>
                           <p id="profile_info">이메일 : ${userInfo.email}</p>
                           <br>
                           <button type="button" class="float-left "
                              data-bs-toggle="modal" data-bs-target="#uptModal">정보수정</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <nav>
            <div class="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
               <a class="nav-item nav-link active" id="nav-res-tab"
                  data-toggle="tab" href="#nav-res" role="tab"
                  aria-controls="nav-res" aria-selected="true">예약내역</a> <a
                  class="nav-item nav-link" id="nav-wish-tab" data-toggle="tab"
                  href="#nav-wish" role="tab" aria-controls="nav-wish"
                  aria-selected="false">❤️찜</a> <a class="nav-link"
                  href="myboardlist" aria-controls="nav-contact"
                  aria-selected="false">활동내역</a>
            </div>
         </nav>
         <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-res" role="tabpanel"
               aria-labelledby="nav-wish-tab">
               <div class="card-deck">
                  <div class="container px-4 px-lg-5 mt-5">
                     <div
                        class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach var="reservation" items="${rlist}">
                           <div class="col mb-5">
                              <div class="card h-100">
                                 <!-- Product image-->
                                 <img class="card-img-top"
                                    src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg"
                                    alt="..." />
                                 <!-- Product details-->
                                 <div class="card-body p-4">
                                    <div class="text-center">
                                       <!-- Product name-->
                                       <h5 class="fw-bolder">${reservation.room.product.proName}</h5>
                                       <h6 class="fw-bolder">${reservation.room.roomName}</h6>
                                       <!-- Product price-->
                                       ${reservation.startDt} ~ ${reservation.endDt}
                                    </div>
                                 </div>
                                 <!-- Product actions-->
                                 <div class="card-footer p-2 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                       <a class="btn btn-outline-dark mt-auto" onclick="viewDetail(${reservation.reservationId})"
                                          data-bs-toggle="modal" data-bs-target="#reservationInfo">예약정보</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
            <div class="tab-pane fade" id="nav-wish" role="tabpanel"
               aria-labelledby="nav-res-tab">
               <div class="card-deck">
                  <div class="container px-4 px-lg-5 mt-5">
                     <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        
                        <c:forEach items="${wishProList}" var="pro">
                        <div class="col mb-5">
                           <div class="card h-100">
                              <!-- Product image-->
                              <img class="card-img-top"
                                 src="${path}/assets/img/bsn/${pro.pro_img.pfname}"
                                 alt="..." />
                              <!-- Product details-->
                              <div class="card-body p-4">
                                 <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${pro.product.pro_name}</h5>
                                    <!-- Product loc-->
                                    ${pro.product.pro_loc}
                                 </div>
                              </div>
                              <!-- Product actions-->
                              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                 <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto"
                                       href="${path}/product_detail?pro_id=${pro.product.pro_id}&start_dt=&end_dt=&user_cnt=">View Details</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        </c:forEach>

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- <div class="d-flex justify-content-around mb-3 pt-3">
         <span>예약 내역</span>
         <span>❤️찜</span>
         <span>활동 내역</span>
      </div> -->
      <hr>
   </div>
   <script type="text/javascript">
      // 유효성
      function modify_check() {
         var userName = $("#userName").val()
         var nName = $("#nName").val()
         var userId = $("#userId").val()
         var userPass = $("#userPass").val()
         var repass = $("#repass").val()
         var email = $("#email").val()
         var userPhone = $("#userPhone").val()

         if (userName == "") {
            $("#ck_userName").text("이름을 입력하세요.")
            $("#userName").focus()
         } else if (nName == "") {
            $("#ck_nName").text("닉네임을 입력하세요.")
            $("#nName").focus()
         } else if (userPass == "") {
            $("#ck_userPass").text("비밀번호를 입력하세요.")
            $("#userPass").focus()
         } else if (userPass != repass) {
            $("#ck_rePass").text("비밀번호가 일치하지 않습니다.")
            $("#repass").val("").focus()
         } else if (email == "") {
            // 이메일 유효성 검사
            $("#email").focus()
         } else if (userPhone == "") {
            // 전화번호 유효성 검사
            $("#userPhone").focus()
         } else {
            modify();
            console.log("수정 함수 실행")
         }
      }

      // 회원 정보 수정
      function modify() {
         var userData = {
            userId : $("#userId").val(),
            userName : $("#userName").val(),
            nName : $("#nName").val(),
            userPass : $("#userPass").val(),
            email : $("#email").val(),
            userPhone : $("#userPhone").val(),
         }; // 폼 데이터를 배열 형태로 직렬화
         $.ajax({
            type : "put",
            url : "/sec/try/update",
            data : JSON.stringify(userData), // 직렬화된 데이터를 JSON 문자열로 변환
            contentType : "application/json; charset=utf-8", // JSON
            success : function(rs) {
               alert("개인정보 수정 성공")
               location.href = "/sec/mypage";
            },
            error : function(err) {
               console.log(err)
            }

         })
      }
   </script>
   <!-- 수정하기 modal  -->
   <div class="modal fade" id="uptModal" tabindex="-1"
      aria-labelledby="uptModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">나의 정보 수정</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="container">
                  <!-- Outer Row -->
                  <div class="row justify-content-center">
                     <div class="col-xl-12 col-lg-12 col-md-9" id="joinBox">
                        <div class="card o-hidden border-0 my-5">
                           <div class="card-body p-0">
                              <div class="pl-5 pr-5">
                                 <form class="modifForm">
                                    <input type="hidden" name="userId" id="userId"
                                       value="${userInfo.userId}">
                                    <div class="form-group">
                                       <label>이름</label> <input type="text"
                                          class="form-control form-control-user"
                                          value="${userInfo.userName}" id="userName" name="userName"
                                          readonly>
                                    </div>
                                    <div class="form-group">
                                       <label>닉네임</label> <input type="text"
                                          class="form-control form-control-user" id="nName"
                                          value="${userInfo.nName}" name="nName"
                                          placeholder="닉네임을 입력하세요."> <small id="ck_nName"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>비밀번호</label> <input type="password"
                                          class="form-control form-control-user" id="userPass"
                                          name="userPass"
                                          placeholder="비밀번호를 입력해주세요. (특수문자를 포함한 8~10자)"> <small
                                          id="ck_userPass"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>비밀번호 재입력</label> <input type="password"
                                          class="form-control form-control-user" id="repass"
                                          placeholder="비밀번호 재입력"> <small id="ck_rePass"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>이메일</label> <input type="text"
                                          class="form-control form-control-user" id="email"
                                          name="email" value=" ${userInfo.email}"> <small
                                          id="ck_userEmail"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>전화번호</label> <input type="text"
                                          class="form-control form-control-user" id="userPhone"
                                          name="userPhone" value=" ${userInfo.userPhone}">
                                       <button type="button" class="float-right" id="idCheck">인증</button>
                                       <small id="ck_userPhone"></small>
                                    </div>
                                    <div class="form-group"></div>
                                    <button type="button" onclick="modify_check()"
                                       class="btn btn-outline-success btn-block mt-5" id="modBtn">수정하기</button>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
       function viewDetail(resId){
         console.log(resId);
         var id = resId;
         $.ajax({
            type : "post",
            url : "/read/resDetail",
            data : "resId="+id,
            dataType : "text",
            success : function(rs) {
               checkReview(id);
               console.log(rs);
               // 문자열로 받은 json 데이터 -> json 형태로 parse
               var rsJson = JSON.parse(rs);   
               var resDate = rsJson.startDt +" ~ "+rsJson.endDt
               $("#proName").val(rsJson.proName);
               $("#proName2").val(rsJson.proName);
               $("#proName3").text(rsJson.proName);
               $("#reservationId").val(rsJson.reservationId);
               $("#reservationId2").val(rsJson.reservationId);
               $("#roomId").val(rsJson.roomId);
               $("#roomName").val(rsJson.roomName);
               $("#roomName2").val(rsJson.roomName);
               $("#resDate").val(resDate);
               $("#resDate2").val(resDate);
               $("#resName").val(rsJson.userName);
               $("#resPhone").val(rsJson.userPhone);
               $("#payment").val(rsJson.payment+"원");
               if(rsJson.status == 0) {
                  $("#status").val("예약문의");
               }else if(rsJson.status == 1){
                  $("#status").val("예약확정");
               }else if(rsJson.status == 2){
                  $("#status").val("취소된 예약입니다.");
               }else if(rsJson.status == 3){
                  $("#status").val("사업자측에서 취소한 예약입니다.");
               }else if(rsJson.status == 4){
                  $("#status").val("이용완료");
                  $("#reviewBtn").show()
                  $("#recommBtn").show()
               }
            },
            error : function(err) {
               console.log(err)
            }

         })
      }
   </script>
   <!--  예약 상세 modal -->
   <div class="modal fade" id="reservationInfo" tabindex="-1"
      aria-labelledby="findIdModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">예약 정보</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="container">
                  <!-- Outer Row -->
                  <div class="row justify-content-center">
                     <div class="col-xl-12 col-lg-12 col-md-9" id="joinBox">
                        <div class="card o-hidden border-0 my-5">
                           <div class="card-body p-0">
                              <div class="pl-5 pr-5">
                                 <div class="form-group">
                                    <label>숙소명</label> <input type="text"
                                       class="form-control form-control-user" id="proName"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>객실명</label> <input type="text"
                                       class="form-control form-control-user" id="roomName"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>예약일자</label> <input type="text"
                                       class="form-control form-control-user" id="resDate"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>예약자명</label> <input type="text"
                                       class="form-control form-control-user" id="resName"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>예약자 연락처</label> <input type="text"
                                       class="form-control form-control-user" id="resPhone"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>예약상태</label> <input type="text"
                                       class="form-control form-control-user" id="status"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>결제금액</label> <input type="text"
                                       class="form-control form-control-user" id="payment"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                                          data-bs-toggle="modal" data-bs-target="#reviewModal" id="reviewBtn">후기 작성</button>
               <button type="button" class="btn btn-secondary"
                                          data-bs-toggle="modal" data-bs-target="#recommModal" id="recommBtn">게시물 작성</button>
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
               
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      // 리뷰 작성
      function wirteReview(){
          var formData = new FormData($('#reviewFrm')[0]);
          $.ajax({
            type: "POST",
            url: "/try/write/review",
            data: formData,
            processData: false,
            contentType: false,
            success: function (rs) {
              // 서버에서 반환한 응답을 처리
              if (rs == "Y") {
                alert("후기 작성이 완료되었습니다.");
                location.href = "/sec/mypage";
              } else {
                alert("작성 실패");
              }
            },
            error: function (err) {
              console.log(err);
              alert("error: 관리자에게 문의해주세요.");
            }
          })
      }
   </script>
   <!--  후기 작성 modal -->
   <div class="modal fade" id="reviewModal" tabindex="-1"
      aria-labelledby="reviewFormModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">후기 작성하기</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="container">
                  <!-- Outer Row -->
                  <div class="row justify-content-center">
                     <div class="col-xl-12 col-lg-12 col-md-9" id="joinBox">
                        <div class="card o-hidden border-0 my-5">
                           <div class="card-body p-0">
                              <div class="pl-5 pr-5">
                                 <form method="post" enctype="multipart/form-data" id="reviewFrm">
                                 <input type="hidden" id="reservationId" name="reservationId" value=""/>
                                 <input type="hidden" id="roomId" name="roomId" value=""/>
                                 <div class="form-group">
                                    <label>숙소명</label> <input type="text"
                                       class="form-control form-control-user" id="proName2"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>객실명</label> <input type="text"
                                       class="form-control form-control-user" id="roomName2"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                    <label>예약일자</label> <input type="text"
                                       class="form-control form-control-user" id="resDate2"
                                       value="" readonly>
                                 </div>
                                 <div class="form-group">
                                 <label>평점</label>
                                    <select class="form-select" aria-label="Default select example" name="star">
                                      <option selected>선택</option>
                                      <option value="5">5</option>
                                      <option value="4">4</option>
                                      <option value="3">3</option>
                                      <option value="2">2</option>
                                      <option value="1">1</option>
                                    </select>
                                 </div>
                                 <div class="form-group">
                                    <label>후기 내용</label>
                                    <textarea class="form-control form-control-user"  id="textArea" name="reviewDet"></textarea>
                                 </div>
                                 <div class="form-group">
                                    <label>사진첨부</label>
                                    <input type="file" class="form-control form-control-user" id="img" name="report" multiple="multiple">
                                 </div>
                                 <div class="form-group"></div>
                                 <button type="button" onclick="wirteReview()"
                                       class="btn btn-outline-success btn-block mt-5" id="modBtn">후기 작성</button>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
   <!--  게시물 작성 modal -->
   <div class="modal fade" id="recommModal" tabindex="-1"
      aria-labelledby="reviewFormModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-xl">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">추천 게시물 작성하기</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="container">
      <!-- Outer Row -->
      <div class="row justify-content-center">

         <div class="col-xl-12 col-lg-12 col-lg-9 col-mt-10" id="boardForm">
            <div class="card o-hidden border-0 shadow-sm my-5">
               <div class="card-body p-4 justify-content-center">
                  <form method="post" enctype="multipart/form-data" id="RecommFrm">
                     <input type="hidden" id="reservationId2" name="reservationId" value="" />
                     <div class="form-group">
                        <div
                           class="card o-hidden m-3 border-0 shadow-sm my-5 rounded-pill">
                           <div class="ml-5 mt-4 mb-3">
                              <h3 class="justify-content-center" id="proName3">숙소명</h3>
                           </div>
                        </div>
                     </div>
                     <div class="form-group p-0 d-flex justify-content-center">
                        <div>
                           <label>유형</label>
                           <select class="form-select" aria-label="Default select example" name="recommType">
                              <option selected>선택</option>
                              <option value="맛집">맛집</option>
                              <option value="관광명소">관광명소</option>
                              <option value="사진명소">사진명소</option>
                           </select>
                        </div>
                        <div class="pl-2 pr-5 w-75">
                           <label>제목</label> <input type="text"
                              class="form-control form-control-user" id="title" name="title"
                              value="" placeholder="제목을 입력하세요.">
                        </div>
                     </div>

                     <div class="pl-5 ml-1 d-flex w-50 justify-content-center">
                        <input type="text" class="form-control form-control-user w-75"
                           id="search" placeholder="위치를 입력하세요."> 
                        <input type="button" class="btn btn-outline-success ml-3"
                           id="searchBtn" value="검색">
                     </div>
                     <div class="pt-2 pb-2 ml-3 d-flex w-50 justify-content-center">
                        <input type="text" class="form-control form-control-user w-75" id="address" value="" readonly/>
                     </div>
                     <div class="pl-5 pr-5 pb-5 pt-2 d-flex justify-content-center">
                        <br>
                        <div id="map" style="width: 50%; height: 400px;"></div>
                        <div class="d-block">
                           <input type="hidden" id="recomLoc" name="recomLoc" value="" />
                           <input type="hidden" id="latitude" name="latitude" value="" />
                           <input type="hidden" id="longitude" name="longitude" value="" />
                        </div>

                        <div class="pl-5 pr-5">

                           <input type="hidden" id="reservationId" name="reservationId"
                              value="" /> <input type="hidden" id="roomId" name="roomId"
                              value="" />

                           <div class="form-group">
                              <label>게시물 내용</label>
                              <textarea class="form-control form-control-user" id="detail"
                                 name="detail"></textarea>
                           </div>
                           <div class="form-group">
                              <label>사진첨부</label> <input type="file"
                                 class="form-control form-control-user" id="img" name="report"
                                 multiple="multiple">
                           </div>
                           <div class="form-group"></div>
                           <button type="button" onclick="wirteRecomm()"
                              class="btn btn-outline-success btn-block mt-5" id="modBtn">게시물 작성</button>
                        </div>
                        <script type="text/javascript">
                           //지도를 그려주는 함수 실행
                           selectMapList();

                           //검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
                           function searchAddressToCoordinate(search) {
                              naver.maps.Service.geocode({
                                             query : search
                              },
                              function(status, response) {
                                 if (status === naver.maps.Service.Status.ERROR) {
                                    return alert('Something Wrong!');
                                 }
                                 if (response.v2.meta.totalCount === 0) {
                                    return alert('올바른 주소를 입력해주세요.');
                                 }
                                 var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(item.x,item.y);
                                 if (item.roadAddress) {
                                    htmlAddresses.push('[도로명 주소] '+ item.roadAddress);
                                 }
                                 if (item.jibunAddress) {
                                    htmlAddresses.push('[지번 주소] '+ item.jibunAddress);
                                 }
                                 if (item.englishAddress) {
                                    htmlAddresses.push('[영문명 주소] '+ item.englishAddress);
                                 }
                                 insertAddress(
                                    item.roadAddress,item.x,item.y);
                              });
                           }
                           // 주소 검색
                           $('#address').on('keydown',function(e) {
                              var keyCode = e.which;
                              if (keyCode === 13) { // Enter Key
                                 searchAddressToCoordinate($('#search').val());
                              }
                           });
                           $('#searchBtn').on('click',function(e) {
                              e.preventDefault();
                              searchAddressToCoordinate($('#search').val());
                           });
                           naver.maps.Event.once(map, 'init_stylemap', initGeocoder);

                           //검색된 정보를 input box에 할당하고, 지도에 핀 찍는 함수
                           function insertAddress(address, latitude,longitude) {
                              $('#address').val(address);
                              $('#recomLoc').val(address);
                              $('#latitude').val(latitude);
                              $('#longitude').val(longitude);

                              var map = new naver.maps.Map('map', {
                                 center : new naver.maps.LatLng(
                                       longitude, latitude),
                                 zoom : 14
                              });
                              var marker = new naver.maps.Marker({
                                 map : map,
                                 position : new naver.maps.LatLng(
                                       longitude, latitude),
                              });
                           }

                           //지도를 그려주는 함수
                           function selectMapList() {

                              var map = new naver.maps.Map('map', {
                                 center : new naver.maps.LatLng(
                                       37.3595704, 127.105399),
                                 zoom : 10
                              });
                           }

                           // 지도를 이동하게 해주는 함수
                           function moveMap(len, lat) {
                              var mapOptions = {
                                 center : new naver.maps.LatLng(len,
                                       lat),
                                 zoom : 15,
                                 mapTypeControl : true
                              };
                              var map = new naver.maps.Map('map',
                                    mapOptions);
                              var marker = new naver.maps.Marker({
                                 position : new naver.maps.LatLng(
                                       len, lat),
                                 map : map
                              });
                           }
                           function wirteRecomm(){
                               var formData = new FormData($('#RecommFrm')[0]);
                               $.ajax({
                                 type: "POST",
                                 url: "/try/write/recomm",
                                 data: formData,
                                 processData: false,
                                 contentType: false,
                                 success: function (rs) {
                                   // 서버에서 반환한 응답을 처리
                                   if (rs == "Y") {
                                     alert("게시물 작성이 완료되었습니다.");
                                     location.href = "/sec/mypage";
                                   } else {
                                     alert("작성 실패");
                                   }
                                 },
                                 error: function (err) {
                                   console.log(err);
                                   alert("error: 관리자에게 문의해주세요.");
                                 }
                               })
                           }
                        </script>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="../header/footer.jsp"%>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>숙소 상세 페이지</title>
<!-- jQuery 라이브러리 임포트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css"
   href="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css}" />
<script type="text/javascript"
   src="@{https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js}"></script>
<script type="text/javascript"
   src="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js}"></script>

<link rel="stylesheet" href="${path}/assets/css/product_detail.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.a {
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   text-align: center;
   width: 70%;
   margin: 50px auto; /* Center align the container */
   padding: 0 20px; /* Add 20px padding on both sides */
}

body {
   color: #566787;
   background: #f5f5f5;
   font-family: "Varela Round", sans-serif;
}

.form-control:focus {
   border-color: #B0CC69;
   box-shadow: 0 0 8px #beace3;
}

.contact-modal {
   width: 600px;
   padding: 50px;
   margin: 30px auto;
}

.contact-modal h4 {
   font-size: 26px;
   display: inline-block;
}

.contact-modal .form-control, .contact-modal .btn {
   min-height: 38px;
   border-radius: 10px;
   outline: none;
}

.contact-modal .btn-primary {
   min-width: 100px;
   background: #B0CC69;
   border: none;
}

.contact-modal .btn-primary:hover {
   background: #88a738;
}

.contact-modal .btn-primary:focus {
   box-shadow: 0 0 8px rgba(132, 100, 202, 0.6);
}

.contact-modal .btn-link {
   color: #B0CC69;
   border-radius: 10px;
}

.contact-modal label {
   opacity: 0.9;
   font-weight: normal;
   font-size: 95%;
}

.contact-modal textarea {
   resize: vertical;
}

.contact-modal.modal-dialog {
   width: 480px;
}

.contact-modal .modal-header {
   padding: 20px 35px 14px;
}

.contact-modal .modal-content {
   border-radius: 1px;
}

.contact-modal .close {
   position: absolute;
   right: 35px;
   top: 25px;
}

.contact-modal .modal-body {
   padding: 20px 35px 35px;
}

.hint-text {
   opacity: 0.8;
}

.trigger-btn {
   display: inline-block;
   margin: 100px auto;
   border-radius: 10px;
}

#report-type {
   padding: 7px;
   border: 2px solid green;
   border-radius: 10px;
   width: 100%;
   font-size: 16px;
}

#report-type option {
   padding: 7px;
   border-radius: 10px;
}
</style>
<script type="text/javascript">
    function enterChatRoomAndRedirect(se_user, re_user, ceo_name, pro_id) {
        $.ajax({
            url: "${path}/enterChatRoom",
            type: "POST",
            data: { se_user: se_user, re_user: re_user },
            success: function(response) {
                var room_id = parseInt(response);
                var url = "${path}/moveChating3?se_user=" + se_user + "&re_user=" + re_user + "&room_id=" + room_id + "&ceo_name=" + ceo_name+ "&pro_id=" + pro_id;
                window.location.href = url;
            },
            error: function(xhr, status, error) {
                console.log("Error entering chat room:");
                console.log("Status:", status);
                console.log("Error:", error);
                console.log("Response Text:", xhr.responseText);
            }
        });
    }
</script>
</head>
<body>
   <%@include file="../header/user_header.jsp"%>
   <div class="a">
      <div class="container1">



         <div class="slider-container1">
            <div class="slider">
               <img
                  src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg"
                  alt="숙소 이미지 1"> <img
                  src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/06/30/5efaee66a9fdb.jpg"
                  alt="숙소 이미지 2"> <img
                  src="https://image.goodchoice.kr/resize_490x348/affiliate/2023/06/21/11/68f9e4f1694a45948b2d4b8140a02328.jpg"
                  alt="숙소 이미지 3">
            </div>
            <button class="arrow left">&#8249;</button>
            <button class="arrow right">&#8250;</button>
         </div>

         <div class="description1">
            <div class="d-flex justify-content-between">
               <div class="mb-3">

                  <span class="product-availability" name="pro_type">${prhd[0].pro_type}</span>

               </div>

               <div class="message-popup d-flex align-items-center">
                  <span class="message-popup-icon1">
                     <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M1.5 4.25V16.25H4.5V20.0703L5.71875 19.0859L9.25781 16.25H16.5V4.25H1.5ZM3 5.75H15V14.75H8.74219L8.53125 14.9141L6 16.9297V14.75H3V5.75ZM18 7.25V8.75H21V17.75H18V19.9297L15.2578 17.75H9.63281L7.75781 19.25H14.7422L19.5 23.0703V19.25H22.5V7.25H18Z" fill="black"/>
                     </svg>
                  </span>
                  <span class="message-popup-text ms-2" onclick="enterChatRoomAndRedirect('${sessionScope.userId}', '${bsn_id}', '${ceo_name}', '${pro_id}')">
                      Message
                  </span>
                  <a href="${addToWishlistUrl}">
                     <button id="wishlist-button" class="heart-button ${wishlistState}">
                        <p id="heart-icon" style="font-size:30px; margin-bottom:0px;">
                           <c:choose>
                              <c:when test="${wishlistState == 'empty'}">&#129293;</c:when>
                              <c:otherwise>&#10084;</c:otherwise>
                           </c:choose>
                        </p>
                        <span class="heart-text">&nbsp;찜하기</span>
                     </button>
                  </a>
                  
                  <script>
                     var wishlistButton = document.getElementById('wishlist-button');
                     var toggleWishlistUrl = `/toggle_wishlist?pro_id=${param.pro_id}`;
                     var heartIcon = document.getElementById('heart-icon'); // Get the heart icon element
                  
                     wishlistButton.addEventListener('click', function () {
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET', toggleWishlistUrl, true);
                  
                        xhr.onreadystatechange = function () {
                           if (xhr.readyState === 4 && xhr.status === 200) {
                              var data = JSON.parse(xhr.responseText);
                              if (data.exists) {
                                 wishlistButton.classList.add('active');
                                 wishlistButton.classList.remove('empty');
                                 heartIcon.innerHTML = "&#10084;"; // Set heart icon to filled
                              } else {
                                 wishlistButton.classList.add('empty');
                                 wishlistButton.classList.remove('active');
                                 heartIcon.innerHTML = "&#129293;"; // Set heart icon to outline
                              }
                           }
                        };
                  
                        xhr.send();
                     });
                  </script>
               </div>
            </div>


            <div class="description_name" name="pro_name">${prhd[0].pro_name}</h1>

               <div class="product-rating d-flex align-items-center mb-3">
                  <span class="star-rating"> <svg width="16" height="15"
                        viewBox="0 0 16 15" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
        <path
                           d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z"
                           fill="#FFAE00" />
        </svg> <svg width="16" height="15" viewBox="0 0 16 15" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
        <path
                           d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z"
                           fill="#FFAE00" />
        </svg> <svg width="16" height="15" viewBox="0 0 16 15" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
        <path
                           d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z"
                           fill="#FFAE00" />
        </svg> <svg width="16" height="15" viewBox="0 0 16 15" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
        <path
                           d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z"
                           fill="#FFAE00" />
        </svg> <svg width="16" height="15" viewBox="0 0 16 15" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
        <path
                           d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z"
                           fill="#B2B2B2" />
        </svg>
                  </span> <span class="rating-count ms-2">(22)</span>
               </div>
               <p class="s_content" name="ser_conts">${prhd[0].ser_conts}</p>
            </div>


            <div class="info">
               <div class="css-11sbcds">
                  <div class="css-1ju036a">
                     <h2 class="css-3todla">인기시설 및 서비스</h2>
                  </div>
                  <section class="css-1u38mgg">
                     <ul class="css-17yp1q4">
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c313ce9fecc4.22775147.png"
                              alt="스파/월풀/욕조 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">
                              스파/월풀<br>/욕조
                           </div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31409836037.64820304.png"
                              alt="주차가능 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">주차가능</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c30fb58581a7.11803213.png"
                              alt="조식운영 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">조식운영</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311e5e615d3.11619749.png"
                              alt="수영장 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">수영장</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311543917c0.43365861.png"
                              alt="야외수영장 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">야외수영장</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3138a5e2ea4.38579968.png"
                              alt="와이파이 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">와이파이</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3130bbecc55.51674550.png"
                              alt="사우나 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">사우나</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3144caafc60.78284341.png"
                              alt="클럽라운지 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">클럽라운지</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312d25b7881.48044241.png"
                              alt="흡연구역 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">흡연구역</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312ab2a3a54.21397941.png"
                              alt="객실금연 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">객실금연</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31181bebd23.39062499.png"
                              alt="레스토랑 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">레스토랑</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311e9670a08.27489301.png"
                              alt="바 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">바</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3109dda4352.22209168.png"
                              alt="연회장 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">연회장</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31127b01603.92499001.png"
                              alt="피트니스 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">피트니스</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311ae467a30.99886411.png"
                              alt="뷔페 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">뷔페</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c310d3afaa03.83388501.png"
                              alt="어메니티 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">어메니티</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31036778734.93239827.png"
                              alt="24시간
               데스크 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">
                              24시간<br>데스크
                           </div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3125bc08791.41470069.png"
                              alt="유료세탁 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">유료세탁</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312167373b2.34805205.png"
                              alt="커피숍 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">커피숍</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c310fa539846.88150499.png"
                              alt="비즈니스 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">비즈니스</div>
                        </div>
                        <div class="css-t9n8kv">
                           <img width="43" height="31"
                              src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3107116d3e8.32646858.png"
                              alt="수화물보관 아이콘" class="css-19xh2rn">
                           <div class="css-9cehu5">수하물보관</div>
                        </div>
                     </ul>
                  </section>
               </div>
            </div>

            <article class="article">
               <div class="grid__item--1of1 text-center">
                  <div class="tabs">
                     <input type="radio" name="tabs" id="tab1" checked> <label
                        for="tab1"> <i class="icon1 email-cal"></i><span>숙소
                           상세</span>
                     </label> <input type="radio" name="tabs" id="tab2"> <label
                        for="tab2"> <i class="icon1 snapshot"></i><span>위치</span>
                     </label> <input type="radio" name="tabs" id="tab3"> <label
                        for="tab3"> <i class="icon1 inbox-apps"></i><span>후기</span>
                     </label> <input type="radio" name="tabs" id="tab4"> <label
                        for="tab4"> <i class="icon1 log-calls"></i><span>WeJoy</span>
                     </label>


                     <hr class="divider">

                     <div id="tab__content--1" class="tab__content">

                     <div class="container2">
                           <div id="booking" class="section">
                               <div class="section-center">
                                   <div class="row">
                                       <div class="booking-form">
                                           <form action="product_detail" method="get" name="regForm">
                                               <input type="hidden" name="pro_id" value="${param.pro_id}">
                                               <div class="row no-margin">
                                                   <div class="col-md-2">
                                                       <div class="form-group">
                                                           <span class="form-label">Check In</span>
                                                           <input id="start_dt" class="form-control" type="date" name="start_dt">
                                                       </div>
                                                   </div>
                                                   <div class="col-md-2">
                                                       <div class="form-group">
                                                           <span class="form-label">Check out</span>
                                                           <input id="end_dt" class="form-control" type="date" name="end_dt">
                                                       </div>
                                                   </div>
                                                   <div class="col-md-2">
                                                       <div class="form-group">
                                                           <span class="form-label">Guests</span>
                                                           <input class="form-control" id="guestsSelect" name="user_cnt" type="number" placeholder="인원수 입력">
                                                       </div>
                                                   </div>
                                                   <div class="col-md-2">
                                                       <div class="form-btn">
                                                           <button class="submit-btn" id="selectButton">선택</button>
                                                       </div>
                                                   </div>
                                               </div>
                                           </form>
                                           <!-- 객실 목록 출력 -->
                                           <div class="room-list" id="roomListContainer">
                                                 <c:if test="${proDetail.size()==0}">
                                                     <h4 name="room_name">검색결과가 없습니다</h4>
                                               </c:if>
                                               <c:forEach var="room" items="${proDetail}">
                                                   <div class="room-item">
                                                       <div class="room-image-container">
                                                           <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="Room 1">
                                                        
                                                       </div>
                                                       <div class="room-info">
                                                           <h3 name="room_name">${room.room_name}</h3>
                                                           <p>최소 인원: ${room.min_cnt}명</p>
                                                           <p>최대 인원: ${room.max_cnt}명</p>
                                                          <button class="select-room-btn" onclick="gopage(${room.room_id})">객실 선택</button>
                                                         
                                                       </div>
                                                   </div>
                                               </c:forEach>
                                               <script>
                                               $(document).ready(function() {
                                                 const startDtInput = $("#start_dt");
                                                 const endDtInput = $("#end_dt");
                                                 const guestsSelect = $("#guestsSelect");
                                             
                                                 // 현재 날짜 계산
                                                 const currentDate = new Date();
                                                 const currentDateString = currentDate.toISOString().split('T')[0];
                                             
                                                 // 체크인 날짜 최소값 설정
                                                 startDtInput.attr("min", currentDateString);
                                             
                                                 // 체크인 날짜 변경 시 이전 날짜 선택 방지
                                                 startDtInput.on("change", function() {
                                                   const selectedDate = new Date(this.value);
                                                   if (selectedDate <= currentDate) {
                                                     this.value = currentDateString;
                                                     alert("체크인 날짜를 선택해주세요");
                                                   }
                                                   const nextDay = new Date(selectedDate);
                                                   nextDay.setDate(nextDay.getDate() + 1);
                                                   const nextDayString = nextDay.toISOString().split('T')[0];
                                                   endDtInput.attr("min", nextDayString);
                                                   if (new Date(endDtInput.val()) < nextDay) {
                                                     endDtInput.val(nextDayString);
                                                   }
                                                 });
                                             
                                                 // 체크아웃 날짜 변경 시 체크인 날짜 최대값 설정
                                                 endDtInput.on("change", function() {
                                                   const selectedDate = new Date(this.value);
                                                   if (selectedDate <= new Date(startDtInput.val())) {
                                                     const nextDay = new Date(selectedDate);
                                                     nextDay.setDate(nextDay.getDate() + 1);
                                                     const nextDayString = nextDay.toISOString().split('T')[0];
                                                     startDtInput.val(nextDayString);
                                                     alert("체크아웃 날짜를 선택해주세요");
                                                   }
                                                 });
                                             
                                                 // "선택" 버튼 클릭 시 체크인/체크아웃 날짜 및 인원 확인
                                                 $("#selectButton").click(function(event) {
                                                   event.preventDefault();
                                                   if (!startDtInput.val()) {
                                                     alert("체크인 날짜를 선택해주세요");
                                                   } else if (!endDtInput.val()) {
                                                     alert("체크아웃 날짜를 선택해주세요");
                                                   } else if (guestsSelect.val() < 1) {
                                                     alert("인원수를 입력해주세요");
                                                   } else {
                                                     // Proceed with the form submission or other actions
                                                     document.regForm.submit();
                                                   }
                                                 });
                                             
                                                 // 페이지 로드 시 초기 설정
                                                 startDtInput.trigger("change");
                                               });
                                             
                                               function gopage(room_id) {
                                                    const pro_id = '${param.pro_id}';
                                                    const start_dt = '${param.start_dt}';
                                                    const end_dt = '${param.end_dt}';
                                                    const user_cnt = '${param.user_cnt}';
                  
                                                    if (!pro_id || !start_dt || !end_dt || !user_cnt) {
                                                      // 필요한 값 중 하나라도 없는 경우 알림을 표시하고 페이지 이동을 중단합니다.
                                                      alert("체크인, 체크아웃, 인원 수 검색 후 객실 선택이 가능합니다");
                                                      return;
                                                    }
                  
                                                    location.href = '${path}/product_detail3?pro_id=' + pro_id +
                                                      '&start_dt=' + start_dt +
                                                      '&end_dt=' + end_dt +
                                                      '&user_cnt=' + user_cnt +
                                                      '&room_id=' + room_id;
                                                  }
                                             </script>
            
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           </div>
            
                        </div>
                        

 						<div id="tab__content--2" class="tab__content">
                        <div class="desc-content">
                           <div id="map" style="width: 100%; height: 600px;"></div>
                           <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
                           <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3335bd1ef42499207a6458ce22338fc8"></script>
                           <script>
                                  document.getElementById('tab2').addEventListener('change', function () {
                                     if (this.checked) {
               
                                 
                                 var container = document.getElementById('map');
                                 var options = {
                                       center: new kakao.maps.LatLng(37.5394822,126.9975512),
                                       level: 3
                                       };
                                 var map = new kakao.maps.Map(container, options);
                                 var markerPosition  = new kakao.maps.LatLng(37.5394822,126.9975512);  // 마커가 표시될 위치 
                                 var marker = new kakao.maps.Marker({  // 마커를 생성한다
                                    position: markerPosition
                                    });
                                 marker.setMap(map);
                                     }
                                 });
                                 
                              </script>
                        </div>
                        <div class="location-content">지하철역에서 도보 20분</div>
                     </div>
                     <div id="tab__content--3" class="tab__content">

                        <div class="review-list">
                           <c:forEach var="review" items="${prReview}">
                              <div class="review_com">
                                 <div class="review-item">
                                    <div class="review-image">
                                       <img src="${path}/upload/짱구.jpg" alt="User 1">
                                    </div>
                                    <div class="review-content">
                                       <div class="user-nickname" name="n_name">${review.n_name}</div>
                                       <div class="review-text" name="review_det">${review.review_det}</div>
                                    </div>
                                    <div class="report-button">
                                       <button class="report-btn" data-toggle="modal"
                                          data-target="#myModal">신고하기</button>
                                    </div>
                                 </div>
                                 <div class="comment-section">
                                    <div class="manager" name="bsn_name">${review.bsn_name}</div>
                                    <div class="comment-text" name="rv_com_det">${review.rv_com_det}</div>
                                 </div>
                              </div>
                           </c:forEach>
                        </div>
                        <!-- 추가 객실 정보는 여기에 계속 추가 -->
                     </div>
                     <script>
                             document.getElementById('tab3').addEventListener('change', function () {
                                 activateTab('tab__content--3'); 
                             });
                         </script>
                     <div id="tab__content--4" class="tab__content">
                        <div class="container">
                           <c:forEach var="board" items="${blist}">
                              <form id="commForm">
                                 <input type="hidden" id="recom_id" name="recomId"
                                    value="${board.recom_id}" />
                                 <div class="section-title">${board.title}</div>
                                 <div class="recommendation">
                                    <img
                                       src="${path}/assets/img/bsn/${board.imgs.get(0).fname}"
                                       alt="명소 이미지" class="place-image">
                                    <div class="recommendation-container">
                                       <div class="recommendation-text">${board.detail}</div>
                                    </div>
                                 </div>
                                 <hr class="divider">
                                 <div class="wejoy-comment-section">
                                    <div class="wejoy-comment">
                                       <span class="wejoy-user-nickname">작성자: ${board.user_id}</span>
                                       <input type="hidden" name="userId" value="${ij_user.userId}" /> 
                                    </div>

                                    <div id="commentContainer">
                                       <!-- 기존 댓글들 표시 장소-->
                                    <c:forEach var="comm" items="${board.comms}">
                                    <div class="wejoy-comment">
                                       <span class="wejoy-comment-text">${comm.user_id} 님의 댓글: </span>
                                       <span class="wejoy-comment-text">${comm.rc_com_det}</span>
                                    </div>
                                    </c:forEach>
                                    </div>

                                    <div class="wejoy-comment">
                                       <input type="text" class="wejoy-comment-input"
                                          name="rcComDet" id="commentInput" placeholder="댓글 입력">
                                       <button class="wejoy-comment-button" id="commentButton"
                                          onclick="test()">댓글</button>
                                    </div>
                              </form>
                                    <!-- 이 부분에 댓글추가 표시 장소 -->
                        </c:forEach>
                                 </div>
                                 <div style="margin: 200px 0;">
                                 </div>
                           </div>
                           </div>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script>
                 document.getElementById('tab4').addEventListener('change', function () {
                     activateTab('tab__content--4'); 
                 });
                 
                
               
                 function test() {

                    // Ajax 요청을 통해 댓글 추가 처리
                    $.ajax({
                        type: "POST",
                        url: "/try/write/comm", // 댓글 추가를 처리할 URL
                        data: $("#commForm").serialize(),
                        dataType :"text",
                        success: function(response) {
                            // 댓글 추가 성공 시 처리 (예: 댓글 목록 갱신)
                            /* var newComment = JSON.parse(response);   // 문자열로 받은 json데이터를 json 타입으로 변환
                            
                            const commentItem = document.createElement("div");
                            commentItem.classList.add("wejoy-comment");
                            
                            const userNickname = document.createElement("span");
                            userNickname.classList.add("wejoy-user-nickname");
                            userNickname.textContent = newComment.userId;
                            
                            const commentText = document.createElement("span");
                            commentText.classList.add("wejoy-comment-text");
                            commentText.textContent = newComment.rcComDet;
                            
                            commentItem.appendChild(userNickname);
                            commentItem.appendChild(commentText);
                            
                            const commentContainer = document.querySelector("#commentContainer");
                            commentContainer.appendChild(commentItem); */
                            
                            // 입력 필드 초기화
                            if(response == "Y"){
                               $("#commentInput").val("");
                               alert("댓글이 작성되었습니다.")
                               location.reload()
                           }else{
                              alert("작성실패: 관리자에게 문의하세요.")
                           }
                        },
                        error: function(error) {
                            // 댓글 추가 실패 시 처리
                            alert("error: 댓글 추가 실패. 관리자에게 문의하세요.");
                        }
                    });
                 }
                 
            </script>
                     </div>
                  </div>
               </div>
            </article>
         </div>
      </div>
   </div>
   <div id="myModal" class="modal fade">
      <div class="modal-dialog contact-modal">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">신고하기</h4>
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
               <form action="/examples/actions/confirmation.php" method="post">
                  <div class="form-group">
                     <label for="report_type">신고 유형</label> <select id="report-type">
                        <option value="false-information">허위사실 유포</option>
                        <option value="advertisement">광고</option>
                        <option value="personal-information-disclosure">개인정보 유출</option>
                        <option value="obscene-material">음란물</option>
                        <option value="illegal-information">불법 정보</option>
                        <option value="profanity">욕설</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label for="url">신고 URL</label> <input type="text"
                        class="form-control" id="url" required>
                  </div>
                  <div class="form-group">
                     <label for="report_det">신고 내용</label>
                     <textarea class="form-control" id="report_det" rows="4" required></textarea>
                  </div>
                  <input type="submit" class="btn btn-primary" value="Send">
                  <input type="button" class="btn btn-link" data-dismiss="modal"
                     value="Cancel">
               </form>
            </div>
         </div>
      </div>
   </div>

   <script src="${path}assets/js/product_detail.js"></script>
   <%@ include file="../header/footer.jsp"%>
</body>
</html>
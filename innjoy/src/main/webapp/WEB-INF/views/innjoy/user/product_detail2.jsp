<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
   value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>숙소 상세 페이지</title>
<!-- jQuery 라이브러리 임포트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- daterangepicker 라이브러리 임포트 -->
<link rel="stylesheet" type="text/css" href="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css}" />
<script type="text/javascript" src="@{https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js}"></script>
<script type="text/javascript" src="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js}"></script>
<!-- jQuery -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <!-- iamport.payment.js -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="${path}/assets/css/product_detail.css">
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
</style>
<script>

        // 버튼 클릭 시 페이지 이동을 처리하는 함수
        // function navigateToReservationPage() {
        //    window.location.href = '/product_reservation'; // 이동할 페이지의 URL을 설정
        // }
    </script>
</head>
<body>
<%@include file="../header/user_header.jsp"%>
<div class ="a">
<div class="container1">
    <div class="slider-container1">
      <div class="slider">
        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="숙소 이미지 1">
        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/06/30/5efaee66a9fdb.jpg"alt="숙소 이미지 2">
        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2023/06/21/11/68f9e4f1694a45948b2d4b8140a02328.jpg" alt="숙소 이미지 3">
      </div>
      <button class="arrow left">&#8249;</button>
      <button class="arrow right">&#8250;</button>
    </div>
    
    <div class="description1">
      <div class="d-flex justify-content-between">
       <div class="mb-3">
           <span class="product-availability" name="pro_type">${proDetail2.pro_type}</span>
       </div>
       

   </div>


      <div class="description_name">${proDetail2.pro_name}</h1>
      
      <div class="product-rating d-flex align-items-center mb-3">
         <span class="star-rating">
         <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#B2B2B2"/>
        </svg>
        </span>
        <span class="rating-count ms-2">(22)</span>
        </div>
      <p class="s_content"> 흡연 : ${proDetail2.smoking}</p>
      <p class="s_content"> 침대 ${proDetail2.bed_cnt} 개</p>
    </div>
    
    
    <div class="info">
      <div class="css-11sbcds">
         <div class="css-1ju036a">
            <h2 class="css-3todla">인기시설 및 서비스</h2>
         </div>
         <section class="css-1u38mgg">
            <ul class="css-17yp1q4">
               <div class="css-t9n8kv">
                  <img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c313ce9fecc4.22775147.png" alt="스파/월풀/욕조 아이콘" class="css-19xh2rn">
                  <div class="css-9cehu5">스파/월풀<br>/욕조</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31409836037.64820304.png" alt="주차가능 아이콘" class="css-19xh2rn"><div class="css-9cehu5">주차가능</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c30fb58581a7.11803213.png" alt="조식운영 아이콘" class="css-19xh2rn"><div class="css-9cehu5">조식운영</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311e5e615d3.11619749.png" alt="수영장 아이콘" class="css-19xh2rn"><div class="css-9cehu5">수영장</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311543917c0.43365861.png" alt="야외수영장 아이콘" class="css-19xh2rn"><div class="css-9cehu5">야외수영장</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3138a5e2ea4.38579968.png" alt="와이파이 아이콘" class="css-19xh2rn"><div class="css-9cehu5">와이파이</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3130bbecc55.51674550.png" alt="사우나 아이콘" class="css-19xh2rn"><div class="css-9cehu5">사우나</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3144caafc60.78284341.png" alt="클럽라운지 아이콘" class="css-19xh2rn"><div class="css-9cehu5">클럽라운지</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312d25b7881.48044241.png" alt="흡연구역 아이콘" class="css-19xh2rn"><div class="css-9cehu5">흡연구역</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312ab2a3a54.21397941.png" alt="객실금연 아이콘" class="css-19xh2rn"><div class="css-9cehu5">객실금연</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31181bebd23.39062499.png" alt="레스토랑 아이콘" class="css-19xh2rn"><div class="css-9cehu5">레스토랑</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311e9670a08.27489301.png" alt="바 아이콘" class="css-19xh2rn"><div class="css-9cehu5">바</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3109dda4352.22209168.png" alt="연회장 아이콘" class="css-19xh2rn"><div class="css-9cehu5">연회장</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31127b01603.92499001.png" alt="피트니스 아이콘" class="css-19xh2rn"><div class="css-9cehu5">피트니스</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311ae467a30.99886411.png" alt="뷔페 아이콘" class="css-19xh2rn"><div class="css-9cehu5">뷔페</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c310d3afaa03.83388501.png" alt="어메니티 아이콘" class="css-19xh2rn"><div class="css-9cehu5">어메니티</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31036778734.93239827.png" alt="24시간
               데스크 아이콘" class="css-19xh2rn"><div class="css-9cehu5">24시간<br>데스크</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3125bc08791.41470069.png" alt="유료세탁 아이콘" class="css-19xh2rn"><div class="css-9cehu5">유료세탁</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312167373b2.34805205.png" alt="커피숍 아이콘" class="css-19xh2rn"><div class="css-9cehu5">커피숍</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c310fa539846.88150499.png" alt="비즈니스 아이콘" class="css-19xh2rn"><div class="css-9cehu5">비즈니스</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3107116d3e8.32646858.png" alt="수화물보관 아이콘" class="css-19xh2rn"><div class="css-9cehu5">수화물보관</div>
            </div>
         </ul>
      </section>
      </div>
    </div>
   
   <article class="article">
      <div class="grid__item--1of1 text-center">
         <div class="tabs">
             <input type="radio" name="tabs" id="tab1" checked >
             <label for="tab1">
                 <i class="icon1 email-cal"></i><span>숙소 상세</span>
             </label>
             <input type="radio" name="tabs" id="tab2">
             <label for="tab2">
                 <i class="icon1 snapshot"></i><span>위치</span>
             </label>
             <input type="radio" name="tabs" id="tab3">
             <label for="tab3">
                 <i class="icon1 inbox-apps"></i><span>후기</span>
             </label>
             <input type="radio" name="tabs" id="tab4">
             <label for="tab4">
                 <i class="icon1 log-calls"></i><span>WeJoy</span>
             </label>
      
            <hr class="divider">
            
              <div id="tab__content--1" class="tab__content">
                    <div class="container2">
                      <div id="booking" class="section">
                        <div class="section-center">
                              <div class="row2">
                                 <div class="booking-form">
                                    <div class="row no-margin">
                                       <div class="col-md-2">
                                          <div class="form-group">
                                             <span class="form-label">Check In</span>
                                             <h5 class="checkIn" name="start_dt">${param.start_dt}</h5>
                                          </div>
                                       </div>
                                       <div class="col-md-2">
                                          <div class="form-group">
                                             <span class="form-label">Check out</span>
                                             <h5 class="checkOut" name="end_dt">${param.end_dt}</h5>
                                          </div>
                                       </div>
                                       <div class="col-md-2">
                                          <div class="form-group">
                                             <span class="form-label">Guests</span>
                                             <h5 class="Guests" name="user_cnt">${param.user_cnt}명</h5>
                                          </div>
                                       </div>
                                    
                                    <hr class="divider">
                                       <div class="reservation-table">
                                          <table>
                                             <tr>
                                                <th>체크인 시간 : ${proDetail2.checkin} </th>
                                                <th>체크아웃 시간 : ${proDetail2.checkout} </th>
                                             </tr>
                                             <tr>
                                                <td>1박 가격 : <span id="price" name="room_price">${proDetail2.room_price}원</span></td>
                                                <td>총 금액 : <span id="total_price"><input type="hidden" name="price" /></span></td>
                              
                                                <td><button class="reserve-button" data-toggle="modal" data-target="#reservation_Modal">예약하기</button></td>
                                             </tr>
                                          </table>
                                       </div>
                                    </div>
                                    <hr class="divider">
                                    <div class="room-detail">
                                     <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="숙소 이미지 1">
                                      <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/06/30/5efaee66a9fdb.jpg"alt="숙소 이미지 2">
                                      <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2023/06/21/11/68f9e4f1694a45948b2d4b8140a02328.jpg" alt="숙소 이미지 3">
                                    </div>
                                    
                                    <hr class="divider">   
                                    
                                    <div class="room-infos">
                                        <div class="room-detail-info">기본정보</div>
                                        <div class="room-basic-info">${proDetail2.basic_info}</div>
                                    </div>
                                    <hr class="divider">
                                    <div class="room-infos">
                                        <div class="room-detail-info">예약정보</div>
                                        <div class="room-reservation-info">${proDetail2.res_ann}</div>
                                    </div>   
                                    <hr class="divider">
                                    <div class="room-infos">
                                        <div class="room-detail-info">세부정보</div>
                                        <div class="room-reservation-info">${proDetail2.ser_conts}</div>
                                    </div>                        
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <script> // 총 금액 구하기,,
                     var startDate = new Date("${param.start_dt}");
                     var endDate = new Date("${param.end_dt}");
                     
                     var timeDiff = endDate - startDate;
                     var nightCount = Math.ceil(timeDiff / (1000 * 3600 * 24));
                     
                     var roomPrice = ${proDetail2.room_price};
                     var totalPrice = roomPrice * nightCount;
                     // 천 단위로 ","로 구분된 문자열로 포맷팅
                     function formatNumber(number) {
                        return number.toLocaleString();
                     }
                     // HTML 요소 업데이트 함수
                     function updatePrice() {
                        var totalPriceField = document.getElementById('total_price');
                        var hiddenPriceField = document.getElementById('payment');
                        var priceField = document.getElementById('price');
                        
                        totalPriceField.textContent = formatNumber(totalPrice) + "원";
                        hiddenPriceField.value = totalPrice;
                        priceField.textContent = formatNumber(roomPrice) + "원";
                     }
                     // 이 코드는 페이지가 로드될 때 실행됩니다.
                     window.onload = function () {
                        updatePrice(); // 초기 가격 설정
                        document.getElementById("modal_total_price").textContent = formatNumber(totalPrice) + "원"; // 모달에 총 금액 설정
                        };
                        // 모달 열기 버튼 클릭 시
                        function openModal() {
                           // 모달 금액 설정
                           document.getElementById("modal_total_price").textContent = formatNumber(totalPrice) + "원";
                           $('#reservation_Modal').modal('show');
                           }
                        </script>
                   </div>
                     
             
             <div id="tab__content--2" class="tab__content">
               <div class="desc-content">
               <div id="map" style="width:100%;height:600px;"></div>
               <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c7f24d1d2999a56f70827b2234f8442"></script>
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
                                     <button class="report-btn" data-toggle="modal" data-target="#myModal">신고하기</button>
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
                <div class="section-title" name="title">${prComm[0].title}</div>
                <div class="recommendation">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA3MThfMjE1%2FMDAxNjg5NjgyMjkyNjEy.qh04MF1RCBnjzl9YXLIzp6W3xbD9thiVZSpfH9_UO2gg.XN6FKZzrYnEzvxB8vDN-noqQZbY4f-Lr03vXINiLJsog.JPEG.kkan9000%2FKakaoTalk_20230718_193348736_06.jpg&type=sc960_832" alt="명소 이미지" class="place-image">
                    <div class="recommendation-container">
                       <div class="recommendation-text" name="detail">
                           ${prComm[0].detail}
                         
                       </div>
                    </div>
                </div>
                 <hr class="divider">
                 
                <div class="wejoy-comment-section">
                   <div class="wejoy-comment">
                        <span class="wejoy-user-nickname" name="user_id">${user_id}</span>
                        <span class="wejoy-comment-text">첫 번째 댓글입니다.</span>
                    </div>
                   
                  
                  <div id="commentContainer">
                      <!-- 기존 댓글들 표시 장소-->
                  </div>
                  <div class="wejoy-comment">
                      <input type="text" class="wejoy-comment-input" id="commentInput" placeholder="댓글 입력">
                      <button class="wejoy-comment-button" id="commentButton" onclick=javascript:test();>댓글</button>
                  </div>
                    <!-- 이 부분에 댓글추가 표시 장소 -->
                </div>
                <div style="margin: 200px 0;"></div>
             </div>
             <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
               
                 document.getElementById('tab4').addEventListener('change', function () {
                     activateTab('tab__content--4'); 
                 });
                 
                 $(document).ready(function() {
                     // 댓글 달기 버튼 클릭 시
                     $("#commentButton").click(function() {
                         const comment = $("#commentInput").val();
                         const recomId = ${recom_id}; // 위에서 받아온 추천 게시글의 ID
                         const userId = "${user_id}"; // 로그인한 사용자의 ID

                         // Ajax 요청을 통해 댓글 추가 처리
                         $.ajax({
                             type: "POST",
                             url: "/addComment", // 댓글 추가를 처리할 URL
                             data: { recomId: recomId, userId: userId, comment: comment },
                             success: function(response) {
                                 // 댓글 추가 성공 시 처리 (예: 댓글 목록 갱신)
                                 const newComment = response; // 서버에서 반환된 새 댓글 정보
                                 
                                 const commentItem = document.createElement("div");
                                 commentItem.classList.add("wejoy-comment");
                                 
                                 const userNickname = document.createElement("span");
                                 userNickname.classList.add("wejoy-user-nickname");
                                 userNickname.textContent = newComment.userNickname;
                                 
                                 const commentText = document.createElement("span");
                                 commentText.classList.add("wejoy-comment-text");
                                 commentText.textContent = newComment.commentText;
                                 
                                 commentItem.appendChild(userNickname);
                                 commentItem.appendChild(commentText);
                                 
                                 const commentContainer = document.querySelector("#commentContainer");
                                 commentContainer.appendChild(commentItem);
                                 
                                 // 입력 필드 초기화
                                 $("#commentInput").val("");
                             },
                             error: function(error) {
                                 // 댓글 추가 실패 시 처리
                                 alert("댓글 추가 실패");
                             }
                         });
                     });
                 });
               
                 function test() {
                 
                 const comment = $("#commentInput").val();
                 const recomId = ${recom_id}; // 위에서 받아온 추천 게시글의 ID
                 const userId = "${user_id}"; // 로그인한 사용자의 ID

                 // Ajax 요청을 통해 댓글 추가 처리
                 $.ajax({
                     type: "POST",
                     url: "/addComment", // 댓글 추가를 처리할 URL
                     data: { recomId: recomId, userId: userId, comment: comment },
                     success: function(response) {
                         // 댓글 추가 성공 시 처리 (예: 댓글 목록 갱신)
                         const newComment = response; // 서버에서 반환된 새 댓글 정보
                         
                         const commentItem = document.createElement("div");
                         commentItem.classList.add("wejoy-comment");
                         
                         const userNickname = document.createElement("span");
                         userNickname.classList.add("wejoy-user-nickname");
                         userNickname.textContent = newComment.userNickname;
                         
                         const commentText = document.createElement("span");
                         commentText.classList.add("wejoy-comment-text");
                         commentText.textContent = newComment.commentText;
                         
                         commentItem.appendChild(userNickname);
                         commentItem.appendChild(commentText);
                         
                         const commentContainer = document.querySelector("#commentContainer");
                         commentContainer.appendChild(commentItem);
                         
                         // 입력 필드 초기화
                         $("#commentInput").val("");
                     },
                     error: function(error) {
                         // 댓글 추가 실패 시 처리
                         alert("댓글 추가 실패");
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

<script>
/*     function checkLoginAndShowModal(event) {
        event.preventDefault(); // 폼 전송을 중지

        var userName = "${ij_user.userName}";

        if (!userName) {
            alert("로그인이 필요합니다.");
            location.href = '/login'; // 로그인 페이지로 이동
        } else {
            // 로그인 상태인 경우, API 시작
            requestPay();
        }
    } */
    function requestPay() {
       var productName = $("#productName").val();
        var payment = $("#payment").val();
        var userId = $("#userId").val()
        var roomId = $("#roomId").val()
        var userCnt = $("#userCnt").val()
        var startDt = convertToDate($("#startDt").val());
        var endDt = convertToDate($("#endDt").val());
       
        var IMP = window.IMP;
        IMP.init("imp32553024");
        // 원포트 관리자 페이지 -> 내정보 -> 가맹점식별코드
        // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
        IMP.request_pay({
            pg: 'html5_inicis',  // 실제 계약 후에는 실제 상점아이디로 변경
            pay_method: 'card', // 'card'만 지원됩니다.
            merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
            name: productName,
            amount: payment,
            buyer_email: "${ij_user.email}",
            buyer_name: "${ij_user.userName}",
            buyer_tel:  "${ij_user.userPhone}",
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            m_redirect_url: 'https://www.myservice.com/payments/complete/mobile',
        }, function (rsp) {
            if (rsp.success) {  // 결제가 성공했을 떄
                // 결제가 완료되었을 떄 결제 정보를 뜨게 만듬
              console.log("success")
            console.log("reservation()호출")
              reservation();
            } else {    // 결제가 실패했을 때
                // 결제에 실패했을떄 실패메세지와 실패사유를 출력
                var msg = '결제에 실패하였습니다.';
                msg += '실패 사유 : ' + rsp.error_msg;
            }
        });
    }

    function reservation() {
        var resData = {
          roomId: $("#room_id").val(),
            payment: $("#payment").val(),
            userId: $("#userId").val(),
            roomId: $("#roomId").val(),
            userCnt: $("#userCnt").val(),
            startDt: convertToDate($("#startDt").val()),
            endDt: convertToDate($("#endDt").val())
        }; // 폼 데이터를 배열 형태로 직렬화
       $.ajax({
            type: "post",
            url: "/sec/try/reservation",
            data: JSON.stringify(resData),
            contentType: "application/json; charset=utf-8",
            success: function (rs) {
                console.log(resData);
                console.log(userId);
                console.log(roomId);
                alert("예약 성공")
                location.href = "/sec/mypage";
            },
            error: function (err) {
                console.log(err);
            }
        });
    }

    function convertToDate(dateString) {
       // dateString은 "YYYY-MM-DD" 형식으로 전달되어야 함
        var parts = dateString.split('-');
        var year = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10) - 1; // JavaScript에서 월은 0부터 시작함
        var day = parseInt(parts[2], 10);
        
        var convertedDate = new Date(year, month, day);
        return convertedDate;
    }
    </script>

   
<div id="reservation_Modal" class="modal fade">
   <div class="modal-dialog contact-modal">
      <div class="modal-content">
         <div class="modal-header">            
            <p class="reservaion-info-head">예약정보</p>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         </div>
         <div class="modal-body">
                <form action="" method="post" onsubmit="checkLoginAndShowModal(event)">
                    <div class="reservation-info-list">숙소명</div>
                  <div class="reservation-infos">${proDetail2.pro_name}</div>
                  <div class="reservation-info-list">객실명</div>
                  <div class="reservation-infos">${proDetail2.room_name}</div>
                  <input class="reservation-input" type="hidden" id="roomId" name="roomId" value="${proDetail2.room_id}">
                  <input class="reservation-input" type="hidden" id="productName" value="${proDetail2.pro_name}">
                  <div class="reservation-info-list">예약날짜</div>
                  <div class="reservation-infos">${param.start_dt} - ${param.end_dt}</div>
                  <input class="reservation-input" type="hidden" id="startDt" name="startDt" value="${param.start_dt}">
                  <input class="reservation-input" type="hidden" id="endDt" name="endDt" value="${param.end_dt}">
                  <div class="reservation-info-list">인원수</div>
                  <div class="reservation-infos">${param.user_cnt}명</div>
                  <input class="reservation-input" type="hidden" id="userCnt" name="userCnt"  value="${param.user_cnt}">
                  <div class="reservation-info-list">가격</div>
                  <div class="reservation-infos" id="modal_total_price">원</div>
                  <input class="reservation-input" type="hidden" id="payment" name="payment"  value="0">
                  <div class="reservation-info-list">예약자 이름</div>
                  <div class="reservation-infos">${ij_user.userName}</div>
                  <input class="reservation-input" type="hidden" id="userId" name="userId" value="${ij_user.userId}">
                  <div class="reservation-info-list">예약자 연락처</div>
                  <div class="reservation-infos">${ij_user.userPhone}</div>
                    <input type="button" class="btn btn-primary" value="예약하기" onclick="requestPay()">
                    <input type="button" class="btn btn-link" data-dismiss="modal" value="Cancel">
                </form>
         </div>
      </div>
   </div>
</div> 


 <div id="myModal" class="modal fade">
   <div class="modal-dialog contact-modal">
      <div class="modal-content">
         <div class="modal-header">            
            <h4 class="modal-title">신고하기</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         </div>
         <div class="modal-body">
                <form action="/examples/actions/confirmation.php" method="post">
                    <div class="form-group">
                        <label for="report_type">신고 유형</label>
                        <select id="report-type">
                      <option value="false-information">허위사실 유포</option>
                      <option value="advertisement">광고</option>
                      <option value="personal-information-disclosure">개인정보 유출</option>
                      <option value="obscene-material">음란물</option>
                      <option value="illegal-information">불법 정보</option>
                      <option value="profanity">욕설</option>
                  </select>
                    </div>
                    <div class="form-group">
                        <label for="url">신고 URL</label>
                        <input type="text" class="form-control" id="url" required>
                    </div>
                    <div class="form-group">
                        <label for="report_det">신고 내용</label>
                        <textarea class="form-control" id="report_det" rows="4" required></textarea>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Send">
                    <input type="button" class="btn btn-link" data-dismiss="modal" value="Cancel">
                </form>
         </div>
      </div>
   </div>
</div> 

<script src="${path}assets/js/product_detail.js"></script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
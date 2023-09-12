<!-- bsn_res.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
    <link rel="stylesheet" href="${path}/buser/buser.css">
    <link rel="stylesheet" href="${path}/calendar/css/style.css">
    <script src="${path}/a00_com/jquery.min.js"></script>
    <script src="${path}/a00_com/popper.min.js"></script>
    <script src="${path}/a00_com/bootstrap.min.js"></script>
    <script src="${path}/a00_com/jquery-ui.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>InnJoy</title>

    <script src="https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>

    <script src='${path}/calendar/fullcalendar/packages/core/main.js'></script>
    <script src='${path}/calendar/fullcalendar/packages/interaction/main.js'></script>
    <script src='${path}/calendar/fullcalendar/packages/daygrid/main.js'></script>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${path}/calendar/fonts/icomoon/style.css">
    <link href='${path}/calendar/fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='${path}/calendar/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />

    <script src="${path}/calendar/js/main.js"></script>
	
	<script>
	    document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var currentDate = new Date();
	        var selectedRoomId = null;
	        var modalTitleElement;
	        	
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            locale: 'ko',
	            plugins: [ 'interaction', 'dayGrid' ],
	            defaultDate: currentDate,
	            editable: true,
	            eventLimit: true,
	            displayEventTime: false,
	            events: function(info, successCallback, failureCallback) {
	                var eventsUrl = '${path}/sec/calList?room_id=' + selectedRoomId;
	
	                fetch(eventsUrl)
	                .then(response => response.json())
		            .then(data => {
		                data.forEach(event => {
		                    if (event.title === '예약문의' || event.title === '예약확정') {
		                        event.backgroundColor = '#B0CC69';
		                        event.borderColor = '#B0CC69';
		                    } else if (event.title === '예약취소(사용자)') {
		                        event.backgroundColor = '#FF5656';
		                        event.borderColor = '#FF5656';
		                    } else if (event.title === '예약취소(사업자)') {
		                        event.backgroundColor = '#FF5656';
		                        event.borderColor = '#FF5656';
		                    } else if (event.title === '이용완료') {
		                        event.backgroundColor = '#98A2FF';
		                        event.borderColor = '#98A2FF';
		                    }
		                });
		                successCallback(data);
		            })
	                .catch(error => failureCallback(error));
	        	},
	        	// Inside your eventClick function
	        	
	        	eventClick: function(info) {
	        		var path = "${path}";
	        	    var modalBody = document.getElementById('eventModalBody');
	        	    var reservation_id = parseInt(info.event.extendedProps.reservation_id);
	                modalTitleElement = document.getElementById('eventModalLabel');
	                modalTitleElement.innerText = info.event.title;

					fetch(path + "/sec/resDetModal?reservation_id=" + reservation_id)
	        	        .then(response => response.json())
	        	        .then(resDetModal => {
	        	            var checkInDate // 한글로 날짜 설정하기
	        	           		= new Date(resDetModal.reservation.start_dt).toLocaleDateString('ko-KR');
	        	            var checkOutDate  // 한글로 날짜 설정하기
	        	            	= new Date(resDetModal.reservation.end_dt).toLocaleDateString('ko-KR');
	        	            var paymentFormatted  // 세번째 자리마다 , 출력
	        	            	= resDetModal.reservation.payment.toLocaleString('ko-KR');
	        	            
	                        var modalContent = '<div>';
	                        modalContent += '<div>예약일</div>';
	                        modalContent += '<p>Check-in: ' + checkInDate + '</p>';
	                        modalContent += '<p>Check-out: ' + checkOutDate + '</p></div>';
	                        modalContent += '<div>';
	                        modalContent += '<div>예약자 명</div><p>';
	                        modalContent += resDetModal.user.user_name + '</p></div>';
	                        modalContent += '<div>';
	                        modalContent += '<div>예약자 아이디</div>';
	                        modalContent += '<p>' + resDetModal.user.user_id + '</p></div>';	                        
	                        modalContent += '<div>';
	                        modalContent += '<div>예약자 전화번호</div><p>';
	                        modalContent += resDetModal.user.user_phone + '</p></div>';
	                        modalContent += '<div>';
	                        modalContent += '<div>사용 인원</div><p>';
	                        modalContent += resDetModal.reservation.user_cnt + '명</p></div>';
	                        modalContent += '<div>';
	                        modalContent += '<div>결제 금액</div>';
	                        modalContent += '<p>' + paymentFormatted + '원</p></div>';
	                        
	                        if (info.event.title === '예약취소(사용자)') {
	                            var cancleReason = resDetModal.cancle_reason;
	                            modalContent += '<div>';
	                            modalContent += '<div>취소 사유</div>';
	                            modalContent += '<p>' + cancleReason + '</p></div>';
	                        }
	                        
	                        modalBody.innerHTML = modalContent;
	        	            $('#eventModal').modal('show');
	        	        })
	        	        .catch(error => console.error(error));
						
						// 예약 취소
				        const cancelButton1 = document.getElementById('closebtn2');
				        cancelButton1.addEventListener('click', function() {
				            var reservation_id = parseInt(info.event.extendedProps.reservation_id);
				            var path = "${path}";
				            var cancelUrl = path + "/sec/resCancle?reservation_id="+reservation_id;

							const requestData = {
							    reservation_id: parseInt(info.event.extendedProps.reservation_id)
							};

							fetch(cancelUrl, {
							    method: 'POST',
							    headers: {
							        'Content-Type': 'application/json'
							    },
							    body: JSON.stringify(requestData)
							})
							.then(response => response.json())
							.then(data => {
							    console.log(data);
							})
							.catch(error => console.error(error));

				            $('#eventModal').modal('hide');
				        });
				        
						// 예약 확정
				        const cancelButton2 = document.getElementById('closebtn4');
				        cancelButton2.addEventListener('click', function() {
				            var reservation_id = parseInt(info.event.extendedProps.reservation_id);
				            var path = "${path}";
				            var cancelUrl = path + "/sec/resConf?reservation_id="+reservation_id;

							const requestData = {
							    reservation_id: parseInt(info.event.extendedProps.reservation_id)
							};

							fetch(cancelUrl, {
							    method: 'POST',
							    headers: {
							        'Content-Type': 'application/json'
							    },
							    body: JSON.stringify(requestData)
							})
							.then(response => response.json())
							.then(data => {
							    console.log(data);
							})
							.catch(error => console.error(error));

				            $('#eventModal').modal('hide');
				        });
				        
						// 이용 완료
				        const cancelButton3 = document.getElementById('closebtn3');
				        cancelButton3.addEventListener('click', function() {
				            var reservation_id = parseInt(info.event.extendedProps.reservation_id);
				            var path = "${path}";

				            var cancelUrl = path + "/sec/resUse?reservation_id="+reservation_id;

							const requestData = {
							    reservation_id: parseInt(info.event.extendedProps.reservation_id)
							};

							fetch(cancelUrl, {
							    method: 'POST',
							    headers: {
							        'Content-Type': 'application/json'
							    },
							    body: JSON.stringify(requestData)
							})
							.then(response => response.json())
							.then(data => {
							    console.log(data);
							})
							.catch(error => console.error(error));

				            $('#eventModal').modal('hide');
				        });

	        	}
	        });        
	
	        var roomList = document.getElementById('roomList');
	        roomList.addEventListener('change', function() {
	            selectedRoomId = roomList.value;
                localStorage.setItem('selectedRoomId', selectedRoomId);
	            calendar.refetchEvents();
	        });
	
	        selectedRoomId = roomList.options[0].value;
	        calendar.refetchEvents();
	
	        // X 버튼
	        const closebtn1 = document.getElementById('closebtn1');
	        closebtn1.addEventListener('click', function() {
	        	$('#eventModal').modal('hide');
	        });
	        
	        // 예약 취소 버튼
	        const closeButton = document.getElementById('closebtn2');
	        closeButton.addEventListener('click', function() {
			    alert("예약이 취소되었습니다.");
	            location.reload(); // 클릭시 새로고침
	        });	
	     	// 이용완료 버튼
	        const closeButton2 = document.getElementById('closebtn3');
	        closeButton2.addEventListener('click', function() {
	        	alert("이용완료 처리되었습니다.");
	            location.reload(); // 클릭시 새로고침
	        });	        
	        // 예약 확정 버튼
	        const closeButton3 = document.getElementById('closebtn4');
	        closeButton3.addEventListener('click', function() {
	        	alert("예약이 확정되었습니다.");
	            location.reload(); // 클릭시 새로고침
	        });	
	        calendar.render();
	    });
	</script>

</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="../header/buser_header.jsp" flush="true"/>
    <c:set var="bsn_id" value="${sessionScope.bsn_id}" />
    <div class="middle">
        <p class="middle_p">예약관리</p>
    </div>
    <div class="log_sel">
        <div>
            <P class="type_n">숙소</P>
        </div>
        <div class="log_type">
            <select class="log_type2" id="roomList">
                <c:forEach items="${bsn_res}" var="room">
                    <option value="${room.room.room_id}">
                    ${room.product.pro_name} - ${room.room.room_name}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="cal">
        <div id='calendar'></div>
    </div>

    <!-- 모달창 -->
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel">예약문의</h5>
                    <button type="button" id="closebtn1" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="eventModalBody">
      		      	
                </div>
                <div class="modal-footer">
                    <button type="button" id = "closebtn4" class="res_con_btn" data-dismiss="modal">예약확정</button>
                    <button type="button" id="closebtn2" class="res_can_btn" data-dismiss="modal">예약취소</button>
                    <button type="button" id="closebtn3" class="res_use_btn" data-dismiss="modal">이용완료</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <jsp:include page="../header/footer.jsp" flush="true"/>
</body>
</html>

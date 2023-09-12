<!-- bsn_inq_chatt.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
    <link rel="stylesheet" href="${path}/buser/buser.css?after" >
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <script src="${path}/a00_com/jquery.min.js"></script>
    <script src="${path}/a00_com/popper.min.js"></script>
    <script src="${path}/a00_com/bootstrap.min.js"></script>
    <script src="${path}/a00_com/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>InnJoy</title>
   
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	
	<script type="text/javascript">
	    var ws;
	    
	    $(document).ready(function() {
	        wsOpen();
	        
	        $(window).on('load', function() {
	            scrollToBottom();
	        });
	    });
	
	    function wsOpen() {
	        ws = new WebSocket("ws://" + location.host +
	        		"/chating/" + $("#room_id").val());

	        ws.onopen = function(event) {
	            console.log("WebSocket connection opened.");
	        };
	
	        ws.onmessage = function(event) {
	            console.log("Message received:", event.data);
	            
	            var message = JSON.parse(event.data);
	            if (message.type === "message") {
	                var sender = message.sender;
	                var msgContent = message.msg;
	                var chatBox = $("#chating");
	
	                if (sender === $("#re_user").val()) {
	                    chatBox.append("<p class='me'>나: " + msgContent + "</p>");
	                } else if (sender === $("#se_user").val()) {
	                    chatBox.append("<p class='others'>" +
	                    		sender + ": " + msgContent + "</p>");
	                }
	                scrollToBottom();
	            } else {
	                console.warn("Unknown message type!");
	            }
	        };
	
	        document.addEventListener("keypress", function(e) {
	            if (e.keyCode === 13) {
	                send();
	            }
	        });
	    }	    
	    function scrollToBottom() {
	        var chatBox = $("#chating");
	        chatBox.scrollTop(chatBox[0].scrollHeight);
	    }
	
	    function send() {
	        var option = {
	            room_id: $("#room_id").val(),
	            re_user: $("#re_user").val(),
	            se_user: $("#se_user").val(),
	            senderType: "re_user",
	            msg: $("#chatting").val()
	        };
	
	        // 실제로 메시지를 서버로 보내는 부분 (AJAX 호출)
	        $.ajax({
	            type: "POST",
	            url: "${path}/sendMessage",
	            data: option,
	            success: function() {
	                $('#chatting').val("");
	                console.log("Sent message:", option.msg);
	                
	                var chatBox = $("#chating");
	                chatBox.append("<p class='me'>나: " + option.msg + "</p>");
	                scrollToBottom();
	
	                ws.send(JSON.stringify(option))
	            },
	            error: function() {
	                alert("메세지를 전송하지 못했습니다.");
	            }
	        });
	    }
	</script>
    <style>
        *{
            margin:0;
            padding:0;
        }
        .container{
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }
        .container h1{
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #B0CC69;
            border-left: 3px solid #B0CC69;
            margin-bottom: 20px;
        }
        .chating{
            width: 100%;
            height: 500px;
            overflow: auto;
            border:1px solid #B0CC69;
            border-radius:15px;
            padding : 20px;
        }
        .chating .me{
            color: black;
            font-weight:bold;
            text-align: right;
        }
        .chating .others{
            color: black;
            font-weight:bold;
            text-align: left;
        }
        input{
            width: 330px;
            height: 25px;
        }
        .inputTable{
        	margin-top:30px;
        	border:1px solid #B0CC69;
        	border-radius:10px;
        	padding:10px;
        }
        .form-control{
        	border-left: none !important;
        	border-top: none !important;
        	border-bottom: none !important;
        	border-right: 1px solid #B0CC69!important;
        }
    </style>
</head>
<body>
    <jsp:include page="../header/buser_header.jsp" flush="true"/> <%-- 공통 상단바 --%>
    
    <div id="container" class="container">
        <h1>${user_name} 고객님과의 쪽지</h1>
		<input type="hidden" id="se_user" value="${se_user}">
		<input type="hidden" id="re_user" value="${re_user}">
		<input type="hidden" id="room_id" value="${room_id}">
        
        <div id="chating" class="chating">
            <c:forEach items="${chatMessages}" var="message">
                <c:choose>
                    <c:when test="${message.sender eq re_user}">
                        <p class="me">나: ${message.message}</p>
                    </c:when>
                    <c:otherwise>
                        <p class="others">${user_name} 고객님: ${message.message}</p>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        
        <div>
            <div class="inputTable">
                <div class="input-group">
                    <input type="text" class="form-control" 
                    	placeholder="보내실 메세지를 입력하세요." id="chatting">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" 
                        	onclick="send()" id="sendBtn">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    <jsp:include page="../header/footer.jsp" flush="true"/>
</body>
</html>
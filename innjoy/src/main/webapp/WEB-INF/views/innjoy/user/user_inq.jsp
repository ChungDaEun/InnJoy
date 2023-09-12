<!-- user_inq.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
    <link rel="stylesheet" href="${path}/buser/buser.css?after">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="${path}/a00_com/jquery.min.js"></script>
    <script src="${path}/a00_com/popper.min.js"></script>
    <script src="${path}/a00_com/bootstrap.min.js"></script>
    <script src="${path}/a00_com/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>InnJoy</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    <script type="text/javascript">
    var ws;
    window.onload = function () {
        getRoom();
    }

    function getRoom() {
        var userId = $("#hiddenUserId").val();
        commonAjax('${path}/getRoom2', { se_user: userId }, 'post', function (result) {
            createChatingRoom(result, userId);
        });
    }

    function goRoom(se_user, re_user, room_id, ceo_name) {
        location.href = "${path}/moveChating2?se_user=" + se_user + "&re_user=" + re_user + "&room_id=" + room_id+ "&ceo_name=" + ceo_name;
    }

    function createChatingRoom(res, userId) {
        if (res != null) {
            var roomList = document.getElementById("roomList");
            roomList.innerHTML = ''; // Clear previous content

            res.forEach(function (d, idx) {
                var rn = d.bsn_user.ceo_name.trim(); // Assuming you want to display the user's name
                var room_id = d.chatRoom.room_id;

                if (d.chatRoom.se_user === userId) {
                    var ul = document.createElement("ul");
                    ul.classList.add("chat_list");

                    var liId = document.createElement("li");
                    liId.classList.add("id");
                    liId.textContent = idx + 1;

                    var liRoom = document.createElement("li");
                    liRoom.classList.add("room");
                    liRoom.textContent = rn + " 사장님";

                    var liGo = document.createElement("li");
                    liGo.classList.add("go");

                    var button = document.createElement("button");
                    button.classList.add("goBtn");
                    button.type = "button";
                    button.textContent = "메세지 보내기";
                    button.onclick = function () {
                        goRoom(d.chatRoom.se_user, d.chatRoom.re_user, room_id, rn);
                    };

                    liGo.appendChild(button);
                    ul.appendChild(liId);
                    ul.appendChild(liRoom);
                    ul.appendChild(liGo);
                    roomList.appendChild(ul);
                }
            });
        }
    }

    function commonAjax(url, parameter, type, calbak, contentType) {
        $.ajax({
            url: url,
            data: parameter,
            type: type,
            contentType: contentType != null ? contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function (res) {
                calbak(res);
            },
            error: function (err) {
                console.log('error');
                calbak(err);
            }
        });
    }    </script>
    <style>
        .chat_list {
            border: 1px solid #c9c9c9;
            border-radius: 20px;
            margin-top: 20px;
            height: 70px;
            font-size: 20px;
            padding-top: 17px;
            padding-right: 30px;
        }

        .go {
            float: right;
        }

        .goBtn {
            border-radius: 20px;
            height: 50px;
            background-color: #B0CC69;
            color: white;
            margin-top: -7px;
            padding: 10px;
        }

        .chat-message-sent {
            text-align: right;
            padding: 5px 10px;
            border-radius: 10px;
            margin: 5px 0;
        }

        .sent2 {
            background-color: #EBEBEB;
            padding: 5px 10px;
            border-radius: 10px;
            margin: 5px 0;
        }

        .chat-message-received {
            text-align: left;
            padding: 5px 10px;
            border-radius: 10px;
            margin: 5px 0;
        }

        .received2 {
            background-color: rgba(176, 204, 105, 0.5);
            padding: 5px 10px;
            border-radius: 10px;
            margin: 5px 0;
        }

        .rec_date {
            color: #585858;
            text-align: right;
            margin-top: -10px;
            margin-right: 13px;
        }
    </style>
</head>
<body>
<%@include file="../header/user_header.jsp"%>
    <input type="hidden" id="hiddenUserId" value="${sessionScope.userId}" />
    <div class="middle">
        <p class="middle_p">1:1 문의</p>
    </div>

    <div class="cha_box">
        <div class="cha_list">
            <div class="cha_list_t">
                <p class="cha_list_tp">사장님들과의 쪽지</p>
            </div>
            <div>
                <div class="roomContainer">
                    <div id="roomList" class="roomList"></div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../header/footer.jsp" flush="true" />

</body>
</html>
<!-- ex.jsp -->
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


<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path}/assets/css/vendor.css">
<link rel="stylesheet" href="${path}/assets/css/style.css">


<script type="text/javascript">

function enterChatRoomAndRedirect(se_user, re_user) {
    $.ajax({
        url: "${path}/enterChatRoom", // Updated URL
        type: "POST",
        data: { se_user: se_user, re_user: re_user },
        success: function(response) {
            var room_id = parseInt(response);
            var url = "${path}/moveChating?se_user=" + se_user + "&re_user=" + re_user + "&room_id=" + room_id;
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
<%@include file="../header/main_header.jsp"%>
</head>

<body>
<div>
    <table border="1">
        <tr>
            <th>BSN ID</th>
            <th>Room ID</th>
            <th>Room Name</th>
            <th>Room Price</th>
            <th>문의하기</th>
            
        </tr>
		<c:forEach var="room" items="${roomList}">
		    <tr>
		        <td>숙소 사장 아이디 : ${room.product.bsn_id}</td>
		        <td>방 아이디 : ${room.room.room_id}</td>
		        <td>방 이름 : ${room.room.room_name}</td>
		        <td>방 가격 : ${room.room.room_price}</td>
				<td><button onclick="enterChatRoomAndRedirect('${sessionScope.userId}','${room.product.bsn_id}')">문의하기</button></td>		    </tr>
		</c:forEach>
    </table>
</div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
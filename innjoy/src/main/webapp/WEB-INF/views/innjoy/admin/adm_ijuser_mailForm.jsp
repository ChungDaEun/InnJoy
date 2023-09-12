<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!-- 헤더 -->
<%@ include file="../header/adm_header.jsp"%>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good day!!</title>

<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style type="text/css">
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $("#sendBtn").click(function(event) {
            event.preventDefault(); 

            var mailData = {
                receiver: $("#receiver").val(),
                title: $("#title").val(),
                content: $("#content").val()
            };

            $.ajax({
                type: "POST",
                url: "${path}/admin/ijuser_mailSend", 
                contentType: "application/json",
                data: JSON.stringify(mailData),
                success: function(response) {
                    alert(response); 
                    window.location.href = "${path}/admin/ijuser";
                },
                error: function(xhr, status, error) {
                    alert("오류 발생: " + xhr.responseText);
                }
            });
        });
    });
</script>
</head>
<body>
<div class="jumbotron text-center" style="padding: 35px 5px 10px 5px;">
	<h2>메일전송</h2>
	
</div>
<div class="container" class="container-fluid px-4">
	<form>
		<div class="input-group mb-3">	
			<div class="input-group-prepend ">
				<span class="input-group-text  justify-content-center">
					수신자</span>
			</div>
			<input type="text" class="form-control"
				value="${user.user_name}" readonly/>
		</div>
		<div class="input-group mb-3">	
			<div class="input-group-prepend ">
				<span class="input-group-text  justify-content-center">
					수신 메일주소</span>
			</div>
			<input type="text" name="receiver" class="form-control" id="receiver"
				value="${user.email}" readonly/>
		</div>	
		<div class="input-group mb-3">	
			<div class="input-group-prepend ">
				<span class="input-group-text  justify-content-center">
					발신 메일주소</span>
			</div>
			<!-- 메일 발신 서버 계정으로 발신처리된다. SMTP 등록계정 -->
			<input value="padid78111@gmail.com" 
				type="text" class="form-control" readonly/>
		</div>			
		<div class="input-group mb-3">	
			<div class="input-group-prepend ">
				<span class="input-group-text  justify-content-center">
					제목</span>
			</div>
			<input type="text" name="title" class="form-control" id="title" 
				placeholder="[innjoy]입니다"/>
		</div>
		<div class="input-group mb-3">	
			<div class="input-group-prepend ">
				<span class="input-group-text  justify-content-center">
					내용</span>
			</div>
			<textarea rows="10" cols="" id="content"
				 name="content" class="form-control"
				 placeholder="안녕하세요,고객님. [innjoy]입니다"
				></textarea>
		</div>				
		<div style="text-align:right;">
			<input type="button" class="btn btn-success" 
				value="메일전송" id="sendBtn"/>		
		</div>	
	</form>	
	
</div>   
<%@ include file="../header/footer.jsp"%>

</body>
</html>
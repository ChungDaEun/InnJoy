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
	<link rel="stylesheet" href="${path}/buser/buser.css" >
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>InnJoy</title>
   
	<script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    
</head>
<body>
	<jsp:include page="../header/buser_header.jsp" flush="true"/> <%-- 공통 상단바 --%>
	
	<div class = "middle">
		<p class = "middle_p">마이페이지</p>
	</div>
	<script type="text/javascript">
			// 유효성
				function modify_check() {
					var bsnPhone = $("#bsnPhone").val()
					var bsnEmail = $("#bsnEmail").val()
					if (bsnPhone == "") {
						alert("전화번호를 입력하세요.");
						$("#bsnPhone").focus()
					} else if (bsnEmail == "") {
						alert("이메일을 입력하세요.");
						$("#bsnEmail").focus()
					} else {
						modify();
						console.log("수정 함수 실행")
					}
				}
								
				// 회원가입
				function modify() {
					var bsnData = {
					        bsnId: $("#bsnId").val(),
					        bsnEmail: $("#bsnEmail").val(),
					        bsnPhone: $("#bsnPhone").val(),
					};
					$.ajax({
						type : "put",
						url : "/sec/try/update_bsn",
						data: JSON.stringify(bsnData), // 폼 데이터를 배열 형태로 직렬화한 후 JSON 문자열로 변환
				        contentType: "application/json; charset=utf-8", // JSON 형태의 데이터를 본문으로 보낸다고 명시
						success : function(rs) {
							alert("개인정보 수정 성공")
							location.href="/sec/bsn_acc";
						},
						error : function(err) {
							console.log(err)
						}

					})
				}
		</script>
<form id="bsnFrom">
	<div class = "acc">
		<div class = "acc_box">
			<div><img class = "acc_img" 
				src = "${path}/assets/img/seoul-signiel.jpg"></div>
			<div class = "acc_inf">
				<ul>
					<li class = "acc_inf_t">계정 정보</li><br>
					<input type="hidden"  id="bsnId" name="bsnId" value="${bsnInfo.bsnId}"/>
					<li class = "acc_inf_d">아이디: ${bsnInfo.bsnId}</li><br>
					<li class = "acc_inf_d">상호(법인명): ${bsnInfo.bsnName}</li><br>
					<li class = "acc_inf_d">성명(대표자): ${bsnInfo.ceoName}</li><br>
					<li class = "acc_inf_d">사업자 번호: ${bsnInfo.bsnNumber}</li><br>
					<li><input type = "text" class = "acc_inp"  id="bsnPhone" name="bsnPhone"
						value="${bsnInfo.bsnPhone}"></li><br>
					<li><input type = "text" class = "acc_inp2"  id="bsnEmail" name="bsnEmail"
						value="${bsnInfo.bsnEmail}"></li>
				</ul>
				
			</div>
		</div>
	</div>
	<br>
	<div class = "acc_btn_d2">
		<button type="button" onclick="modify_check()" class = "acc_btn2">저장</button>
	</div>
</form>
	
	<jsp:include page="../header/footer.jsp" flush="true"/>
</body>
</html>
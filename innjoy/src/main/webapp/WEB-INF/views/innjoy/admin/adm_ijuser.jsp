<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="../header/adm_header.jsp"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Tables - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${path}/adminst/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
			<div class="container" class="container-fluid px-4">
				<h1 class="mt-4">일반 회원 목록</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">회원관리</li>
					<li class="breadcrumb-item active">일반 회원 목록</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">전체 일반 회원을 회원을 조회, 메일링 및 탈퇴 처리할 수 있습니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 일반 회원 목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>탈퇴</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>탈퇴</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="ijuser" items="${userList}">
									<tr>
										<td>${ijuser.user_id}</td>
										<td>${ijuser.user_name}</td>
										<td>${ijuser.user_phone}</td>
										<td><a
											href="${path}/admin/ijuser_mailForm?user_id=${ijuser.user_id}">${ijuser.email}
										</a></td>
										<td>${ijuser.n_name}</td>
										<td><input type="button" class="adminBan" value="탈퇴"
											name="삭제" onclick="userBan('${ijuser.user_id}')" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<script type="text/javascript">
							function userBan(id) {
								if (confirm("아이디 : " + id + " 을 탈퇴처리 하시겠습니까?")) {
									location.href = "${path}/userBan?user_id="
											+ id
								}
							}
						</script>
					</div>
				</div>
			</div>
		</main>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/adminst/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/adminst/js/datatables-simple-demo.js"></script>

	<%@ include file="../header/footer.jsp"%>
</body>
</html>
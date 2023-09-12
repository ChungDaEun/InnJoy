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
			<div class="container-fluid px-4"
				style="margin-left: 270px; width: 1200px;">
				<h1 class="mt-4">사업자 회원 탈퇴</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">회원관리</a></li>
					<li class="breadcrumb-item active">사업자 회원 탈퇴 처리</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">탈퇴처리를 진행할 수 있습니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 사업자 회원 목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>아이디</th>
									<th>상호명</th>
									<th>사업자 번호</th>
									<th>탈퇴처리</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>아이디</th>
									<th>상호명</th>
									<th>사업자 번호</th>
									<th>탈퇴처리</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="bsnuser" items="${bsnList}">
									<tr >
										<td>${bsnuser.bsn_id}</td>
										<td>${bsnuser.bsn_name}</td>
										<td>${bsnuser.bsn_number}</td>
										<td>
										<input type="button" class="adminBan" value="탈퇴" name="삭제"
											onclick="userBan('${bsnuser.bsn_id}')"/>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</main>
	</div>
	</div>
	<script type="text/javascript">
		function userBan(id) {
			if(confirm("아이디 : "+id+" 을 탈퇴처리 하시겠습니까?")){
				location.href = "${path}/bsnuserBan?bsn_id=" + id
		    }
		}
	</script>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="../header/user_header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<style>
body {
	min-height: 100vh;
}
table{
	margin-top:30px;
	margin-bottom:30px;
	font-family: "Roboto", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}

.ndbutton-container {
	margin-bottom: 1rem;
	overflow: hidden;
}

</style>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#goMain").click(function() {
			location.href = "${path}/notice"
		})
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th width="10%">제목</th>
							<th width="90%">${notice.n_title}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>작성일</td>
							<td>${notice.regdate}<span style='float:right'>조회수:${notice.readcnt}</span></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<pre>${notice.n_content}</pre>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><c:forEach var="fname"
										items="${notice.fnames}">
										<button onclick="download('${fname}')" type="button"
											class="btn btn-outline-info">${fname}</button>
									</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function download(fname) {
			if (confirm(fname + " 다운로드 하시겠습니까?")) {
				location.href = "${path}/download?fname=" + fname
			}
		}
	</script>

	<!-- 헤더 -->
	<%@ include file="../header/footer.jsp"%>
</body>
</html>
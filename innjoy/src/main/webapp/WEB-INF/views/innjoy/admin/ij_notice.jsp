<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="../header/user_header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>innjoy</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style>
td {
	text-align: center;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${path}/adminst/css/styles.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<style>
#regBtn {
	width: 200px;
	height: 30px;
	color: white;
	background-color: #B0CC69;
	border: none;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
	float: right;
}
</style>
</head>

<body>
	<div class="container">
		<div style="margin: 15pt;">
			<h2 class="section-heading">공지사항</h2>
		</div>
		<script type="text/javascript">
			function ckSearch() {
				var n_title = "${sch.n_title}"
				var n_titleVal = $("[name=n_title]").val()
				if (n_title != n_titleVal)
					$("[name=curPage]").val("1")

			}
		</script>
		<form id="frm01" onSubmit="ckSearch()" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
				<span class="input-group-text mr-sm-2">총 : ${sch.count} 건</span>
				<div class="input-group">
					<input name="n_title" value="${sch.n_title}" class="form-control"
						placeholder="제목" />
					<button id="searchButton" class="btn btn-success mr-sm-2">검색</button>
				</div>
				<input type="hidden" name="curPage" value="${sch.curPage}" /> <select
					name="pageSize" class="form-select col-sm-1">
					<option>3</option>
					<option>5</option>
					<option>10</option>
					<option>20</option>
					<option>50</option>
				</select>
			</nav>
		</form>
		<script type="text/javascript">
			$("[name=pageSize]").val("${sch.pageSize}")
			$("[name=pageSize]").change(function() {
				$("[name=curPage]").val("1")
				$("#frm01").submit()
			})
			function goPage(cnt) {
				$("[name=curPage]").val(cnt)
				$("#frm01").submit()
			}
		</script>

		<table class="table">
			<col width="20%">
			<col width="50%">
			<col width="20%">
			<col width="10%">
			<thead>
				<tr class="table-success text-center">
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty noticeList}">
						<c:forEach var="notice" items="${noticeList}">
							<tr ondblclick="detail(${notice.no})">
								<td>${notice.cnt}</td>
								<td class="text-left"><c:if test="${notice.level>1}">
										<c:forEach begin="2" end="${notice.level}">
    									&nbsp;&nbsp;&nbsp;
    							</c:forEach>
									</c:if> ${notice.n_title}</td>
								<td><fmt:formatDate value="${notice.regdate}" /></td>
								<td>${notice.readcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" class="text-center">해당하는 게시물이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<script type="text/javascript">
			function detail(no) {
				location.href = "${path}/noticeDetail?no=" + no
			}
		</script>
		<ul class="pagination justify-content-end">
			<li class="page-item"><a class="page-link"
				href="javascript:goPage(${sch.startBlock-1})">Previous</a></li>
			<c:forEach var="cnt" begin="1" end="${sch.endBlock}">
				<li class="page-item ${sch.curPage==cnt?'active':''}"><a
					class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link"
				href="javascript:goPage(${sch.endBlock+1})">Next</a></li>
		</ul>
	</div>
	<%@ include file="../header/footer.jsp"%>
</body>
</html>
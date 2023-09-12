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

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- 구글 차트 Api -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" href="${path}/assets/css/admin_user.css">
<title>어드민 게시글</title>
<!-- all css -->
<style>
</style>

</head>
<body>

	<div>
		<jsp:include page="../header/adm_header.jsp" flush="true" />
		<div class="member">
			<!-- 이름 & 아이디로 서치 -->
			<div class="title">
				<h2>일반회원 목록</h2>
			</div>
			<form style="float: right;">
				<input type="text" style="margin-left: 200px;"
					search_input" placeholder="id로 검색하세요" name="search" size="30">
				<button type="submit" style="margin-right: 100px;"
					class="search_onclick_submit">검색</button>
			</form>

			<div class="member_list">
				<table class="admin_board_wrap">
					<tbody class="admin_boardList">
						<th class="admin_board_head">No</th>
						<th class="admin_board_head">아이디</th>
						<th class="admin_board_head">이름</th>
						<th class="admin_board_head">이메일</th>
					</tbody>
					<tbody>
						<tr class="admin_board_content">
							<td class="admin_board_content_nm">1</td>
							<td class="admin_board_content_nm"><a href="#"
								class="mypageModal">himan</a></td>
							<td class="admin_board_content_nm">홍길동</td>
							<td class="admin_board_content_nm">hong@gmail.com</td>
						</tr>
						<tr class="admin_board_content">
							<td class="admin_board_content_nm">1</td>
							<td class="admin_board_content_nm"><a href="#"
								class="mypageModal">himan</a></td>
							<td class="admin_board_content_nm">홍길동</td>
							<td class="admin_board_content_nm">hong@gmail.com</td>
						</tr>
						<tr class="admin_board_content">
							<td class="admin_board_content_nm">1</td>
							<td class="admin_board_content_nm"><a href="#"
								class="mypageModal">himan</a></td>
							<td class="admin_board_content_nm">홍길동</td>
							<td class="admin_board_content_nm">hong@gmail.com</td>
						</tr>

					</tbody>
				</table>


				<!-- 회원관리 모달 -->
				<div class="mypage_modal">
					<div class="service_box">
						<div class="mem_box_inner">
							<div class="mypage">
								<div class="mypage_form">
									<h3>홍길동님의 회원정보</h3>
									<div class="insert">
										<!--이름-->
										<div class="name_box">
											&nbsp;
											<p class="passage">이름</p>
											<input type="text" name="name" readonly value="홍길동"><br>
										</div>
										<!--아이디-->
										<div class="id_box">
											&nbsp;
											<p class="passage">아이디</p>
											<input type="text" name="id" readonly value="himan"><br>

										</div>
										<!--비밀번호-->
										<div class="pw_box">
											&nbsp;
											<p class="passage">비밀번호</p>
											<input type="password" name="pw" readonly value="7777"><br>

										</div>
										<!--전화번호-->
										<div class="tel_box">
											&nbsp;
											<p class="passage">전화번호</p>
											<input type="tel" name="phone" readonly value="010-1111-1111"><br>
										</div>

										<!--이메일-->
										<div class="tel_box">
											&nbsp;
											<p class="passage">이메일</p>
											<input type="text" name="e-mail" readonly
												value="hong@gmail.com"><br>
										</div>
										<!--현재 상태 구분-->
										<div class="job_box">
											&nbsp;
											<p class="passage">회원 유형</p>
											&nbsp;&nbsp;<span id="job-stat">일반 회원</span>
										</div>

									</div>
									<div class="close_btn">
										<button class="close">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			// 모달 스크립트 
			$(function() {
				$('.mypageModal').click(function() {
					$('.mypage_modal').fadeIn();
				});
				$('.close').click(function() {
					$('.mypage_modal').fadeOut();
				});
			});

			//검색
			$('.search_onclick_submit').click(function() {
				alert('검색')
				location.href = "" + "검색어 이름" + "" + "검색어 아이디";
			});
			// 엔터키누를시 검색버튼 눌리기
			$('.search-input').keypress(function(e) {
				if (e.keyCode == 13) {
					//실행할 function작성
					alert("엔터시 검색");
				}
			});
		</script>

		<jsp:include page="../header/footer.jsp" flush="true" />
	</div>
</body>
</html>
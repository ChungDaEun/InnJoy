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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sbudeobyvn&submodules=geocoder"></script>


<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path}/assets/css/vendor.css">
<link rel="stylesheet" href="${path}/assets/css/style.css">
<style type="text/css">
input[type=radio] {
	display: none;
}

input[type=radio]+label {
	display: inline-block;
	cursor: pointer;
	height: 50px;
	width: 130px;
	border: 1px solid #869c51;
	line-height: 50px;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
}

input[type=radio]+label {
	background-color: #fff;
	color: #869c51;
}

input[type=radio]:checked+label {
	background-color: #869c51;
	color: #fff;
}

#joinBox input, #joinBox button, #profile_info {
	font-size: 10pt;
}

#joinBox button {
	background-color: #869c51;
	color: #fff;
}

#title {
	margin-bottom: 150px;
	font-size: 18pt;
}

.joinForm {
	padding-top: 20px;
}

.card-img-top{
	height: 110px !important;
	width: 110px !important;
}

a.list-group-item{
	border: none;
}

#uptBtn, #delBtn{
	width: 80px !important;
}

#nav-review-tab.active, #nav-board-tab.active, #nav-reple-tab.active{
	color: #fff !important;
	background-color: #869c51 !important;
}

#sidenav{
	width: 20rem;
}
.list-group-item{
	width: 764px !important;
	height: 86px !important;
}
#textArea, #reviewDet2{
	height: 10rem;
	resize: none;
}
#detail {
	height: 17rem;
	resize: none;
}
#selectNtitle{
	height: 5rem;
}
</style>
<%@include file="../header/user_header.jsp"%>
</head>

<body>
	<div class="d-flex align-items-start justify-content-center">
		<div class="p-5" id="sidenav">
			<div class="pb-2">
				<span id="title">활동내역</span>
			</div>
			<nav id="nav" class="w-100">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a class="nav-item nav-link active" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
						aria-controls="nav-review" aria-selected="true">나의 후기</a>
					<a class="nav-item nav-link" id="nav-board-tab" data-toggle="tab" href="#nav-board" role="tab"
						aria-controls="nav-board" aria-selected="true">나의 게시물</a>
					<a class="nav-item nav-link" id="nav-reple-tab" data-toggle="tab" href="#nav-reple" role="tab"
						aria-controls="nav-reple" aria-selected="true">나의 댓글</a>
				</div>
			</nav>
		</div>
		<!-- Outer Row -->
		<div class="tab-content mt-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
						<div class="container px-4 px-lg-5">
							<div class="row justify-content-center">
							<c:forEach var="reservation" items="${rlist}">
								<!-- review 있을 때만 출력 -->
								<c:if test="${not empty reservation.review}">
									<div class="col mb-3">
										<div class="d-flex flex-row card w-100">
											<!-- Product image-->
											<img class="card-img-top" src="${path}/assets/img/bsn/${reservation.review.reviewImg.get(0).fname}" alt="..." />
											<!-- Product details-->
											<a href="#" class="list-group-item list-group-item-action" aria-current="true">
											    <div class="d-flex w-100 justify-content-between">
											      <h5 class="fw-bolder pt-3 mb-1">${reservation.room.product.proName}</h5>
											      <small>${recomm.recomTime }</small>
											    </div>
											    <p class="mb-1">${reservation.review.reviewDet}</p>
											</a>
											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center pt-2 d-flex">
													<a id="uptBtn" class="btn btn-outline-success mt-auto" onclick="viewDetailReview(${reservation.review.reviewId})"
														data-bs-toggle="modal" data-bs-target="#uptReview">수정</a>
													<a id="delBtn" class="btn btn-outline-warning mt-auto" onclick="deleteReview(${reservation.review.reviewId})">삭제</a>
												</div>
											</div>
										</div>
									</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
				</div>
				<script type="text/javascript">
					function deleteReview(reviewId){
						if(confirm("후기를 삭제하시겠습니까?")) {
							$.ajax({
								type : "delete",
								url : "/try/delete/review",
								data : "reviewId=" +reviewId,
								dataType : "text",
								success : function(rs) {
									if (rs == "success") {
										alert("후기를 삭제하였습니다.")
										location.href="/sec/myboardlist"
									} else if (rs == "fail"){
										alert("삭제 실패. 관리자에게 문의하세요.")
										location.href = "/sec/myboardlist"
									} else {
										alert("error: 관리자에게 문의하세요.")
									}
								},
								error : function(err) {
								console.log(err)
								}
							})
						}
					}
				// 후기 수정
				function uptReview(){
					var reviewFrm = new FormData($('#reviewFrm')[0]);
					$.ajax({
						 type: "POST",
						 url : "/try/update/review",
					     data: reviewFrm,
					     processData: false,
					     contentType: false,
					     success : function(rs) {
							if (rs == "success") {
								alert("후기를 수정하였습니다.")
								location.href = "/sec/myboardlist"
							} else if (rs == "fail"){
								alert("수정 실패. 관리자에게 문의하세요.")
								location.href = "/sec/myboardlist"
							} else {
								alert("error: 관리자에게 문의하세요.")
							}
						},
						error : function(err) {
							console.log(err)
						}
					})
				}
				// 후기 조회
				function viewDetailReview(reviewId){
					$.ajax({
						type : "post",
						url : "/read/reviewDetail",
						data : "reviewId=" + reviewId,
						dataType :"text",
						success : function(rs) {
							var review = JSON.parse(rs);	// 문자열로 받은 json데이터를 json 타입으로 변환
							var resDate = review.startDte +"~"+review.endDte
							console.log("star: "+review.star)
							$("#reservationId2").val(review.reservationId);
							$("#reviewId2").val(review.reviewId);
							$("#proName2").val(review.proName);
							$("#roomName2").val(review.roomName);
							$("#resDate2").val(resDate);
							$("#star2").val(review.star).prop("selected", true)
							$("#reviewDet2").text(review.reviewDet);
						},
						error : function(err) {
						console.log(err)
						}
					})
				}
				</script>
				<div class="tab-pane fade" id="nav-board" role="tabpanel" aria-labelledby="nav-board-tab">
					<div class="container px-4 px-lg-5">
							<div class="row justify-content-center">
								<c:forEach var="reservation" items="${rlist}">
								<c:forEach var="recomm" items="${reservation.recomm}">
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product image-->
										<img class="card-img-top" src="${path}/assets/img/bsn/${recomm.boardImg.get(0).fname}" alt="..." />
										<!-- Product details-->
										
										<a href="#" class="list-group-item list-group-item-action pl-5 ml-3" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-3 mb-1">${recomm.title }</h5>
										      <small>${recomm.recomTime }</small>
										    </div>
										    <p class="mb-1">${recomm.detail}</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0  border-top-0 bg-transparent">
											<div class="text-center pt-2 d-flex">
												<a id="uptBtn" class="btn btn-outline-success mt-auto" onclick="viewDetailRecomm(${recomm.recomId})"
													data-bs-toggle="modal" data-bs-target="#uptRecomm">수정</a>
												<a id="delBtn" class="btn btn-outline-warning mt-auto" onclick="deleteRecomm(${recomm.recomId})">삭제</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								</c:forEach>
							</div>
						</div>
				</div>
				<script type="text/javascript">
					function deleteRecomm(recommId){
						if(confirm("게시물을 삭제하시겠습니까?")) {
							$.ajax({
								type : "delete",
								url : "/try/delete/recomm",
								data : "recommId=" +recommId,
								dataType : "text",
								success : function(rs) {
									if (rs == "success") {
										alert("게시물을 삭제하였습니다.")
										location.href = "/sec/myboardlist"
									} else if (rs == "fail"){
										alert("삭제 실패. 관리자에게 문의하세요.")
										location.href = "/sec/myboardlist"
									} else {
										alert("error: 관리자에게 문의하세요.")
									}
								},
								error : function(err) {
								console.log(err)
								}
							})
						}
					}
					// 게시물 수정
 					function uptRecomm(){
						var recommFrm = new FormData($('#recommFrm')[0]);
						$.ajax({
							type: "POST",
							url : "/try/update/recomm",
						    data: recommFrm,
						    processData: false,
						    contentType: false,
						    success : function(rs) {
								if (rs == "success") {
									alert("게시물을 수정하였습니다.")
									location.href = "/sec/myboardlist"
								} else if (rs == "fail"){
									alert("수정 실패. 관리자에게 문의하세요.")
									location.href = "/sec/myboardlist"
								} else {
									alert("error: 관리자에게 문의하세요.")
								}
							},
							error : function(err) {
								console.log(err)
							}
						})
					}
					// 게시물 조회
					function viewDetailRecomm(recommId){
						$.ajax({
							type : "post",
							url : "/read/recommDetail",
							data : "recommId=" + recommId,
							dataType :"text",
							success : function(rs) {
								var recomm = JSON.parse(rs);	// 문자열로 받은 json데이터를 json 타입으로 변환
								console.log(recomm);
								$("#reservationId3").val(recomm.reservaitonId);
								$("#recommId").val(recomm.recomId);
								$("#proName3").text(recomm.proName);
								$("#recommtype").val(recomm.recommType).prop("selected", true);
								$("#title2").val(recomm.title);
								$("#search").val(recomm.recomLoc);
								$("#address").val(recomm.recomLoc);
								$("#recomLoc").val(recomm.recomLoc);
								$("#latitude").val(recomm.latitude);
								$("#longitude").val(recomm.longitude);
								$("#detail").text(recomm.detail);
							},
							error : function(err) {
							console.log(err)
							}
						})
					}
				</script>
				<div class="tab-pane fade" id="nav-reple" role="tabpanel" aria-labelledby="nav-reple-tab">
					<div class="container px-4 px-lg-5">
							<div class="row justify-content-center">
								<c:forEach var="comment" items="${comments}">
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action pl-5 ml-3" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-2 mb-1">${comment.recomm.title}</h5>
										      <small>${recomm.recomTime }</small>
										    </div>
										    <p class="mb-1">${comment.rcComDet }</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" onclick="deleteComm(${comment.rcComId})">삭제</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								</div>
							</div>
						</div>
				<script type="text/javascript">
					function deleteComm(commId){
						if(confirm("댓글을 삭제하시겠습니까?")) {
							$.ajax({
								type : "delete",
								url : "/try/delete/comm",
								data : "commId=" +commId,
								dataType : "text",
								success : function(rs) {
									if (rs == "success") {
										alert("댓글을 삭제하였습니다.")
									} else if (rs == "fail"){
										alert("삭제 실패. 관리자에게 문의하세요.")
										location.href = "/sec/myboardlist"
									} else {
										alert("error: 관리자에게 문의하세요.")
									}
								},
								error : function(err) {
								console.log(err)
								}
							})
						}
					}
				</script>
				</div>
			</div>
<!--  리뷰 수정 modal -->
	<div class="modal fade" id="uptReview" tabindex="-1"
		aria-labelledby="findIdModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 수정하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<!-- Outer Row -->
						<div class="row justify-content-center">
							<div class="col-xl-12 col-lg-12 col-md-9" id="joinBox">
								<div class="card o-hidden border-0 my-5">
									<div class="card-body p-0">
										<div class="pl-5 pr-5">
											<form enctype="multipart/form-data" id="reviewFrm">
											<input type="hidden" id="reviewId2" name="reviewId"/>
											<input type="hidden" id="reservationId" name="reservationId" value="0"/>
											<div class="form-group">
												<label>숙소명</label> <input type="text"
													class="form-control form-control-user" id="proName2"
													value="" readonly>
											</div>
											<div class="form-group">
												<label>객실명</label> <input type="text"
													class="form-control form-control-user" id="roomName2"
													value="" readonly>
											</div>
											<div class="form-group">
												<label>예약일자</label> <input type="text"
													class="form-control form-control-user" id="resDate2"
													value="" readonly>
											</div>
											<div class="form-group">
											<label>평점</label>
												<select class="form-select" aria-label="Default select example" id="star2" name="star">
												  <option selected>선택</option>
												  <option value="5">5</option>
												  <option value="4">4</option>
												  <option value="3">3</option>
												  <option value="2">2</option>
												  <option value="1">1</option>
												</select>
											</div>
											<div class="form-group">
												<label>후기 내용</label>
												<textarea class="form-control form-control-user"  id="reviewDet2" name="reviewDet"></textarea>
											</div>
											<div class="form-group">
												<label>사진첨부</label>
												<input type="file" class="form-control form-control-user" id="img" name="report" multiple="multiple">
											</div>
											<div class="form-group"></div>
											<button type="button" onclick="uptReview()"
													class="btn btn-outline-success btn-block mt-5" id="modBtn">후기 작성</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>
	<!--  게시물 상세 modal -->
	<div class="modal fade" id="uptRecomm" tabindex="-1"
		aria-labelledby="reviewFormModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">추천 게시물 작성하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-12 col-lg-12 col-lg-9 col-mt-10" id="joinBox">
				<div class="card o-hidden border-0 shadow-sm my-5">
					<div class="card-body p-4 justify-content-center">
						<form enctype="multipart/form-data" id="recommFrm">
							<input type="hidden" id="reservationId3" name="reservationId" value="0" />
							<input type="hidden" id="recommId" name="recomId" value="0" />
							<div class="form-group">
								<div
									class="card o-hidden m-3 border-0 shadow-sm my-5 rounded-pill">
									<div class="ml-5 mt-4 mb-3">
										<h3 class="justify-content-center" id="proName3">숙소명</h3>
									</div>
								</div>
							</div>
							<div class="form-group p-0 d-flex justify-content-center" id="selectNtitle">
								<div>
									<label>유형</label>
									<select class="form-select" aria-label="Default select example" name="recommType">
										<option selected>선택</option>
										<option value="맛집">맛집</option>
										<option value="관광명소">관광명소</option>
										<option value="사진명소">사진명소</option>
									</select>
								</div>
								<div class="pl-2 pr-5 w-75">
									<label>제목</label> <input type="text"
										class="form-control form-control-user" id="title2" name="title"
										value="" placeholder="제목을 입력하세요.">
								</div>
							</div>

							<div class="pl-5 ml-1 d-flex w-50 justify-content-center">
								<input type="text" class="form-control form-control-user w-75"
									id="search" placeholder="위치를 입력하세요."> 
								<input type="button" class="btn btn-outline-success ml-3"
									id="searchBtn" value="검색">
							</div>
							<div class="pt-2 pb-2 ml-3 d-flex w-50 justify-content-center">
								<input type="text" class="form-control form-control-user w-75" id="address" value="" readonly/>
							</div>
							<div class="pl-5 pr-5 pb-5 pt-2 d-flex justify-content-center">
								<br>
								<div id="map" style="width: 50%; height: 400px;"></div>
								<div class="d-block">
									<input type="hidden" id="recomLoc" name="recomLoc" value="" />
									<input type="hidden" id="latitude" name="latitude" value="" />
									<input type="hidden" id="longitude" name="longitude" value="" />
								</div>

								<div class="pl-5 pr-5">

									<input type="hidden" id="reservationId" name="reservationId"
										value="" /> <input type="hidden" id="roomId" name="roomId"
										value="" />

									<div class="form-group">
										<label>게시물 내용</label>
										<textarea class="form-control form-control-user" id="detail"
											name="detail"></textarea>
									</div>
									<div class="form-group">
										<label>사진첨부</label> <input type="file"
											class="form-control form-control-user" id="img" name="report"
											multiple="multiple">
									</div>
									<div class="form-group"></div>
									<button type="button" onclick="uptRecomm()"
										class="btn btn-outline-success btn-block mt-5" id="writeRecomm">게시물 작성</button>
								</div>
								<script type="text/javascript">
									//지도를 그려주는 함수 실행
									selectMapList();

									//검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
									function searchAddressToCoordinate(search) {
										naver.maps.Service.geocode({
															query : search
										},
										function(status, response) {
											if (status === naver.maps.Service.Status.ERROR) {
												return alert('Something Wrong!');
											}
											if (response.v2.meta.totalCount === 0) {
												return alert('올바른 주소를 입력해주세요.');
											}
											var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(item.x,item.y);
											if (item.roadAddress) {
												htmlAddresses.push('[도로명 주소] '+ item.roadAddress);
											}
											if (item.jibunAddress) {
												htmlAddresses.push('[지번 주소] '+ item.jibunAddress);
											}
											if (item.englishAddress) {
												htmlAddresses.push('[영문명 주소] '+ item.englishAddress);
											}
											insertAddress(
												item.roadAddress,item.x,item.y);
										});
									}
									// 주소 검색
									$('#address').on('keydown',function(e) {
										var keyCode = e.which;
										if (keyCode === 13) { // Enter Key
											searchAddressToCoordinate($('#search').val());
										}
									});
									$('#searchBtn').on('click',function(e) {
										e.preventDefault();
										searchAddressToCoordinate($('#search').val());
									});
									naver.maps.Event.once(map, 'init_stylemap', initGeocoder);

									//검색된 정보를 input box에 할당하고, 지도에 핀 찍는 함수
									function insertAddress(address, latitude,longitude) {
										$('#address').val(address);
										$('#recomLoc').val(address);
										$('#latitude').val(latitude);
										$('#longitude').val(longitude);

										var map = new naver.maps.Map('map', {
											center : new naver.maps.LatLng(
													longitude, latitude),
											zoom : 14
										});
										var marker = new naver.maps.Marker({
											map : map,
											position : new naver.maps.LatLng(
													longitude, latitude),
										});
									}

									//지도를 그려주는 함수
									function selectMapList() {

										var map = new naver.maps.Map('map', {
											center : new naver.maps.LatLng(
													37.3595704, 127.105399),
											zoom : 10
										});
									}

									// 지도를 이동하게 해주는 함수
									function moveMap(len, lat) {
										var mapOptions = {
											center : new naver.maps.LatLng(len,
													lat),
											zoom : 15,
											mapTypeControl : true
										};
										var map = new naver.maps.Map('map',
												mapOptions);
										var marker = new naver.maps.Marker({
											position : new naver.maps.LatLng(
													len, lat),
											map : map
										});
									}
								</script>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
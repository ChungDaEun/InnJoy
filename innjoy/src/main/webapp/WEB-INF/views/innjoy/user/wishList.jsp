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
<link rel="stylesheet" href="${path}/buser/buser.css">



<%@include file="../header/user_header.jsp"%>
</head>

<body>
    <div class="middle">
        <p class="middle_p">찜 목록</p>
    </div>
    <div class="log_sel" style = "margin-left:20%; width:60%">
    							<c:forEach items="${wishProList}" var="pro">
								<div class="col mb-5" style = "width:20%; height:5%;">
									<div class="card h-100">
										<!-- Product image-->
										<img class="card-img-top"
											src="${path}/img/${pro.pro_img.pfname}"
											alt="..."
											style = "width:100%; height:80%">
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">${pro.product.pro_name}</h5>
												<!-- Product loc-->
												${pro.product.pro_loc}
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto"
													href="${path}/product_detail?pro_id=${pro.product.pro_id}&start_dt=&end_dt=&user_cnt=">View Details</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
    </div>

<%@ include file="../header/footer.jsp" %>  
</body>
</html>
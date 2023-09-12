<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
   value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>숙소 메인</title>
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="meta description">
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <!-- all css -->
    <style>
        :root {
            --primary-color: #00234D;
            --secondary-color: #F76B6A;

            --btn-primary-border-radius: 0.25rem;
            --btn-primary-color: #fff;
            --btn-primary-background-color: #00234D;
            --btn-primary-border-color: #00234D;
            --btn-primary-hover-color: #fff;
            --btn-primary-background-hover-color: #00234D;
            --btn-primary-border-hover-color: #00234D;
            --btn-primary-font-weight: 500;

            --btn-secondary-border-radius: 0.25rem;
            --btn-secondary-color: #00234D;
            --btn-secondary-background-color: transparent;
            --btn-secondary-border-color: #00234D;
            --btn-secondary-hover-color: #fff;
            --btn-secondary-background-hover-color: #00234D;
            --btn-secondary-border-hover-color: #00234D;
            --btn-secondary-font-weight: 500;

            --heading-color: #000;
            --heading-font-family: 'Poppins', sans-serif;
            --heading-font-weight: 700;

            --title-color: #000;
            --title-font-family: 'Poppins', sans-serif;
            --title-font-weight: 400;

            --body-color: #000;
            --body-background-color: #fff;
            --body-font-family: 'Poppins', sans-serif;
            --body-font-size: 14px;
            --body-font-weight: 400;

            --section-heading-color: #000;
            --section-heading-font-family: 'Poppins', sans-serif;
            --section-heading-font-size: 48px;
            --section-heading-font-weight: 600;

            --section-subheading-color: #000;
            --section-subheading-font-family: 'Poppins', sans-serif;
            --section-subheading-font-size: 16px;
            --section-subheading-font-weight: 400;
        }
        #btn{
           background-color: #869c51;
           border :#869c51;
         color: #fff;
        }
    </style>

    <link rel="stylesheet" href="assets/css/vendor.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <%@include file="../header/all_header.jsp"%>
</head>

<body>
    <div class="body-wrapper">
        
        <main id="MainContent" class="content-for-layout">
            <!-- slideshow start -->
            <div class="slideshow-section position-relative">
                <div class="slideshow-active activate-slider" data-slick='{
                    "slidesToShow": 1, 
                    "slidesToScroll": 1, 
                    "dots": true,
                    "arrows": true,
                    "responsive": [
                        {
                        "breakpoint": 768,
                        "settings": {
                            "arrows": false
                        }
                        }
                    ]
                }'>
                    <div class="slide-item slide-item-bag position-relative">
                        <img class="slide-img d-none d-md-block" src="${path}/upload/메인3.jpg" alt="slide-1">
                        <div class="content-absolute content-slide">
                            <div class="container height-inherit d-flex align-items-center justify-content-end">
                                <div class="content-box slide-content slide-content-1 py-4">
                                    <h2 class="slide-heading heading_72 animate__animated animate__fadeInUp"
                                        data-animation="animate__animated animate__fadeInUp">
                                        Inn Joy
                                    </h2>
                                    <p class="slide-subheading heading_24 animate__animated animate__fadeInUp"
                                        data-animation="animate__animated animate__fadeInUp">
                                        당신의 여행 친구 !
                                    </p>
                                    <a class="btn-primary slide-btn animate__animated animate__fadeInUp"
                                        href="collection-left-sidebar.html" id="btn"
                                        data-animation="animate__animated animate__fadeInUp">숙소 보기 ></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="slide-item slide-item-bag position-relative">
                        <img class="slide-img d-none d-md-block" src="${path}/upload/메인1.jpg"alt="slide-2">
                        <div class="content-absolute content-slide">
                            <div class="container height-inherit d-flex align-items-center justify-content-end">
                                <div class="content-box slide-content slide-content-1 py-4 text-center">
                                    <h2 class="slide-heading heading_72 animate__animated animate__fadeInUp"
                                        data-animation="animate__animated animate__fadeInUp">
                                        플러스 친구 이벤트
                                    </h2>
                                    <p class="slide-subheading heading_24 animate__animated animate__fadeInUp"
                                        data-animation="animate__animated animate__fadeInUp">
                                        지금 플러스 친구를 하면 혜택이 와르르!
                                    </p>
                                    <a class="btn-primary slide-btn animate__animated animate__fadeInUp"
                                        href="collection-left-sidebar.html"  id="btn"
                                        data-animation="animate__animated animate__fadeInUp">플러스 친구하러 가기 ></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="slide-item slide-item-bag position-relative">
                        <img class="slide-img d-none d-md-block" src="${path}/upload/메인2.jpg" alt="slide-3">
                        <div class="content-absolute content-slide">
                            <div class="container height-inherit d-flex align-items-center justify-content-center">
                                <div class="content-box slide-content slide-content-1 py-4 text-center">
                                    <h2 class="slide-heading heading_72 animate__animated animate__fadeInUp"
                                        data-animation="animate__animated animate__fadeInUp">
                                        Goodbye Summer!
                                    </h2>
                                    <p class="slide-subheading heading_24 animate__animated animate__fadeInUp"
                                        data-animation="animate__animated animate__fadeInUp">
                                        개강 전 여행을 떠나보아요!
                                    </p>
                                    <a class="btn-primary slide-btn animate__animated animate__fadeInUp"
                                        href="collection-left-sidebar.html"  id="btn"
                                        data-animation="animate__animated animate__fadeInUp">숙소 둘러보기 ></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="activate-arrows"></div>
                <div class="activate-dots dot-tools"></div>
            </div>
            <!-- slideshow end -->

            <!-- trusted badge start -->
            <div class="trusted-section mt-100 overflow-hidden">
                <div class="trusted-section-inner">
                    <div class="container">
                        <div class="row justify-content-center trusted-row">
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="trusted-badge rounded p-0">
                                    <div class="trusted-icon">
                                        <img class="icon-trusted" src="${path}/assets/img/innjoy_logo.jpg" alt="icon-1">
                                    </div>
                                    <div class="trusted-content">
                                        <h2 class="heading_18 trusted-heading">첫결제 이벤트</h2>
                                        <p class="text_16 trusted-subheading trusted-subheading-2">20% 할인</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="trusted-badge rounded p-0">
                                    <div class="trusted-icon">
                                        <img class="icon-trusted" src="${path}/assets/img/innjoy_logo.jpg" alt="icon-2">
                                    </div>
                                    <div class="trusted-content">
                                        <h2 class="heading_18 trusted-heading">반가워요 휴먼고객님!</h2>
                                        <p class="text_16 trusted-subheading trusted-subheading-2">15% 할인</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="trusted-badge rounded p-0">
                                    <div class="trusted-icon">
                                        <img class="icon-trusted" src="${path}/assets/img/innjoy_logo.jpg" alt="icon-3">
                                    </div>
                                    <div class="trusted-content">
                                        <h2 class="heading_18 trusted-heading">카드 결제시!</h2>
                                        <p class="text_16 trusted-subheading trusted-subheading-2">5% 할인</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- trusted badge end -->

            <!-- banner start -->
            <div class="grid-banner mt-100 overflow-hidden">
                <div class="collection-tab-inner mt-0">
                    <div class="container">
                        <div class="grid-container-2">
                            <a class="grid-item grid-item-1 position-relative rounded mt-0 d-flex" href="collection-left-sidebar.html"
                                data-aos="fade-right" data-aos-duration="700">
                                <img class="banner-img rounded" src="${path}/upload/샘플6.jpg" alt="banner-1">
                                <div class="content-absolute content-slide">
                                    <div class="container height-inherit d-flex">
                                        <div class="content-box banner-content p-4">
                                            <h2 class="heading_34 primary-color" style="color: black;">Inn <br>Joy!</h2>
                                            <p class="text_14 mt-2 primary-color" style="color: white;">반가워요 처음이신가요?</p>
                                            <span class="text_12 mt-4 link-underline d-block primary-color">
                                                VIEW MORE
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a class="grid-item grid-item-2 position-relative rounded mt-0 d-flex" href="collection-left-sidebar.html"
                                data-aos="fade-right" data-aos-duration="700">
                                <img class="banner-img rounded" src="${path}/upload/샘플1.jpg"  alt="banner-1">
                                <div class="content-absolute content-slide">
                                    <div class="container height-inherit d-flex justify-content-end">
                                        <div class="content-box banner-content p-4 text-end">
                                            <h2 class="heading_34 primary-color" style="color: white;">We Joy! <br>Together</h2>
                                            <p class="text_14 mt-2 primary-color" style="color: white;">친구들의 명소 추천 이야기!</p>
                                            <span class="text_12 mt-4 link-underline d-block primary-color">
                                                VIEW MORE
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a class="grid-item grid-item-3 position-relative rounded mt-0 d-flex" href="collection-left-sidebar.html"
                                data-aos="fade-left" data-aos-duration="700">
                                <img class="banner-img rounded" src="${path}/upload/샘플7.jpg"  alt="banner-1">
                                <div class="content-absolute content-slide">
                                    <div class="container height-inherit d-flex">
                                        <div class="content-box banner-content p-4">
                                            <h2 class="heading_34 primary-color" style="color: white;">신규 숙소 <br>입점 이벤트</h2>
                                            <p class="text_14 mt-2 primary-color" style="color: white;">사장님은 몰라</p>
                                            <span class="text_12 mt-4 link-underline d-block primary-color">
                                                VIEW MORE
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- banner end -->

            <!-- collection start -->
            <div class="featured-collection mt-100 overflow-hidden">
                <div class="collection-tab-inner">
                    <div class="container">
                        <div class="section-header text-center">
                            <h2 class="section-heading primary-color">숙소 둘러보기</h2>
                        </div>
                        <div class="row">
                            <c:forEach var="product" items="${mainp}">
							    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
							    
							        <div class="product-card">
							            <div class="product-card-img">
							                <a class="hover-switch" href="${path}/product_detail_all?pro_id=${product.product.pro_id}&start_dt=&end_dt=&user_cnt=">
							                    <img class="secondary-img" src="${path}/assets/img/bsn/${product.pro_img.pfname}"  alt="product-img">
							                    <img class="primary-img" src="${path}/assets/img/bsn/${product.pro_img.pfname}"alt="product-img" >
							                </a>
							                <div class="product-badge">
							                    <span class="badge-label badge-percentage rounded">${product.pro_type_id.pro_type}</span>
							                    <span class="badge-label badge-percentage rounded">${product.product.pro_loc}</span>
							                </div>
							                <div class="product-card-action product-card-action-2 justify-content-center">
							                    <a href="#" class="action-card action-wishlist">
                                                <svg class="icon icon-wishlist" width="26" height="22"
                                                    viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                        fill="#00234D" />
                                                </svg>
                                            </a>

                                            
                                        </div>
                                    </div>
                                    <div class="product-card-details">
						                <h3 class="product-card-title">
						                    <a href="${path}/product_detail?pro_id=${product.product.pro_id}">${product.product.pro_name}</a>
						                </h3>
						                <div class="product-card-price">
						                    <span class="card-price-regular">${product.room.room_price} ~</span>
						                </div>
						            </div>
						        </div>
						    </div>
						</c:forEach>
                            
                            
                            
                        </div>
                        <div class="view-all text-center" data-aos="fade-up" data-aos-duration="700">
                            <a class="btn-primary slide-btn animate__animated animate__fadeInUp" href="#">VIEW ALL</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- collection end -->

            <!-- shop by category start -->
            <div class="shop-category mt-100 overflow-hidden">
                <div class="collection-tab-inner mt-0">
                    <div class="container">
                        <div class="section-header text-center">
                            <h2 class="section-heading primary-color">Inn Joy 둘러보기</h2>
                        </div>
                        <div class="shop-category-2 shop-category-inner">
                            <div class="scattered-item" data-aos="fade-left" data-aos-duration="700">
                                <div class="scattered-wrapper">
                                    <div class="scattered-content">
                                        <img class="scattered-img" src="${path}/upload/샘플10.jpg" alt="img">
                                    </div>
                                    <div class="scattered-details">
                                        <h2 class="scattered-heading primary-color">We Joy !</h2>
                                        <a href="collection-left-sidebar.html"
                                            class="text_12 link-underline d-block primary-color mt-2">
                                            Together
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="scattered-item" data-aos="fade-right" data-aos-duration="700">
                                <div class="scattered-wrapper">
                                    <div class="scattered-content">
                                        <img class="scattered-img" src="${path}/upload/샘플9.jpg" alt="img">
                                    </div>
                                    <div class="scattered-details">
                                        <h2 class="scattered-heading primary-color">마이페이지</h2>
                                        <a href="#2" class="text_12 link-underline d-block primary-color mt-2">
                                            MyPage
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="scattered-item" data-aos="fade-left" data-aos-duration="700">
                                <div class="scattered-wrapper">
                                    <div class="scattered-content">
                                        <img class="scattered-img" src="${path}/upload/샘플12.jpg" alt="img">
                                    </div>
                                    <div class="scattered-details">
                                        <h2 class="scattered-heading primary-color">문의사항</h2>
                                        <a href="#3" class="text_12 link-underline d-block primary-color mt-2">
                                            Inquiry
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- shop by category end -->

            

            <!-- testimonial start -->
            <div class="testimonial-section mt-100 overflow-hidden home-section">
                <div class="testimonial-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5 col-md-12 col-12" data-aos="fade-right" data-aos-duration="700">
                                <div class="section-header">
                                    <h2 class="section-heading primary-color">숙소 후기</h2>
                                    <p class="section-subheading">
                                        진실된 숙소 후기만을 담았습니다. 별점 1점도 소중히 여기고 있습니다.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-6 offset-lg-1 col-md-12 col-12" data-aos="fade-left"
                                data-aos-duration="700">
                                <div class="testimonial-container position-relative">
                                    <div class="testimonial-slideshow common-slider" data-slick='{
                                            "slidesToShow": 1, 
                                            "slidesToScroll": 1,
                                            "dots": false,
                                            "arrows": true
                                        }'>
                                        <c:forEach var="review" items="${mainr}">
									    <div class="testimonial-item">
									        <div class="testimonial-icon-wrap d-flex align-items-center">
									            <div class="testimonial-icon-quote">
									                <svg width="40" height="29" viewBox="0 0 40 29" fill="none"
									                    xmlns="http://www.w3.org/2000/svg">
									                    <path
									                        d="M0 28.99L11.7 0H19.5L12.22 28.99H0ZM20.28 28.99L32.11 0H39.91L32.5 28.99H20.28Z"
									                        fill="#00234D" />
									                </svg>
									            </div>
									            <div class="testimonial-icon-star d-flex align-items-center ms-3">
									                <c:forEach begin="1" end="${review.review.star}">
									                    <img src="assets/img/icon/star.svg" alt="img">
									                </c:forEach>
									                <c:forEach begin="${review.review.star + 1}" end="5">
									                    <img src="assets/img/icon/star.svg" alt="img">
									                </c:forEach>
									            </div>
									        </div>
									        <p class="testimonial-review my-4 text_16">
									            “ ${review.review.review_det}”
									        </p>
									        <div class="testimonial-reviewer d-flex align-items-center">
									            <div class="reviewer-img">
									                <img src="${path}/upload/짱구.jpg" alt="img" width="80" height="81">
									            </div>
									            <div class="reviewer-info ms-4">
									                <h4 class="reviewer-name heading_18 mb-2 primary-color">${review.user.n_name}
									                </h4>
									                <p class="reviewer-desig text_14 m-0">${review.product.pro_name}</p>
									            </div>
									        </div>
									    </div>
									</c:forEach>

                                        
                                    </div>
                                    <div class="activate-arrows show-arrows-always article-arrows arrows-white"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- testimonial end -->

            <!-- single banner start -->
            <div class="single-banner-section mt-100 overflow-hidden">
                <div class="position-relative overlay">
                    <img class="single-banner-img" src="${path}/upload/샘플13.jpg" alt="slide-1">

                    <div class="content-absolute content-slide">
                        <div class="container height-inherit d-flex align-items-center justify-content-center">
                            <div class="content-box single-banner-content py-4 text-center" data-aos="fade-up"
                                data-aos-duration="700">
                                <h2 class="single-banner-heading heading_42 text-white animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp" data-aos="fade-up"
                                    data-aos-duration="700">
                                    사업자 모집
                                </h2>
                                <p class="single-banner-text text_16 text-white animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp" data-aos="fade-up"
                                    data-aos-duration="700">
                                    원룸만 있으면 함께 할 수 있어요! 문의주세요!
                                </p>
                                <a class="btn-primary single-banner-btn animate__animated animate__fadeInUp"
                                    href="collection-left-sidebar.html"
                                    data-animation="animate__animated animate__fadeInUp" data-aos="fade-up"
                                    data-aos-duration="700">
                                    문의하기
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- single banner end -->

            <!-- latest blog start -->
            <div class="latest-blog-section mt-100 overflow-hidden home-section">
                <div class="latest-blog-inner">
                    <div class="container">
                        <div class="section-header text-center">
                            <h2 class="section-heading primary-color">We Joy</h2>
                        </div>
                        <div class="article-card-container position-relative">
                            <div class="common-slider" data-slick='{
                                "slidesToShow": 3, 
                                "slidesToScroll": 1,
                                "dots": false,
                                "arrows": true,
                                "responsive": [
                                  {
                                    "breakpoint": 1281,
                                    "settings": {
                                      "slidesToShow": 2
                                    }
                                  },
                                  {
                                    "breakpoint": 602,
                                    "settings": {
                                      "slidesToShow": 1
                                    }
                                  }
                                ]
                            }'>

                                 <c:forEach var="recomm" items="${mainc}">
                                <div class="article-slick-item" data-aos="fade-up" data-aos-duration="700">
                                    <div class="article-card bg-transparent p-0 shadow-none">
                                        <a class="article-card-img-wrapper" href="article.html">
                                            <img src="${path}/assets/img/bsn/${recomm.board_img.fname}" alt="img"
                                                class="article-card-img rounded">
                                            <span class="article-tag article-tag-absolute rounded">${recomm.recomm.recom_loc}</span>
                                        </a>
                                        <p class="article-card-published text_12 d-flex align-items-center">
                                            <span class="article-date d-flex align-items-center">
                                                <span class="icon-publish">
                                                    <svg width="17" height="18" viewBox="0 0 17 18" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M3.46875 0.875V1.59375H0.59375V17.4063H16.4063V1.59375H13.5313V0.875H12.0938V1.59375H4.90625V0.875H3.46875ZM2.03125 3.03125H3.46875V3.75H4.90625V3.03125H12.0938V3.75H13.5313V3.03125H14.9688V4.46875H2.03125V3.03125ZM2.03125 5.90625H14.9688V15.9688H2.03125V5.90625ZM6.34375 7.34375V8.78125H7.78125V7.34375H6.34375ZM9.21875 7.34375V8.78125H10.6563V7.34375H9.21875ZM12.0938 7.34375V8.78125H13.5313V7.34375H12.0938ZM3.46875 10.2188V11.6563H4.90625V10.2188H3.46875ZM6.34375 10.2188V11.6563H7.78125V10.2188H6.34375ZM9.21875 10.2188V11.6563H10.6563V10.2188H9.21875ZM12.0938 10.2188V11.6563H13.5313V10.2188H12.0938ZM3.46875 13.0938V14.5313H4.90625V13.0938H3.46875ZM6.34375 13.0938V14.5313H7.78125V13.0938H6.34375ZM9.21875 13.0938V14.5313H10.6563V13.0938H9.21875Z"
                                                            fill="#00234D" />
                                                    </svg>
                                                </span>
                                                <span class="ms-2">${recomm.recomm.recom_time}</span>
                                            </span>
                                            <span class="article-author d-flex align-items-center ms-4">
                                                <span class="icon-author"><svg width="15" height="17"
                                                        viewBox="0 0 15 17" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M7.5 0.59375C4.72888 0.59375 2.46875 2.85388 2.46875 5.625C2.46875 7.3573 3.35315 8.89587 4.69238 9.80274C2.12903 10.9033 0.3125 13.447 0.3125 16.4063H1.75C1.75 13.2224 4.31616 10.6563 7.5 10.6563C10.6838 10.6563 13.25 13.2224 13.25 16.4063H14.6875C14.6875 13.447 12.871 10.9033 10.3076 9.80274C11.6469 8.89587 12.5313 7.3573 12.5313 5.625C12.5313 2.85388 10.2711 0.59375 7.5 0.59375ZM7.5 2.03125C9.49341 2.03125 11.0938 3.63159 11.0938 5.625C11.0938 7.61841 9.49341 9.21875 7.5 9.21875C5.50659 9.21875 3.90625 7.61841 3.90625 5.625C3.90625 3.63159 5.50659 2.03125 7.5 2.03125Z"
                                                            fill="#00234D" />
                                                    </svg>
                                                </span>
                                                <span class="ms-2">${recomm.user.n_name}</span>
                                            </span>
                                        </p>
                                        <h2 class="article-card-heading heading_18">
                                            <a class="heading_18" href="article.html">
                                                ${recomm.recomm.title}
                                            </a>
                                        </h2>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="activate-arrows show-arrows-always article-arrows arrows-white"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- latest blog end -->

           
        </main>

        
        <!-- scrollup start -->
        <button id="scrollup">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="18 15 12 9 6 15"></polyline></svg>  
        </button>
        <!-- scrollup end -->

        
        

        
        

        <!-- all js -->
        <script src="${path}/assets/js/vendor.js"></script>
        <script src="${path}/assets/js/main.js"></script>
    </div>

<%@ include file="../header/footer.jsp" %>  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    </style> 

    <link rel="stylesheet" href="${path}/assets/css/vendor.css">
    <link rel="stylesheet" href="${path}/assets/css/faq.css">
</head>

<body>

<div class="body-wrapper">
<jsp:include page="../header/user_header.jsp" flush="true" />
        <main id="MainContent" class="content-for-layout">
            <div class="faq-section mt-100">
                <div class="faq-inner">
                    <div class="container">
                  		<h2 class="section-heading">자주 묻는 질문</h2> 
                        <div class="faq-container">
                            <div class="row">
                               
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="faq-item rounded">
                                        <h2 class="faq-heading heading_18 collapsed d-flex align-items-center justify-content-between"
                                            data-bs-toggle="collapse" data-bs-target="#faq1">
                                            천재지변/기상악화로 인한 취소는 어떻게 하나요?
                                            <span class="faq-heading-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#F76B6A" stroke-width="2"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-down">
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </h2>
                                        <div id="faq1" class="accordion-collapse collapse">
                                            <p class="faq-body text_14">
                                            천재지변 또는 기상악화로 인해 숙소 방문이 어려우실 경우 innjoy 고객센터로 문의 부탁드립니다<br>
											다만,  상담사 연결이 지연될 것으로 예상되어<br>
											보다 연결이 원활한 야놀자 innjoy '1대1 채팅'을 통한 상담을 권장 드립니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="faq-item rounded">
                                        <h2 class="faq-heading heading_18 collapsed d-flex align-items-center justify-content-between"
                                            data-bs-toggle="collapse" data-bs-target="#faq2">
                                            취소/환불 규정이 어떻게 되나요?
                                            <span class="faq-heading-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#F76B6A" stroke-width="2"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-down">
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </h2>
                                        <div id="faq2" class="accordion-collapse collapse">
                                            <p class="faq-body text_14">
                                            - 입실 6일 전 24시 전까지: 없음 <br>
											- 입실 5일 전 24시 전까지: 10% <br>
											- 입실 4일 전 24시 전까지: 20% <br>
											- 입실 3일 전 24시 전까지: 30% <br>
											- 입실 2일 전 24시 전까지: 50% <br>
											- 입실 1일 전 24시 전까지: 70% 
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="faq-item rounded">
                                        <h2 class="faq-heading heading_18 collapsed d-flex align-items-center justify-content-between"
                                            data-bs-toggle="collapse" data-bs-target="#faq3">
                                            예약대기 건 예약취소하고 싶어요.
                                            <span class="faq-heading-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#F76B6A" stroke-width="2"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-down">
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </h2>
                                        <div id="faq3" class="accordion-collapse collapse">
                                            <p class="faq-body text_14">
                                            예약 대기중에는 고객센터에 예약취소 요청해주시길 바랍니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="faq-item rounded">
                                        <h2 class="faq-heading heading_18 collapsed d-flex align-items-center justify-content-between"
                                            data-bs-toggle="collapse" data-bs-target="#faq4">
                                            체크인날짜/객실타입을 변경하고 싶어요.
                                            <span class="faq-heading-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#F76B6A" stroke-width="2"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-down">
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </h2>
                                        <div id="faq4" class="accordion-collapse collapse">
                                            <p class="faq-body text_14">
                                            예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.
                                            <br>예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 재결제 하셔서 이용 부탁드립니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>         
        </main>
        <jsp:include page="../header/footer.jsp" flush="true" />
       
    </div>
     
</body>

</html>
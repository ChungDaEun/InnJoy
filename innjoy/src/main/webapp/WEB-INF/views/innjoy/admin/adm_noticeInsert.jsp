<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="../header/adm_header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>innjoy</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style>
body {
   min-height: 100vh;
}

.ndbutton-container {
   margin-bottom: 1rem;
   overflow: hidden;
}

.d_btn {
   width: 120px;
   height: 40px;
   color: white;
   background-color: #B0CC69;
   border: none;
   cursor: pointer;
   margin-left: 10px;
   float: right;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
   src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
   type="text/javascript"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#n_title").on("input", function() { // input 이벤트 사용
         let text = $(this).val();
         if (text.length >= 30) {
            alert("제목은 30자까지 입력 가능합니다.");
         }
      });
      $("#n_content").on("input", function() { // input 이벤트 사용
         let content = $(this).val();
         if (content.length >= 1000) {
            alert("내용은 1000자까지 입력 가능합니다.");
         }
      });
   });
</script>

</head>

<body>
   <div class="container" class="container-fluid px-4">
      <h1 class="mt-4">공지사항 관리</h1>
      <div class="card mb-4">
         <div class="card-body">공지사항 작성, 수정 및 조회 가능합니다</div>
      </div>
      <h4 class="mb-3">공지사항 등록</h4>
      <form method="post" action="${path}/noticeInsert"
         enctype="multipart/form-data" class="validation-form" novalidate>
         <input id="refno" type="hidden" name="refno"
            value="${empty param.refno?'0':param.refno}" />
         <div class="mb-3">
            <label for="n_title">제목</label> <input class="form-control initFrm"
               name="n_title" value="${param.n_title}" type="text" maxlength="30"
               id="n_title" placeholder="제목 입력" required>
         </div>
         <div class="mb-3">
            <label for="n_content">내용</label>
            <textarea name="n_content" class="form-control initFrm  ckValid" maxlength="1000"
               id="n_content" placeholder="내용 입력" required rows="5">${param.n_content}</textarea>
            <div class="invalid-feedback">내용를 입력해주세요.</div>
         </div>
         <div class="mb-3">
            <div class="custom-file">
               <input type="file" name="report" class="custom-file-input"
                  id="file01" multiple="multiple"> <label
                  class="custom-file-label" for="file01">파일 선택</label>
            </div>
         </div>

         <script type="text/javascript">
            $(".custom-file-input").on("change", function() {
               $(this).next(".custom-file-label").text($(this).val())
            })
         </script>
         <div class="ndbutton-container">
            <button id="regBtn" class="d_btn" type="submit">게시물 등록</button>
         </div>
      </form>
   </div>
   <%@ include file="../header/footer.jsp"%>
</body>
</html>
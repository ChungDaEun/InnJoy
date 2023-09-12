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

#ndetail {
   max-width: 1200px;
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
   $(document).ready(
         function() {
            $("#reBtn").click(
                  function() {
                     $("#refno").val($("#no").val())
                     $("#n_title").val("RE:" + $("#n_title").val())
                     $("#n_content").val(
                           "\n\n\n\n" + "=== 이전글 ===\n"
                                 + $("#n_content").val())
                     $("form").attr("action",
                           "${path}/admin/noticeInsertFrm")
                     $("form").submit()

                  })
            $("#uptBtn").click(function() {
               if (confirm("수정하시겠습니까?")) {
                  $("form").attr("action", "${path}/noticeUpdate");
                  $("form").submit();
               }
            })
            $("#delBtn").click(
                  function() {
                     if (confirm("삭제하시겠습니까?")) {
                        location.href = "${path}/noticeDelete?no="
                              + $("#no").val()
                     }
                  })
            var msg = "${msg}"
            if (msg.indexOf("수정") != -1) {
               if (confirm(msg + "\n 조회화면으로 이동 하시겠습니까?")) {
                  location.href = "${path}/admin/notice"
               }
            }
            if (msg.indexOf("삭제") != -1) {
               alert(msg + "\n 목록으로 이동합니다.")
               location.href = "${path}/admin/notice"
            }
            $("#goMain").click(function() {
               location.href = "${path}/admin/notice"
            })

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
      <div class="input-form-backgroud row">
         <div class="input-form col-md-12 mx-auto" id="ndetail">
            <form method="post" enctype="multipart/form-data"
               class="validation-form" novalidate>
               <div class="row">
                  <div class="col-md-6 mb-3">
                     <input name="no" type="hidden" value="${notice.no}" readonly
                        class="form-control  ckValid" id="no" required>
                  </div>
                  <div class="col-md-6 mb-3">
                     <input name="refno" type="hidden" value="${notice.refno}"
                        readonly class="form-control  ckValid" id="refno" required>
                  </div>
               </div>


               <div class="mb-3">
                  <label for="n_title">제목</label> <input name="n_title" type="text"
                     value="${notice.n_title}" class="form-control ckValid"
                     id="n_title" placeholder="제목 입력" maxlength="30" required>
               </div>
               <div class="row">
                  <div class="col-md-6 mb-3">
                     <label>등록일</label> <input type="text"
                        value='<fmt:formatDate pattern="yyyy-MM-dd" 
                        value="${notice.regdate}"/>'
                        readonly class="form-control  ckValid">
                  </div>
                  <div class="col-md-6 mb-3">
                     <label>수정일</label> <input type="text"
                        value='<fmt:formatDate  pattern="yyyy-MM-dd"  value="${notice.uptdate}"/>'
                        readonly class="form-control  ckValid">
                  </div>
               </div>
               <div class="mb-3">
                  <label for="n_content">내용</label>
                  <textarea name="n_content" class="form-control  ckValid"
                     id="n_content" placeholder="내용 입력" maxlength="1000" required
                     rows="5">${notice.n_content}</textarea>
                  <div class="invalid-feedback">내용를 입력해주세요.</div>
               </div>
               <div class="mb-3">
                  <label for="fname">첨부파일</label>
                  <c:forEach var="fname" items="${notice.fnames}">
                     <button onclick="download('${fname}')" type="button"
                        class="btn btn-outline-info">${fname}</button>
                  </c:forEach>

               </div>
               <script type="text/javascript">
                  function download(fname) {
                     if (confirm(fname + " 다운로드 하시겠습니까?")) {
                        location.href = "${path}/download?fname="
                              + fname
                     }
                  }
               </script>

               <script type="text/javascript">
                  $(".custom-file-input").on(
                        "change",
                        function() {
                           $(this).next(".custom-file-label").text(
                                 $(this).val())
                        })
               </script>
               <div class="ndbutton-container">
                  <button id="reBtn" class="d_btn" type="button">답글 달기</button>
                  <button id="delBtn" class="d_btn" type="button">삭제</button>
                  <button id="uptBtn" class="d_btn" type="button">수정</button>
                  <button id="goMain" class="d_btn" type="button">목록</button>
               </div>
            </form>
         </div>
      </div>
   </div>
   <!-- 헤더 -->
   <%@ include file="../header/footer.jsp"%>
</body>
</html>
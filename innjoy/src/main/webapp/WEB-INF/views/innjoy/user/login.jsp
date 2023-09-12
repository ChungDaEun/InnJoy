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

#loginBox {
   margin-top: 100px;
}

#title_login {
   margin-bottom: 150px;
   font-size: 20pt;
}

.userLoginForm {
   padding-top: 20px;
}
</style>
<script type="text/javascript">
   $(document).ready(function() {
      // 로그인 enter
      $("#input_pass").keypress(function(e) {
         if (e.keyCode && e.keyCode == 13) {
            $("#loginBtn").click()
         }
      })
   })
   // 로그인 유효성
   function login_check() {
      var input_id = $("#input_id").val()
      var input_pass = $("#input_pass").val()
      if (input_id.trim().length<=0) {
         $("#ck_loginId").text("아이디를 입력하세요.")
         $("#input_id").focus()
      } else if (input_pass.trim().length<=0) {
         $("#ck_loginPass").text("비밀번호를 입력하세요.")
         $("#input_pass").focus()
      } else {
         login();
         console.log("로그인함수 실행")
      }
   }

   // 로그인 기능
   function login() {
      var input_id = $('#input_id').val()
      var input_pass = $('#input_pass').val()
      $.ajax({
         type : "post",
         url : "try/login",
         data : "user_id=" + input_id + "&user_pass=" + input_pass,
         dataType : "text",
         success : function(rs) {
            if (rs == "fail") {
               alert("가입되지 않은 아이디이거나, 잘못된 비밀번호입니다.")
            } else if (rs == "ij"){
               alert("로그인 성공")
               location.href = "/sec/main2"
            } else if (rs == "bsn"){
               alert("사업자회원으로 로그인 성공")
               location.href = "/sec/bsn_acc"
            } else if (rs == "adm"){
               alert("관리자로 로그인 성공")
               location.href = "/admin/main"
            } else {
               alert("error : 관리자에게 문의하세요.");
            }
         },
         error : function(err) {
            console.log(err)
         }

      })
   }
</script>
<%@include file="../header/all_header.jsp"%>
</head>
<body>
   <div class="container">

      <!-- Outer Row -->
      <div class="row justify-content-center">

         <div class="col-xl-5 col-lg-12 col-md-9 col-mt-10" id="loginBox">

            <div class="card o-hidden border-0 shadow-sm my-5">
               <div class="card-body p-0">
                  <div class="p-5">
                     <div class="text-center">
                        <span id="title_login">로그인</span>
                     </div>
                     <form class="userLoginForm" method="post">
                        <div class="form-group">
                           <input type="text" class="form-control form-control-user"
                              id="input_id" name="user_id" placeholder="아이디"> <small
                              id="ck_loginId"></small>
                        </div>
                        <div class="form-group">
                           <input type="password" class="form-control form-control-user"
                              id="input_pass" name="user_pass" placeholder="비밀번호"> <small
                              id="ck_loginPass"></small>
                        </div>
                        <div class="form-group"></div>
                        <button type="button" onclick="login_check()"
                           class="btn btn-outline-success btn-block" id="loginBtn">
                           LogIn</button>
                     </form>
                     <hr>
                     <div class="text-center">
                        <a class="text-success small" href="/signup">아직 회원이 아니신가요?</a>
                     </div>
                     <div class="text-center">
                        <a class="text-success small" data-bs-toggle="modal"
                           data-bs-target="#findIdModal">아이디 찾기</a>
                     </div>
                     <div class="text-center">
                        <a class="text-success small" data-bs-toggle="modal"
                           data-bs-target="#findPassModal">비밀번호 재설정</a>
                     </div>
                  </div>
               </div>
            </div>

         </div>

      </div>

   </div>

   <script type="text/javascript">
      // 아이디 찾기 유효성
      function findId_check() {
         var findId_name = $("#findId_name").val()
         var findId_phone = $("#findId_phone").val()
         if (findId_name.trim().length<=0) {
            $("#ck_findIdName").text("이름을 입력하세요.")
            $("#findId_name").focus()
         } else if (findId_phone.trim().length<=0) {
            $("#ck_findIdPhone").text("전화번호를 입력하세요.")
            $("#findId_phone").focus()
         } else {
            findId();
            console.log("아이디찾기 함수 실행")
         }
      }
         function findId(){
            var name = $('#findId_name').val()
            var phone = $('#findId_phone').val()
            $.ajax({
               type : "post",
               url : "/try/findId",
               data : "name=" + name + "&phone=" + phone,
               dataType : "text",
               success : function(rs) {
                  if (rs =="fail") {
                     alert("해당 정보로 가입된 이력이 없습니다.")
                  }else{
                     alert("회원님의 아이디는 " + rs +" 입니다.")
                     $("#input_id").val(rs)
                        document.getElementById('findIdModal').click();
                  }
               },
               error : function(err) {
                  console.log(err)
               }

            })
         }
   </script>

   <!-- 아이디찾기 modal  -->
   <div class="modal fade" id="findIdModal" tabindex="-1"
      aria-labelledby="findIdModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">아이디 찾기</h1>
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
                                 <form class="findIdForm" id="findIdForm" method="post">
                                    <div class="form-group">
                                       <label>이름</label> <input type="text"
                                          class="form-control form-control-user" id="findId_name"
                                          name="user_name" placeholder="이름"> <small
                                          id="ck_findIdName"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>전화번호</label> <input type="text"
                                          class="form-control form-control-user" id="findId_phone"
                                          name="user_phone" placeholder="전화번호" maxlength="13">
                                       <small id="ck_findIdPhone"></small>
                                       <button type="button" class="float-right" id="idCheck">인증</button>
                                    </div>
                                    <div class="form-group"></div>
                                    <button type="button" onclick="findId_check()"
                                       class="btn btn-outline-success btn-block mt-5"
                                       id="findIdBtn">아이디 찾기</button>
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

   <script type="text/javascript">
    $(document).ready(function(){
       var userType= "";
       
       $("#replacePassForm").hide()
       
       $("#findPassBtn").click(function(){
          findPass_check();
       })
       
       $("#replaceBtn").click(function(){
          passCheck(userType);
       })
       
      // 비밀번호 찾기 유효성
         function findPass_check() {
            var findPass_id = $("#findPass_id").val()
            var findPass_phone = $("#findPass_phone").val()
            if (findPass_id.trim().length<=0) {
               $("#ck_findPassId").text("아이디를 입력하세요.")
               $("#findPass_id").focus()
            } else if (findPass_phone.trim().length<=0) {
               $("#ck_findPassPhone").text("전화번호를 입력하세요.")
               $("#findPass_phone").focus()
            } else {
               findPass();
               console.log("비밀번호 재설정 함수 실행")
            }
         }
         
         function findPass(){
            var id = $('#findPass_id').val()
            var phone = $('#findPass_phone').val()
            $.ajax({
               type : "post",
               url : "/try/findPass",
               data : "id=" + id + "&phone=" + phone,
               dataType : "text",
               success : function(rs) {
                  if (rs =="ij" || rs =="bsn") {
                     userType= rs;
                     alert("비밀번호를 재설정해주세요.")
                     hideNshow();
                  }else if (rs =="fail") {
                     alert("해당 정보로 가입된 이력이 없습니다.")
                  }else {
                     alert("error : 관리자에게 문의하세요.")
                  }
               },
               error : function(err) {
                  console.log(err)
               }

            })
         }
         
         function passCheck(userType){
            var replacePass= $("#replacePass").val()
            var rePass= $("#rePass").val()
            
            if(replacePass.trim().length<=0){
               $("#ck_replacePass").text("비밀번호를 입력하세요.")
               $("#replacePass").focus()
            }else if(replacePass != rePass){
               $("#ck_rePass").text( "비밀번호가 일치하지 않습니다.")
               $("#rePass").val("").focus()
            }else{
               chgPass(userType)
            }
         }

         function chgPass(userType){
            var pass = $("#replacePass").val()
            var id = $("#findPass_id").val()
            
            if(userType =="ij"){
               $.ajax({
                  type : "post",
                  url : "/try/chgPass",
                  data : "pass=" + pass + "&id=" + id,
                  dataType : "text",
                  success : function(rs) {
                     if (rs =="true") {
                        alert("비밀번호 재설정이 완료되었습니다. 로그인해주세요.")
                     }else if (rs =="fail") {
                        alert("error : 비밀번호 재설정 실패.")
                     }else {
                        alert("error : 관리자에게 문의하세요.")
                     }
                     document.getElementById('findPassModal').click();
                  },
                  error : function(err) {
                     console.log(err)
                  }
               })
            }else if(userType=="bsn"){
               $.ajax({
                  type : "post",
                  url : "/try/chgBsnPass",
                  data : "pass=" + pass + "&id=" + id,
                  dataType : "text",
                  success : function(rs) {
                     if (rs =="true") {
                        alert("비밀번호 재설정이 완료되었습니다. 로그인해주세요.")
                     }else if (rs =="fail") {
                        alert("error : 비밀번호 재설정 실패.")
                     }else {
                        alert("error : 관리자에게 문의하세요.")
                     }
                     document.getElementById('findPassModal').click();
                  },
                  error : function(err) {
                     console.log(err)
                  }
               })
            }else{
               alert("error: 관리자에게 문의하세요.")
            }
            $("#findPassForm").show()
            $("#replacePassForm").hide()
            $("#findPass_id").val("")
            $("#findPass_phone").val("")
         }
         
         function hideNshow(){
               $("#findPassForm").hide()
            $("#replacePassForm").show()
         }
    })
    
      
   </script>

   <!-- 비밀번호 찾기 modal -->
   <div class="modal fade" id="findPassModal" tabindex="-1"
      aria-labelledby="findPassModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
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
                                 <form class="findPassForm" id="findPassForm" method="post">
                                    <div class="form-group">
                                       <label>아이디</label> <input type="text"
                                          class="form-control form-control-user" id="findPass_id"
                                          name="user_id" placeholder="아이디"> <small
                                          id="ck_findPassId"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>전화번호</label> <input type="text"
                                          class="form-control form-control-user" id="findPass_phone"
                                          name="user_phone" placeholder="전화번호" maxlength="13">
                                       <small id="ck_findPassPhone"></small>
                                       <button type="button" class="float-right" id="idCheck">인증</button>
                                    </div>
                                    <div class="form-group"></div>
                                    <button type="button"
                                       class="btn btn-outline-success btn-block mt-5"
                                       id="findPassBtn">비밀번호 재설정</button>
                                 </form>
                                 <form class="replacePassForm" id="replacePassForm" method="post">
                                    <div class="form-group">
                                       <label>비밀번호</label> <input type="password"
                                          class="form-control form-control-user" id="replacePass"
                                          name="replacePass" placeholder="재설정할 비밀번호"> <small
                                          id="ck_replacePass"></small>
                                    </div>
                                    <div class="form-group">
                                       <label>비밀번호 재입력</label> <input type="password"
                                          class="form-control form-control-user" id="rePass"
                                          name="rePass" placeholder="비밀번호 재입력">
                                       <small id="ck_rePass"></small>
                                    </div>
                                    <div class="form-group"></div>
                                    <button type="button"
                                       class="btn btn-outline-success btn-block mt-5"
                                       id="replaceBtn">비밀번호 재설정</button>
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
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
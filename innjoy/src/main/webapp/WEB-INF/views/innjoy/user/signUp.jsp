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

#joinBox {
   margin-top: 100px;
}

#joinBox input, #joinBox button {
   font-size: 10pt;
}

#joinBox button {
   background-color: #869c51;
   color: #fff;
}

#title_join {
   margin-bottom: 150px;
   font-size: 20pt;
}

.joinForm {
   padding-top: 20px;
}

form small {
   color: #869c51;
}
</style>

<%@include file="../header/all_header.jsp"%>
</head>
<body>
   <script type="text/javascript">
      document.addEventListener('DOMContentLoaded', function() {
           // 모든 입력 필드에 대한 이벤트 리스너를 추가
           const userFields = document.querySelectorAll('.form-control-user');
           const bsnFields = document.querySelectorAll('.form-control-bsn');
           
           userFields.forEach(function(userFields) {
              userFields.addEventListener('input', checkUserInputs);
           });
           bsnFields.forEach(function(bsnFields) {
              bsnFields.addEventListener('input', checkBsnInputs);
           });
   
           // 버튼을 찾아서 초기 상태로 설정
           const joinBtn = document.getElementById('joinBtn');
           joinBtn.disabled = true;
           
           const bsn_joinBtn = document.getElementById('bsn_joinBtn');
           bsn_joinBtn.disabled = true;
         });
   
         // 인풋박스 입력 확인 검사
         function checkUserInputs() {
           // 모든 입력 필드의 값을 가져옴
           const userFields = document.querySelectorAll('.form-control-user');
           let allUserFilled = true;
   
           // 모든 입력 필드를 순회하면서 값을 확인
           userFields.forEach(function(userField) {
             if (userField.value.trim() === '') {
                allUserFilled = false;
               return;
             }
           });
           
           var  ischeck = checkUserId();
           
           // 버튼을 찾아서 활성화 또는 비활성화
           const joinBtn = document.getElementById('joinBtn');
           joinBtn.disabled = !allUserFilled || ischeck;
           console.log("allUserFilled: "+!allUserFilled)
           console.log("ischeck: "+ischeck)
           console.log("!allUserFilled || ischeck: "+!allUserFilled || ischeck)
         // input 전부 채워지지 않았거나, 아이디 체크 안했을 때 (둘 중 하나만 true여도 true)
         // 다 채워지면 true, 중복되지 않은 아이디면 false
         // 둘 중 하나라도 false 이면 false ==> &&
         // 
         }
         
         // 인풋박스 입력 확인 검사
         function checkBsnInputs() {
           // 모든 입력 필드의 값을 가져옴
           const bsnFields = document.querySelectorAll('.form-control-bsn');
           let allBsnFilled = true;

           bsnFields.forEach(function(bsnField) {
             if (bsnField.value.trim() === '') {
                allBsnFilled = false;
               return;
             }
           });
           
           var  ischeck = checkBsnId();
           
           // 버튼을 찾아서 활성화 또는 비활성화
           const bsn_joinBtn = document.getElementById('bsn_joinBtn');
           bsn_joinBtn.disabled = !allBsnFilled || ischeck;
           console.log("allBsnFilled: "+!allBsnFilled)
           console.log("ischeck: "+ischeck)
           console.log("!allBsnFilled || ischeck: "+!allBsnFilled || ischeck)
              // input 전부 채워지지 않았거나, 아이디 체크 안했을 때 (둘 중 하나만 false여도 false)
         }
         
         // 일반회원 아이디 중복 확인 여부 검사
         function checkUserId(){
            var ckUserId = document.getElementById('ck_userId').textContent;
            if(ckUserId !== "사용할 수 있는 아이디입니다."){
               return true;
            }else if(ckUserId == "사용할 수 있는 아이디입니다."){
               return false;
            }
         }
         
         // 사업자 아이디 중복 확인 여부 검사
         function checkBsnId(){
            var ckBsnId = document.getElementById('ck_bsnId').textContent;
            console.log("ckBsnId: " + ckBsnId)
            console.log("ckBsnId: "+ (bsnId !== "사용할 수 있는 아이디입니다."))
            if(ckBsnId !== "사용할 수 있는 아이디입니다." ){
               return true;
            }else if(ckBsnId == "사용할 수 있는 아이디입니다."){
               return false;
            }
         }
         
         // 전화번호 자동 하이픈
         function formatPhoneNumber(input) {
             const phoneNumber = input.value.replace(/\D/g, '');
             if (phoneNumber.length >= 3 && phoneNumber.length < 7) {
                input.value = phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3);
             } else if (phoneNumber.length >= 7) {
                   input.value = phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3, 7) + '-' + phoneNumber.slice(7);
             }
          }
          // 정규식을 사용하여 영어 소문자와 숫자를 포함하고 4~8자 이내로 작성한 아이디 확인
         function isValidId(id) {
             const regex = /^[a-z0-9]{4,8}$/;
             return regex.test(id);
         }
         // 정규식을 사용하여 특수문자를 포함하고 4~8자 이내로 작성한 비밀번호를 확인
         function isValidPass(pass) {
            const regex = /^(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{4,8}$/;
            return regex.test(pass);
         }
         // 정규식을 사용하여 이메일 주소 유효성 검사
         function isValidEmail(email) {
            const regex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
            return regex.test(email);
         }
   
   </script>

   <div class="container">

      <!-- Outer Row -->
      <div class="row justify-content-center">

         <div class="col-xl-5 col-lg-12 col-md-9 col-mt-10" id="joinBox">

            <div class="card o-hidden border-0 shadow-sm my-5">
               <div class="card-body p-0">
                  <div class="p-5">
                     <div class="text-center">
                        <span id="title_join">회원 가입</span>
                     </div>
                     <br>
                     <div class="d-flex justify-content-center pb-2"
                        id="userTypeRadio">
                        <input type="radio" id="user" name="userType" value="user">
                        <label for="user">일반회원</label> <input type="radio" id="bsn_user"
                           name="userType" value="bsn_user"> <label for="bsn_user">사업자회원</label><br>
                     </div>

                     <!-- 일반회원 회원가입 폼 -->
                     <form id="user_joinForm"  method="post">
                        <div class="form-group">
                           <label>이름</label>
                           <input type="text" class="form-control form-control-user" id="userName"
                              name="userName" placeholder="이름을 입력하세요.">
                           <small id="ck_userName"></small>
                        </div>
                        <div class="form-group">
                           <label>닉네임</label>
                           <input type="text" class="form-control form-control-user" id="nName"
                              name="nName" placeholder="닉네임을 입력하세요.">
                           <small id="ck_nName"></small>
                        </div>
                        <div class="form-group">
                           <label>아이디</label> <input type="text" class="form-control form-control-user" id="userId"
                              name="userId" placeholder="아이디를 입력해주세요.(소문자, 숫자를 포함한 4-8글자)">
                           <button type="button" class="float-right" id="idCheckBtn">중복확인</button>
                           <small id="ck_userId"></small>
                        </div>
                        <div class="form-group">
                           <label>비밀번호</label>
                           <input type="password" class="form-control form-control-user" id="userPass"
                              name="userPass" placeholder="비밀번호를 입력해주세요. (특수문자를 포함한 4-8자)">
                           <small id="ck_userPass"></small>
                        </div>
                        <div class="form-group">
                           <label>비밀번호 재입력</label>
                           <input type="password" class="form-control form-control-user" id="repass"
                              placeholder="비밀번호 재입력">
                           <small id="ck_rePass"></small>
                        </div>
                        <div class="form-group">
                           <label>이메일</label>
                           <input type="text" class="form-control form-control-user" id="email"
                              name="email" placeholder="xxx@xxx.com">
                           <small id="ck_userEmail"></small>
                        </div>
                        <div class="form-group">
                           <label>전화번호</label>
                           <input type="text" class="form-control form-control-user" id="userPhone"
                              name="userPhone" placeholder="전화번호" onkeyup="formatPhoneNumber(this)" maxlength="13">
                           <button type="button" class="float-right" id="phoneCheck">인증</button>
                           <small id="ck_userPhone"></small>
                        </div>
                        <div class="form-group"></div>
                        <button type="button" onclick="user_joinCheck()" class="btn btn-outline-success btn-block mt-5" id="joinBtn">
                           SignUp</button>
                     </form>
                     <script type="text/javascript">
                        // 회원가입 유효성
                        function user_joinCheck() {
                           var userName = $("#userName").val()
                           var nName = $("#nName").val()
                           var userId = $("#userId").val()
                           var userPass = $("#userPass").val()
                           var repass = $("#repass").val()
                           var email = $("#email").val()
                           var userPhone = $("#userPhone").val()

                           if (userName.trim().length<=0) {
                              $("#ck_userName").text("이름을 입력하세요.")
                              $("#userName").focus()
                           } else if (nName.trim().length<=0) {
                              $("#ck_nName").text("닉네임을 입력하세요.")
                              $("#nName").focus()
                           } else if (userId.trim().length<=0) {
                              $("#ck_userId").text("아이디를 입력하세요.")
                              $("#userId").focus()
                           } else if (isValidId(userId) == false) {
                              $("#ck_userId").text("소문자와 숫자를 포함하여 4-8글자로 작성해주세요.")
                              $("#userId").val("").focus()
                           } else if (userPass.trim().length<=0) {
                              $("#ck_userPass").text("비밀번호를 입력하세요.")
                              $("#userPass").focus()
                           } else if (isValidPass(userPass) == false) {
                              $("#ck_userPass").val("").text("특수문자를 포함하여 4-8글자로 작성해주세요.")
                              $("#userPass").focus()
                           } else if (userPass != repass) {
                              $("#ck_rePass").text("비밀번호가 일치하지 않습니다.")
                              $("#repass").val("").focus()
                           } else if (email.trim().length<=0) {
                              $("#ck_userEmail").text("이메일을 입력하세요.")
                              $("#email").focus()
                           } else if (isValidEmail(email) == false) {
                              $("#ck_userEmail").text("이메일 형식이 올바르지 않습니다.")
                              $("#email").val("").focus()
                           } else if (userPhone.trim().length<=0) {
                              $("#ck_userPhone").text("전화번호를 입력하세요.")
                              $("#userPhone").focus()
                           } else {
                              join();
                              console.log("회원가입 함수 실행")
                           }
                        }

                        // 회원가입
                        function join() {
                           $.ajax({
                              type : "post",
                              url : "/try/join",
                              data : $("#user_joinForm").serialize(),
                              dataType : "text",
                              success : function(rs) {
                                 alert("회원가입 성공. 로그인 후 이용가능합니다.")
                                 location.href="/login";
                              },
                              error : function(err) {
                                 console.log(err)
                              }

                           })
                        }
                        
                         // 아이디 정규식
                        function isValidId(id) {
                            const regex = /^[a-z0-9]{4,8}$/;
                            return regex.test(id);
                        }
                        // 비밀번호 정규식
                        function isValidPass(pass) {
                           const regex = /^(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{4,8}$/;
                           return regex.test(pass);
                        }
                        // 이메일 정규식
                        function isValidEmail(email) {
                           const regex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
                           return regex.test(email);
                        }
                     </script>

                     <!-- 사업자 회원 회원가입 폼 -->
                     <form id="bsn_joinForm" method="post">
                        <div class="form-group">
                           <label>아이디</label> <input type="text"
                              class="form-control form-control-bsn" id="bsnId"
                              name="bsnId" placeholder="아이디를 입력해주세요.(소문자, 숫자를 포함한 4-8글자)">
                           <button type="button" class="float-right" id="idBsnCheck">중복확인</button>
                           <small id="ck_bsnId"></small>
                        </div>
                        <div class="form-group">
                           <label>비밀번호</label> <input type="password"
                              class="form-control form-control-bsn" id="bsnPass"
                              name="bsnPass" placeholder="비밀번호를 입력해주세요. (특수문자를 포함한 4-8자)">
                           <small id="ck_bsnPass"></small>
                        </div>
                        <div class="form-group">
                           <label>비밀번호 재입력</label> <input type="password"
                              class="form-control form-control-bsn" id="bsn_rePass"
                              placeholder="비밀번호 재입력"> <small id="ck_bsnrRepw"></small>
                        </div>
                        <div class="form-group">
                           <label>상호명</label> <input type="text"
                              class="form-control form-control-bsn" id="bsnName"
                              name="bsnName" placeholder="상호명을 입력하세요."> <small
                              id="ck_bsnName"></small>
                        </div>
                        <div class="form-group">
                           <label>사업자번호</label> <input type="text"
                              class="form-control form-control-bsn" id="bsnNumber"
                              name="bsnNumber" placeholder="사업자번호를 입력하세요.">
                           <small id="ck_bsnNum"></small>
                        </div>
                        <div class="form-group">
                           <label>대표자명</label> <input type="text"
                              class="form-control form-control-bsn" id="ceoName"
                              name="ceoName" placeholder="대표자명을 입력하세요."> <small
                              id="ck_ceoName"></small>
                        </div>
                        <div class="form-group">
                           <label>이메일</label> <input type="text"
                              class="form-control form-control-bsn" id="bsnEmail"
                              name="bsnEmail" placeholder="xxx@xxx.com"> <small
                              id="ck_bsnEmail"></small>
                        </div>
                        <div class="form-group">
                           <label>전화번호</label> <input type="text"
                              class="form-control form-control-bsn" id="bsnPhone"
                              name="bsnPhone" placeholder="전화번호" onkeyup="formatPhoneNumber(this)" maxlength="13">
                           <button type="button" class="float-right" id="phoneCheck">인증</button>
                           <small id="ck_bsnPhone"></small>
                        </div>
                        <div class="form-group"></div>
                        <button type="button" onclick="bsn_joinCheck()"
                           class="btn btn-outline-success btn-block mt-5" id="bsn_joinBtn">
                           SignUp</button>
                     </form>

                     <script type="text/javascript">
                        // 회원가입 유효성
                        function bsn_joinCheck() {
                           var bsnId = $("#bsnId").val()
                           var bsnPass = $("#bsnPass").val()
                           var bsn_rePass = $("#bsn_rePass").val()
                           var bsnName = $("#bsnName").val()
                           var bsnNumber = $("#bsnNumber").val()
                           var ceoName = $("#ceoName").val()
                           var bsnEmail = $("#bsnEmail").val()
                           var bsnPhone = $("#bsnPhone").val()

                           if (bsnId.trim().length<=0) {
                              $("#ck_bsnId").text("아이디를 입력하세요.")
                              $("#bsnId").focus()
                           } else if (isValidId(bsnId) == false) {
                              $("#ck_bsnId").text("소문자와 숫자를 포함하여 4-8글자로 작성해주세요.")
                              $("#bsnId").val("").focus()
                           } else if (bsnPass.trim().length<=0) {
                              $("#ck_bsnPass").text("비밀번호를 입력하세요.")
                              $("#bsnPass").focus()
                           } else if (isValidPass(bsnId) == false) {
                              $("#ck_bsnPass").text("특수문자를 포함하여 4-8글자로 작성해주세요.")
                              $("#bsnPass").val("").focus()
                           } else if (bsnPass != bsn_rePass) {
                              $("#ck_bsnrRepw").text("비밀번호가 일치하지 않습니다.")
                              $("#bsn_rePass").val("").focus()
                           } else if (bsnName.trim().length<=0) {
                              $("#ck_bsnName").text("상호명을 입력하세요.")
                              $("#bsnName").focus()
                           } else if (bsnNumber.trim().length<=0) {
                              $("#ck_bsnNum").text("사업자번호를 입력하세요.")
                              $("#bsnNumber").focus()
                           } else if (ceoName.trim().length<=0) {
                              $("#ck_ceoName").text("대표자명을 입력하세요.")
                              $("#ceoName").focus()
                           } else if (bsnEmail.trim().length<=0) {
                              $("#ck_bsnEmail").text("이메일을 입력하세요.")
                              $("#bsnEmail").focus()
                           } else if ( isValidEmail(bsnEmail) == false) {
                              $("#ck_bsnEmail").text("이메일 형식이 올바르지 않습니다.")
                              $("#bsnEmail").val("").focus()
                           } else if (bsnPhone.trim().length<=0) {
                              $("#ck_bsnPhone").text("전화번호를 입력하세요.")
                              $("#bsnPhone").focus()
                           } else {
                              joinBsn();
                              console.log("회원가입 함수 실행")
                           }
                        }
                        // 회원가입
                        function joinBsn() {
                           $.ajax({
                              type : "post",
                              url : "try/join_bsn",
                              data : $("#bsn_joinForm").serialize(),
                              dataType : "text",
                              success : function(rs) {
                                 alert("회원가입 성공. 로그인 후 이용가능합니다.")
                                 location.href="/login";
                              },
                              error : function(err) {
                                 console.log(err)
                              }

                           })
                        }
                     </script>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      $(document).ready(function() {
         $("#idCheckBtn").on("click", function() {
         var userId = $("#userId").val()
         $.ajax({
               type : "post",
               url : "/try/idCk",
               data : "userId="+userId,
               dataType : "text",
               success : function(rs) {
                  if(rs=="false"){
                     console.log(rs)
                     $("#ck_userId").text("이미 사용중인 아이디입니다.")
                     $("#userId").focus()
                  }else if(userId.trim().length<=0){
                     $("#ck_userId").text("공백은 아이디로 사용할 수 없습니다.")
                     $("#userId").focus()
                  }else if(isValidId(userId) == false){
                     $("#ck_userId").text("소문자와 숫자를 포함하여 4-8글자로 작성해주세요.")
                     $("#userId").val("").focus()
                  }else if(rs=="true"){
                     $("#ck_userId").text("사용할 수 있는 아이디입니다.")
                  }else{
                     alert("error: 관리자에게 문의하세요.")
                  }
                  checkUserInputs()
               },
               error : function(err) {
                  console.log(err)
               }
            })
            
         })
         $("#idBsnCheck").on("click", function() {
         var bsnId = $("#bsnId").val()
         $.ajax({
               type : "post",
               url : "/try/idCk",
               data : "userId="+bsnId,
               dataType : "text",
               success : function(rs) {
                  if(rs=="false"){
                     console.log(rs)
                     $("#ck_bsnId").text("이미 사용중인 아이디입니다.")
                     $("#bsnId").focus()
                  }else if(isValidId(bsnId) == false){
                     $("#ck_bsnId").text("소문자와 숫자를 포함하여 4-8글자로 작성해주세요.")
                     $("#bsnId").val("").focus()
                  }else if(bsnId.trim().length<=0){
                     $("#ck_bsnId").text("공백은 아이디로 사용할 수 없습니다.")
                     $("#bsnId").focus()
                  }else if(rs=="true"){
                     $("#ck_bsnId").text("사용할 수 있는 아이디입니다.")
                  }else{
                     alert("error: 관리자에게 문의하세요.")
                  }
                  checkBsnInputs()
               },
               error : function(err) {
                  console.log(err)
               }
            })
            
         })
         
         $("#user_joinForm").hide()
         $("#bsn_joinForm").hide()

         $("#user").on("click", function() {
            $("#user_joinForm").show()
            $("#bsn_joinForm").hide()
         })

         $("#bsn_user").on("click", function() {
            $("#user_joinForm").hide()
            $("#bsn_joinForm").show()
         })
/*          
         function checkUserId(){
            var ckUserId = document.getElementById('ck_userId');
            if($("#userId").val() == "" || ckUserId !== "사용할 수 있는 아이디입니다." ){
               var ischeck = true;
            }else if(ckUserId == "사용할 수 있는 아이디입니다."){
               var ischeck = false; // 예시로 중복되지 않았다고 가정
            }
            // 버튼을 찾아서 활성화 또는 비활성화
             var joinBtn = document.getElementById('joinBtn');
             joinBtn.disabled = ischeck;
         }
         
         function checkBsnId(){
            var ckBsnId = document.getElementById('ck_bsnId');
            if($("bsnId").val() == "" || bsnId !== "사용할 수 있는 아이디입니다." ){
               var ischeck = true;
            }else if(ckBsnId == "사용할 수 있는 아이디입니다."){
               var ischeck = false; // 예시로 중복되지 않았다고 가정
            }
            // 버튼을 찾아서 활성화 또는 비활성화
             var bsn_joinBtn = document.getElementById('bsn_joinBtn');
             bsn_joinBtn.disabled = ischeck;
         } */
         
   })
   </script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
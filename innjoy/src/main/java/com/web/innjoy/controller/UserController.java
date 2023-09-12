package com.web.innjoy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Reservation;
import com.web.innjoy.model.Review;
import com.web.innjoy.service.BsnService;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.WishProPimg;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

   @Autowired
   private UserService userService;
   @Autowired
   private BsnService bsnService;

   // 메인
//   @RequestMapping("main")
//   public String main() {
//      return "user/main";
//   }

   // 로그인
   @RequestMapping("login")
   public String login() {
      return "user/login";
   }
   /*
    * // 로그인 (security)
    * 
    * @RequestMapping("login_auth") public String loginAuth() { return
    * "user/login_auth"; }
    */
   
   // 회원가입
   @RequestMapping("signup")
   public String signUp() {
      return "user/signUp";
   }
   
   // 마이페이지
    @RequestMapping("/sec/mypage")
   public String signPage(HttpServletRequest request, Model model) {
       HttpSession session = request.getSession();
       String userId = (String) session.getAttribute("userId");
       Ij_User user = (Ij_User) session.getAttribute("ij_user");
        // model : user객체
       Ij_User ij = userService.getProfile(userId);
       model.addAttribute("userInfo", ij);
       // model : 나의 예약 리스트
       List<Reservation> rlist = userService.getMyResList(user);
       model.addAttribute("rlist", rlist);   // model : reservation List
       // model : 나의 찜 리스트
       List<WishProPimg> wishProList = bsnService.wishProList(userId);
       model.addAttribute("wishProList", wishProList);
      return "user/myPage";
   }
    
    // 내 활동 내역
    @RequestMapping("/sec/myboardlist")
    public String myBoardList(HttpSession session, Model model) {
       Ij_User user = (Ij_User) session.getAttribute("ij_user");
       // model : 나의 예약 리스트
       List<Reservation> rlist = userService.getMyResList(user);
       model.addAttribute("rlist",rlist);
       // model : 나의 댓글 리스트
       List<Recomm_comm> commList = userService.getMyCommList(user);
       model.addAttribute("comments", commList);
       return "user/myBoardList";
    }
   
   // 예약하기
   @RequestMapping("/sec/reservationForm")
   public String ReservationForm(HttpSession session, Model model) {
      Ij_User user = (Ij_User) session.getAttribute("ij_user");
      // model: 유저 정보
      model.addAttribute("userInfo", user);
      return "user/product_reservation";
   }
   
   // 상품 상세보기
//   @RequestMapping("product_detail")
//   public String product_detail() {
//      return "user/product_detail";
//   }
   
   // 게시물 작성하기
   @RequestMapping("sec/boardForm")
   public String boardForm() {
      return "user/boardForm";
   }

}
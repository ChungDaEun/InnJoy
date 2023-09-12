package com.web.innjoy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.innjoy.model.Bsn_User;
import com.web.innjoy.service.BsnService;
import com.web.innjoy.service.ProductService;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductIns;
import com.web.innjoy.vo.ProductRoom;
import com.web.innjoy.vo.Reservation;
import com.web.innjoy.vo.Review_comm;
import com.web.innjoy.vo.Room;
import com.web.innjoy.vo.WishProPimg;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BsnController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	// 사업자 로그인 > 숙소 등록 현황
	@RequestMapping("bsnuser")
    public String bsnuser(Model d, HttpSession s,
    					  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
		bsn_id = (String) s.getAttribute("bsnId");
        List<Product> bsnuser = productService.bsnuser(bsn_id);
        d.addAttribute("bsnuser", bsnuser);
        return "bsn/bsn_acc_list";
    }
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보
	@RequestMapping("roomList")
	public String roomList(@ModelAttribute("sch") Room sch,
							@RequestParam("pro_id") int pro_id,
							Model d) {
		d.addAttribute("roomList", productService.roomList(sch));
		d.addAttribute("bsnprdInfo", productService.bsnprdInfo(pro_id));
		return "bsn/bsn_acc_list_detail";
	}
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보 > 객실 정보
	@GetMapping("roomDetail")
	public String roomDetail(@RequestParam("room_id") int room_id, Model d) {
		d.addAttribute("roomDetail", productService.roomDetail(room_id));
		return "bsn/bsn_acc_list_detail_roomDetail";
	}
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보 > 객실 정보 > 객실 삭제
	@DeleteMapping("deleteRoom")
	public String deleteRoom(@RequestParam("room_id") int room_id,
							   Model d) {
		d.addAttribute("msg", productService.deleteRoom(room_id));
		return "bsn/bsn_review_list_detail"; 
	}
	// 사업자 로그인 > 후기관리메인
	@RequestMapping("reviewList")
	public String reviewList(Model d, HttpSession s,
			  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
		bsn_id = (String) s.getAttribute("bsnId");
        List<Product> bsnuser = productService.bsnuser(bsn_id);
        d.addAttribute("bsnuser", bsnuser);
		return "bsn/bsn_review_list";
	}
	// 사업자 로그인 > 후기관리메인 > 숙소별 후기 리스트 
	@RequestMapping("prdReviewList")
	public String prdReviewList(@ModelAttribute("sch") BsnReviewMng sch, Model d
			, @RequestParam("pro_id") int pro_id
			) {
		d.addAttribute("prdReviewList", productService.prdReviewList(sch));
		d.addAttribute("bsnprdInfo", productService.bsnprdInfo(pro_id));
		return "bsn/bsn_review_list_detail";
	}
	// 사업자 로그인 > 후기관리메인 > 숙소별후기리스트 > 답글입력
	@RequestMapping("insertBsnReview")
	public String insertBsnReview(Review_comm ins, Model d) {
		d.addAttribute("msg", productService.insertBsnReview(ins));
		return "forward:/prdReviewList";
	}
	// boardUpdate
//	@PostMapping("updateBsnReview")
//	public String updateBsnReview(Review_comm upt,Model d){
//		d.addAttribute("msg", productService.updateBsnReview(upt));
//		//d.addAttribute("board",productService.getBoard(upt.getNo()));
//		// getRvComId
//		
//		return "bsn/bsn_review_list_detail";
//	}  
//	// boardDelete?no=4
	@DeleteMapping("deleteBsnReview")
	public String deleteBsnReview(@RequestParam("rv_com_id") int rv_com_id,
							   Model d) {
		d.addAttribute("msg", productService.deleteBsnReview(rv_com_id));
		return "bsn/bsn_review_list_detail"; 
	}
//	@GetMapping("deleteBsnReview")
//	public String deleteBsnReview(@RequestParam("rv_com_id") int rv_com_id,
//			Model d) {
//		d.addAttribute("msg", productService.deleteBsnReview(rv_com_id));
//		return "bsn/bsn_review_list_detail"; 
//	}
	// 등록화면
	   @GetMapping("/sec/showRegiForm")
	   public String showRegiForm(HttpServletRequest request, Model model) {
	      HttpSession session = request.getSession();
	      
	      String bsnId = (String) session.getAttribute("bsnId");
	      
	      Bsn_User bsn = userService.getBsnProfile(bsnId);
	      model.addAttribute("bsnInfo", bsn);
	      
	      return "bsn/bsn_acc_regi_test";
	   }
	   // 숙소 등록
	   @RequestMapping("insertProduct")
	   public String insertProduct(ProductIns ins, Model d) {
	      d.addAttribute("msg", productService.insertProduct(ins));
	      return "redirect:/bsnuser";
	   }

	@RequestMapping("bsnMypage")
	public String bstMyPage() {
		return "bsn/bsn_myPage";
	}

	
	
	
	
	
/*--------------------여기서부터는 다은-------------------------------*/
    @Autowired
    private BsnService bsnService;
    
    // 사업자페이지 > 메인페이지 > 예약관리
    @RequestMapping("/sec/bsn_res")
    public String bsn_res(Model d, HttpSession s,
    					  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
        bsn_id = (String) s.getAttribute("bsnId");
        List<ProductRoom> bsn_res = bsnService.bsn_res(bsn_id);
        d.addAttribute("bsn_res", bsn_res);
        return "bsn/bsn_res";
    }
    
    // 캘린더 예약 리스트
    @RequestMapping("/sec/calList")
    public ResponseEntity<List<Map<String, Object>>> calList(
        @RequestParam(name = "room_id", required = false) int room_id) {
        List<Reservation> reservations = bsnService.calList(room_id);
        List<Map<String, Object>> calendarEvents = new ArrayList<>();

        for (Reservation reservation : reservations) {
            Map<String, Object> event = new HashMap<>();
            event.put("title", getStatusText(reservation.getStatus()));
            event.put("start", reservation.getStart_dt());
            event.put("end", reservation.getEnd_dt());
            event.put("reservation_id", reservation.getReservation_id());
            
            calendarEvents.add(event);
        }
        return ResponseEntity.ok(calendarEvents);
    }

    private String getStatusText(int status) {
        switch (status) {
            case 0:
                return "예약문의";
            case 1:
                return "예약확정";
            case 2:
                return "예약취소(사용자)";
            case 3:
                return "예약취소(사업자)";
            case 4:
                return "이용완료";
            default:
                return "상태없음";
        }
    }

    @GetMapping("/sec/resDetModal")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> resDetModal
    						(@RequestParam("reservation_id") int reservation_id) {
        Map<String, Object> resDetModal = bsnService.resDetModal(reservation_id);
        return ResponseEntity.ok(resDetModal);
    }
    
    // 예약 취소
    @PostMapping("/sec/resCancle")
    @ResponseBody
    public String resCancle(@RequestBody Map<String, Integer> requestData) {
        int reservation_id = requestData.get("reservation_id");
        bsnService.resCancle(reservation_id);
        return "예약 취소 성공";
    }
    
    // 예약 확정
    @PostMapping("/sec/resConf")
    @ResponseBody
    public String resConf(@RequestBody Map<String, Integer> requestData) {
        int reservation_id = requestData.get("reservation_id");
        bsnService.resConf(reservation_id);
        return "예약 확정 성공";
    }
    
    // 이용 완료
    @PostMapping("/sec/resUse")
    @ResponseBody
    public String resUse(@RequestBody Map<String, Integer> requestData) {
        int reservation_id = requestData.get("reservation_id");
        bsnService.resUse(reservation_id);
        return "이용 완료 성공";
    }
    
    
	// 사업자페이지 > 마이페이지 > 계정확인
	// http://localhost:5050/login
	// http://localhost:5050/bsn_acc
	@GetMapping("/sec/bsn_acc")
	public String bsn_acc(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String bsnId = (String) session.getAttribute("bsnId");
		
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		
		return "bsn/bsn_acc";
	}

	// 사업자페이지 > 마이페이지 > 계정수정
	// http://localhost:5050/bsn_acc_corr
	@GetMapping("/sec/bsn_acc_corr")
	public String bsn_acc_corr(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String bsnId = (String) session.getAttribute("bsnId");
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		return "bsn/bsn_acc_corr";
	}
	// 사업자페이지 > 1:1문의
	@GetMapping("/sec/bsn_inq")
	public String bsn_inq() {
		return "bsn/bsn_inq";
	}
	// 일반회원 > 1:1문의
	@GetMapping("/sec/user_inq")
	public String user_inq() {
		return "user/user_inq";
	}
	
	// product 상세에서 찜하기 누르기
    @GetMapping("/toggle_wishlist")
    public String toggleWishlist(@RequestParam("pro_id") int pro_id, HttpSession session) {
        String user_id = (String) session.getAttribute("userId");
        System.out.println("#뭐징..#" + user_id + pro_id);
        bsnService.toggleWishlist(user_id, pro_id);

        return "redirect:/product_detail?pro_id=" + pro_id;
    }
	// 일반회원 > 1:1문의
	@GetMapping("/sec/wishList")
	public String wishList(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("userId");
		List<WishProPimg> wishProList = bsnService.wishProList(user_id);
		model.addAttribute("wishProList",wishProList);
		return "user/wishList";
	}

    
	
}

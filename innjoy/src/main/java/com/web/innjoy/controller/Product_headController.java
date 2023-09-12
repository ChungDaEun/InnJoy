package com.web.innjoy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.innjoy.service.BoardService;
import com.web.innjoy.service.BsnService;
import com.web.innjoy.service.ChatService;
import com.web.innjoy.service.Product_headService;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductBsn;
import com.web.innjoy.vo.Product_roomfilter;
import com.web.innjoy.vo.Product_roomfilter2;

import jakarta.servlet.http.HttpSession;

@Controller
public class Product_headController {
	
	@Autowired
	private Product_headService service;
	@Autowired
	private BoardService boardService;

	@Autowired
    private BsnService bsnService;
	
	@Autowired
    private ChatService chatService;
	
	@RequestMapping("product_detail")
	public String product_headdetail(@RequestParam("pro_id") int pro_id, @RequestParam("start_dt") 
			String start_dt, @RequestParam("end_dt") String end_dt,
			@RequestParam("user_cnt") String user_cnt,
			Model model,
			HttpSession session) {
	    System.out.println("pro_id찍히나???: " + pro_id); // 로깅 추가
	    
	    if(start_dt != null) {
	    	start_dt = start_dt.replaceAll("-", "");
	    }
	    if(end_dt != null) {
	    	end_dt = end_dt.replaceAll("-", "");
	    }

	    // bsn_id 찾기
	    Product pro = bsnService.FindBsnID(pro_id);   
	    model.addAttribute("pro_id",pro.getPro_id());
	    model.addAttribute("bsn_id",pro.getBsn_id());
	    
        ProductBsn bsn = chatService.FindCeoName(pro_id);
        String ceo_name = bsn.getBsn_user().getCeoName();
        model.addAttribute("ceo_name", ceo_name);
        model.addAttribute("pro_id", pro_id);

		String user_id = (String) session.getAttribute("userId");
        boolean exists = bsnService.checkDataExists(user_id, pro_id);

        // 데이터가 있는지 여부를 JSP에 전달
        model.addAttribute("wishlistState", exists ? "active" : "empty");
	    
	    List<Product_roomfilter> a = service.ProductDetail(pro_id, start_dt, end_dt, user_cnt);
	    
	    model.addAttribute("prhd", service.ProductheadDetail(pro_id));
	    model.addAttribute("prReview", service.ProductreviewDetail(pro_id));
	    model.addAttribute("blist", service.getRecommByProId(pro_id));

	    model.addAttribute("proDetail", a);
	    
	    return "user/product_detail";
	}
//	@RequestMapping("viewComms")
//	public ResponseEntity<List<CommDto>> viewComms(@RequestParam("recomId") int recomId, Model model) {
//	    System.out.println("recomId: " + recomId);
//	    List<CommDto> commList = boardService.getCommList(recomId);
//	    model.addAttribute("commList",commList);
//	    return ResponseEntity.ok(commList);
//	}
	@RequestMapping("product_detail3")
	   public String product_headdetail3(@RequestParam("pro_id") int pro_id, @RequestParam("start_dt") String start_dt, 
	         @RequestParam("end_dt") String end_dt, @RequestParam("user_cnt") String user_cnt,@RequestParam("room_id")int room_id, Model model2) {
	      
	      System.out.println("######################찍혀라 제발333: " + pro_id); // 로깅 추가
	      System.out.println("######################찍혀라 제발333: " + room_id); // 로깅 추가
	      System.out.println("######################찍혀라 제발333: " + start_dt); // 로깅 추가
	      System.out.println("######################찍혀라 제발333: " + end_dt); // 로깅 추가
	      
	      Product_roomfilter2 prf2 = service.ProductDetail2(pro_id, start_dt, end_dt, user_cnt, room_id);
	      
	      System.out.println("roomfilter2 stdt:" + prf2.getStart_dt());
	      System.out.println("roomfilter2 eddt:"+prf2.getEnd_dt());
	       model2.addAttribute("proDetail2", prf2);
	       
	       return "user/product_detail2";
	   }  
	
	@RequestMapping("product_detail_all")
	public String product_headdetail(@RequestParam("pro_id") int pro_id, @RequestParam("start_dt") 
			String start_dt, @RequestParam("end_dt") String end_dt, @RequestParam("user_cnt") String user_cnt, Model model) {
	    System.out.println("pro_id찍히나???: " + pro_id); // 로깅 추가
	    
	    if(start_dt != null) {
	    	start_dt = start_dt.replaceAll("-", "");
	    }
	    if(end_dt != null) {
	    	end_dt = end_dt.replaceAll("-", "");
	    }

	    
	    List<Product_roomfilter> a = service.ProductDetail(pro_id, start_dt, end_dt, user_cnt);
	    
	    model.addAttribute("prhd", service.ProductheadDetail(pro_id));
	    model.addAttribute("prReview", service.ProductreviewDetail(pro_id));
	    model.addAttribute("blist", service.getRecommByProId(pro_id));
	    
	    model.addAttribute("proDetail", a);
	    
	    return "user/product_detail_all";
	}

}
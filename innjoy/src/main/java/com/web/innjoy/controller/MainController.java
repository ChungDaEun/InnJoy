package com.web.innjoy.controller;

import java.util.List;
import com.web.innjoy.vo.MainProduct_p;
import com.web.innjoy.vo.MainReview_r;
import com.web.innjoy.vo.MainRecomm_r;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.innjoy.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService service;
	@RequestMapping("main")
	public String main_productdetail(Model d) {
		System.out.println("mainController 실행");
		List<MainProduct_p> productList = service.MainproList();
		System.out.println("productList.size: "+ productList.size());
		for(MainProduct_p prod : productList) {
			System.out.println(prod.getProduct().getPro_name());
		}
		d.addAttribute("mainp", productList);
	    
	    List<MainRecomm_r> reviewList = service.MainrevList();
	    d.addAttribute("mainr", reviewList);
	    
	    List<MainReview_r> recommList = service.MainrecList();
	    d.addAttribute("mainc", recommList);
	    
	    return "user/main";
	}
	@RequestMapping("/sec/main2")
	public String main_productdetail2(Model d) {
		System.out.println("mainController 실행");
		List<MainProduct_p> productList = service.MainproList();
		System.out.println("productList.size: "+ productList.size());
		for(MainProduct_p prod : productList) {
			System.out.println(prod.getProduct().getPro_name());
		}
		d.addAttribute("mainp", productList);
	    
	    List<MainRecomm_r> reviewList = service.MainrevList();
	    d.addAttribute("mainr", reviewList);
	    
	    List<MainReview_r> recommList = service.MainrecList();
	    d.addAttribute("mainc", recommList);
	    
	    return "user/main2";
	}
}

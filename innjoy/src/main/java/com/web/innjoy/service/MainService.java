package com.web.innjoy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.MainDao;
import com.web.innjoy.vo.MainProduct_p;
import com.web.innjoy.vo.MainReview_r;
import com.web.innjoy.vo.MainRecomm_r;

@Service
public class MainService {
	@Autowired
	private MainDao dao;
	
	public List<MainProduct_p> MainproList(){
	System.out.println("service: MainproList");
	return dao.getMainproductList();
	}
	public List<MainRecomm_r> MainrevList(){
		System.out.println("service: MainrevList");
		return dao.getMainreviewList();
		}
	public List<MainReview_r> MainrecList(){
		System.out.println("service: MainrecList");
		return dao.getMainrecommList();
		}
}

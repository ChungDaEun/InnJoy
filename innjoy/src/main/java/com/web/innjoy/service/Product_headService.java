package com.web.innjoy.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.Product_headDao;
import com.web.innjoy.vo.Board;
import com.web.innjoy.vo.ProductHead_p;
import com.web.innjoy.vo.ProductRecomm_r;
import com.web.innjoy.vo.ProductReview_r;
import com.web.innjoy.vo.Product_roomfilter;
import com.web.innjoy.vo.Product_roomfilter2;

@Service
public class Product_headService {
	@Autowired
	private Product_headDao dao;
    

    public List<ProductHead_p> ProductheadDetail(int pro_id) {
        System.out.println("#숙소헤드 디테일 서비스 호출#"+pro_id);
        return dao.getProducthead_detail(pro_id);
    }
    public List<ProductReview_r> ProductreviewDetail(int pro_id) {
        System.out.println("#숙소리뷰 디테일 서비스 호출#"+pro_id);
        return dao.getProductreview_detail(pro_id);
    }
    public List<ProductRecomm_r> ProductrecommDetail(int pro_id) {
        System.out.println("#숙소리뷰 디테일 서비스 호출#"+pro_id);
        return dao.getProductrecomm_detail(pro_id);
    }
    
    // 숙소 게시물 리스트
    public List<Board> getRecommByProId(int pro_id){
    	System.out.println("#숙소게시물리스트 서비스 호출#"+pro_id);
    	List<Board> blist = dao.getRecommById(pro_id);	// 숙소 게시물리스트 blist에 저장
    	List<Board> recommList = new ArrayList<Board>();
    	for(Board b:blist) {
    		int recomId= b.getRecom_id();	// recomId 받아서
    		System.out.println("getRecommByProId - recomId: " + recomId);
    		b.setComms(dao.getCommListById(recomId));
    		b.setImgs(dao.getImgListById(recomId));
    		// 해당 개시물의 댓글리스트와 이미지 리스트 board 객체에 setting
    		recommList.add(b);
    		// board 객체 새로 생성한 recommList에 저장
    	}
    	return recommList;
    }
    
    public List<Product_roomfilter> ProductDetail(int pro_id, String start_dt,String end_dt,String user_cnt) {
    	return dao.getProductDetail(pro_id, start_dt, end_dt, user_cnt);
    }
    
    public Product_roomfilter2 ProductDetail2(int pro_id, String start_dt,String end_dt,String user_cnt, int room_id) {
    	 System.out.println("ProductDetail2 Service: "+pro_id);
    	return dao.getProductDetail2(pro_id, start_dt, end_dt, user_cnt, room_id);
    }
    

    
//    @Transactional
//    public void addComment(int recom_id, String userId, String commentText) {
//        dao.insertComment(recom_id, userId, commentText);
//    }
}   
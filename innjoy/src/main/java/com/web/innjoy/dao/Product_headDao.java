package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.innjoy.vo.Board;
import com.web.innjoy.vo.Board_img;
import com.web.innjoy.vo.ProductHead_p;
import com.web.innjoy.vo.ProductRecomm_r;
import com.web.innjoy.vo.ProductReview_r;
import com.web.innjoy.vo.Product_roomfilter;
import com.web.innjoy.vo.Product_roomfilter2;
import com.web.innjoy.vo.Recomm_comm;

@Mapper
public interface Product_headDao {
   public List<ProductHead_p>getProducthead_detail(int pro_id);
   public List<ProductReview_r> getProductreview_detail(int pro_id);
   public List<ProductRecomm_r> getProductrecomm_detail(int pro_id);
   public List<Product_roomfilter> getProductDetail(@Param("pro_id") int pro_id, @Param("start_dt") String start_dt,@Param("end_dt") String end_dt,@Param("user_cnt") String user_cnt);
   
   public Product_roomfilter2 getProductDetail2(@Param("pro_id") int pro_id, @Param("start_dt") String start_dt,@Param("end_dt") String end_dt,@Param("user_cnt") String user_cnt, @Param("room_id") int room_id);

   // pro_id로 게시물 가져오기
   public List<Board> getRecommById(@Param("pro_id") int pro_id);
   public List<Recomm_comm> getCommListById(int recomId);
   public List<Board_img> getImgListById(int recomId);
   
//   // pro_id로 게시물에 달린 댓글 가져오기
//   public List<Recomm_comm> getCommListById(@Param("pro_id") int pro_id);

   
}

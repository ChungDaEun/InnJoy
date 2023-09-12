package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.Pro_img;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductIns;
import com.web.innjoy.vo.ProductSch;
import com.web.innjoy.vo.Review_comm;
import com.web.innjoy.vo.Room;
import com.web.innjoy.vo.RoomIns;
import com.web.innjoy.vo.Room_img;
// com.web.innjoy.dao.ProductDao
@Mapper
public interface ProductDao {
	
	public List<Product> bsnuser(@Param("bsn_id") String bsn_id);
	
	public List<Product> productList(ProductSch sch);
	
	public List<Room> roomList(Room sch);
	public Product bsnprdInfo(int pro_id); 
	public List<BsnReviewMng> prdReviewList(BsnReviewMng sch);
	
	public Room roomDetail(int room_id);
	public BsnReviewMng reviewDetail(String user_id);
	
	public List<BsnReviewMng> reviewList (BsnReviewMng sch);
	public int insertBsnReview(Review_comm insert);
	public int deleteBsnReview(int rv_com_id);
	public int deleteRoom(int room_id);
	public int updateBsnReview(Review_comm upt);
	
	public BsnReviewMng productInfo(int pro_id); 
	
	public Bsn_user bsn_user(String bsn_id); 
	
	public Bsn_user login(Bsn_user bsnS);
	
	public int insertRoom2(ProductIns insert);
	
	
// 숙소등록	
	public int getRImgNo();
	public int getPro_id();
	public int insertProduct(ProductIns insert);
	public int getPImgNo();
	public int insertProductImg(Pro_img insert);
	public int insertRoomImg(Room_img insert);
	public int getRoom_id();
	public int insertRoom(RoomIns insert);
}

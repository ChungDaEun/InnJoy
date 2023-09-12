package com.web.innjoy.dao;

// com.web.innjoy.dao.BsnDao
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductRoom;
import com.web.innjoy.vo.ResUser;
import com.web.innjoy.vo.Reservation;
import com.web.innjoy.vo.WishProPimg;

@Mapper
public interface BsnDao {
	
	public List<ProductRoom> bsn_res(@Param("bsn_id") String bsn_id);
	
	// 캘린더
	public List<Reservation> calList(@Param("room_id") int room_id);
	
	// 캘린더 모달창
    public ResUser resDetModal(@Param("reservation_id") int reservation_id);
    
    // 취소 사유
    @Select("SELECT cancle_reason FROM res_cancle "
    		+ "WHERE reservation_id = #{reservation_id}")
    String getCancleReason(@Param("reservation_id") int reservation_id);
    
    // 캘린더 예약 취소
    @Update("UPDATE RESERVATION SET STATUS = 3"
    		+ " WHERE RESERVATION_ID = #{reservation_id}")
    void resCancle(@Param("reservation_id") int reservation_id);
    
    // 캘린더 예약 확정
    @Update("UPDATE RESERVATION SET STATUS = 1"
    		+ " WHERE RESERVATION_ID = #{reservation_id}")
    void resConf(@Param("reservation_id") int reservation_id);
    
    // 캘린더 이용 완료
    @Update("UPDATE RESERVATION SET STATUS = 4"
    		+ " WHERE RESERVATION_ID = #{reservation_id}")
    void resUse(@Param("reservation_id") int reservation_id);
    
    // 숙소 상세에서 채팅방 이동
    public Product FindBsnID(@Param("pro_id") int pro_id);
    
    // 찜하기 확인하기
    @Select("SELECT * FROM wish WHERE user_id = #{user_id} AND pro_id = #{pro_id}")
    Map<String, Object> checkDataExists(@Param("user_id") String user_id, @Param("pro_id") int pro_id);

    // 찜하기 
    @Insert("INSERT INTO wish (wish_id, user_id, pro_id) VALUES (wish_seq.nextval, #{user_id}, #{pro_id})")
    void addToWishlist(@Param("user_id") String user_id, @Param("pro_id") int pro_id);

    // 찜 취소 하기
    @Delete("DELETE FROM wish WHERE user_id = #{user_id} AND pro_id = #{pro_id}")
    void deleteFromWishlist(@Param("user_id") String user_id, @Param("pro_id") int pro_id);
    
    // 찜 리스트 출려
    List<WishProPimg> wishProList(@Param("user_id") String user_id);
}
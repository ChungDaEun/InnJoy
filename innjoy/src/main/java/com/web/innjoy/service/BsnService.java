package com.web.innjoy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.BsnDao;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductRoom;
import com.web.innjoy.vo.ResUser;
import com.web.innjoy.vo.Reservation;
import com.web.innjoy.vo.WishProPimg;

@Service
public class BsnService {
    @Autowired
    private BsnDao dao;
   
    
    public List<ProductRoom> bsn_res(String bsn_id){
    	return dao.bsn_res(bsn_id);
    }
    // 캘린더
    public List<Reservation> calList(int room_id) {
        return dao.calList(room_id);
    } 
    
    // 캘린더 모달창
    public Map<String, Object> resDetModal(int reservation_id) {
        Map<String, Object> resDetModal = new HashMap<>();
        
        ResUser resUser = dao.resDetModal(reservation_id);
        resDetModal.put("user", resUser.getUser());
        resDetModal.put("reservation", resUser.getReservation());

        // 예약취소(사용자)일 경우 
        if (resUser.getReservation().getStatus() == 2) {
            String cancleReason = dao.getCancleReason(reservation_id);
            resDetModal.put("cancle_reason", cancleReason);
        }

        return resDetModal;
    }
    
    // 캘린더 예약취소
    public void resCancle(int reservation_id) {
        dao.resCancle(reservation_id);
    }
    
    
    // 캘린더 예약확정
    public void resConf(int reservation_id) {
        dao.resConf(reservation_id);
    }
    
    // 캘린더 이용완료
    public void resUse(int reservation_id) {
        dao.resUse(reservation_id);
    }
    
    // 숙소페이지에서 채팅방 이동
    public Product FindBsnID(int pro_id) {
        return dao.FindBsnID(pro_id);
    }
    
    // 숙소 상세 페이지에서 찜하기 버튼 데이터 유무 확인
    public boolean checkWishlistData(String user_id, int pro_id) {
        // Check if data exists in the wishlist for the user and product
        return dao.checkDataExists(user_id, pro_id) != null;
    }

    // 유무 확인해서 insert하거나 delete하기
    public void toggleWishlist(String user_id, int pro_id) {
        // Check if data exists
        if (checkWishlistData(user_id, pro_id)) {
            // Data exists, so delete it
            dao.deleteFromWishlist(user_id, pro_id);
        } else {
            // Data does not exist, so insert it
            dao.addToWishlist(user_id, pro_id);
        }
    }
    // product_detail에서 찜 데이터 있나 없나 확인
    public boolean checkDataExists(String user_id, int pro_id) {
        Map<String, Object> result = dao.checkDataExists(user_id, pro_id);
        return result != null && !result.isEmpty();
    }

    // 찜 리스트
    public List<WishProPimg> wishProList(String user_id) {

        return dao.wishProList(user_id);
    }
    
}
package com.web.innjoy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dto.ReservationDto;
import com.web.innjoy.model.Admin;
import com.web.innjoy.model.Bsn_User;
import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Reservation;
import com.web.innjoy.model.Review;
import com.web.innjoy.repository.AdminRepository;
import com.web.innjoy.repository.Bsn_UserRepository;
import com.web.innjoy.repository.Ij_UserRepository;
import com.web.innjoy.repository.Recomm_CommRepository;
import com.web.innjoy.repository.ResRepository;
import com.web.innjoy.repository.ReviewRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class UserService{

	@Autowired
	private Ij_UserRepository userRepository;
	@Autowired
	private Bsn_UserRepository bsn_userRepository;
	@Autowired
	private AdminRepository admRepository;
	@Autowired
	private ResRepository resRepository;
	@Autowired
	private Recomm_CommRepository commRepository;
	@Autowired
	private ReviewRepository revRepository;

	/* 일반회원 */
	
	// 로그인
	public Ij_User login(String user_id, String user_pass) {
        return userRepository.findByUserIdAndUserPass(user_id, user_pass);
    }
	// 회원가입
    public Ij_User join(Ij_User user) {
    	return userRepository.save(user);
    }
	// 회원정보 수정
    public void update(Ij_User user) {
    	System.out.println(user.getUserId());
    	System.out.println(user.getUserName());
    	Ij_User ij = userRepository.findById(user.getUserId()).orElseThrow(() -> {
            return new IllegalArgumentException("회원 찾기 실패");
        });
    	ij.setUserName(user.getUserName());
    	ij.setnName(user.getnName());
        ij.setUserPass(user.getUserPass());
        ij.setEmail(user.getEmail());
        ij.setUserPhone(user.getUserPhone());
        userRepository.save(ij);
    }
    // 회원정보 조회
    public Ij_User getProfile(String userId) {
    	System.out.println("service userid="+userId);
    	 return userRepository.findById(userId)
                 .orElseThrow(() -> new EntityNotFoundException("회원 찾기 실패"));
    }
    // 예약 내역 조회
    public List<Reservation> getMyResList(Ij_User user){
    	return resRepository.findByIjUser(user);
    }
    // 예약 상세내역 조회
    public ReservationDto getResDetail(int id) {
    	System.out.println("reservation id: "+id);
    	Reservation res = resRepository.findByReservationId(id);
    	ReservationDto resDto = new ReservationDto(
    			res.getReservationId(),
    			res.getIjUser().getUserName(),
    			res.getIjUser().getUserPhone(),
    			res.getRoom().getProduct().getProName(),
    			res.getRoom().getRoomId(),
    			res.getRoom().getRoomName(),
    			res.getUserCnt(),
    			res.getStartDt(),
    			res.getEndDt(),
    			res.getPayment(),
    			res.getStatus()
    			);
    	return resDto;
    }
    
    // 내가 쓴 댓글 조회
    public List<Recomm_comm> getMyCommList(Ij_User user){
    	return commRepository.findByIjUser(user);
    }
    // 내가 쓴 후기 조회
    public List<Review> getMyReviewList(Reservation res){
    	return revRepository.findByReservation(res);
    }
    // 예약하기
    public Reservation reservation(Reservation res) {
    	return resRepository.save(res);
    }
    
    /* 사업자회원 */

    // 로그인
	public Bsn_User loginBsn(String bsn_id, String bsn_pass) {
		return bsn_userRepository.findByBsnIdAndBsnPass(bsn_id, bsn_pass);
	}
	// 회원가입
    public Bsn_User joinBsn(Bsn_User buser) {
    	return bsn_userRepository.save(buser);
    }
 // 회원정보 수정
    public void updateBsn(Bsn_User user) {
    	System.out.println(user.getBsnId());
    	System.out.println(user.getBsnEmail());
    	System.out.println(user.getBsnPhone());
    	Bsn_User bsn = bsn_userRepository.findById(user.getBsnId()).orElseThrow(() -> {
            return new IllegalArgumentException("사업자회원 찾기 실패");
        });
        bsn.setBsnEmail(user.getBsnEmail());
        bsn.setBsnPhone(user.getBsnPhone());
        bsn_userRepository.save(bsn);
    }
 // 사업자 회원정보 조회
    public Bsn_User getBsnProfile(String bsnId) {
    	System.out.println("service bsnId="+bsnId);
    	 return bsn_userRepository.findById(bsnId)
                 .orElseThrow(() -> new EntityNotFoundException("회원 찾기 실패"));
    }

    /* 관리자 */
    public Admin loginAdm(String adm_id, String adm_pass) {
    	return admRepository.findByAdmIdAndAdmPass(adm_id, adm_pass);
    }
    
    /* 아이디 중복 검사 */
    public String idCkeck(String userId){
    	String rs = "";
    	int uCnt = userRepository.ckId(userId);
    	int bCnt = bsn_userRepository.ckBsnId(userId);
    	if(uCnt > 0 || bCnt > 0) {	// 각 디비에 userId에 해당하는 값이 있을 경우,
    		rs = "false";
    	}else {
    		rs="true";
    	}
    	System.out.println(uCnt);
    	System.out.println(bCnt);
    	return rs;
    }
    
    // 아이디 찾기
    public String findId(String name, String phone) {
    	String rs ="";
    	Ij_User ij = userRepository.findByUserNameAndUserPhone(name, phone);
    	Bsn_User bsn = bsn_userRepository.findByCeoNameAndBsnPhone(name, phone);
    	if(ij != null) {
    		System.out.println("ij:" + ij.getUserId());
    		rs=ij.getUserId();
    	}else if(bsn != null) {
    		System.out.println("bsn:" + bsn.getBsnId());
    		rs=bsn.getBsnId();
    	}else {
    		rs="fail";
    	}
    	return rs;
    }
    
    // 비밀번호 찾기
    public String findPass(String id, String phone) {
    	String rs = "";
    	Ij_User ij = userRepository.findByUserIdAndUserPhone(id, phone);
    	Bsn_User bsn = bsn_userRepository.findByBsnIdAndBsnPhone(id, phone);
    	if(ij != null) {
    		System.out.println("ij:" + ij.getUserId());
    		rs="ij";
    	}else if(bsn != null) {
    		System.out.println("bsn:" + bsn.getBsnId());
    		rs="bsn";
    	}else {
    		rs="fail";
    	}
    	return rs;
    }
    
    // 일반회원 비밀번호 재설정
    public String chgUserPass(String pass, String id) {
    	String rs ="";
    	rs =  userRepository.changePass(pass, id) > 0 ? "true":"fail";
    	System.out.println(rs);
    	return rs;
    }
    
    // 사업자회원 비밀번호 재설정
    public String chgBsnPass(String pass, String id) {
    	String rs ="";
    	rs =  bsn_userRepository.changePass(pass, id) > 0 ? "true":"fail";
    	System.out.println(rs);
    	return rs;
    }

}
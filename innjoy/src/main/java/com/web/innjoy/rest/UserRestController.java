package com.web.innjoy.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.innjoy.dto.ReservationDto;
import com.web.innjoy.model.Admin;
import com.web.innjoy.model.Bsn_User;
import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Reservation;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.MailSender;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	// 로그인 세션
	@RequestMapping("try/login")
	public String tryLogin(@RequestParam("user_id") String user_id,
													@RequestParam("user_pass") String user_pass,
													HttpSession session,
													Model model) {
		String rs = "";
		Ij_User ij = userService.login(user_id, user_pass);
		Bsn_User bsn = userService.loginBsn(user_id, user_pass);
		Admin adm = userService.loginAdm(user_id, user_pass);
		if(ij == null && bsn == null && adm == null) {	// 일반회원, 사업자회원, 관리자 모두 null
			rs = "fail";
		}else if(ij != null){
			session.setAttribute("ij_user", ij);
			session.setAttribute("userId", ij.getUserId());
			rs = "ij";
		}else if(bsn != null){
			session.setAttribute("bsn_user", bsn);
			session.setAttribute("bsnId", bsn.getBsnId());
			rs = "bsn";
		}else if(adm != null){
			session.setAttribute("admin", adm);
			session.setAttribute("admId", adm.getAdmId());
			rs = "adm";
		}else {
			rs = "err";
		}
		return rs;
	}

	// 로그아웃
	@RequestMapping("try/logout")
	public String logout(HttpServletRequest request) {
		String rs = "";
		//세션 삭제
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
			rs ="success";
		}else {
			rs = "fail";
		}
		return rs;
	}
	 
    // 아이디 중복검사
    @PostMapping("try/idCk")
    public ResponseEntity<String> idCheck(@RequestParam String userId){
    	return ResponseEntity.ok(userService.idCkeck(userId));
    }
    
	// 회원가입 - 일반회원
	@PostMapping("try/join")
    public ResponseEntity<Ij_User> join(Ij_User user) {
        System.out.println("UserRestController : join 호출됨");
        return ResponseEntity.ok(userService.join(user));
    }
    // 회원가입 - 사업자회원
    @PostMapping("try/join_bsn")
    public ResponseEntity<Bsn_User> join_bsn(Bsn_User buser) {
    	System.out.println("UserRestController : join_bsn 호출됨");
    	return ResponseEntity.ok(userService.joinBsn(buser));
    }
    // 예약 상세내역
    @PostMapping("read/resDetail")
    public ResponseEntity<ReservationDto> viewResDetail(@RequestParam int resId) {
    	System.out.println("UserRestController : viewResDetail 호출됨");
    	return ResponseEntity.ok(userService.getResDetail(resId));
    }
    // 회원정보 수정 - 일반
    @PutMapping("/sec/try/update")
    public ResponseEntity<Ij_User> update(@RequestBody Ij_User user) {
    	userService.update(user);
    	return ResponseEntity.noContent().build();
    }
    // 회원정보 수정 - 사업자
    @PutMapping("/sec/try/update_bsn")
    public ResponseEntity<Ij_User> updateBsn(@RequestBody Bsn_User user) {
    	userService.updateBsn(user);
    	return ResponseEntity.noContent().build();
    }
    // 예약하기
    @PostMapping("/sec/try/reservation")
    public ResponseEntity<Reservation> reservation(@RequestBody Reservation res){
    	System.out.println("UserRestController : reservation 호출됨");
    	System.out.println("reservation id ck: " +res.getRoomId());
    	System.out.println("reservation id ck: " +res.getUserId());
        return ResponseEntity.ok(userService.reservation(res));
    }
    
    // 아이디 찾기
    @PostMapping("try/findId")
    public ResponseEntity<String> findId(@RequestParam String name, @RequestParam String phone){
    	return ResponseEntity.ok(userService.findId(name, phone));
    }
    // 비밀번호 찾기
    @RequestMapping("try/findPass")
    public ResponseEntity<String> findPass(@RequestParam String id, @RequestParam String phone){
    	return ResponseEntity.ok(userService.findPass(id, phone));
    }	// front에서 반환값(일반회원, 사업자회원) 비교해서 비밀번호 재설정.
   
    // 비밀번호 재설정 - 일반회원
    @RequestMapping("try/chgPass")
    public ResponseEntity<String> chgUserPass( @RequestParam String pass, @RequestParam String id){
    	return ResponseEntity.ok(userService.chgUserPass(pass, id));
    }
    
    // 비밀번호 재설정 - 사업자회원
    @RequestMapping("try/chgBsnPass")
    public ResponseEntity<String> chgBsnPass( @RequestParam String pass, @RequestParam String id){
    	return ResponseEntity.ok(userService.chgBsnPass(pass, id));
    }
    
}

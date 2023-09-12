package com.web.innjoy.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.web.innjoy.service.AdminService;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.MailSender;
import com.web.innjoy.vo.MonthlyR;
import com.web.innjoy.vo.Notice;
import com.web.innjoy.vo.NoticeSch;
import com.web.innjoy.vo.ProdR;
import com.web.innjoy.vo.User;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	//관리자 메인
	@GetMapping("admin/main")
	public String dateIncome() {
		return "admin/adm_main";
	}
	@GetMapping("map")
	public String dateInocome() {
		return "user/maptest";
	}
	//월별 예약차트-json데이터받아오기
	@GetMapping("monthlyRList")
	public @ResponseBody String mresList(Locale locale, Model model) {
		Gson gson = new Gson();
		List<MonthlyR> list = service.getMr_cnt();
		return gson.toJson(list);
	}
	//숙소별 예약차트-json데이터받아오기
	@GetMapping("prodRList")
	public @ResponseBody String presList(Locale locale, Model model) {
		Gson gson = new Gson();
		List<ProdR> list = service.getProdr_cnt();
		return gson.toJson(list);
	}
	// 일반회원 목록
	@GetMapping("/admin/ijuser")
	public String adm_user(Model model) {
		List<User> userList = service.getAllUsers();
		model.addAttribute("userList", userList);
		return "admin/adm_ijuser";
	}

	// 일반회원 메일링 초기화면 로딩
	@GetMapping("/admin/ijuser_mailForm")
	public String mailForm(@RequestParam("user_id") String user_id, Model d) {
		d.addAttribute("user", service.getId(user_id));
		return "admin/adm_ijuser_mailForm";
	}

	// 일반회원 메일발송 처리
	@PostMapping("admin/ijuser_mailSend")
	public ResponseEntity<String> mailSend(@RequestBody MailSender mailForm) {
		service.sendMail(mailForm);
		return ResponseEntity.ok("메일 전송 성공");
	}

	// 탈퇴
	@GetMapping("userBan")
	public String userBan(@RequestParam("user_id") String user_id, Model d) {
		d.addAttribute("msg", service.ijuserDelete(user_id));
		return "redirect:/admin/ijuser";
	}

	// 사업자회원!!
	// 사업자회원 목록
	@GetMapping("/admin/bsnuser")
	public String adm_bsnuser(Model model) {
		List<Bsn_user> bsnList = service.getBsnUsers();
		model.addAttribute("bsnList", bsnList);
		return "admin/adm_bsnuser";
	}

	// 사업자회원 메일링 초기화면 로딩
	@GetMapping("/admin/bsnuser_mailForm")
	public String bsnmailForm(@RequestParam("bsn_id") String bsn_id, Model d) {
		d.addAttribute("bsnuser", service.getBsnId(bsn_id));
		return "admin/adm_bsnuser_mailForm";
	}

	// 사업자 메일발송 처리
	@PostMapping("admin/bsnuser_mailSend")
	public ResponseEntity<String> bsnmailSend(@RequestBody MailSender mailForm) {
		service.sendMail(mailForm);
		return ResponseEntity.ok("메일 전송 성공");
	}

	// 사업자회원 탈퇴
	@GetMapping("bsnuserBan")
	public String bsnuserBan(@RequestParam("bsn_id") String bsn_id, Model d) {
		d.addAttribute("msg", service.bsnuserDelete(bsn_id));
		return "redirect:/admin/bsnuser";
	}

	// 공지사항 메인
	@RequestMapping("/admin/notice")
	public String noticeList(@ModelAttribute("sch") NoticeSch sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
		return "admin/adm_noticemain";
	}

	// 공지 등록 화면
	@RequestMapping("/admin/noticeInsertFrm")
	public String noticeInsertFrm(Notice ins) {
		return "admin/adm_noticeInsert";
	}

	// 공지 등록기능
	@RequestMapping("noticeInsert")
	public String noticeInsert(Notice ins, Model d) {
		d.addAttribute("msg", service.insertNotice(ins));
		return "redirect:/admin/notice";
	}

	// 공지 특정글 보기
	@GetMapping("/admin/noticeDetail")
	public String noticeDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("notice", service.getDetail(no));
		return "admin/adm_noticeDetail";
	}

	// 공지 수정
	@PostMapping("/noticeUpdate")
	public String noteUpdate(Notice upt, Model d) {
		d.addAttribute("msg", service.updateNotice(upt));
		d.addAttribute("notice", service.getNotice(upt.getNo()));

		return "admin/adm_noticeDetail";
	}

	// 공지 삭제
	@GetMapping("/noticeDelete")
	public String noteDelete(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.deleteNotice(no));
		return "admin/adm_noticeDetail";
	}

	//사용자-공지사항
	@RequestMapping("notice")
	public String ijnoticeList(@ModelAttribute("sch") NoticeSch sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
		return "admin/ij_notice";
	}
	//사용자-공지 특정글 보기
	@GetMapping("noticeDetail")
	public String ijnoticeDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("notice", service.getijDetail(no));
		return "admin/ij_noticeDetail";
	}
	//파일 다운로드
		@RequestMapping("download")
		public String download(@RequestParam("fname") 
				String fname, Model d) {
			d.addAttribute("downloadFile", fname);
			System.out.println("호출!!!!");
			return "downloadViewer";
		}
		// 자주묻는 질문
		   @GetMapping("faq")
		   public String faq() {
		      return "admin/ij_faq";
		   }
}

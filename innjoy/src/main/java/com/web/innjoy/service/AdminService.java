package com.web.innjoy.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.innjoy.dao.AdmDao;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.MailSender;
import com.web.innjoy.vo.MonthlyR;
import com.web.innjoy.vo.Notice;
import com.web.innjoy.vo.NoticeFile;
import com.web.innjoy.vo.NoticeSch;
import com.web.innjoy.vo.ProdR;
import com.web.innjoy.vo.User;

@Service
public class AdminService {
	@Autowired
	private AdmDao dao;
	@Autowired(required = false)
	private JavaMailSender sender;
	
	//차트
	public List<MonthlyR> getMr_cnt(){
		return dao.getMr_cnt();
	}
	public List<ProdR> getProdr_cnt(){
		return dao.getProdr_cnt();
	}
	//일반회원
	//회원 목록
	
	public List<User> getAllUsers() {
		return dao.ijList();
	}

	// 특정 회원 정보
	public User getId(String ij_user) {
		return dao.getId(ij_user);
	}
	//자유 메일링
	public void sendMail(MailSender mailForm) {

		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

		simpleMailMessage.setTo(mailForm.getReceiver());
		simpleMailMessage.setSubject(mailForm.getTitle());
		simpleMailMessage.setText(mailForm.getContent());

		sender.send(simpleMailMessage);
	}
	//회원 탈퇴
	public String ijuserDelete(String user_id) {
		return dao.ijuserDelete(user_id) > 0 ? "탈퇴 처리되었습니다." : "탈퇴되지 않았습니다.";
	}
		
	//사업자회원
	// 회원 목록
	public List<Bsn_user> getBsnUsers() {
		return dao.bsnList();
	}

	// 특정 회원 정보
	public Bsn_user getBsnId(String bsn_id) {
		return dao.getBsnId(bsn_id);
	}
	//탈퇴
	public String bsnuserDelete(String bsn_id) {
		return dao.bsnuserDelete(bsn_id) > 0 ? "탈퇴 처리되었습니다." : "탈퇴되지 않았습니다.";
	}
	
	public List<Notice> noticeList(NoticeSch sch) {
	    if (sch.getN_title() == null) sch.setN_title("");
	    sch.setCount(dao.getTot(sch));
	    if (sch.getPageSize() == 0) sch.setPageSize(5); // 초기 페이지 수

	    // 총 페이지 수
	    int pageCnt = (int) Math.ceil(sch.getCount() / (double) sch.getPageSize());
	    sch.setPageCount(pageCnt);

	    // 초기 페이지
	    if (sch.getCurPage() == 0) sch.setCurPage(1);

	    // 페이지 블럭에서 이후 처리시 예외 처리..
	    if (sch.getCurPage() > sch.getPageCount()) {
	        sch.setCurPage(sch.getPageCount());
	    }

	    sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
	    sch.setEnd(sch.getCurPage() * sch.getPageSize());

	    sch.setBlockSize(5);
	    int blockNum = (int) Math.ceil(sch.getCurPage() / (double) sch.getBlockSize());
	    sch.setStartBlock((blockNum - 1) * sch.getBlockSize() + 1);
	    sch.setEndBlock(blockNum * sch.getBlockSize());
	    int endBlock = blockNum * sch.getBlockSize();
	    if (endBlock > sch.getPageCount()) {
	        endBlock = sch.getPageCount();
	    }
	    sch.setEndBlock(endBlock);

	    List<Notice> noticeList = dao.noticeList(sch);

	    // 데이터가 없을 때 빈 리스트 반환
	    return noticeList != null ? noticeList : new ArrayList<Notice>();
	}

	@Value("${upload}")
	private String path;	
	public String insertNotice(Notice insert) {
		int no = dao.getNo();
		insert.setNo(no);
		String msg = "업로드 성공";
		for(MultipartFile mf:insert.getReport() ) {
			String fname = mf.getOriginalFilename();
			if(fname!=null && !fname.trim().equals("")) {
				File f = new File(path+fname);
				try {
					mf.transferTo(f);
					
				} catch (IllegalStateException e) {
					msg = "예외발생1:"+e.getMessage();
				} catch (IOException e) {
					msg = "예외발생2:"+e.getMessage();
				}
				if(msg.equals("업로드 성공")) {
					dao.insertNoticeFile(
						new NoticeFile(no,fname,insert.getN_title()));
				}
			}
		}
		System.out.println("파일첨부내용:"+msg);
		return dao.insertNotice(insert)>0?
				"등록성공":"등록되지 않았습니다";
	}	
	public Notice getDetail(int no) {
		Notice not = dao.getNotice(no);
		not.setFnames(dao.getFnames(no));
		return not;
	}
	public Notice getNotice(int no) {
		return dao.getNotice(no);
	}	
	
	//회원용
	public Notice getijDetail(int no) {
		// 조회할 때, 조회횟수 증가 처리..
		dao.readCntUp(no);
		Notice not = dao.getNotice(no);
		not.setFnames(dao.getFnames(no));
		return not;
	}
	public String updateNotice(Notice upt) {
		return dao.updateNotice(upt)>0?
					"수정완료":"수정되지 않았습니다.";
	}
	public String deleteNotice(int no) {
		return dao.deleteNotice(no)>0?
				"삭제완료":"삭제되지 않았습니다.";
	}

}

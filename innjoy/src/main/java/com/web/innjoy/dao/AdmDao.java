package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.MonthlyR;
import com.web.innjoy.vo.Notice;
import com.web.innjoy.vo.NoticeFile;
import com.web.innjoy.vo.NoticeSch;
import com.web.innjoy.vo.ProdR;
import com.web.innjoy.vo.User;

@Mapper
public interface AdmDao {
	//차트
	List<MonthlyR> getMr_cnt();
	List<ProdR> getProdr_cnt();
	//일반회원
	public List<User> ijList();
	public User getId(String user_id);
	public int ijuserDelete(String user_id);
	//사업자회원
	public List<Bsn_user> bsnList();
	public Bsn_user getBsnId(String bsn_id);
	public int bsnuserDelete(String bsn_id);
	//공지사항
	public int getTot(NoticeSch sch);
	public List<Notice> noticeList(NoticeSch sch);
	public int getNo();
	public int insertNotice(Notice insert);
	public Notice getNotice(int no);
	public void readCntUp(int no);
	public int updateNotice(Notice upt);
	public int deleteNotice(int no);
	public int insertNoticeFile(NoticeFile ins);
	public List<String> getFnames(int no);
}

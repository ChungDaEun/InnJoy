package com.web.innjoy.vo;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
// com.web.board.vo.Board
public class Notice {
	private int cnt;
	private int level;
	private int no;
	private int refno;
	private String n_title;
	private String n_content;
	private int readcnt;
	private Date regdate; 
	private Date uptdate;
	private List<String> fnames;
	private MultipartFile[] report;
	
	public Notice(int cnt, int level, int no, int refno, String n_title, String n_content, int readcnt, Date regdate,
			Date uptdate, List<String> fnames, MultipartFile[] report) {
		super();
		this.cnt = cnt;
		this.level = level;
		this.no = no;
		this.refno = refno;
		this.n_title = n_title;
		this.n_content = n_content;
		this.readcnt = readcnt;
		this.regdate = regdate;
		this.uptdate = uptdate;
		this.fnames = fnames;
		this.report = report;
	}

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRefno() {
		return refno;
	}

	public void setRefno(int refno) {
		this.refno = refno;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUptdate() {
		return uptdate;
	}

	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}

	public List<String> getFnames() {
		return fnames;
	}

	public void setFnames(List<String> fnames) {
		this.fnames = fnames;
	}

	public MultipartFile[] getReport() {
		return report;
	}

	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
}
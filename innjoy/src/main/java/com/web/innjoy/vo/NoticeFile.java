package com.web.innjoy.vo;

public class NoticeFile {
	private int no;
	private String fname;
	private String directory;
	private String info;

	public NoticeFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public NoticeFile(int no, String fname, String directory, String info) {
		super();
		this.no = no;
		this.fname = fname;
		this.directory = directory;
		this.info = info;
	}
	
	public NoticeFile(int no, String fname, String info) {
		super();
		this.no = no;
		this.fname = fname;
		this.info = info;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getDirectory() {
		return directory;
	}
	public void setDirectory(String directory) {
		this.directory = directory;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}

package com.web.innjoy.vo;

import java.util.Date;

public class Board_img {
	private int no;
	private String fname;
	private Date updte;
	private int recom_id ;
	
	public Board_img() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board_img(int no, String fname, Date updte, int recom_id) {
		super();
		this.no = no;
		this.fname = fname;
		this.updte = updte;
		this.recom_id = recom_id;
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

	public Date getUpdte() {
		return updte;
	}

	public void setUpdte(Date updte) {
		this.updte = updte;
	}

	public int getRecom_id() {
		return recom_id;
	}

	public void setRecom_id(int recom_id) {
		this.recom_id = recom_id;
	}
	
}

package com.web.innjoy.vo;

import java.util.Date;

public class Review_img {
	private int no;
	private String fname;
	private Date updte;
	private int review_id;
	
	public Review_img() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review_img(int no, String fname, Date updte, int review_id) {
		super();
		this.no = no;
		this.fname = fname;
		this.updte = updte;
		this.review_id = review_id;
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

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

}

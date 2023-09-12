package com.web.innjoy.vo;

import java.util.Date;

public class Review_comm {
	private int rv_com_id;
	private int review_id;
	private String rv_com_det;
	private Date rv_com_time;
	
	public Review_comm() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Review_comm(int rv_com_id, int review_id, String rv_com_det, Date rv_com_time) {
		super();
		this.rv_com_id = rv_com_id;
		this.review_id = review_id;
		this.rv_com_det = rv_com_det;
		this.rv_com_time = rv_com_time;
	}
	public int getRv_com_id() {
		return rv_com_id;
	}
	public void setRv_com_id(int rv_com_id) {
		this.rv_com_id = rv_com_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getRv_com_det() {
		return rv_com_det;
	}
	public void setRv_com_det(String rv_com_det) {
		this.rv_com_det = rv_com_det;
	}
	public Date getRv_com_time() {
		return rv_com_time;
	}
	public void setRv_com_time(Date rv_com_time) {
		this.rv_com_time = rv_com_time;
	}
	
}

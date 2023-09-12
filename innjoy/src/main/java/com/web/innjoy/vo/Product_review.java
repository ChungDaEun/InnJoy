package com.web.innjoy.vo;

import java.util.Date;

public class Product_review {
	private String user_id;
	private String n_name;
	private int reservation_id;
	private int room_id;
	private String room_name;
	private int pro_id;
	private String bsn_id;
	private String bsn_name;
	private int review_id;
	private int star;
	private String review_det;
	private Date rev_time;
	private String fname;
	private String rv_com_det;
	private Date rv_com_time;
	public Product_review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_review(String user_id, String n_name, int reservation_id, int room_id, String room_name, int pro_id,
			String bsn_id, String bsn_name, int review_id, int star, String review_det, Date rev_time, String fname,
			String rv_com_det, Date rv_com_time) {
		super();
		this.user_id = user_id;
		this.n_name = n_name;
		this.reservation_id = reservation_id;
		this.room_id = room_id;
		this.room_name = room_name;
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.bsn_name = bsn_name;
		this.review_id = review_id;
		this.star = star;
		this.review_det = review_det;
		this.rev_time = rev_time;
		this.fname = fname;
		this.rv_com_det = rv_com_det;
		this.rv_com_time = rv_com_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getBsn_id() {
		return bsn_id;
	}
	public void setBsn_id(String bsn_id) {
		this.bsn_id = bsn_id;
	}
	public String getBsn_name() {
		return bsn_name;
	}
	public void setBsn_name(String bsn_name) {
		this.bsn_name = bsn_name;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReview_det() {
		return review_det;
	}
	public void setReview_det(String review_det) {
		this.review_det = review_det;
	}
	public Date getRev_time() {
		return rev_time;
	}
	public void setRev_time(Date rev_time) {
		this.rev_time = rev_time;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
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
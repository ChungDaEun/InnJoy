package com.web.innjoy.vo;

import java.util.Date;

public class Product_recomm {
	private int recom_id;
	private String title;
	private String detail;
	private String recom_loc;
	private Date recom_time;
	private int reservation_id;
	private String fname;
	private int room_id;
	private int pro_id;
	private String user_id;
	private String n_name;
	public Product_recomm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_recomm(int recom_id, String title, String detail, String recom_loc, Date recom_time,
			int reservation_id, String fname, int room_id, int pro_id, String user_id, String n_name) {
		super();
		this.recom_id = recom_id;
		this.title = title;
		this.detail = detail;
		this.recom_loc = recom_loc;
		this.recom_time = recom_time;
		this.reservation_id = reservation_id;
		this.fname = fname;
		this.room_id = room_id;
		this.pro_id = pro_id;
		this.user_id = user_id;
		this.n_name = n_name;
	}
	public int getRecom_id() {
		return recom_id;
	}
	public void setRecom_id(int recom_id) {
		this.recom_id = recom_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRecom_loc() {
		return recom_loc;
	}
	public void setRecom_loc(String recom_loc) {
		this.recom_loc = recom_loc;
	}
	public Date getRecom_time() {
		return recom_time;
	}
	public void setRecom_time(Date recom_time) {
		this.recom_time = recom_time;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
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

}
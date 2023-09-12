package com.web.innjoy.vo;

import java.util.Date;

public class Product_roomfilter {

	private int pro_id;
	private String pro_name;
	private int room_id;
	private String room_name;
	private int room_price;
	private String checkin;
	private String checkout;
	private int min_cnt;
	private int max_cnt;
	private int reservation_id;
	private String user_id;
	private int user_cnt;
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
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
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getMin_cnt() {
		return min_cnt;
	}
	public void setMin_cnt(int min_cnt) {
		this.min_cnt = min_cnt;
	}
	public int getMax_cnt() {
		return max_cnt;
	}
	public void setMax_cnt(int max_cnt) {
		this.max_cnt = max_cnt;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_cnt() {
		return user_cnt;
	}
	public void setUser_cnt(int user_cnt) {
		this.user_cnt = user_cnt;
	}
	public Date getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(Date start_dt) {
		this.start_dt = start_dt;
	}
	public Date getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(Date end_dt) {
		this.end_dt = end_dt;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Product_roomfilter(int pro_id, String pro_name, int room_id, String room_name, int room_price,
			String checkin, String checkout, int min_cnt, int max_cnt, int reservation_id, String user_id, int user_cnt,
			Date start_dt, Date end_dt, String fname) {
		super();
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.room_id = room_id;
		this.room_name = room_name;
		this.room_price = room_price;
		this.checkin = checkin;
		this.checkout = checkout;
		this.min_cnt = min_cnt;
		this.max_cnt = max_cnt;
		this.reservation_id = reservation_id;
		this.user_id = user_id;
		this.user_cnt = user_cnt;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.fname = fname;
	}
	public Product_roomfilter() {
		super();
		// TODO Auto-generated constructor stub
	}
	private Date start_dt;
	private Date end_dt;
	private String fname;

}
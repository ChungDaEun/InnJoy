package com.web.innjoy.vo;


public class RoomIns {
	private int room_id;
	private String room_name; //
	private int  room_price; //
	private String checkin; //
	private String checkout; //
	private int min_cnt; //
	private int max_cnt; //
	private String smoking; //
	private String bed_cnt; //
	private int pro_id; //
//	private int no;
//	private Date updte;
//	private String fname;
	public RoomIns() {
		super();
		// TODO Auto-generated constructor stub
	}
	





	public RoomIns(int room_id, String room_name, int room_price, String checkin, String checkout, int min_cnt, int max_cnt,
		String smoking, String bed_cnt, int pro_id) {
	super();
	this.room_id = room_id;
	this.room_name = room_name;
	this.room_price = room_price;
	this.checkin = checkin;
	this.checkout = checkout;
	this.min_cnt = min_cnt;
	this.max_cnt = max_cnt;
	this.smoking = smoking;
	this.bed_cnt = bed_cnt;
	this.pro_id = pro_id;
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
	public String getSmoking() {
		return smoking;
	}
	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}
	public String getBed_cnt() {
		return bed_cnt;
	}
	public void setBed_cnt(String bed_cnt) {
		this.bed_cnt = bed_cnt;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	
	
}

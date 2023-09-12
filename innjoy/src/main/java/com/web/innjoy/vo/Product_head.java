package com.web.innjoy.vo;

public class Product_head {
	private int pro_id;
	private String pro_name;
	private String ser_conts;
	private String pfname;
	private String pro_type;
	private int pro_type_id;
	private String bsn_id;
	private String start_dt;
	private String end_dt;
	private String user_cnt;
	private String room_id;
	private String room_name;
	private String min_cnt;
	private String max_cnt;
	
	public Product_head() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product_head(int pro_id, String pro_name, String ser_conts, String pfname, String pro_type, int pro_type_id,
			String bsn_id, String start_dt, String end_dt, String user_cnt, String room_id, String room_name,
			String min_cnt, String max_cnt) {
		super();
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.ser_conts = ser_conts;
		this.pfname = pfname;
		this.pro_type = pro_type;
		this.pro_type_id = pro_type_id;
		this.bsn_id = bsn_id;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.user_cnt = user_cnt;
		this.room_id = room_id;
		this.room_name = room_name;
		this.min_cnt = min_cnt;
		this.max_cnt = max_cnt;
	}

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

	public String getSer_conts() {
		return ser_conts;
	}

	public void setSer_conts(String ser_conts) {
		this.ser_conts = ser_conts;
	}

	public String getPfname() {
		return pfname;
	}

	public void setPfname(String pfname) {
		this.pfname = pfname;
	}

	public String getPro_type() {
		return pro_type;
	}

	public void setPro_type(String pro_type) {
		this.pro_type = pro_type;
	}

	public int getPro_type_id() {
		return pro_type_id;
	}

	public void setPro_type_id(int pro_type_id) {
		this.pro_type_id = pro_type_id;
	}

	public String getBsn_id() {
		return bsn_id;
	}

	public void setBsn_id(String bsn_id) {
		this.bsn_id = bsn_id;
	}

	public String getStart_dt() {
		return start_dt;
	}

	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}

	public String getEnd_dt() {
		return end_dt;
	}

	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}

	public String getUser_cnt() {
		return user_cnt;
	}

	public void setUser_cnt(String user_cnt) {
		this.user_cnt = user_cnt;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getMin_cnt() {
		return min_cnt;
	}

	public void setMin_cnt(String min_cnt) {
		this.min_cnt = min_cnt;
	}

	public String getMax_cnt() {
		return max_cnt;
	}

	public void setMax_cnt(String max_cnt) {
		this.max_cnt = max_cnt;
	}




}
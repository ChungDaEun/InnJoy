package com.web.innjoy.vo;

public class Product {
	private int pro_id;
	private String bsn_id;
	private int pro_type_id;
	private String pro_name;
	private String pro_loc;
	private String basic_info;
	private String res_ann;
	private String ser_conts;
	private String pfname;
	
	private int room_id;
	private String[] room_name;
	private int[]  room_price;
	private String[] checkin;
	private String[] checkout;
	private int[] min_cnt;
	private int[] max_cnt;
	private String[] smoking;
	private String[] bed_cnt;
	
	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Product(int pro_id, int pro_type_id, String pro_name, String basic_info, String res_ann, String ser_conts) {
		super();
		this.pro_id = pro_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
	}

	
	public Product(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
			String res_ann, String ser_conts) {
		super();
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.pro_loc = pro_loc;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
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
	public int getPro_type_id() {
		return pro_type_id;
	}
	public void setPro_type_id(int pro_type_id) {
		this.pro_type_id = pro_type_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_loc() {
		return pro_loc;
	}
	public void setPro_loc(String pro_loc) {
		this.pro_loc = pro_loc;
	}
	public String getBasic_info() {
		return basic_info;
	}
	public void setBasic_info(String basic_info) {
		this.basic_info = basic_info;
	}
	public String getRes_ann() {
		return res_ann;
	}
	public void setRes_ann(String res_ann) {
		this.res_ann = res_ann;
	}
	public String getSer_conts() {
		return ser_conts;
	}
	public void setSer_conts(String ser_conts) {
		this.ser_conts = ser_conts;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public Product(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
			String res_ann, String ser_conts, int room_id, String[] room_name, int[] room_price, String[] checkin,
			String[] checkout, int[] min_cnt, int[] max_cnt, String[] smoking, String[] bed_cnt) {
		super();
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.pro_loc = pro_loc;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
		this.room_id = room_id;
		this.room_name = room_name;
		this.room_price = room_price;
		this.checkin = checkin;
		this.checkout = checkout;
		this.min_cnt = min_cnt;
		this.max_cnt = max_cnt;
		this.smoking = smoking;
		this.bed_cnt = bed_cnt;
	}

	public String[] getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String[] room_name) {
		this.room_name = room_name;
	}

	public int[] getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int[] room_price) {
		this.room_price = room_price;
	}

	public String[] getCheckin() {
		return checkin;
	}

	public void setCheckin(String[] checkin) {
		this.checkin = checkin;
	}

	public String[] getCheckout() {
		return checkout;
	}

	public void setCheckout(String[] checkout) {
		this.checkout = checkout;
	}

	public int[] getMin_cnt() {
		return min_cnt;
	}

	public void setMin_cnt(int[] min_cnt) {
		this.min_cnt = min_cnt;
	}

	public int[] getMax_cnt() {
		return max_cnt;
	}

	public void setMax_cnt(int[] max_cnt) {
		this.max_cnt = max_cnt;
	}

	public String[] getSmoking() {
		return smoking;
	}

	public void setSmoking(String[] smoking) {
		this.smoking = smoking;
	}

	public String[] getBed_cnt() {
		return bed_cnt;
	}

	public void setBed_cnt(String[] bed_cnt) {
		this.bed_cnt = bed_cnt;
	}


	public String getPfname() {
		return pfname;
	}


	public void setPfname(String pfname) {
		this.pfname = pfname;
	}
}

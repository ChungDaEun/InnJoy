package com.web.innjoy.vo;

public class Pro_type_id {
	private int pro_type_id;
	private String pro_type;
	
	public Pro_type_id() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Pro_type_id(int pro_type_id, String pro_type) {
		super();
		this.pro_type_id = pro_type_id;
		this.pro_type = pro_type;
	}
	public int getPro_type_id() {
		return pro_type_id;
	}
	public void setPro_type_id(int pro_type_id) {
		this.pro_type_id = pro_type_id;
	}
	public String getPro_type() {
		return pro_type;
	}
	public void setPro_type(String pro_type) {
		this.pro_type = pro_type;
	}

}

package com.web.innjoy.vo;

public class Wish {
	private int wish_id;
	private String user_id;
	private int pro_id;
	public Wish() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Wish(int wish_id, String user_id, int pro_id) {
		super();
		this.wish_id = wish_id;
		this.user_id = user_id;
		this.pro_id = pro_id;
	}
	public int getWish_id() {
		return wish_id;
	}
	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

}

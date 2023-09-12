package com.web.innjoy.vo;

import java.util.Date;

public class Recomm_comm {
	private int rc_com_id;
	private int recom_id;
	private String user_id;
	private String rc_com_det;
	private Date rc_com_time;
	public Recomm_comm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Recomm_comm(int rc_com_id, int recom_id, String user_id, String rc_com_det, Date rc_com_time) {
		super();
		this.rc_com_id = rc_com_id;
		this.recom_id = recom_id;
		this.user_id = user_id;
		this.rc_com_det = rc_com_det;
		this.rc_com_time = rc_com_time;
	}
	public int getRc_com_id() {
		return rc_com_id;
	}
	public void setRc_com_id(int rc_com_id) {
		this.rc_com_id = rc_com_id;
	}
	public int getRecom_id() {
		return recom_id;
	}
	public void setRecom_id(int recom_id) {
		this.recom_id = recom_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRc_com_det() {
		return rc_com_det;
	}
	public void setRc_com_det(String rc_com_det) {
		this.rc_com_det = rc_com_det;
	}
	public Date getRc_com_time() {
		return rc_com_time;
	}
	public void setRc_com_time(Date rc_com_time) {
		this.rc_com_time = rc_com_time;
	}
	
}

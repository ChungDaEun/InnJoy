package com.web.innjoy.vo;

public class Res_cancle {
	private int cancle_id;
	private int reservation_id;
	private String cancle_reason;
	
	public Res_cancle() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Res_cancle(int cancle_id, int reservation_id, String cancle_reason) {
		super();
		this.cancle_id = cancle_id;
		this.reservation_id = reservation_id;
		this.cancle_reason = cancle_reason;
	}
	public int getCancle_id() {
		return cancle_id;
	}
	public void setCancle_id(int cancle_id) {
		this.cancle_id = cancle_id;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getCancle_reason() {
		return cancle_reason;
	}
	public void setCancle_reason(String cancle_reason) {
		this.cancle_reason = cancle_reason;
	}
	
	
}

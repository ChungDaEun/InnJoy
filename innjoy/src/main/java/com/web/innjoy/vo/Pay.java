package com.web.innjoy.vo;

import java.util.Date;

public class Pay {
	private int pay_id;
	private int reservation_id;
	private int pay_price;
	private String pay_type;
	private Date pay_time;
	
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Pay(int pay_id, int reservation_id, int pay_price, String pay_type, Date pay_time) {
		super();
		this.pay_id = pay_id;
		this.reservation_id = reservation_id;
		this.pay_price = pay_price;
		this.pay_type = pay_type;
		this.pay_time = pay_time;
	}
	public int getPay_id() {
		return pay_id;
	}
	public void setPay_id(int pay_id) {
		this.pay_id = pay_id;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	
}

package com.web.innjoy.vo;

import java.util.Date;

public class Reservation {
	private int reservation_id;
	private String user_id;
	private int room_id;
	private int user_cnt;
	private Date start_dt;
	private Date end_dt;
	private int payment;
	private int status;
	
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reservation(int reservation_id, String user_id, int room_id, int user_cnt, Date start_dt, Date end_dt,
			int payment, int status) {
		super();
		this.reservation_id = reservation_id;
		this.user_id = user_id;
		this.room_id = room_id;
		this.user_cnt = user_cnt;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.payment = payment;
		this.status = status;
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

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
}

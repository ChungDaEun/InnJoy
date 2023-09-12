package com.web.innjoy.vo;

import java.util.Date;

public class Room_img {
	private int rno;
	private String rfname;
	private Date updte;
	private int room_id;
	public Room_img() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Room_img(int rno, String rfname, Date updte, int room_id) {
		super();
		this.rno = rno;
		this.rfname = rfname;
		this.updte = updte;
		this.room_id = room_id;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRfname() {
		return rfname;
	}
	public void setRfname(String rfname) {
		this.rfname = rfname;
	}
	public Date getUpdte() {
		return updte;
	}
	public void setUpdte(Date updte) {
		this.updte = updte;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	
}

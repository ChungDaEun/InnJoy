package com.web.innjoy.dto;

import java.util.Date;

public class ReservationDto {

	private int reservationId;
	private String userName;
	private String userPhone;
	private String proName;
	private String proLoc;
	private int roomId;
	private String roomName;
	private int userCnt;
	private Date startDt;
	private Date endDt;
	private int payment;
	private int status;
	
	// 생성자
	public ReservationDto() {}
	
	public ReservationDto(int reservationId, String userName, String userPhone, String proName, int roomId,
			String roomName, int userCnt, Date startDt, Date endDt, int payment, int status) {
		this.reservationId = reservationId;
		this.userName = userName;
		this.userPhone = userPhone;
		this.proName = proName;
		this.roomId = roomId;
		this.roomName = roomName;
		this.userCnt = userCnt;
		this.startDt = startDt;
		this.endDt = endDt;
		this.payment = payment;
		this.status = status;
	}
	
	public ReservationDto(int reservationId, String userName, String userPhone, String proName, String proLoc,
			int roomId, String roomName, int userCnt, Date startDt, Date endDt, int payment, int status) {
		this.reservationId = reservationId;
		this.userName = userName;
		this.userPhone = userPhone;
		this.proName = proName;
		this.proLoc = proLoc;
		this.roomId = roomId;
		this.roomName = roomName;
		this.userCnt = userCnt;
		this.startDt = startDt;
		this.endDt = endDt;
		this.payment = payment;
		this.status = status;
	}

	// getter, setter
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getUserCnt() {
		return userCnt;
	}
	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
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

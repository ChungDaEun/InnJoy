package com.web.innjoy.dto;

import java.util.Date;

public class ReviewDto {

	private int reviewId;
	private int reservationId;
	private String proName;
	private String roomName;
	private Date startDte;
	private Date endDte;
	private int star;
	private String reviewDet;
	
	// 생성자
	public ReviewDto() {}
	
	public ReviewDto(int reviewId, int reservationId, String proName, String roomName, Date startDte, Date endDte,
			int star, String reviewDet) {
		this.reviewId = reviewId;
		this.reservationId = reservationId;
		this.proName = proName;
		this.roomName = roomName;
		this.startDte = startDte;
		this.endDte = endDte;
		this.star = star;
		this.reviewDet = reviewDet;
	}
	// getter, setter
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Date getStartDte() {
		return startDte;
	}
	public void setStartDte(Date startDte) {
		this.startDte = startDte;
	}
	public Date getEndDte() {
		return endDte;
	}
	public void setEndDte(Date endDte) {
		this.endDte = endDte;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReviewDet() {
		return reviewDet;
	}
	public void setReviewDet(String reviewDet) {
		this.reviewDet = reviewDet;
	}
	
}

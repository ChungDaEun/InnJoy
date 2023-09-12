package com.web.innjoy.vo;

import java.util.Date;

public class Review {
	private int review_id;
	private int star;
	private String review_det;
	private Date rev_time;
	private int reservation_id;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int review_id, int star, String review_det, Date rev_time, int reservation_id) {
		super();
		this.review_id = review_id;
		this.star = star;
		this.review_det = review_det;
		this.rev_time = rev_time;
		this.reservation_id = reservation_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReview_det() {
		return review_det;
	}
	public void setReview_det(String review_det) {
		this.review_det = review_det;
	}
	public Date getRev_time() {
		return rev_time;
	}
	public void setRev_time(Date rev_time) {
		this.rev_time = rev_time;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}

}

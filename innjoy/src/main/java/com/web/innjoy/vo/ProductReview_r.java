package com.web.innjoy.vo;

public class ProductReview_r {
	private User user;
	private Reservation reservation;
	private Room room;
	private Product product;
	private Bsn_user bsn_user;
	private Review review;
	private Review_img review_img;
	private Review_comm review_comm;
	public ProductReview_r() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductReview_r(User user, Reservation reservation, Room room, Product product, Bsn_user bsn_user,
			Review review, Review_img review_img, Review_comm review_comm) {
		super();
		this.user = user;
		this.reservation = reservation;
		this.room = room;
		this.product = product;
		this.bsn_user = bsn_user;
		this.review = review;
		this.review_img = review_img;
		this.review_comm = review_comm;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Bsn_user getBsn_user() {
		return bsn_user;
	}
	public void setBsn_user(Bsn_user bsn_user) {
		this.bsn_user = bsn_user;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public Review_img getReview_img() {
		return review_img;
	}
	public void setReview_img(Review_img review_img) {
		this.review_img = review_img;
	}
	public Review_comm getReview_comm() {
		return review_comm;
	}
	public void setReview_comm(Review_comm review_comm) {
		this.review_comm = review_comm;
	}

}
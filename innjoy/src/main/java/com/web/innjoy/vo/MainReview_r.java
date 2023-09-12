package com.web.innjoy.vo;

public class MainReview_r {
	private Review review;
	private User user;
	private Product product;
	private Review_img review_img;
	public MainReview_r() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainReview_r(Review review, User user, Product product, Review_img review_img) {
		super();
		this.review = review;
		this.user = user;
		this.product = product;
		this.review_img = review_img;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Review_img getReview_img() {
		return review_img;
	}
	public void setReview_img(Review_img review_img) {
		this.review_img = review_img;
	}
	
}
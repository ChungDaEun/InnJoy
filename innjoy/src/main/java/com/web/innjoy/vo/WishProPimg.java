package com.web.innjoy.vo;

public class WishProPimg {
	private Product product;
	private Wish wish;
	private Pro_img pro_img;
	
	public WishProPimg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WishProPimg(Product product, Wish wish, Pro_img pro_img) {
		super();
		this.product = product;
		this.wish = wish;
		this.pro_img = pro_img;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Wish getWish() {
		return wish;
	}
	public void setWish(Wish wish) {
		this.wish = wish;
	}
	public Pro_img getPro_img() {
		return pro_img;
	}
	public void setPro_img(Pro_img pro_img) {
		this.pro_img = pro_img;
	}
	

}

package com.web.innjoy.vo;

public class ProductHead_p {
	private Product product;
	private Pro_type_id pro_type_id;
	private Pro_img pro_img;
	
	public ProductHead_p() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductHead_p(Product product, Pro_type_id pro_type_id, Pro_img pro_img) {
		super();
		this.product = product;
		this.pro_type_id = pro_type_id;
		this.pro_img = pro_img;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Pro_type_id getPro_type_id() {
		return pro_type_id;
	}
	public void setPro_type_id(Pro_type_id pro_type_id) {
		this.pro_type_id = pro_type_id;
	}
	public Pro_img getPro_img() {
		return pro_img;
	}
	public void setPro_img(Pro_img pro_img) {
		this.pro_img = pro_img;
	}
	
}

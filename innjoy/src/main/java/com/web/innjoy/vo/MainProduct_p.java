package com.web.innjoy.vo;

public class MainProduct_p {
	private Pro_type_id pro_type_id;
	private Product product;
	private Room room;
	private Pro_img pro_img; 
	public MainProduct_p() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainProduct_p(Pro_type_id pro_type_id, Product product, Room room, Pro_img pro_img) {
		super();
		this.pro_type_id = pro_type_id;
		this.product = product;
		this.room = room;
		this.pro_img = pro_img;
	}
	public Pro_type_id getPro_type_id() {
		return pro_type_id;
	}
	public void setPro_type_id(Pro_type_id pro_type_id) {
		this.pro_type_id = pro_type_id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Pro_img getPro_img() {
		return pro_img;
	}
	public void setPro_img(Pro_img pro_img) {
		this.pro_img = pro_img;
	}
	
}

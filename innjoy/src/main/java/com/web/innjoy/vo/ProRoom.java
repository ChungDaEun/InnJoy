package com.web.innjoy.vo;

public class ProRoom {
    private Product product;
    private Room room;
    private Pro_img pro_img;
	public ProRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProRoom(Product product, Room room) {
		super();
		this.product = product;
		this.room = room;
	}
	
	public ProRoom(Product product, Room room, Pro_img pro_img) {
		super();
		this.product = product;
		this.room = room;
		this.pro_img = pro_img;
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

package com.web.innjoy.vo;

public class ProductRoom {
    private Product product;
    private Room room;
	public ProductRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductRoom(Product product, Room room) {
		super();
		this.product = product;
		this.room = room;
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
    
}

package com.web.innjoy.vo;

public class ProductRoom_f {
	private Room room;
	private Product product;
	private Room_img room_img;
	private Reservation reservation;
	public ProductRoom_f() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductRoom_f(Room room, Product product, Room_img room_img, Reservation reservation) {
		super();
		this.room = room;
		this.product = product;
		this.room_img = room_img;
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
	public Room_img getRoom_img() {
		return room_img;
	}
	public void setRoom_img(Room_img room_img) {
		this.room_img = room_img;
	}
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

}
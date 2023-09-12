package com.web.innjoy.vo;

public class ProductRecomm_r {
	private Recomm recomm;
	private Board_img board_img;
	private Reservation reservation;
	private Room room;
	private Product product;
	private User user;
	public ProductRecomm_r() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductRecomm_r(Recomm recomm, Board_img board_img, Reservation reservation, Room room, Product product,
			User user) {
		super();
		this.recomm = recomm;
		this.board_img = board_img;
		this.reservation = reservation;
		this.room = room;
		this.product = product;
		this.user = user;
	}
	public Recomm getRecomm() {
		return recomm;
	}
	public void setRecomm(Recomm recomm) {
		this.recomm = recomm;
	}
	public Board_img getBoard_img() {
		return board_img;
	}
	public void setBoard_img(Board_img board_img) {
		this.board_img = board_img;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
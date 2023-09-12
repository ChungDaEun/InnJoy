package com.web.innjoy.vo;

public class MainRecomm_r {
	private Recomm recomm;
	private User user;
	private Reservation reservation;
	private Board_img board_img;
	public MainRecomm_r() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainRecomm_r(Recomm recomm, User user, Reservation reservation, Board_img board_img) {
		super();
		this.recomm = recomm;
		this.user = user;
		this.reservation = reservation;
		this.board_img = board_img;
	}
	public Recomm getRecomm() {
		return recomm;
	}
	public void setRecomm(Recomm recomm) {
		this.recomm = recomm;
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
	public Board_img getBoard_img() {
		return board_img;
	}
	public void setBoard_img(Board_img board_img) {
		this.board_img = board_img;
	}
	
}
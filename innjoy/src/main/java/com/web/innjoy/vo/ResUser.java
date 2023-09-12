package com.web.innjoy.vo;

public class ResUser {
	private User user;
	private Reservation reservation;
	public ResUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResUser(User user, Reservation reservation) {
		super();
		this.user = user;
		this.reservation = reservation;
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
	

}

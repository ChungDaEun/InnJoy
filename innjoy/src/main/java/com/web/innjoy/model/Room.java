package com.web.innjoy.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name ="ROOM")
public class Room {
	
	@Id
	@Column(name="room_id", unique = true)
	private int roomId;
	
	@Column(name="room_name")
	private String roomName;
	
	@Column(name="room_price")
	private int roomPrice;
	
	@Column(name="checkin")
	private String checkin;
	
	@Column(name="checkout")
	private String checkout;
	
	@Column(name="min_cnt")
	private int minCnt;
	
	@Column(name="max_cnt")
	private int maxCnt;
	
	@Column(name="smoking")
	private String smoking;
	
	@Column(name="bed_cnt")
	private String bedCnt;
	
	@ManyToOne	// many rooms, one product
	@JoinColumn(name="pro_id")
	private Product product;
	
	@OneToMany(mappedBy = "room")		//  one room, many reservations
	private List<Reservation> reservation;

	public Room() {}
	
	public Room(int roomId, String roomName, int roomPrice, String checkin, String checkout, int minCnt, int maxCnt,
			String smoking, String bedCnt, Product product, List<Reservation> reservation) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.roomPrice = roomPrice;
		this.checkin = checkin;
		this.checkout = checkout;
		this.minCnt = minCnt;
		this.maxCnt = maxCnt;
		this.smoking = smoking;
		this.bedCnt = bedCnt;
		this.product = product;
		this.reservation = reservation;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getMinCnt() {
		return minCnt;
	}

	public void setMinCnt(int minCnt) {
		this.minCnt = minCnt;
	}

	public int getMaxCnt() {
		return maxCnt;
	}

	public void setMaxCnt(int maxCnt) {
		this.maxCnt = maxCnt;
	}

	public String getSmoking() {
		return smoking;
	}

	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}

	public String getBedCnt() {
		return bedCnt;
	}

	public void setBedCnt(String bedCnt) {
		this.bedCnt = bedCnt;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Reservation> getReservation() {
		return reservation;
	}

	public void setReservation(List<Reservation> reservation) {
		this.reservation = reservation;
	}
	
	
	
}

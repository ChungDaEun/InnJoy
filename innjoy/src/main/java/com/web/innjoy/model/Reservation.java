package com.web.innjoy.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="RESERVATION")
public class Reservation {
	
	@Id
	@Column(name="reservation_id", unique = true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reservation_id_seq_generator")
	@SequenceGenerator(name = "reservation_id_seq_generator", sequenceName = "reservation_id_seq", allocationSize = 1)
	private int reservationId;

	@ManyToOne		//  many Reservations, one user
	@JoinColumn(name="user_id", insertable = false, updatable = false)
	private Ij_User ijUser;
	
	@ManyToOne // many reservations, one room
	@JoinColumn(name="room_id", insertable = false, updatable = false)
	private Room room;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="room_id")
	private int roomId;
	
	@Column(name="user_cnt")
	private int userCnt;
	
	@Column(name="start_dt")
	@Temporal(TemporalType.DATE)
	private Date startDt;
	
	@Column(name="end_dt")
	@Temporal(TemporalType.DATE)
	private Date endDt;
	
	@Column(name="payment")
	private int payment;
	
	@Column(name="status")
	private int status;
	
	@OneToOne(mappedBy="reservation")		// one reservation, one review
	private Review review;

	@OneToMany(mappedBy="reservation")	// one reservation, many recomms
	private List<Recomm> recomm;
	
	// 생성자
	public Reservation() {}

	public Reservation(int reservationId, Ij_User ijUser, Room room, String userId, int roomId, int userCnt,
			Date startDt, Date endDt, int payment, int status, Review review, List<Recomm> recomm) {
		this.reservationId = reservationId;
		this.ijUser = ijUser;
		this.room = room;
		this.userId = userId;
		this.roomId = roomId;
		this.userCnt = userCnt;
		this.startDt = startDt;
		this.endDt = endDt;
		this.payment = payment;
		this.status = status;
		this.review = review;
		this.recomm = recomm;
	}

	// getter, setter
	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public Ij_User getIjUser() {
		return ijUser;
	}

	public void setIjUser(Ij_User ijUser) {
		this.ijUser = ijUser;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getUserCnt() {
		return userCnt;
	}

	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}

	public Date getStartDt() {
		return startDt;
	}

	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}

	public Date getEndDt() {
		return endDt;
	}

	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public List<Recomm> getRecomm() {
		return recomm;
	}

	public void setRecomm(List<Recomm> recomm) {
		this.recomm = recomm;
	}
	
}

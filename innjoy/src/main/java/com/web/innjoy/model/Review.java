package com.web.innjoy.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="REVIEW")
public class Review {

	@Id
	@Column(name="review_id", unique = true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_id_seq_generator")
	@SequenceGenerator(name = "review_id_seq_generator", sequenceName = "review_id_seq", allocationSize = 1)
	private int reviewId;
	
	@Column(name="star")
	private int star;
	
	@Column(name="review_det")
	private String reviewDet;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="rev_time")
	private Date revTime;
	
	@OneToOne	// one review, one reservation
	@JoinColumn(name="reservation_id", insertable = false, updatable = false)
	private Reservation reservation;
	
	@Column(name="reservation_id")
	private int reservationId;
	
	@OneToMany(mappedBy="review", cascade = CascadeType.REMOVE)
	private List<Review_Img> reviewImg;
	
	// 생성자
	public Review() {}

	public Review(int reviewId, int star, String reviewDet, Reservation reservation, int reservationId,
			List<Review_Img> reviewImg) {
		this.reviewId = reviewId;
		this.star = star;
		this.reviewDet = reviewDet;
		this.revTime = new Date();
		this.reservation = reservation;
		this.reservationId = reservationId;
		this.reviewImg = reviewImg;
	}
	
	// getter, setter
	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getReviewDet() {
		return reviewDet;
	}

	public void setReviewDet(String reviewDet) {
		this.reviewDet = reviewDet;
	}

	public Date getRevTime() {
		return revTime;
	}

	public void setRevTime(Date revTime) {
		this.revTime = revTime;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public List<Review_Img> getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(List<Review_Img> reviewImg) {
		this.reviewImg = reviewImg;
	}

	
}

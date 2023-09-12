package com.web.innjoy.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="REVIEW_IMG")
public class Review_Img {
	
	@Id
	@Column(name="no", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "rvImg_seq_generator")
	@SequenceGenerator(name = "rvImg_seq_generator", sequenceName = "rvImg_seq", allocationSize = 1)
	private int no;
	
	@Column(name="fname")
	private String fname;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updte")
	private Date updte;
	
	@ManyToOne	// many imgs, one review
	@JoinColumn(name="review_id", insertable=false, updatable=false)
	private Review review;
	
	@Column(name="review_id")
	private int reviewId;
	
	// 생성자
	public Review_Img() {}
	
	public Review_Img(String fname, int reviewId) {
		this.fname = fname;
		this.updte = new Date();
		this.reviewId = reviewId;
	}

	public Review_Img(int no, String fname, Date updte, Review review, int reviewId) {
		this.no = no;
		this.fname = fname;
		this.updte = updte;
		this.review = review;
		this.reviewId = reviewId;
	}

	// getter, setter
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public Date getUpdte() {
		return updte;
	}

	public void setUpdte(Date updte) {
		this.updte = updte;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
}

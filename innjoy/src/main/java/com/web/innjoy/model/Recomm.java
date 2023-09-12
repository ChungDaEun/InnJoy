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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="RECOMM")
public class Recomm {
	
	@Id
	@Column(name="recom_id", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recomm_id_seq_generator")
	@SequenceGenerator(name = "recomm_id_seq_generator", sequenceName = "recomm_id_seq", allocationSize = 1)
	private int recomId;
	
	@Column(name="title")
	private String title;
	
	@Column(name="detail")
	private String detail;
	
	@Column(name="recomLoc")
	private String recomLoc;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="recom_time")
	private Date recomTime;
	
	@Column(name="recommType")
	private String recommType;	// 게시물 타입
	
	@Column(name="latitude")
	private Double latitude;		// 위도
	
	@Column(name="longitude")
	private Double longitude;		// 경도
	
	@ManyToOne	// many recomms, one reservation
	@JoinColumn(name="reservation_id", insertable = false, updatable = false)
	private Reservation reservation;
	
	@Column(name="reservation_id")
	private int reservationId;
	
	@OneToMany(mappedBy="recomm", cascade=CascadeType.REMOVE)	// one recomm, many comments
	private List<Recomm_comm> recomm_comm;
	
	@OneToMany(mappedBy="recomm",cascade=CascadeType.REMOVE)	// one recomm, many imgs
	private List<Board_Img> boardImg;
	
	// 생성자
	public Recomm() {}

	public Recomm(int recomId, String title, String detail, String recomLoc, String recommType,
			Double latitude, Double longitude, Reservation reservation, int reservationId,
			List<Recomm_comm> recomm_comm, List<Board_Img> boardImg) {
		this.recomId = recomId;
		this.title = title;
		this.detail = detail;
		this.recomLoc = recomLoc;
		this.recomTime = new Date();
		this.recommType = recommType;
		this.latitude = latitude;
		this.longitude = longitude;
		this.reservation = reservation;
		this.reservationId = reservationId;
		this.recomm_comm = recomm_comm;
		this.boardImg = boardImg;
	}

	// getter, setter
	public int getRecomId() {
		return recomId;
	}

	public void setRecomId(int recomId) {
		this.recomId = recomId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getRecomLoc() {
		return recomLoc;
	}

	public void setRecomLoc(String recomLoc) {
		this.recomLoc = recomLoc;
	}

	public Date getRecomTime() {
		return recomTime;
	}

	public void setRecomTime(Date recomTime) {
		this.recomTime = recomTime;
	}

	public String getRecommType() {
		return recommType;
	}

	public void setRecommType(String recommType) {
		this.recommType = recommType;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
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

	public List<Recomm_comm> getRecomm_comm() {
		return recomm_comm;
	}

	public void setRecomm_comm(List<Recomm_comm> recomm_comm) {
		this.recomm_comm = recomm_comm;
	}

	public List<Board_Img> getBoardImg() {
		return boardImg;
	}

	public void setBoardImg(List<Board_Img> boardImg) {
		this.boardImg = boardImg;
	}
	
}

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
@Table(name="BOARD_IMG")
public class Board_Img {
	
	@Id
	@Column(name="no", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bImg_seq_generator")
	@SequenceGenerator(name = "bImg_seq_generator", sequenceName = "bImg_seq", allocationSize = 1)
	private int no;
	
	@Column(name="fname")
	private String fname;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updte")
	private Date updte;
	
	@ManyToOne	// many imgs, one recomm
	@JoinColumn(name="recom_id", insertable=false, updatable=false)
	private Recomm recomm;
	
	@Column(name="recom_id")
	private int recomId;
	
	// 생성자
	public Board_Img() {}
	
	public Board_Img(String fname, int recomId) {
		this.fname = fname;
		this.updte = new Date();
		this.recomId = recomId;
	}

	public Board_Img(int no, String fname, Date updte, Recomm recomm, int recomId) {
		this.no = no;
		this.fname = fname;
		this.updte = updte;
		this.recomm = recomm;
		this.recomId = recomId;
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

	public Recomm getRecomm() {
		return recomm;
	}

	public void setRecomm(Recomm recomm) {
		this.recomm = recomm;
	}

	public int getRecomId() {
		return recomId;
	}

	public void setRecomId(int recomId) {
		this.recomId = recomId;
	}

}

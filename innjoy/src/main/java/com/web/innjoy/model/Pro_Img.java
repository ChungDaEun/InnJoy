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
@Table(name="PRO_IMG")
public class Pro_Img {
	
	@Id 
	@Column(name="no", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pImg_seq_generator")
	@SequenceGenerator(name = "pImg_seq_generator", sequenceName = "pImg_seq", allocationSize = 1)
	private int no;
	
	@Column(name="fname")
	private String fname;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updte")
	private Date updte;
	
	@ManyToOne	// many imgs, one product
	@JoinColumn(name="pro_id", insertable=false, updatable=false)
	private Product product;
	
	@Column(name="pro_id")
	private int proId;
	
	// 생성자
	public Pro_Img() {}
	
	public Pro_Img(String fname, int proId) {
		this.fname = fname;
		this.updte = new Date();
		this.proId = proId;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}
	
}

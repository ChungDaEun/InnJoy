package com.web.innjoy.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="BSN_USER")
public class Bsn_User {

	@Id
	@Column(name="bsn_id",  unique = true)
	private String bsnId;

	@Column(name="bsn_pass")
	private String bsnPass;

	@Column(name="bsn_name")
	private String bsnName;

	@Column(name="bsn_number")
	private String bsnNumber;

	@Column(name="ceo_name")
	private String ceoName;

	@Column(name="bsn_phone")
	private String bsnPhone;

	@Column(name="bsn_email")
	private String bsnEmail;

	@OneToMany(mappedBy = "bsnUser")		//  one bsn, many products
	private List<Product> product;

	// 생성자
	public Bsn_User() {}
	
	public Bsn_User(String bsnId, String bsnPass, String bsnName, String bsnNumber, String ceoName, String bsnPhone,
			String bsnEmail, List<Product> product) {
		this.bsnId = bsnId;
		this.bsnPass = bsnPass;
		this.bsnName = bsnName;
		this.bsnNumber = bsnNumber;
		this.ceoName = ceoName;
		this.bsnPhone = bsnPhone;
		this.bsnEmail = bsnEmail;
		this.product = product;
	}

	// getter, setter
	public String getBsnId() {
		return bsnId;
	}

	public void setBsnId(String bsnId) {
		this.bsnId = bsnId;
	}

	public String getBsnPass() {
		return bsnPass;
	}

	public void setBsnPass(String bsnPass) {
		this.bsnPass = bsnPass;
	}

	public String getBsnName() {
		return bsnName;
	}

	public void setBsnName(String bsnName) {
		this.bsnName = bsnName;
	}

	public String getBsnNumber() {
		return bsnNumber;
	}

	public void setBsnNumber(String bsnNumber) {
		this.bsnNumber = bsnNumber;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public String getBsnPhone() {
		return bsnPhone;
	}

	public void setBsnPhone(String bsnPhone) {
		this.bsnPhone = bsnPhone;
	}

	public String getBsnEmail() {
		return bsnEmail;
	}

	public void setBsnEmail(String bsnEmail) {
		this.bsnEmail = bsnEmail;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
}

package com.web.innjoy.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="ADMIN")
public class Admin {

	@Id
	@Column(name="adm_id", unique = true)
	private String admId;

	@Column(name="adm_pass")
	private String admPass;

	// 생성자
	public Admin() {}

	public Admin(String admId, String admPass) {
		super();
		this.admId = admId;
		this.admPass = admPass;
	}

	// getter, setter
	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public String getAdmPass() {
		return admPass;
	}

	public void setAdmPass(String admPass) {
		this.admPass = admPass;
	}

}

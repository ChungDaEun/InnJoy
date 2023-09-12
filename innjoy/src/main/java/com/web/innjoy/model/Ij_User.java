package com.web.innjoy.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "IJ_USER")
public class Ij_User {

	@Id		// PK
	@Column(name="user_id",  unique = true)		// 중복 방지
	private String userId;

	@Column(name="user_pass")
	private String userPass;

	@Column(name="n_name")
	private String nName;
	
	@Column(name="user_name")
	private String userName;

	@Column(name="user_phone")
	private String userPhone;

	@Column(name="email")
	private String email;

	@Column(name="auth")
	private String auth;

	@OneToMany(mappedBy="ijUser")
	private List<Reservation> reservation;
	
	@OneToMany(mappedBy="ijUser")
	private List<Recomm_comm> recomm_comm;

	public Ij_User() {}
	
	public Ij_User(String userId, String userPass, String nName, String userName, String userPhone, String email,
			String auth, List<Reservation> reservation) {
		this.userId = userId;
		this.userPass = userPass;
		this.nName = nName;
		this.userName = userName;
		this.userPhone = userPhone;
		this.email = email;
		this.auth = auth;
		this.reservation = reservation;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getnName() {
		return nName;
	}

	public void setnName(String nName) {
		this.nName = nName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public List<Reservation> getReservation() {
		return reservation;
	}

	public void setReservation(List<Reservation> reservation) {
		this.reservation = reservation;
	}
	
}

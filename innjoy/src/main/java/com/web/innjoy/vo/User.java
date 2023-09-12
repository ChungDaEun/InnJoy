package com.web.innjoy.vo;

public class User {
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_phone;
	private String email;
	private String n_name;
	private String auth;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String user_id, String user_pass, String user_name, String user_phone, String email, String n_name,
			String auth) {
		super();
		this.user_id = user_id;
		this.user_pass = user_pass;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.email = email;
		this.n_name = n_name;
		this.auth = auth;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}

}

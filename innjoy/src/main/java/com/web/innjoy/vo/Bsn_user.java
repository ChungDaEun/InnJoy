package com.web.innjoy.vo;

public class Bsn_user {
	private String bsn_id;
	private String bsn_pass;
	private String bsn_name;
	private String bsn_number;
	private String ceo_name;
	private String bsn_phone;
	private String bsn_email;
	private String ceoName;
	public Bsn_user() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bsn_user(String bsn_id, String bsn_pass, String bsn_name, String bsn_number, String ceo_name,
			String bsn_phone, String bsn_email) {
		super();
		this.bsn_id = bsn_id;
		this.bsn_pass = bsn_pass;
		this.bsn_name = bsn_name;
		this.bsn_number = bsn_number;
		this.ceo_name = ceo_name;
		this.bsn_phone = bsn_phone;
		this.bsn_email = bsn_email;
	}
	public String getCeoName() {
		return ceoName;
	}
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}
	public String getBsn_id() {
		return bsn_id;
	}
	public void setBsn_id(String bsn_id) {
		this.bsn_id = bsn_id;
	}
	public String getBsn_pass() {
		return bsn_pass;
	}
	public void setBsn_pass(String bsn_pass) {
		this.bsn_pass = bsn_pass;
	}
	public String getBsn_name() {
		return bsn_name;
	}
	public void setBsn_name(String bsn_name) {
		this.bsn_name = bsn_name;
	}
	public String getBsn_number() {
		return bsn_number;
	}
	public void setBsn_number(String bsn_number) {
		this.bsn_number = bsn_number;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getBsn_phone() {
		return bsn_phone;
	}
	public void setBsn_phone(String bsn_phone) {
		this.bsn_phone = bsn_phone;
	}
	public String getBsn_email() {
		return bsn_email;
	}
	public void setBsn_email(String bsn_email) {
		this.bsn_email = bsn_email;
	}
	

}

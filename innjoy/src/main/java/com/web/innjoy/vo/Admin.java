package com.web.innjoy.vo;

public class Admin {
	private String adm_id;
	private String adm_pass;
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Admin(String adm_id, String adm_pass) {
		super();
		this.adm_id = adm_id;
		this.adm_pass = adm_pass;
	}
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_pass() {
		return adm_pass;
	}
	public void setAdm_pass(String adm_pass) {
		this.adm_pass = adm_pass;
	}
	
}

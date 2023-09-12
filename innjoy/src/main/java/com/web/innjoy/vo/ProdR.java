package com.web.innjoy.vo;

public class ProdR {
	private String prod;
	private int prodr_cnt;
	public ProdR() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProdR(String prod, int prodr_cnt) {
		super();
		this.prod = prod;
		this.prodr_cnt = prodr_cnt;
	}
	public String getProd() {
		return prod;
	}
	public void setProd(String prod) {
		this.prod = prod;
	}
	public int getProdr_cnt() {
		return prodr_cnt;
	}
	public void setProdr_cnt(int prodr_cnt) {
		this.prodr_cnt = prodr_cnt;
	}
}

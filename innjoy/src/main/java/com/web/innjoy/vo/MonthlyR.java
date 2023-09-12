package com.web.innjoy.vo;

public class MonthlyR {
	private int monthly_res;
	private int mr_cnt;
	public MonthlyR() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MonthlyR(int monthly_res, int mr_cnt) {
		super();
		this.monthly_res = monthly_res;
		this.mr_cnt = mr_cnt;
	}
	public int getMonthly_res() {
		return monthly_res;
	}
	public void setMonthly_res(int monthly_res) {
		this.monthly_res = monthly_res;
	}
	public int getMr_cnt() {
		return mr_cnt;
	}
	public void setMr_cnt(int mr_cnt) {
		this.mr_cnt = mr_cnt;
	}
}

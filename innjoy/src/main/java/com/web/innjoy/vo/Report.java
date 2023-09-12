package com.web.innjoy.vo;

import java.util.Date;

public class Report {
	private int report_id;
	private int review_id;
	private int recom_id;
	private int rc_com_id;
	private String report_type;
	private String report_det;
	private String url;
	private Date rep_time;
	
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Report(int report_id, int review_id, int recom_id, int rc_com_id, String report_type, String report_det,
			String url, Date rep_time) {
		super();
		this.report_id = report_id;
		this.review_id = review_id;
		this.recom_id = recom_id;
		this.rc_com_id = rc_com_id;
		this.report_type = report_type;
		this.report_det = report_det;
		this.url = url;
		this.rep_time = rep_time;
	}
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getRecom_id() {
		return recom_id;
	}
	public void setRecom_id(int recom_id) {
		this.recom_id = recom_id;
	}
	public int getRc_com_id() {
		return rc_com_id;
	}
	public void setRc_com_id(int rc_com_id) {
		this.rc_com_id = rc_com_id;
	}
	public String getReport_type() {
		return report_type;
	}
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	public String getReport_det() {
		return report_det;
	}
	public void setReport_det(String report_det) {
		this.report_det = report_det;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getRep_time() {
		return rep_time;
	}
	public void setRep_time(Date rep_time) {
		this.rep_time = rep_time;
	}
	
}

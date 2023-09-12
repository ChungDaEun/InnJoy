package com.web.innjoy.dto;

import java.util.Date;

public class CommDto {

	private int rcComId;
	private int recomId;
	private String userId;
	private String rcComDet;
	private Date rcComTime;
	
	public CommDto() {}
	
	public CommDto(int rcComId, int recomId, String userId, String rcComDet, Date rcComTime) {
		this.rcComId = rcComId;
		this.recomId = recomId;
		this.userId = userId;
		this.rcComDet = rcComDet;
		this.rcComTime = rcComTime;
	}
	public int getRcComId() {
		return rcComId;
	}
	public void setRcComId(int rcComId) {
		this.rcComId = rcComId;
	}
	public int getRecomId() {
		return recomId;
	}
	public void setRecomId(int recomId) {
		this.recomId = recomId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRcComDet() {
		return rcComDet;
	}
	public void setRcComDet(String rcComDet) {
		this.rcComDet = rcComDet;
	}
	public Date getRcComTime() {
		return rcComTime;
	}
	public void setRcComTime(Date rcComTime) {
		this.rcComTime = rcComTime;
	}
	
	
}

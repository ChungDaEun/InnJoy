package com.web.innjoy.dto;

import java.util.Date;

public class RecommDto {
	
	private String proName;
	private int recomId;
	private String title;
	private String detail;
	private String recomLoc;
	private String recomType;
	private Date recomTime;
	private Double latitude;
	private Double longitude;
	private int reservaitonId;
	
	public RecommDto() {}

	public RecommDto(String proName, int recomId, String title, String detail, String recomLoc, String recomType,
			Date recomTime, Double latitude, Double longitude, int reservaitonId) {
		this.proName = proName;
		this.recomId = recomId;
		this.title = title;
		this.detail = detail;
		this.recomLoc = recomLoc;
		this.recomType = recomType;
		this.recomTime = recomTime;
		this.latitude = latitude;
		this.longitude = longitude;
		this.reservaitonId = reservaitonId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getRecomId() {
		return recomId;
	}

	public void setRecomId(int recomId) {
		this.recomId = recomId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getRecomLoc() {
		return recomLoc;
	}

	public void setRecomLoc(String recomLoc) {
		this.recomLoc = recomLoc;
	}

	public String getRecomType() {
		return recomType;
	}

	public void setRecomType(String recomType) {
		this.recomType = recomType;
	}

	public Date getRecomTime() {
		return recomTime;
	}

	public void setRecomTime(Date recomTime) {
		this.recomTime = recomTime;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public int getReservaitonId() {
		return reservaitonId;
	}

	public void setReservaitonId(int reservaitonId) {
		this.reservaitonId = reservaitonId;
	}
	
	
}

package com.web.innjoy.vo;

import java.util.Date;

public class Recomm {
		private int recom_id;
		private String title;
		private String detail;
		private String recom_loc;
		private Date recom_time;
		private String rec_photo;
		private int reservation_id;
		private String recommType;   // 게시물 타입
		private double latitude;      // 위도
		private double longitude;      // 경도
		public Recomm() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Recomm(int recom_id, String title, String detail, String recom_loc, Date recom_time, String rec_photo,
				int reservation_id, String recommType, double latitude, double longitude) {
			super();
			this.recom_id = recom_id;
			this.title = title;
			this.detail = detail;
			this.recom_loc = recom_loc;
			this.recom_time = recom_time;
			this.rec_photo = rec_photo;
			this.reservation_id = reservation_id;
			this.recommType = recommType;
			this.latitude = latitude;
			this.longitude = longitude;
		}
		public int getRecom_id() {
			return recom_id;
		}
		public void setRecom_id(int recom_id) {
			this.recom_id = recom_id;
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
		public String getRecom_loc() {
			return recom_loc;
		}
		public void setRecom_loc(String recom_loc) {
			this.recom_loc = recom_loc;
		}
		public Date getRecom_time() {
			return recom_time;
		}
		public void setRecom_time(Date recom_time) {
			this.recom_time = recom_time;
		}
		public String getRec_photo() {
			return rec_photo;
		}
		public void setRec_photo(String rec_photo) {
			this.rec_photo = rec_photo;
		}
		public int getReservation_id() {
			return reservation_id;
		}
		public void setReservation_id(int reservation_id) {
			this.reservation_id = reservation_id;
		}
		public String getRecommType() {
			return recommType;
		}
		public void setRecommType(String recommType) {
			this.recommType = recommType;
		}
		public double getLatitude() {
			return latitude;
		}
		public void setLatitude(double latitude) {
			this.latitude = latitude;
		}
		public double getLongitude() {
			return longitude;
		}
		public void setLongitude(double longitude) {
			this.longitude = longitude;
		}
		
		
}

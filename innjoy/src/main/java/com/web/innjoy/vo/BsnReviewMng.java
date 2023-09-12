package com.web.innjoy.vo;

import java.util.Date;

public class BsnReviewMng {
   // 후기관리페이지메인에서필요한정보
   private int pro_id;
   private String bsn_id;
   private String pro_name;
   private String pro_loc;
   private String pfname;
   // 숙소 별 후기관리 버튼 클릭 시 후기 리스트 출력
   // 객실정보
   private int room_id;
   private String room_name;
   private int room_price;
   private String checkin; 
   private String checkout;
   // 예약정보
   private int reservation_id;
   private String user_id;
   // 후기정보
   private int review_id;
   private int star;
   private String review_det;
   private Date rev_time;
   // 답글 정보
   private String rv_com_det;
   private Date rv_com_time;
   private int rv_com_id;
   // 리뷰 이미지
   private int no;
   private String fname;
   private Date updte;
   
   public String getPfname() {
	return pfname;
}
public void setPfname(String pfname) {
	this.pfname = pfname;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public Date getUpdte() {
	return updte;
}
public void setUpdte(Date updte) {
	this.updte = updte;
}
public int getRv_com_id() {
	return rv_com_id;
}
public void setRv_com_id(int rv_com_id) {
	this.rv_com_id = rv_com_id;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getRv_com_det() {
	return rv_com_det;
}
public void setRv_com_det(String rv_com_det) {
	this.rv_com_det = rv_com_det;
}
public Date getRv_com_time() {
	return rv_com_time;
}
public void setRv_com_time(Date rv_com_time) {
	this.rv_com_time = rv_com_time;
}
public int getPro_id() {
      return pro_id;
   }
   public void setPro_id(int pro_id) {
      this.pro_id = pro_id;
   }
   public String getBsn_id() {
      return bsn_id;
   }
   public void setBsn_id(String bsn_id) {
      this.bsn_id = bsn_id;
   }
   public String getPro_name() {
      return pro_name;
   }
   public void setPro_name(String pro_name) {
      this.pro_name = pro_name;
   }
   public String getPro_loc() {
      return pro_loc;
   }
   public void setPro_loc(String pro_loc) {
      this.pro_loc = pro_loc;
   }
   public int getRoom_id() {
      return room_id;
   }
   public void setRoom_id(int room_id) {
      this.room_id = room_id;
   }
   public String getRoom_name() {
      return room_name;
   }
   public void setRoom_name(String room_name) {
      this.room_name = room_name;
   }
   public int getRoom_price() {
      return room_price;
   }
   public void setRoom_price(int room_price) {
      this.room_price = room_price;
   }
   public String getCheckin() {
      return checkin;
   }
   public void setCheckin(String checkin) {
      this.checkin = checkin;
   }
   public String getCheckout() {
      return checkout;
   }
   public void setCheckout(String checkout) {
      this.checkout = checkout;
   }
   public int getReservation_id() {
      return reservation_id;
   }
   public void setReservation_id(int reservation_id) {
      this.reservation_id = reservation_id;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public int getReview_id() {
      return review_id;
   }
   public void setReview_id(int review_id) {
      this.review_id = review_id;
   }
   public int getStar() {
      return star;
   }
   public void setStar(int star) {
      this.star = star;
   }
   public String getReview_det() {
      return review_det;
   }
   public void setReview_det(String review_det) {
      this.review_det = review_det;
   }
   public Date getRev_time() {
      return rev_time;
   }
   public void setRev_time(Date rev_time) {
      this.rev_time = rev_time;
   }
   
}
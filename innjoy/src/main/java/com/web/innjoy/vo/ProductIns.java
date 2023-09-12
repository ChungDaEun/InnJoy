package com.web.innjoy.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductIns {
	private int pro_id;
	private String bsn_id;
	private int pro_type_id;
	private String pro_name;
	private String pro_loc;
	private String basic_info;
	private String res_ann;
	private String ser_conts;
	private String checkin; 
	private String checkout;
	
	private int no;
	private int[] rno;
	private MultipartFile[] pfname; // pro_img
	private MultipartFile[] rfname; // room_img
//	private String fname;
	private Date updte;
	
	private String[] room_name; 
	private int[]  room_price; 
	private int[] room_id;
	private int[] min_cnt; 
	private int[] max_cnt; 
	private String[] smoking; 
	private String[] bed_cnt; 
	
	private List<String> fnames;
	
	
	
	
	
	

	public int[] getRno() {
		return rno;
	}

	public void setRno(int[] rno) {
		this.rno = rno;
	}


	public ProductIns(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
			String res_ann, String ser_conts, String checkin, String checkout, int no, int[] rno,
			MultipartFile[] pfname, MultipartFile[] rfname, Date updte, String[] room_name, int[] room_price,
			int[] room_id, int[] min_cnt, int[] max_cnt, String[] smoking, String[] bed_cnt, List<String> fnames) {
		super();
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.pro_loc = pro_loc;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
		this.checkin = checkin;
		this.checkout = checkout;
		this.no = no;
		this.rno = rno;
		this.pfname = pfname;
		this.rfname = rfname;
		this.updte = updte;
		this.room_name = room_name;
		this.room_price = room_price;
		this.room_id = room_id;
		this.min_cnt = min_cnt;
		this.max_cnt = max_cnt;
		this.smoking = smoking;
		this.bed_cnt = bed_cnt;
		this.fnames = fnames;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}



	public MultipartFile[] getPfname() {
		return pfname;
	}

	public void setPfname(MultipartFile[] pfname) {
		this.pfname = pfname;
	}

	public Date getUpdte() {
		return updte;
	}

	public void setUpdte(Date updte) {
		this.updte = updte;
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

	public int getPro_type_id() {
		return pro_type_id;
	}

	public void setPro_type_id(int pro_type_id) {
		this.pro_type_id = pro_type_id;
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

	public String getBasic_info() {
		return basic_info;
	}

	public void setBasic_info(String basic_info) {
		this.basic_info = basic_info;
	}

	public String getRes_ann() {
		return res_ann;
	}

	public void setRes_ann(String res_ann) {
		this.res_ann = res_ann;
	}

	public String getSer_conts() {
		return ser_conts;
	}

	public void setSer_conts(String ser_conts) {
		this.ser_conts = ser_conts;
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

	public int[] getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int[] room_id) {
		this.room_id = room_id;
	}

	public String[] getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String[] room_name) {
		this.room_name = room_name;
	}

	public int[] getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int[] room_price) {
		this.room_price = room_price;
	}

	public int[] getMin_cnt() {
		return min_cnt;
	}

	public void setMin_cnt(int[] min_cnt) {
		this.min_cnt = min_cnt;
	}

	public int[] getMax_cnt() {
		return max_cnt;
	}

	public void setMax_cnt(int[] max_cnt) {
		this.max_cnt = max_cnt;
	}

	public String[] getSmoking() {
		return smoking;
	}

	public void setSmoking(String[] smoking) {
		this.smoking = smoking;
	}

	public String[] getBed_cnt() {
		return bed_cnt;
	}

	public void setBed_cnt(String[] bed_cnt) {
		this.bed_cnt = bed_cnt;
	}
	


	public ProductIns(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
		String res_ann, String ser_conts, String checkin, String checkout, int[] room_id, String[] room_name,
		int[] room_price, int[] min_cnt, int[] max_cnt, String[] smoking, String[] bed_cnt) {
	super();
	this.pro_id = pro_id;
	this.bsn_id = bsn_id;
	this.pro_type_id = pro_type_id;
	this.pro_name = pro_name;
	this.pro_loc = pro_loc;
	this.basic_info = basic_info;
	this.res_ann = res_ann;
	this.ser_conts = ser_conts;
	this.checkin = checkin;
	this.checkout = checkout;
	this.room_id = room_id;
	this.room_name = room_name;
	this.room_price = room_price;
	this.min_cnt = min_cnt;
	this.max_cnt = max_cnt;
	this.smoking = smoking;
	this.bed_cnt = bed_cnt;
}
	




	public ProductIns(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
			String res_ann, String ser_conts, String checkin, String checkout, int no, MultipartFile[] pfname,
			MultipartFile[] rfname, Date updte, String[] room_name, int[] room_price, int[] room_id, int[] min_cnt,
			int[] max_cnt, String[] smoking, String[] bed_cnt, List<String> fnames) {
		super();
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.pro_loc = pro_loc;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
		this.checkin = checkin;
		this.checkout = checkout;
		this.no = no;
		this.pfname = pfname;
		this.rfname = rfname;
		this.updte = updte;
		this.room_name = room_name;
		this.room_price = room_price;
		this.room_id = room_id;
		this.min_cnt = min_cnt;
		this.max_cnt = max_cnt;
		this.smoking = smoking;
		this.bed_cnt = bed_cnt;
		this.fnames = fnames;
	}

	public MultipartFile[] getRfname() {
		return rfname;
	}

	public void setRfname(MultipartFile[] rfname) {
		this.rfname = rfname;
	}

	public List<String> getFnames() {
		return fnames;
	}

	public void setFnames(List<String> fnames) {
		this.fnames = fnames;
	}


	public ProductIns(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
			String res_ann, String ser_conts, String checkin, String checkout, int no, MultipartFile[] pfname,
			Date updte, String[] room_name, int[] room_price, int[] room_id, int[] min_cnt, int[] max_cnt,
			String[] smoking, String[] bed_cnt, List<String> fnames) {
		super();
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.pro_loc = pro_loc;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
		this.checkin = checkin;
		this.checkout = checkout;
		this.no = no;
		this.pfname = pfname;
		this.updte = updte;
		this.room_name = room_name;
		this.room_price = room_price;
		this.room_id = room_id;
		this.min_cnt = min_cnt;
		this.max_cnt = max_cnt;
		this.smoking = smoking;
		this.bed_cnt = bed_cnt;
		this.fnames = fnames;
	}

	public ProductIns() {
		super();
		// TODO Auto-generated constructor stub
	}
	


}

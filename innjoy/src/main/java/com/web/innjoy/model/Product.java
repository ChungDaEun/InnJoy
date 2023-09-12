package com.web.innjoy.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="PRODUCT")
public class Product {

	@Id
	@Column(name="pro_id", unique = true)
	private int proId;
	
	@ManyToOne	// Many products, one bsn_user
	@JoinColumn(name="bsn_id")
	private Bsn_User bsnUser;
	
	@ManyToOne // Many products, one product type
	@JoinColumn(name="pro_type_id")
	private Pro_Type_Id proTypeId;
	
	@Column(name="pro_name")
	private String proName;
	
	@Column(name="pro_loc")
	private String proLoc;
	
	@Column(name="basic_info")
	private String basicInfo;
	
	@Column(name="res_ann")
	private String resAnn;
	
	@Column(name="ser_conts")
	private String serConts;

	@OneToMany(mappedBy="product", cascade = CascadeType.REMOVE)	// one Product, many rooms
	private List<Room> room;
	
	@OneToMany(mappedBy="product",cascade = CascadeType.REMOVE)	// one Product, many iimgs
	private List<Pro_Img> proImg;
	
	// 생성자
	public Product() {}

	public Product(int proId, Bsn_User bsnUser, Pro_Type_Id proTypeId, String proName, String proLoc, String basicInfo,
			String resAnn, String serConts, List<Room> room, List<Pro_Img> proImg) {
		this.proId = proId;
		this.bsnUser = bsnUser;
		this.proTypeId = proTypeId;
		this.proName = proName;
		this.proLoc = proLoc;
		this.basicInfo = basicInfo;
		this.resAnn = resAnn;
		this.serConts = serConts;
		this.room = room;
		this.proImg = proImg;
	}

	// getter, setter
	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public Bsn_User getBsnUser() {
		return bsnUser;
	}

	public void setBsnUser(Bsn_User bsnUser) {
		this.bsnUser = bsnUser;
	}

	public Pro_Type_Id getProTypeId() {
		return proTypeId;
	}

	public void setProTypeId(Pro_Type_Id proTypeId) {
		this.proTypeId = proTypeId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProLoc() {
		return proLoc;
	}

	public void setProLoc(String proLoc) {
		this.proLoc = proLoc;
	}

	public String getBasicInfo() {
		return basicInfo;
	}

	public void setBasicInfo(String basicInfo) {
		this.basicInfo = basicInfo;
	}

	public String getResAnn() {
		return resAnn;
	}

	public void setResAnn(String resAnn) {
		this.resAnn = resAnn;
	}

	public String getSerConts() {
		return serConts;
	}

	public void setSerConts(String serConts) {
		this.serConts = serConts;
	}

	public List<Room> getRoom() {
		return room;
	}

	public void setRoom(List<Room> room) {
		this.room = room;
	}

	public List<Pro_Img> getProImg() {
		return proImg;
	}

	public void setProImg(List<Pro_Img> proImg) {
		this.proImg = proImg;
	}
	
}

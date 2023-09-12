package com.web.innjoy.vo;

import java.util.Date;
import java.util.List;

public class Board {
	
	private int recom_id;	//게시물 아이디
	private String title;	// 제목
	private String detail;	// 내용
	private Date recom_time;	// 시간
	private String user_id;	// 작성자
	private List<Recomm_comm> comms;	// 댓글 list
	private List<Board_img> imgs;	// 게시물 이미지 list
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Board(int recom_id, String title, String detail, Date recom_time, String user_id, List<Recomm_comm> comms,
			List<Board_img> imgs) {
		this.recom_id = recom_id;
		this.title = title;
		this.detail = detail;
		this.recom_time = recom_time;
		this.user_id = user_id;
		this.comms = comms;
		this.imgs = imgs;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public List<Recomm_comm> getComms() {
		return comms;
	}

	public void setComms(List<Recomm_comm> comms) {
		this.comms = comms;
	}

	public List<Board_img> getImgs() {
		return imgs;
	}

	public void setImgs(List<Board_img> imgs) {
		this.imgs = imgs;
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
	public Date getRecom_time() {
		return recom_time;
	}
	public void setRecom_time(Date recom_time) {
		this.recom_time = recom_time;
	}

}

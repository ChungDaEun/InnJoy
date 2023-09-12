package com.web.innjoy.vo;

public class ChatRoom {
	int room_id; // 룸 번호
	String se_user; // 일반 회원
	String re_user; // 사업자
	public ChatRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatRoom(int room_id, String se_user, String re_user) {
		super();
		this.room_id = room_id;
		this.se_user = se_user;
		this.re_user = re_user;
	}
	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getSe_user() {
		return se_user;
	}



	public void setSe_user(String se_user) {
		this.se_user = se_user;
	}



	public String getRe_user() {
		return re_user;
	}



	public void setRe_user(String re_user) {
		this.re_user = re_user;
	}
	@Override
	public String toString() {
		return "Room [se_user=" + se_user + ", re_user=" + re_user + "room_id=" + room_id + "]";
	}
	

}

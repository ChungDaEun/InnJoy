package com.web.innjoy.vo;

public class ChatBsn {
	private ChatRoom chatRoom;
	private Bsn_user bsn_user;
	public ChatBsn() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatBsn(ChatRoom chatRoom, Bsn_user bsn_user) {
		super();
		this.chatRoom = chatRoom;
		this.bsn_user = bsn_user;
	}
	public ChatRoom getChatRoom() {
		return chatRoom;
	}
	public void setChatRoom(ChatRoom chatRoom) {
		this.chatRoom = chatRoom;
	}
	public Bsn_user getBsn_user() {
		return bsn_user;
	}
	public void setBsn_user(Bsn_user bsn_user) {
		this.bsn_user = bsn_user;
	}
	

}

package com.web.innjoy.vo;

public class ChatUser {
	private ChatRoom chatRoom;
	private User user;
	
	public ChatUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatUser(ChatRoom chatRoom, User user) {
		super();
		this.chatRoom = chatRoom;
		this.user = user;
	}

	public ChatRoom getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(ChatRoom chatRoom) {
		this.chatRoom = chatRoom;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	


}

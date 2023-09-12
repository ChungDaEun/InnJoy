package com.web.innjoy.vo;

public class ChatMessage {
	private int id;
	private int room_id;
	private String sender;
	private String message;
	public ChatMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatMessage(int id, int room_id, String sender, String message) {
		super();
		this.id = id;
		this.room_id = room_id;
		this.sender = sender;
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	

}

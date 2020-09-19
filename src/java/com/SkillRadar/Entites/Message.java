package com.SkillRadar.Entites;

public class Message {
	
	int id;
	User sender,reciever;
	CustomDateTime dateTime;
	String message;
	
	public Message() {
		super();
	}

	public Message(int id, User sender, User reciever, CustomDateTime dateTime, String message) {
		super();
		this.id = id;
		this.sender = sender;
		this.reciever = reciever;
		this.dateTime = dateTime;
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReciever() {
		return reciever;
	}

	public void setReciever(User reciever) {
		this.reciever = reciever;
	}

	public CustomDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(CustomDateTime dateTime) {
		this.dateTime = dateTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", sender=" + sender + ", reciever=" + reciever + ", dateTime=" + dateTime
				+ ", message=" + message + "]";
	}
	
}

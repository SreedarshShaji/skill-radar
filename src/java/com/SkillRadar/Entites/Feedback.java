package com.SkillRadar.Entites;

public class Feedback {
	int id;
	User user;
	String Message,Reply;
	CustomDateTime dateTime;
	
	public Feedback() {
		super();
	}

	public Feedback(int id, User user, String message, String reply, CustomDateTime dateTime) {
		super();
		this.id = id;
		this.user = user;
		Message = message;
		Reply = reply;
		this.dateTime = dateTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessage() {
		return Message;
	}

	public void setMessage(String message) {
		Message = message;
	}

	public String getReply() {
		return Reply;
	}

	public void setReply(String reply) {
		Reply = reply;
	}

	public CustomDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(CustomDateTime dateTime) {
		this.dateTime = dateTime;
	}
	
	
}

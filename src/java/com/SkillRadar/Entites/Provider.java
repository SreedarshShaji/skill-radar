package com.SkillRadar.Entites;

import java.util.ArrayList;

public class Provider implements User {
	
	int id;
	String name,email,password,categories;
	Location location;
	String status;
	boolean isAvailable;
	
	
	public Provider(int id, String name, String email, String password, String categories, Location location, String status, boolean isAvailable) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.categories = categories;
		this.location = location;
		this.status = status;
		this.isAvailable = isAvailable;
	}
	
	public Provider() {
	}
	
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "Provider [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", categories="
				+ categories + "location=" + location + ", status=" + status
				+ ", isAvailable=" + isAvailable + "]";
	}

}

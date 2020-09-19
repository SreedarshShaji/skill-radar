package com.SkillRadar.Entites;

public class ServiceCategory {
	int id;
	String name,description,photo;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public ServiceCategory() {
		super();
	}
	public ServiceCategory(int id, String name, String description, String photo) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "ServiceCategory [id=" + id + ", name=" + name + ", description=" + description + ", photo=" + photo
				+ "]";
	}

}

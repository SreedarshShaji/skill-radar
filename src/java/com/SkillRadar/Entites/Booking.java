package com.SkillRadar.Entites;

public class Booking {
	int id;
	Provider provider;
	Customer customer;
	int service;
	CustomDateTime customDateTime;
        int status;
	int rating;
	String review;
	
	public Booking() {
		super();
	}
	
	public Booking(int id, Provider provider, Customer customer, CustomDateTime customDateTime, int rating,
			String review) {
		super();
		this.id = id;
		this.provider = provider;
		this.customer = customer;
		this.customDateTime = customDateTime;
		this.rating = rating;
		this.review = review;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public CustomDateTime getCustomDateTime() {
		return customDateTime;
	}

	public void setCustomDateTime(CustomDateTime customDateTime) {
		this.customDateTime = customDateTime;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
		
}
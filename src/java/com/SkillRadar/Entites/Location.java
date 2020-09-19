package com.SkillRadar.Entites;

public class Location {
	double latitude,longitude;

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Location() {
		super();
	}

	public Location(double latitude, double longitude) {
		super();
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public Location(String location) {
		super();
		String[] latAndLong=location.split(",");
		this.latitude = Double.parseDouble(latAndLong[0]);
		this.longitude = Double.parseDouble(latAndLong[1]);
	}

	@Override
	public String toString() {
		return latitude + "," + longitude;
	}
	
}

package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class RentCar {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String pick_up_location;
	private String drop_off_location;
	private String pick_up_date;
	private String drop_off_date;
	private String time;
	private String name;
	private String price;
	private String image;
	private String email;
	private String user;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPick_up_location() {
		return pick_up_location;
	}
	public void setPick_up_location(String pick_up_location) {
		this.pick_up_location = pick_up_location;
	}
	public String getDrop_off_location() {
		return drop_off_location;
	}
	public void setDrop_off_location(String drop_off_location) {
		this.drop_off_location = drop_off_location;
	}
	public String getPick_up_date() {
		return pick_up_date;
	}
	public void setPick_up_date(String pick_up_date) {
		this.pick_up_date = pick_up_date;
	}
	public String getDrop_off_date() {
		return drop_off_date;
	}
	public void setDrop_off_date(String drop_off_date) {
		this.drop_off_date = drop_off_date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}

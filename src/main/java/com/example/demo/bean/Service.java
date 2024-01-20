package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Service {
	
	public String image;
	@Id
	public String name;
	public String decp;
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDecp() {
		return decp;
	}
	public void setDecp(String decp) {
		this.decp = decp;
	}

}

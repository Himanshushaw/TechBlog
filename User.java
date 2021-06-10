package com.tech.blog.entities;


//this class is for entity i.e for the table we have created in the database

import java.sql.*;;

public class User {
	private int Id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private Timestamp date;
	private String profile;
	
	public User(int id, String name, String email, String password, String gender, String about, Timestamp date) {
		super();
		Id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.date = date;
	
	}

	public User() {
	}

	public User(String name, String email, String password, String gender, String about) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		
	}
	
	
	
	

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
	

}

package com.pharmacist;

public class pharmacist {
	private String userid;
	private String password;
	private String name;
	private String email;
	private String phone;
	
	
	public pharmacist(String userid, String password, String name, String email, String phone) {
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}


	public String getId() {
		return userid;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

}
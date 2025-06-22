package com.deliveryagent;

public class Deliveryagent {
	private int agentID;
	private String username;
	private String name;
	private String email;
	private String phone;
	private String password;
	
	public Deliveryagent(int agentID, String username, String name, String email, String phone, String password) {

		this.agentID = agentID;
		this.username = username;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	public int getAgentID() {
		return agentID;
	}

	public String getUsername() {
		return username;
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

	public String getPassword() {
		return password;
	}

	
	
	
}

package com.customer;

public class customer {
	
	    private int id;
	    private String name;
	    private String email;
	    private String phone;
	    private String username;
	    private String password;
	    private String address;
		public customer(int id, String name, String email, String phone, String username, String password,
				String address) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.username = username;
			this.password = password;
			this.address = address;
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
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		
	
	

}

package com.deliveryagent;

public class Order {
    private int orderid;
    private int userid;
    private String name;
    private String email;
    private String address;
    private String phone;
    private double amount;
    private String deliverStatus;
    private String paymentmethod;

    public Order(int orderid, int userid, String name, String email, String address,
                 String phone, double amount, String deliverStatus, String paymentmethod) {
        this.orderid = orderid;
        this.userid = userid;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.amount = amount;
        this.deliverStatus = deliverStatus;
        this.paymentmethod = paymentmethod;
    }

    // Getters
    public int getOrderid() {
    	return orderid; 
    }
    public int getUserid() { 
    	return userid; 
    }
    public String getName() {
    	return name; 
    }
    public String getEmail() {
    	return email;
    }
    public String getAddress() { 
    	return address; 
    }
    public String getPhone() {
    	return phone; 
    }
    public double getAmount() { 
    	return amount; 
    }
    public String getDeliverStatus() { 
    	return deliverStatus; 
    }
    public String getPaymentmethod() { 
    	return paymentmethod; 
    }
}

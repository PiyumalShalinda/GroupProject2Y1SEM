package com.deliveryagent;

public class PrescriptionDelivery { /*class*/
    private int pDeliveryID;
    private int cusID;
    private String cusname;
    private String email;
    private String phone;
    private String address;
    private int presID;
    private String dstatus;
    private double amount;
    private String paymentmethod; /*information hiding like encapsulation using*/
// <-- renamed from Dstatus

    public PrescriptionDelivery(int pDeliveryID, int cusID, String cusname, String email, String phone, String address, int presID, String dstatus,double amount,String paymentmethod) {
        this.pDeliveryID = pDeliveryID;
        this.cusID = cusID;
        this.cusname = cusname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.presID = presID;
        this.dstatus = dstatus;
        this.amount = amount;
        this.paymentmethod=paymentmethod;
    }

    
    /*using abstraction*/
    public int getpDeliveryID() {
        return pDeliveryID;
    }

    public int getCusID() {
        return cusID;
    }

    public String getCusname() {
        return cusname;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public int getPresID() {
        return presID;
    }

    public String getDstatus() {
        return dstatus; // Matches the field name
    }
    
    public double getamount() {
    	return amount;
    }
    
    public String getpaymentmethod() {
    	return paymentmethod;
    }
}


package com.admin;

public class Auser {                        //encapsulation
    private String pharmacistID;
    private String password;
    private String name;
    private String email;
    private String contactnumber;

    public Auser(String pharmacistID, String password, String name, String email, String contactnumber) {
        this.pharmacistID = pharmacistID;
        this.password = password;
        this.name = name;
        this.email = email;
        this.contactnumber = contactnumber;
    }

    public String getPharmacistID() {
        return pharmacistID;
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
    public String getContactnumber() {
        return contactnumber;
    }
}

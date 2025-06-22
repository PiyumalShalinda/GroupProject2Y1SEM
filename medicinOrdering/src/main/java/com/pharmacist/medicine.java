package com.pharmacist;

public class medicine {
    private int medID;
    private String medName;
    private String medDesc;
    private String medBenefits;
    private String medIng;
    private int medQty;
    private double medPrice;
    private String medImage;
    private String pharmacistId; 

   
    public medicine(int medID, String medName, String medDesc, String medBenefits,
                    String medIng, int medQty, double medPrice, String medImage, String pharmacistId) {
        this.medID = medID;
        this.medName = medName;
        this.medDesc = medDesc;
        this.medBenefits = medBenefits;
        this.medIng = medIng;
        this.medQty = medQty;
        this.medPrice = medPrice;
        this.medImage = medImage;
        this.pharmacistId = pharmacistId;
    }

    
    public medicine() {}

   
    public int getMedID() {
        return medID;
    }

    public void setMedID(int medID) {
        this.medID = medID;
    }

    public String getMedName() {
        return medName;
    }

    public void setMedName(String medName) {
        this.medName = medName;
    }

    public String getMedDesc() {
        return medDesc;
    }

    public void setMedDesc(String medDesc) {
        this.medDesc = medDesc;
    }

    public String getMedBenefits() {
        return medBenefits;
    }

    public void setMedBenefits(String medBenefits) {
        this.medBenefits = medBenefits;
    }

    public String getMedIng() {
        return medIng;
    }

    public void setMedIng(String medIng) {
        this.medIng = medIng;
    }

    public int getMedQty() {
        return medQty;
    }

    public void setMedQty(int medQty) {
        this.medQty = medQty;
    }

    public double getMedPrice() {
        return medPrice;
    }

    public void setMedPrice(double medPrice) {
        this.medPrice = medPrice;
    }

    public String getMedImage() {
        return medImage;
    }

    public void setMedImage(String medImage) {
        this.medImage = medImage;
    }

    public String getPharmacistId() {
        return pharmacistId;
    }

    public void setPharmacistId(String pharmacistId) {
        this.pharmacistId = pharmacistId;
    }
}


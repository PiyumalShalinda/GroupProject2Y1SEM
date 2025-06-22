package com.customer;

public class Prescription {
    private int id;
    private String fileName;
    private String filePath;
    private String status;
    private String deliverStatus;
    private double amount;  // New property for amount

    public Prescription(int id, String fileName, String filePath, String status, String deliverStatus, double amount) {
        this.id = id;
        this.fileName = fileName;
        this.filePath = filePath;
        this.status = status;
        this.deliverStatus = deliverStatus;
        this.amount = amount;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDeliverStatus() {
        return deliverStatus;
    }

    public void setDeliverStatus(String deliverStatus) {
        this.deliverStatus = deliverStatus;
    }

    public double getAmount() {  // Getter for amount
        return amount;
    }

    public void setAmount(double amount) {  // Setter for amount
        this.amount = amount;
    }
}

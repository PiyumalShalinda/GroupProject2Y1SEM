package com.customer;

public class Order {

    private int orderId;
    private double amount;
    private String deliverStatus;

    // Constructor
    public Order(int orderId, double amount, String deliverStatus) {
        this.orderId = orderId;
        this.amount = amount;
        this.deliverStatus = deliverStatus;
    }

    // Getters
    public int getOrderId() {
        return orderId;
    }

    public double getAmount() {
        return amount;
    }

    public String getDeliverStatus() {
        return deliverStatus;
    }
}

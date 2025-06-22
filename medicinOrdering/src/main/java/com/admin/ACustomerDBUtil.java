package com.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ACustomerDBUtil {
    
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    
    public static List<ACustomer> getAllCustomers() {
        List<ACustomer> customers = new ArrayList<>();                                     //abstraction
        try {
            con = ADBconnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM customer"; 
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String address = rs.getString("address");

                ACustomer customer = new ACustomer(id, name, email, phone, username, password, address);
                customers.add(customer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }
    public static boolean updateCustomer(String id, String name, String email, String phone, String address) {
        boolean isSuccess = false;
        try {
            con = ADBconnect.getConnection();
            stmt = con.createStatement();
            
            
            String sql = "UPDATE customer SET name='" + name + "', email='" + email + "', phone='" + phone + "', address='" + address + "' WHERE id='" + id + "'";

            int result = stmt.executeUpdate(sql);
            
            if (result > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    
    
    public static boolean deleteCustomer(String customerId) {
        boolean isSuccess = false;
        try {
            con = ADBconnect.getConnection();
            stmt = con.createStatement();
            String sql = "DELETE FROM customer WHERE id='" + customerId + "'";
            int result = stmt.executeUpdate(sql);
            
            if (result > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    

}

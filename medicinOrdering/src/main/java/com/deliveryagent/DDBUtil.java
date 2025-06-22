package com.deliveryagent;

import java.sql.Connection;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DDBUtil {
	
	private static Connection con =null;
	private static Statement stmt =null;
	private static ResultSet rs =null;
	private static boolean isSuccess;
	
	
    public static List<Deliveryagent> validate(String username, String password){ //using loging validation
        ArrayList<Deliveryagent> agent = new ArrayList<>();


        try {
        	con = DDBconnect.getConnection();
        	stmt = con.createStatement();
            String sql = "select * from deliveryagent where username ='" + username + "' and password ='" + password + "'";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int agentID = rs.getInt(1);
                String Uname = rs.getString(2);
                String name = rs.getString(3);       
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String passU = rs.getString(6);

                Deliveryagent D = new Deliveryagent(agentID, Uname, name, email, phone, passU); //using objects
                agent.add(D);
            }

        } catch (Exception e) { // error handling
            e.printStackTrace();
        }

        return agent;
    }

    // Updated insert method with correct column order
    public static boolean insertagent(String username, String name, String email, String phone, String password) {
        boolean isSuccess = false;

        try {
        	con = DDBconnect.getConnection();
        	stmt = con.createStatement();
           
            String sql = "INSERT INTO deliveryagent (username, name, email, phone, password) VALUES ('" 
                        + username + "','" + name + "','" + email + "','" + phone + "','" + password + "')";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    public static boolean updateagent(String agentID, String username, String name, String email, String phone, String password) {
    	
    	try {
    		con = DDBconnect.getConnection();
        	stmt = con.createStatement();
        	
        	String sql ="update deliveryagent set username='"+username+"',name='"+name+"',email='"+email+"',phone='"+phone+"',password='"+password+"'"
        			+ "where agentID='"+agentID+"'";
        	int rs= stmt.executeUpdate(sql);
        	
        	if(rs>0) {
        		isSuccess = true;
        	}
    		
        	else {
                isSuccess = false;
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return isSuccess;
    }
    
    public static List<Deliveryagent> getDDetails(String agentID){
    	ArrayList<Deliveryagent> d = new ArrayList<>();
    	
    	int convertedID = Integer.parseInt(agentID);
    	
    	try {
    		con = DDBconnect.getConnection();
        	stmt = con.createStatement();
        	String sql= "Select * from deliveryagent where agentID='"+convertedID+"' ";
        	rs = stmt.executeQuery(sql);
        	
        	while(rs.next()) {
        		int ID = rs.getInt(1);
        		String username = rs.getString(2);
        		String name = rs.getString(3);
        		String email = rs.getString(4);
        		String phone = rs.getString(5);
        		String password = rs.getString(6);
        		
        		Deliveryagent DA = new Deliveryagent(ID,username,name,email,phone,password); //object using
        		d.add(DA);
        	}
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return d;
    }
    public static boolean Ddeleteagent(String agentID) {
    	int convId = Integer.parseInt(agentID);
    	
    	try {
    		con = DDBconnect.getConnection();
        	stmt = con.createStatement();
        	String sql = "delete from deliveryagent where agentID='"+convId+"'";
        	int r = stmt.executeUpdate(sql);
        
        	if(r>0) {
        		isSuccess = true;
        	}
    		
        	else {
                isSuccess = false;
            }
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return isSuccess;
    }
    
    public static List<Order> getAllOrders() { // abstraction
        List<Order> orders = new ArrayList<>();

        try {
            Connection con = DDBconnect.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `order`");

            while (rs.next()) {
                int orderid = rs.getInt("orderid");
                int userid = rs.getInt("userid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                double amount = rs.getDouble("amount");
                String deliverStatus = rs.getString("deliverStatus");
                String paymentmethod = rs.getString("paymentmethod");

                orders.add(new Order(orderid, userid, name, email, address, phone, amount, deliverStatus, paymentmethod));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
   

	public static boolean updateOrderStatus(String orderId, String newStatus) {
		
		 boolean isSuccess = false;

	        try {
	            con = DDBconnect.getConnection();
	            stmt = con.createStatement();
	            String sql = "UPDATE `order` SET deliverStatus = '" + newStatus + "' WHERE orderid = '" + orderId + "'";
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return isSuccess;
	}
	
	public static List<PrescriptionDelivery> getAllPrescriptionDeliveries() { //DAO
	    List<PrescriptionDelivery> deliveries = new ArrayList<>();

	    try {
	        con = DDBconnect.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM prescriptiondelivery";
	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            int pDeliveryID = rs.getInt("pDeliveryID");
	            int cusID = rs.getInt("cusID");
	            String cusname = rs.getString("cusname");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            String address = rs.getString("address");
	            int presID = rs.getInt("presID");
	            String dstatus = rs.getString("Dstatus");
	            double amount = rs.getDouble("amount");
	            String paymentmethod = rs.getString("paymentmethod");

	            deliveries.add(new PrescriptionDelivery(pDeliveryID, cusID, cusname, email, phone, address, presID, dstatus, amount, paymentmethod));

	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return deliveries;
	}
	
	public static boolean updatePrescriptionStatus(String deliveryId, String newStatus) {
	    boolean isSuccess = false;

	    try {
	        con = DDBconnect.getConnection();
	        stmt = con.createStatement();
	        String sql = "UPDATE prescriptiondelivery SET Dstatus = '" + newStatus + "' WHERE pDeliveryID = '" + deliveryId + "'";
	        int rs = stmt.executeUpdate(sql);

	        if (rs > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}




}

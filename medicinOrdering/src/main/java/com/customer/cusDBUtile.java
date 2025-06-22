package com.customer;

//model 

import java.math.BigDecimal;
import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;



public class cusDBUtile {
	
	
	private static Connection con= null;
	private static Statement stmt= null;
	private static ResultSet rs=null;
	
	// checke customer user name alrady in databse 
	public static boolean doesUsernameExist(String username) {
        boolean exists = false;
        String sql = "SELECT * FROM customer WHERE username = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            
            stmt.setString(1, username);
             rs = stmt.executeQuery();
            
            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error
        }
        
        return exists;
    }
	
	
	
  // insert customer 
    public static boolean insertcustomer(String name,String email,String phone ,String username,String password,String address) {
		
		boolean isSuccess = false;
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			String sql="insert into customer values(0,'"+name+"','"+email+"','"+phone+"','"+username+"','"+password+"','"+address+"')";
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				
				isSuccess= true;
				System.out.println("data insert");
			}else {
				
				isSuccess=false;
				System.out.println("data not insert");
			}
			
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		
		
		
		
		
		
		
		return isSuccess;
		
		
		
	}
	
	
    public static boolean validateUser(String username, String password) {
        boolean isValid = false;
        String sql = "SELECT * FROM customer WHERE username = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password); // You should hash the password here

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    isValid = true; // User found with matching credentials
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log any SQL errors
        }

        return isValid;
    }

   //include DAO Pattern 
    public static customer getUserDetails(String username) {
        customer user = null;
        String sql = "SELECT * FROM customer WHERE username = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Map the result set to a customer object
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String userName = rs.getString("username");
                    String password = rs.getString("password");
                    String address=rs.getString("address");
                    // Create customer object
                    user = new customer(id, name, email, phone, userName, password,address);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log any SQL errors
        }

        return user;
    }
	
    
    public static boolean updateUserDetails(String id, String name, String email, String phone, String password, String address) {
        boolean isUpdated = false;
        String sql = "UPDATE customer SET name = ?, email = ?, phone = ?, address = ? WHERE id = ?";

        if (password != null && !password.trim().isEmpty()) {
            sql = "UPDATE customer SET name = ?, email = ?, phone = ?, address = ?, password = ? WHERE id = ?";
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);

            if (password != null && !password.trim().isEmpty()) {
                stmt.setString(5, password);
                stmt.setString(6, id);
            } else {
                stmt.setString(5, id);
            }

            int result = stmt.executeUpdate();

            if (result > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    
    
    public static boolean deleteUserProfile(String id) {
        boolean isDeleted = false;
        String sql = "DELETE FROM customer WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set the user ID for deletion
            stmt.setString(1, id);

            // Execute the delete query
            int result = stmt.executeUpdate();
            if (result > 0) {
                isDeleted = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDeleted;
    }
	
    public static boolean insertPrescription(String userId, String name, String email, String phone, String fileName, String filePath, String paymentMethod, String address) {
        boolean isSuccess = false;

        // Corrected SQL query - Added 'address' column
        String sql = "INSERT INTO prescriptions (userid, name, email, phone, filename, filepath, paymentmethod, status, address) VALUES (?, ?, ?, ?, ?, ?, ?, 'pending', ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set values for each placeholder in the SQL query
            stmt.setString(1, userId);  
            stmt.setString(2, name);     
            stmt.setString(3, email);    
            stmt.setString(4, phone);    // Set phone
            stmt.setString(5, fileName); // Set file name
            stmt.setString(6, filePath); // Set file path
            stmt.setString(7, paymentMethod); // Set payment method
            stmt.setString(8, address); // Set address

            // Execute the update and check if rows were affected
            int result = stmt.executeUpdate();

            if (result > 0) {
                isSuccess = true;  // Successfully inserted the prescription
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print any SQL exceptions
            System.out.println("Not uploaded");
        }

        return isSuccess;  // Return true if insertion was successful, otherwise false
    }
    public static List<Prescription> getPrescriptionsByUserId(String userId) {
        List<Prescription> prescriptions = new ArrayList<>();
        String sql = "SELECT * FROM prescriptions WHERE userid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String fileName = rs.getString("filename");
                String filePath = rs.getString("filepath");  // Fetching the file path from the database
                String status = rs.getString("status");
                String deliverStatus = rs.getString("DeliverStatus"); // Fetching the deliverStatus
                double amount = rs.getDouble("amount");

                // Pass deliverStatus to the constructor
                Prescription prescription = new Prescription(id, fileName, filePath, status, deliverStatus, amount);
                prescriptions.add(prescription);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Log any SQL errors
        }

        return prescriptions;
    }
    
    public static boolean prescriptionExists(String userId, String imagePath) {
        boolean exists = false;
        String sql = "SELECT * FROM prescriptions WHERE user_id = ? AND image = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, imagePath);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }


    public static boolean deletePrescription(int prescriptionId) {
        boolean isDeleted = false;
        String sql = "DELETE FROM prescriptions WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, prescriptionId);
            int result = stmt.executeUpdate();

            if (result > 0) {
                isDeleted = true; // Prescription successfully deleted
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

    
    public static boolean deletePrescriptionsByUserId(String userId) {
        boolean isDeleted = false;
        String sql = "DELETE FROM prescriptions WHERE userid = ?";  // SQL query to delete prescriptions by userId

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, userId);  // Set the userId parameter for the deletion query

            int result = stmt.executeUpdate();  // Execute the deletion query
            if (result > 0) {
                isDeleted = true;  // Successfully deleted prescriptions
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log any SQL errors
        }

        return isDeleted;  // Return true if the prescriptions were successfully deleted, otherwise false
    }

   
    
    public static boolean insertOrder(String userId, String name, String email, String phone, String address, double totalAmount, String paymentMethod) {
        String sql = "INSERT INTO pharmacy.order (userid, name, email, phone, address, amount, paymentmethod, deliverStatus) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, 'pending')";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, userId);
            stmt.setString(2, name);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setDouble(6, totalAmount);
            stmt.setString(7, paymentMethod); // Insert payment method (should be "cash")

            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to clear the cart (if needed)
    public static void clearCart(HttpSession session) {
        session.removeAttribute("cart");
    }



   public static List<Order> getUserOrders(String userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT orderid, amount, deliverStatus FROM pharmacy.order WHERE userid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderid");
                double amount = rs.getDouble("amount");
                String deliverStatus = rs.getString("deliverStatus");

                Order order = new Order(orderId, amount, deliverStatus);
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

public static boolean isPrescriptionApproved(String prescriptionId) {
    // Logic to check if the prescription status is "Accepted"
    // Assuming you have a column 'status' in prescriptions table and it should be "Accepted" to be confirmed
    String sql = "SELECT status FROM pharmacy.prescriptions WHERE id = ?";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {
        stmt.setString(1, prescriptionId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next() && "Accepted".equals(rs.getString("status"))) {
            return true;  // Prescription is approved
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;  // Prescription not approved
}

public static boolean insertPrescriptionToDelivery(String prescriptionId, String userId, String name, String email, String phone, String address, String amount, String paymentMethod) {
	String sql = "INSERT INTO pharmacy.prescriptiondelivery (cusID, cusname, email, phone, address, presID, Dstatus, amount, paymentmethod) VALUES (?, ?, ?, ?, ?, ?, 'pending', ?, ?)";

	try (Connection con = DBConnection.getConnection();
	     PreparedStatement stmt = con.prepareStatement(sql)) {

	    int cusId = Integer.parseInt(userId);
	    int presId = Integer.parseInt(prescriptionId);

	    stmt.setInt(1, cusId);
	    stmt.setString(2, name);
	    stmt.setString(3, email);
	    stmt.setString(4, phone);
	    stmt.setString(5, address);
	    stmt.setInt(6, presId);
	    stmt.setBigDecimal(7, new BigDecimal(amount)); // amount as decimal
	    stmt.setString(8, paymentMethod);              // payment method

	    int result = stmt.executeUpdate();
	    System.out.println("🚀 Prescription Delivery Insert Result: " + result);
	    return result > 0;

	} catch (NumberFormatException e) {
	    System.out.println("❌ Invalid ID: userId=" + userId + ", prescriptionId=" + prescriptionId);
	    e.printStackTrace();
	} catch (SQLException e) {
	    System.out.println("❌ SQL Exception during insertPrescriptionToDelivery");
	    e.printStackTrace();
	}

	return false;
}


public static Map<String, String> getPrescriptionDetails(String prescriptionId) {
    Map<String, String> data = new HashMap<>();

    String sql = "SELECT amount, paymentmethod FROM prescriptions WHERE id = ?";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setInt(1, Integer.parseInt(prescriptionId));
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            data.put("amount", rs.getString("amount"));
            data.put("paymentmethod", rs.getString("paymentmethod"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return data;
}


public static List<Map<String, Object>> getPrescriptionDeliveriesByUserId(String userId) {
    List<Map<String, Object>> deliveries = new ArrayList<>();
    String sql = "SELECT presID, amount, Dstatus FROM pharmacy.prescriptiondelivery WHERE cusID = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setString(1, userId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("presID", rs.getInt("presID"));
            row.put("amount", rs.getBigDecimal("amount"));
            row.put("Dstatus", rs.getString("Dstatus"));
            deliveries.add(row);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return deliveries;
}



public static void updatePrescriptionDeliverStatus(String prescriptionId, String newStatus) {
    String sql = "UPDATE prescriptions SET deliverStatus = ? WHERE id = ?";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setString(1, newStatus);
        stmt.setInt(2, Integer.parseInt(prescriptionId));
        stmt.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}



public static boolean deleteOrdersByUserId(String userId) {
    boolean isDeleted = false;
    String sql = "DELETE FROM pharmacy.order WHERE userid = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setString(1, userId);
        int result = stmt.executeUpdate();

        if (result >= 0) {  // 0 means no orders, but deletion is still successful
            isDeleted = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return isDeleted;
}





}	
	
    	
	


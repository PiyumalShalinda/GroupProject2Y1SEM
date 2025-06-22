package com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean validate(String username, String password) {
	    boolean isSuccess = false;
	    try {
	        con = ADBconnect.getConnection();
	        stmt = con.createStatement();

	        
	        System.out.println("Executing query: SELECT * FROM admin WHERE UserID='" + username + "' AND password='" + password + "'");

	        String sql = "SELECT * FROM admin WHERE UserID='" + username + "' AND password='" + password + "'";
	        rs = stmt.executeQuery(sql);

	        if (rs.next()) {
	            isSuccess = true;
	            System.out.println("Login successful for UserID: " + username);
	        } else {
	            System.out.println("Login failed for UserID: " + username);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
	        try { if (con != null) con.close(); } catch (Exception e) {}
	    }
	    return isSuccess;
	}
	
	public static List<Auser> getAuser(String pharmacistID){
		ArrayList<Auser> use = new ArrayList<>();
		
		try {
			con = ADBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from pharmacist where pharmacistID='"+pharmacistID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				String pharmacistIDU = rs.getString(1);
				String passwordU = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String contactnumber = rs.getString(5);
				
				
				Auser U = new Auser(pharmacistIDU,passwordU ,name,email,contactnumber);
				
				use.add(U);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return use;
	}
	
	
	public static boolean insertuser(String pharmacistID, String password, String name, String email, String contactnumber) {
	    boolean isSuccess = false;
	    try {
	        con = ADBconnect.getConnection();
	        stmt = con.createStatement();
	        
	       
	        String sql = "INSERT INTO pharmacist (pharmacistID, password, name, email, contactnumber) " +
	                    "VALUES ('" + pharmacistID + "','" + password + "','" + name + "','" + email + "','" + contactnumber + "')";
	        
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


	
	public static boolean updateuser(String pharmacistID, String password,String name, String email, String contactnumber) {
		
		
		try {
			con = ADBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "update pharmacist set password='"+password+"',name ='"+name+"',email='"+email+"',contactnumber='"+contactnumber+"'"+ "where pharmacistID='"+pharmacistID+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess= true;
			}
			else {
				isSuccess= false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	public static List<Auser> getUserDetails(String pharmacistID){
		
		
		ArrayList<Auser> use = new ArrayList<>();
		
		try {
			con = ADBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from pharmacist where pharmacistID= '"+pharmacistID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				String pharmacistId = rs.getString(1);
				String password = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String contactnumber = rs.getString(5);
				
				
				Auser u = new Auser(pharmacistId,password,name,email,contactnumber);
				use.add(u);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return use;
	}
	public static boolean ADeleteuser(String pharmacistID) {
	    boolean isSuccess = false;

	    try {
	        Connection con = ADBconnect.getConnection();
	        String sql = "DELETE FROM pharmacist WHERE pharmacistID = ?";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, pharmacistID);

	        int result = pstmt.executeUpdate();
	        isSuccess = result > 0;

	        pstmt.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	public static List<Auser> getAllUsers() {
	    ArrayList<Auser> users = new ArrayList<>();
	    
	    try {
	        con = ADBconnect.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM pharmacist"; 
	        rs = stmt.executeQuery(sql);
	        
	        while(rs.next()) {
	            
	            String pharmacistID= rs.getString("pharmacistID");
	            String password = rs.getString("password");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String contactnumber = rs.getString("contactnumber");
	           
	            
	            Auser u = new Auser(pharmacistID, password, name, email, contactnumber);
	            users.add(u);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    
	    return users;
	}
	public static boolean isEmployeeIDExists(String pharmacistID) {

		boolean exists = false;

		try {
			con = ADBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM pharmacist WHERE pharmacistID = '" + pharmacistID + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				exists = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return exists;
	}
	public static boolean updateUser(String pharmacistID, String password, String name, String email, String contactnumber) {
	    boolean success = false;

	    try (Connection con = ADBconnect.getConnection()) {
	        String sql = "UPDATE pharmacist SET password=?, name=?, email=?, contactnumber=? WHERE pharmacistID=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, password);
	        ps.setString(2, name);
	        ps.setString(3, email);
	        ps.setString(4, contactnumber);
	        ps.setString(5, pharmacistID);

	        int rows = ps.executeUpdate();
	        if (rows > 0) {
	            success = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return success;
	}

}

package com.pharmacist;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class P_DButil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	
public static boolean validate(String userid,String password) {
		
		try {
			con =P_DBconnect.getConnection();
			stmt = con.createStatement();
			String sql =  "select * from pharmacist where pharmacistID='"+userid+"' and password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				isSuccess =true;
			}else {
				isSuccess = false ;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

public static boolean insertMedicine(String id ,String name , String description , String benefits , String ingredients ,int quantity , double price) {
	boolean isSuccess = false ;
	
	
	try {
		
		con = P_DBconnect.getConnection();
		stmt = con.createStatement();
		String sql ="insert into medicine values('"+id+"','"+name+"','"+description+"','"+benefits+"','"+ingredients+"','"+quantity+"','"+price+"')";
		
		int rs = stmt.executeUpdate(sql);
		
		
		if(rs>0) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess ;
}
/*
	public static boolean updateProfile(String id ,String name , String email , String phone , String password) {
		
		
		try {
			con = P_DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "update pharmacist set name='"+name+"', email='"+email+"',contactnumber='"+phone+"',password='"+password+"' where pharmacistID='"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}*/

public static boolean updateProfile(String id, String name, String email, String phone, String password) {
    boolean isSuccess = false;

    try {
        con = P_DBconnect.getConnection();
        String sql = "UPDATE pharmacist SET name = ?, email = ?, contactnumber = ?, password = ? WHERE pharmacistID = ?";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, phone);
        stmt.setString(4, password);
        stmt.setString(5, id);

        int rows = stmt.executeUpdate();
        if (rows > 0) {
            isSuccess = true;
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return isSuccess;
}



	public static List<pharmacist> getPharmacistDetails(String id){
		
		ArrayList<pharmacist> p = new ArrayList<>();
		
		try {
			con = P_DBconnect.getConnection();
			stmt = con.createStatement();
			String sql ="select * from pharmacist where pharmacistID='"+id+"'" ;

			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				String ID = rs.getString("pharmacistID");
	            String password = rs.getString("password");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String phone = rs.getString("contactnumber");
				
				pharmacist ph = new pharmacist(ID , password , name , email ,phone);
				
				p.add(ph);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public static List<medicine> getAllMedicines() {
	    List<medicine> medicines = new ArrayList<>();

	    try {
	        con = P_DBconnect.getConnection();
	        String sql = "SELECT * FROM medicine";
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            int medID = rs.getInt("medID");
	            String medName = rs.getString("medName");
	            String medDesc = rs.getString("medDesc");
	            String medBenefits = rs.getString("medBenefits");
	            String medIng = rs.getString("medIng");
	            int medQty = rs.getInt("medQty");
	            double medPrice = rs.getDouble("medPrice");
	            String medImage = rs.getString("medimage");
	            String pharmacistId = rs.getString("pharmacist_id"); 

	            
	            medicine med = new medicine(medID, medName, medDesc, medBenefits, medIng, medQty, medPrice, medImage, pharmacistId);
	            medicines.add(med);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return medicines;
	}

	public static boolean acceptOrder(int orderId, double amount) {
	    boolean isSuccess = false;

	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "UPDATE prescriptions SET status = 'Accepted', amount = ? WHERE id = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setDouble(1, amount);
	        stmt.setInt(2, orderId);

	        int rows = stmt.executeUpdate();
	        if (rows > 0) {
	            isSuccess = true;
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	public static boolean deleteMedicine(int medID) {
	    boolean isSuccess = false;

	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "DELETE FROM medicine WHERE medID = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, medID);

	        int rows = stmt.executeUpdate();
	        if (rows > 0) {
	            isSuccess = true;
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	public static boolean isMedicineNameExists(String medName) {
	    boolean exists = false;
	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "SELECT COUNT(*) FROM medicine WHERE medName = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setString(1, medName);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            exists = true;
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return exists;
	}

	public static boolean addMedicine(String name, String desc, String benefits, String ing, int qty, double price, String image, String pharmacistId) {
	    boolean isSuccess = false;
	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "INSERT INTO medicine (medName, medDesc, medBenefits, medIng, medQty, medPrice, medimage, pharmacist_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setString(1, name);
	        stmt.setString(2, desc);
	        stmt.setString(3, benefits);
	        stmt.setString(4, ing);
	        stmt.setInt(5, qty);
	        stmt.setDouble(6, price);
	        stmt.setString(7, image);
	        stmt.setString(8, pharmacistId);

	        int rows = stmt.executeUpdate();
	        if (rows > 0) {
	            isSuccess = true;
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}

	public static medicine getMedicineById(int medID) {
	    medicine med = null;

	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "SELECT * FROM medicine WHERE medID = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, medID);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            med = new medicine();
	            med.setMedID(rs.getInt("medID"));
	            med.setMedName(rs.getString("medName"));
	            med.setMedDesc(rs.getString("medDesc"));
	            med.setMedBenefits(rs.getString("medBenefits"));
	            med.setMedIng(rs.getString("medIng"));
	            med.setMedQty(rs.getInt("medQty"));
	            med.setMedPrice(rs.getDouble("medPrice"));
	            med.setMedImage(rs.getString("medimage"));
	            med.setPharmacistId(rs.getString("pharmacist_id"));
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return med;
	}


	public static boolean rejectOrder(int orderId) {
	    boolean isSuccess = false;

	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "UPDATE prescriptions SET status = 'Rejected' WHERE id = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, orderId);

	        int rows = stmt.executeUpdate();
	        if (rows > 0) {
	            isSuccess = true;
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	public static boolean updateMedicine(int medID, String name, String desc, String benefits, String ing, int qty, double price, String image) {
	    boolean isSuccess = false;

	    try {
	        Connection con = P_DBconnect.getConnection();
	        String sql = "UPDATE medicine SET medName=?, medDesc=?, medBenefits=?, medIng=?, medQty=?, medPrice=?, medimage=? WHERE medID=?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setString(1, name);
	        stmt.setString(2, desc);
	        stmt.setString(3, benefits);
	        stmt.setString(4, ing);
	        stmt.setInt(5, qty);
	        stmt.setDouble(6, price);
	        stmt.setString(7, image);
	        stmt.setInt(8, medID);

	        int rows = stmt.executeUpdate();
	        if (rows > 0) {
	            isSuccess = true;
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	public static List<Map<String, String>> getAllPrescriptionOrders(HttpSession session) {
	    List<Map<String, String>> allOrders = new ArrayList<>();
	    int pendingCount = 0;
	    int acceptedCount = 0;

	    try (Connection con = P_DBconnect.getConnection()) {
	        String sql = "SELECT * FROM prescriptions";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Map<String, String> order = new HashMap<>();
	            String status = rs.getString("status");

	            order.put("id", rs.getString("id"));
	            order.put("userid", rs.getString("userid"));
	            order.put("name", rs.getString("name"));
	            order.put("filename", rs.getString("filename"));
	            order.put("filepath", rs.getString("filepath"));
	            order.put("status", status);
	            order.put("amount", rs.getString("amount"));

	            if ("Pending".equalsIgnoreCase(status)) {
	                pendingCount++;
	            } else if ("Accepted".equalsIgnoreCase(status)) {
	                acceptedCount++;
	            }

	            allOrders.add(order);
	        }

	        // Save counters into session
	        session.setAttribute("pendingCount", pendingCount);
	        session.setAttribute("acceptedCount", acceptedCount);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return allOrders;
	}
	// Get all orders from pharmacy.order table
	public static List<Map<String, String>> getAllDeliveryOrders() {
	    List<Map<String, String>> orders = new ArrayList<>();

	    try (Connection con = P_DBconnect.getConnection()) {
	        String sql = "SELECT * FROM pharmacy.`order`";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Map<String, String> order = new HashMap<>();
	            order.put("orderid", rs.getString("orderid"));
	            order.put("userid", rs.getString("userid"));
	            order.put("name", rs.getString("name"));
	            order.put("email", rs.getString("email"));
	            order.put("address", rs.getString("address"));
	            order.put("phone", rs.getString("phone"));
	            order.put("amount", rs.getString("amount"));
	            order.put("deliverStatus", rs.getString("deliverStatus"));
	            order.put("paymentmethod", rs.getString("paymentmethod"));

	            orders.add(order);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return orders;
	}

	// Get all records from prescriptiondelivery table
	public static List<Map<String, String>> getAllPrescriptionDeliveries() {
	    List<Map<String, String>> list = new ArrayList<>();

	    try (Connection con = P_DBconnect.getConnection()) {
	        String sql = "SELECT * FROM pharmacy.prescriptiondelivery";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Map<String, String> pd = new HashMap<>();
	            pd.put("pDeliveryID", rs.getString("pDeliveryID"));
	            pd.put("cusID", rs.getString("cusID"));
	            pd.put("cusname", rs.getString("cusname"));
	            pd.put("email", rs.getString("email"));
	            pd.put("phone", rs.getString("phone"));
	            pd.put("address", rs.getString("address"));
	            pd.put("presID", rs.getString("presID"));
	            pd.put("amount", rs.getString("amount"));
	            pd.put("paymentmethod", rs.getString("paymentmethod"));
	            pd.put("dstatus", rs.getString("Dstatus"));

	            list.add(pd);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}




}

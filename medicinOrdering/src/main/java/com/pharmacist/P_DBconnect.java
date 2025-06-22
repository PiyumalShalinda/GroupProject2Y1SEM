package com.pharmacist;

import java.sql.Connection;
import java.sql.DriverManager;

public class P_DBconnect {

		private static String url="jdbc:mysql://localhost:3306/pharmacy";
		private static 	String username ="root";	
		private static 	String password="12345";	
		private static Connection con ;

		public static Connection getConnection() {
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e) {
				System.out.println("Database Connection is not Success!!");
			}
			
			return con;
		}
	}

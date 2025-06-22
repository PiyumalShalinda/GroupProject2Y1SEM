package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection { //singelenton pattren 

    private static String url = "jdbc:mysql://localhost:3306/pharmacy?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static String user = "root";
    private static String pass = "12345";
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("✅ Database connection successful");
        } catch (Exception e) {
            System.out.println("❌ Database is not successful");
            e.printStackTrace(); // shows exact issue
        }
        return con;
    }
}
// use singletone pattern 
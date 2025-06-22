package com.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Auserinsert")
public class Auserinsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String loggedInUsername = (String) request.getSession().getAttribute("username");

        if (loggedInUsername == null) {
            response.sendRedirect("Login.jsp"); 
            return; 
        }
        String pharmacistID = request.getParameter("pharmacistID");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactnumber = request.getParameter("contactnumber");

        try {
            // Validate contact number format
            if (contactnumber != null && !contactnumber.isEmpty()) {
                try {
                    Long.parseLong(contactnumber); // Try to parse as a number
                } catch (NumberFormatException e) {
                    throw new CustomNumberFormatException("Contact number must contain only digits");
                }
            }

            // Check if employee ID already exists
            boolean isDuplicate = AdminDBUtil.isEmployeeIDExists(pharmacistID);

            if (isDuplicate) {
                // Set error message and form data to retain user input
                request.setAttribute("errorMsg", "Pharmacist ID already exists. Please choose a different ID.");
                request.setAttribute("pharmacistID", pharmacistID);
                request.setAttribute("password", password);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("contactnumber", contactnumber);
                
                // Get all users to display the table
                request.setAttribute("userList", AdminDBUtil.getAllUsers());
                
                // Forward back to admin dashboard with error
                RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
                rd.forward(request, response);
            } else {
                // Insert new user
                boolean isTrue = AdminDBUtil.insertuser(pharmacistID, password, name, email, contactnumber);
                if (isTrue) {
                    // Success - redirect to dashboard
                    request.setAttribute("userList", AdminDBUtil.getAllUsers());
                    RequestDispatcher dis = request.getRequestDispatcher("adminDashboard.jsp");
                    dis.forward(request, response);
                } else {
                    // Database insertion failed
                    RequestDispatcher dis2 = request.getRequestDispatcher("Aunsuccess.jsp");
                    dis2.forward(request, response);
                }
            }
        } catch (CustomNumberFormatException e) {
            // Handle the custom exception for contact number format
            request.setAttribute("errorMsg", e.getMessage());
            request.setAttribute("pharmacistID", pharmacistID);
            request.setAttribute("password", password);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("contactnumber", "");
            
            // Get all users to display the table
            request.setAttribute("userList", AdminDBUtil.getAllUsers());
            
            // Forward back to admin dashboard with error
            RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
            rd.forward(request, response);
        }
    }
}
package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AloginServlet")
public class AloginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username = request.getParameter("uid");
        String password = request.getParameter("pass");

        System.out.println("Received login attempt: UserID = " + username + " | Password = " + password);

        boolean isAdmin = AdminDBUtil.validate(username, password);  
        boolean isPharmacist = AdminDBUtil.isEmployeeIDExists(username); 

        if (isAdmin) {
           
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(30*60);

            List<Auser> userList = AdminDBUtil.getAllUsers();
            request.setAttribute("userList", userList);
            session.setAttribute("userList", userList);

            System.out.println("Admin login successful, redirecting to admin dashboard...");
            response.sendRedirect("adminDashboard.jsp");
        } else if (isPharmacist) {
            // If pharmacist credentials are correct
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(30*60);

            // Get pharmacist details and set in session
            List<Auser> userList = AdminDBUtil.getAuser(username);
            session.setAttribute("userDetails", userList); 

            System.out.println("Pharmacist login successful, redirecting to Auseraccount.jsp...");
            response.sendRedirect("Auseraccount.jsp");  
        } else {
            // If login fails
            System.out.println("Invalid login credentials.");
            out.println("<script type='text/javascript'>");
            out.println("alert('Login failed. Invalid credentials.');");
            out.println("location='Login.jsp';");
            out.println("</script>");
        }
    }
}

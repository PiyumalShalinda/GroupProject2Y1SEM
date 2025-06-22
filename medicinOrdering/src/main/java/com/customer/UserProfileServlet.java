package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user ID from session
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");
        
        // Fetch prescriptions from the database
        List<Prescription> prescriptions = cusDBUtile.getPrescriptionsByUserId(userId);

        // Set prescriptions as request attributes
        request.setAttribute("prescriptions", prescriptions);

        // Forward to userProfile.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }
}
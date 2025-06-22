package com.pharmacist;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_ViewDeliveryOrdersServlet")
public class P_ViewDeliveryOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 
        // Fetch delivery orders and prescription delivery records
        List<Map<String, String>> allOrders = P_DButil.getAllDeliveryOrders();
        List<Map<String, String>> allPrescriptions = P_DButil.getAllPrescriptionDeliveries();

        // Get or create session
        HttpSession session = request.getSession(true);

        // Store data in session for access in JSP
        session.setAttribute("deliveryOrders", allOrders);
        session.setAttribute("prescriptionDeliveries", allPrescriptions);

        // Optionally log session info for debugging
        System.out.println("Session ID: " + session.getId());
        System.out.println("Delivery Orders Size: " + (allOrders != null ? allOrders.size() : 0));
        System.out.println("Prescription Deliveries Size: " + (allPrescriptions != null ? allPrescriptions.size() : 0));

        // Forward to JSP page for rendering the data
        RequestDispatcher dis = request.getRequestDispatcher("P_ViewDeliveryOrders.jsp");
        dis.forward(request, response);
    }
}


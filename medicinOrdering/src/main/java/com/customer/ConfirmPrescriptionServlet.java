package com.customer;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ConfirmPrescriptionServlet")
public class ConfirmPrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        String loggedInUsername = (String) request.getSession().getAttribute("username");

        if (loggedInUsername == null) {
            response.sendRedirect("Login.jsp"); 
            return;
        }


        // Fetch user session data
        String userId = (String) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String address = (String) session.getAttribute("address");

        // Fetch prescription ID from form
        String prescriptionId = request.getParameter("prescriptionId");

        // Validate input
        if (userId == null || prescriptionId == null || prescriptionId.isEmpty()) {
            session.setAttribute("message", "❌ Invalid session or prescription ID.");
            response.sendRedirect("userProfile.jsp");
            return;
        }

        // Check if prescription is approved
        boolean isApproved = cusDBUtile.isPrescriptionApproved(prescriptionId);
        if (!isApproved) {
            session.setAttribute("message", "⚠️ Prescription must be accepted by the pharmacist before delivery.");
            response.sendRedirect("userProfile.jsp");
            return;
        }

        // Fetch amount and payment method from prescriptions table
        Map<String, String> presDetails = cusDBUtile.getPrescriptionDetails(prescriptionId);
        String amount = presDetails.get("amount");
        String paymentMethod = presDetails.get("paymentmethod");

        if (amount == null || paymentMethod == null) {
            session.setAttribute("message", "❌ Missing prescription details. Please contact support.");
            response.sendRedirect("userProfile.jsp");
            return;
        }

        // Insert into delivery table
        boolean isInserted = cusDBUtile.insertPrescriptionToDelivery(
                prescriptionId, userId, name, email, phone, address, amount, paymentMethod);

        if (isInserted) {
            // Update deliverStatus in prescriptions table to "Processing"
            cusDBUtile.updatePrescriptionDeliverStatus(prescriptionId, "Processing");

            session.setAttribute("message", "✅ Prescription confirmed and sent for delivery.");
        } else {
            session.setAttribute("message", "❌ Failed to confirm prescription delivery.");
        }

        response.sendRedirect("UserProfileServlet");
    }
}
package com.customer;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ConfirmOrderServlet")
public class ConfirmOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String address = (String) session.getAttribute("address");

        // Validate session attributes
        if (userId == null || name == null || email == null || phone == null || address == null) {
            session.setAttribute("orderMessage", "You must be logged in to place an order.");
            response.sendRedirect("Login.jsp"); // Redirect to login if the user is not logged in
            return;
        }

        // Retrieve totalAmount and paymentMethod from the request
        double totalAmount = 0.0;
        try {
            totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        } catch (NumberFormatException e) {
            session.setAttribute("orderMessage", "");
            response.sendRedirect("Checkout.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");

        // Check if paymentMethod is valid
        if (paymentMethod == null || paymentMethod.isEmpty() || !paymentMethod.equals("cash")) {
            session.setAttribute("orderMessage", "Invalid payment method selected. Please select Cash on Delivery.");
            response.sendRedirect("Checkout.jsp");
            return;
        }

        // Get prescriptionId
        String prescriptionId = request.getParameter("prescriptionId");

        // Check if prescription is approved
    
        // Insert order into the order table
        boolean isOrderInserted = cusDBUtile.insertOrder(userId, name, email, phone, address, totalAmount, paymentMethod);

        if (isOrderInserted) {
            // Clear the cart from session after successful order placement
            cusDBUtile.clearCart(session);

            // Set the success message and redirect to the cart (ViewChart.jsp)
            session.setAttribute("orderMessage", "Order placed successfully! Your order is now being processed.");
            response.sendRedirect("ViewChart.jsp"); // Redirect to order confirmation page
        } else {
            // Order insertion failed, send an error message
            session.setAttribute("orderMessage", "Failed to place order. Please try again.");
            response.sendRedirect("Checkout.jsp"); // Redirect back to checkout with error message
        }
    }
}

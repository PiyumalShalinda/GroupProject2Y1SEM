package com.pharmacist;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/P_AcceptOrderServlet")
public class P_AcceptOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            double amount = Double.parseDouble(request.getParameter("amount"));

            boolean isAccepted = P_DButil.acceptOrder(orderId, amount);

            if (isAccepted) {
                // Forward to view orders
                RequestDispatcher rd = request.getRequestDispatcher("P_ViewOrdersServlet");
                rd.forward(request, response);
            } else {
                // Optionally show error
                request.setAttribute("errorMsg", "Failed to accept order.");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp");
        }
    }
}



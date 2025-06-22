package com.pharmacist;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_ViewOrdersServlet")
public class P_ViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Fetch orders using DButil
        List<Map<String, String>> allOrders = P_DButil.getAllPrescriptionOrders(session);

        // Save orders in session
        session.setAttribute("allOrders", allOrders);

        // Forward to view
        RequestDispatcher rd = request.getRequestDispatcher("P_orders.jsp");
        rd.forward(request, response);
    }
}

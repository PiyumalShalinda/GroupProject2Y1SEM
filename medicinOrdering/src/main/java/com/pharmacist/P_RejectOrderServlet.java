package com.pharmacist;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_RejectOrderServlet")
public class P_RejectOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check if pharmacist is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            boolean rejected = P_DButil.rejectOrder(orderId);

            if (!rejected) {
                request.setAttribute("error", "Failed to reject the order.");
            }

            RequestDispatcher rd = request.getRequestDispatcher("P_ViewOrdersServlet");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp");
        }
    }
}


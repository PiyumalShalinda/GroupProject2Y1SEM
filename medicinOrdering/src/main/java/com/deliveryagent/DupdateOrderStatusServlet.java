package com.deliveryagent;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

@WebServlet("/DupdateOrderStatusServlet")
public class DupdateOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderid");
        String newStatus = request.getParameter("status");
        String agentID = request.getParameter("agentID"); 

        boolean isUpdated = DDBUtil.updateOrderStatus(orderId, newStatus);

        if (isUpdated) {
            request.setAttribute("message", "Order status updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update order status.");
        }

        // Get agent details
        List<Deliveryagent> DDetails = DDBUtil.getDDetails(agentID);
        request.setAttribute("DDetails", DDetails);

        // Set updated order list
        request.setAttribute("orderList", DDBUtil.getAllOrders());

        // ✅ Add this line to include prescription delivery data
        request.setAttribute("deliveryList", DDBUtil.getAllPrescriptionDeliveries());

        // Forward to JSP
        RequestDispatcher dis = request.getRequestDispatcher("DAgentaccount.jsp");
        dis.forward(request, response);
    }
}




package com.deliveryagent;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DUpdatePrescriptionDeliveryServlet")
public class DUpdatePrescriptionDeliveryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String deliveryId = request.getParameter("deliveryId");
        String newStatus = request.getParameter("status");
        String agentID = request.getParameter("agentID");

        boolean isUpdated = DDBUtil.updatePrescriptionStatus(deliveryId, newStatus);

        if (isUpdated) {
            request.setAttribute("message", "Prescription delivery status updated.");
        } else {
            request.setAttribute("message", "Failed to update prescription delivery status.");
        }

        // Refresh all data
        request.setAttribute("DDetails", DDBUtil.getDDetails(agentID));
        request.setAttribute("orderList", DDBUtil.getAllOrders());
        request.setAttribute("deliveryList", DDBUtil.getAllPrescriptionDeliveries());

        RequestDispatcher dis = request.getRequestDispatcher("DAgentaccount.jsp");
        dis.forward(request, response);
    }
}

package com.deliveryagent;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DupdateagentServlet")
public class DupdateagentServlet extends HttpServlet { /*using inheritance*/
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String agentID = request.getParameter("agentID");
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        
        try {
            // Validate phone number format
            if (phone != null && !phone.isEmpty()) {
                try {
                    Long.parseLong(phone); // Try to parse as a number
                } catch (NumberFormatException e) {
                    throw new CustomNumberFormatException("Contact number must contain only digits");
                }
            }
            
            boolean isTrue;
            isTrue = DDBUtil.updateagent(agentID, username, name, email, phone, password);
            List<Deliveryagent> DDetails = DDBUtil.getDDetails(agentID);
            request.setAttribute("DDetails", DDetails);
            request.setAttribute("orderList", DDBUtil.getAllOrders());
            request.setAttribute("deliveryList", DDBUtil.getAllPrescriptionDeliveries());  // <-- Add this line
            RequestDispatcher dis = request.getRequestDispatcher("DAgentaccount.jsp");
            dis.forward(request, response);
            
        } catch (CustomNumberFormatException e) {
            // Handle the custom exception for contact number format
            List<Deliveryagent> DDetails = DDBUtil.getDDetails(agentID);
            request.setAttribute("DDetails", DDetails);
            request.setAttribute("orderList", DDBUtil.getAllOrders());
            request.setAttribute("deliveryList", DDBUtil.getAllPrescriptionDeliveries());
            request.setAttribute("error", e.getMessage());
            RequestDispatcher dis = request.getRequestDispatcher("DAgentaccount.jsp");
            dis.forward(request, response);
        }
    }
}
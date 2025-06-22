package com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ACustomerDeleteServlet")
public class ACustomerDeleteServlet extends HttpServlet {                   //inheritence
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
        String loggedInUsername = (String) request.getSession().getAttribute("username");                         //polymophism

        if (loggedInUsername == null) {
            response.sendRedirect("Login.jsp"); 
            return;
        }

        String customerId = request.getParameter("id");
        
        boolean isDeleted = ACustomerDBUtil.deleteCustomer(customerId); 
        
        if (isDeleted) {
            List<ACustomer> customerList = ACustomerDBUtil.getAllCustomers();
            request.setAttribute("customerList", customerList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ACusdashboard.jsp");
            dispatcher.forward(request, response);
        }
        else {
            request.setAttribute("errorMessage", "Error deleting customer.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        }
    }
}

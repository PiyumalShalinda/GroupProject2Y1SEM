package com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/ACustomerUpdateServlet")
public class ACustomerUpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String loggedInUsername = (String) request.getSession().getAttribute("username");

        if (loggedInUsername == null) {
            response.sendRedirect("Login.jsp"); 
            return;
        }

       
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
      
        
        
        boolean isUpdated = ACustomerDBUtil.updateCustomer(id, name, email, phone, address); 
        if (isUpdated) {
            List<ACustomer> customerList = ACustomerDBUtil.getAllCustomers();
            request.setAttribute("customerList", customerList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ACusdashboard.jsp");
            dispatcher.forward(request, response);
        

        } else {
           
            request.setAttribute("errorMessage", "Error updating customer.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("ACusdashboard.jsp");
            dispatcher.forward(request, response);
        }
    }
}


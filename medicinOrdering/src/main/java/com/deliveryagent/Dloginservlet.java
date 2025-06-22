package com.deliveryagent;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Dloginservlet")
public class Dloginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //polymorphism
		
		 String loggedInUsername = (String) request.getSession().getAttribute("username");

	        if (loggedInUsername == null) {
	            response.sendRedirect("Login.jsp"); 
	            return;
	        }

	        
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			
			List<Deliveryagent> DDetails = DDBUtil.validate(username, password);
			List<Order> orderList = DDBUtil.getAllOrders(); 
			List<PrescriptionDelivery> deliveryList = DDBUtil.getAllPrescriptionDeliveries();
			request.setAttribute("deliveryList", deliveryList);


			request.setAttribute("DDetails", DDetails);
			request.setAttribute("orderList", orderList);  

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("DAgentaccount.jsp");
		dis.forward(request, response);
	}

}

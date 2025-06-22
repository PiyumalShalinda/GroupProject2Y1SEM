package com.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

       
        String loggedInUsername = (String) request.getSession().getAttribute("username");

        if (loggedInUsername == null) {
            response.sendRedirect("Login.jsp"); 
            return;
        }

        List<Auser> users = AdminDBUtil.getAllUsers();
        request.setAttribute("userList", users);
        RequestDispatcher dis = request.getRequestDispatcher("adminDashboard.jsp");
        dis.forward(request, response);
    }
}

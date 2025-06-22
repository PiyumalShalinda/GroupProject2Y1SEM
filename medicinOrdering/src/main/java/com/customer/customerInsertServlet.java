package com.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customerInsertServlet")
public class customerInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String address = request.getParameter("address");

        // 1. Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("passwordError", "Passwords do not match.");
            RequestDispatcher dis = request.getRequestDispatcher("C_Signupform.jsp");
            dis.forward(request, response);
            return;
        }

        // 2. Check if username already exists
        boolean usernameExists = cusDBUtile.doesUsernameExist(username);
        if (usernameExists) {
            request.setAttribute("usernameError", "Username already exists. Please choose a different one.");
            RequestDispatcher dis = request.getRequestDispatcher("C_Signupform.jsp");
            dis.forward(request, response);
        } else {
            boolean isTrue = cusDBUtile.insertcustomer(name, email, phone, username, password, address);
            if (isTrue) {
                response.sendRedirect("Login.jsp");
            } else {
                response.sendRedirect("home.jsp");
            }
        }
    }
}

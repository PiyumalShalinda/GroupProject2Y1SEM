package com.deliveryagent;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Dinsertsevlet") // Fixed the URL pattern here
public class Dinsertsevlet extends HttpServlet { /*inheritance*/
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");  
        String password = request.getParameter("password");

        boolean isTrue;
        isTrue = DDBUtil.insertagent(username,name, email, phone,  password);

        if(isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
            dis2.forward(request, response);
        }
    }
}

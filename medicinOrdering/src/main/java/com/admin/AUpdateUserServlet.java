package com.admin;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AUpdateUserServlet")
public class AUpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String loggedInUsername = (String) request.getSession().getAttribute("username");

        if (loggedInUsername == null) {
            response.sendRedirect("Login.jsp"); 
            return;
        }
        
        String pharmacistID = request.getParameter("pharmacistID");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactnumber = request.getParameter("contactnumber");

        boolean isTrue = AdminDBUtil.updateUser(pharmacistID, password, name, email, contactnumber);

        if (isTrue) {
            response.sendRedirect("UserListServlet");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Update failed'); location='UserListServlet';</script>");
        }
    }
}



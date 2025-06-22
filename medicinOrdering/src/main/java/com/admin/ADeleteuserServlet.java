package com.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ADeleteuserServlet")
public class ADeleteuserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check if admin is logged in using "username"
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Get pharmacistID from form
        String pharmacistID = request.getParameter("pharmacistID");

        boolean isDeleted = AdminDBUtil.ADeleteuser(pharmacistID);

        if (isDeleted) {
            List<Auser> userList = AdminDBUtil.getAllUsers();
            session.setAttribute("userList", userList);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("errorMsg", "Failed to delete user.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
            dispatcher.forward(request, response);
        }
    }
}

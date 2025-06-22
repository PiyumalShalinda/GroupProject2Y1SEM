package com.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/DeleteCustomerServelet")
public class DeleteCustomerServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String confirmation = request.getParameter("confirmation");

        if ("yes".equals(confirmation)) {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");

            boolean prescriptionsDeleted = cusDBUtile.deletePrescriptionsByUserId(id);
            boolean ordersDeleted = cusDBUtile.deleteOrdersByUserId(id);  // ✅ New step

            if (prescriptionsDeleted && ordersDeleted) {
                boolean userDeleted = cusDBUtile.deleteUserProfile(id);

                if (userDeleted) {
                    session.invalidate();
                    response.sendRedirect("C_Signupform.jsp");
                } else {
                    request.setAttribute("errorMessage", "Failed to delete your account.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("deleteProfile.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Failed to delete prescriptions or orders.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("deleteProfile.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect("userProfile.jsp");
        }
    }
}



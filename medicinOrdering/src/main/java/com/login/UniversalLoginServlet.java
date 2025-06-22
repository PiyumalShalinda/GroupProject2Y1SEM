package com.login;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.admin.AdminDBUtil;
import com.admin.Auser;
import com.customer.cusDBUtile;
import com.customer.customer;
import com.deliveryagent.DDBUtil;
import com.deliveryagent.Deliveryagent;
import com.pharmacist.P_DButil;
import com.pharmacist.pharmacist;

@WebServlet("/UniversalLoginServlet")
public class UniversalLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        HttpSession session = request.getSession(true);

        switch (role) {
            case "admin":
                if (AdminDBUtil.validate(username, password)) {
                    session.setAttribute("username", username);
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes

                    List<Auser> userList = AdminDBUtil.getAllUsers();
                    session.setAttribute("userList", userList);
                    request.setAttribute("userList", userList); // For use in JSP if needed

                    System.out.println("[Admin Login] Username: " + username);
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    redirectToError(request, response, "Invalid admin credentials.");
                }
                break;

            case "pharmacist":
                if (P_DButil.validate(username, password)) {
                    List<pharmacist> pDetails = P_DButil.getPharmacistDetails(username);
                    if (pDetails != null && !pDetails.isEmpty()) {
                        pharmacist p = pDetails.get(0);
                        session.setAttribute("pharmacistId", p.getId());
                        session.setAttribute("name", p.getName());
                        session.setAttribute("email", p.getEmail());
                        session.setAttribute("phone", p.getPhone());
                        session.setAttribute("password", p.getPassword());
                        session.setAttribute("pDetails", pDetails);

                        System.out.println("[Pharmacist Login] Name: " + p.getName() + " | Email: " + p.getEmail());

                        response.sendRedirect("P_account.jsp");
                    } else {
                        redirectToError(request, response, "Pharmacist details not found.");
                    }
                } else {
                    redirectToError(request, response, "Invalid pharmacist credentials.");
                }
                break;

            case "customer":
                if (cusDBUtile.validateUser(username, password)) {
                    customer user = cusDBUtile.getUserDetails(username);
                    session.setAttribute("id", String.valueOf(user.getId()));
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("name", user.getName());
                    session.setAttribute("email", user.getEmail());
                    session.setAttribute("address", user.getAddress());
                    session.setAttribute("phone", user.getPhone());

                    session.setAttribute("prescriptions", cusDBUtile.getPrescriptionsByUserId(String.valueOf(user.getId())));
                    session.setAttribute("orders", cusDBUtile.getUserOrders(String.valueOf(user.getId())));

                    System.out.println("[Customer Login] Name: " + user.getName());

                    response.sendRedirect("userProfile.jsp");
                } else {
                    redirectToError(request, response, "Invalid customer credentials.");
                }
                break;

            case "delivery":
                List<Deliveryagent> dDetails = DDBUtil.validate(username, password);
                if (dDetails != null && !dDetails.isEmpty()) {
                    session.setAttribute("DDetails", dDetails);
                    session.setAttribute("orderList", DDBUtil.getAllOrders());
                    session.setAttribute("deliveryList", DDBUtil.getAllPrescriptionDeliveries());

                    System.out.println("[Delivery Agent Login] Username: " + username);
                    response.sendRedirect("DAgentaccount.jsp");
                } else {
                    redirectToError(request, response, "Invalid delivery agent credentials.");
                }
                break;

            default:
                redirectToError(request, response, "Unknown role selected.");
                break;
        }
    }

    private void redirectToError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
    	request.setAttribute("errorMessage", "Invalid credentials ! please try again ");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
    	dispatcher.forward(request, response);

    }
}

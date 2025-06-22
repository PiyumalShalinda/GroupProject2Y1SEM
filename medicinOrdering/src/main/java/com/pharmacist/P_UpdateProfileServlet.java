package com.pharmacist;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/P_UpdateProfileServlet")
public class P_UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        try {
            // ✅ FIX: Get ID from the form input, not from session
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            
            // Validate phone number format
            if (phone != null && !phone.isEmpty()) {
                try {
                    Long.parseLong(phone); // Try to parse as a number
                } catch (NumberFormatException e) {
                    throw new CustomNumberFormatException("Contact number must contain only digits");
                }
            }
            
            boolean isTrue = P_DButil.updateProfile(id, name, email, phone, password);
            if (isTrue) {
                List<pharmacist> pDetails = P_DButil.getPharmacistDetails(id);
                // ✅ Update session values
                session.setAttribute("pharmacistId", id); // also update this to be safe
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("password", password);
                session.setAttribute("pDetails", pDetails);
                request.setAttribute("success", "Profile updated successfully.");
                RequestDispatcher dis = request.getRequestDispatcher("P_account.jsp");
                dis.forward(request, response);
            } else {
                List<pharmacist> pDetails = P_DButil.getPharmacistDetails(id);
                request.setAttribute("pDetails", pDetails);
                request.setAttribute("error", "Profile update failed. Please try again.");
                RequestDispatcher dis = request.getRequestDispatcher("P_account.jsp");
                dis.forward(request, response);
            }
        } catch (CustomNumberFormatException e) {
            // Handle the custom exception for contact number format
            String id = request.getParameter("id");
            List<pharmacist> pDetails = P_DButil.getPharmacistDetails(id);
            request.setAttribute("pDetails", pDetails);
            request.setAttribute("error", e.getMessage());
            RequestDispatcher dis = request.getRequestDispatcher("P_account.jsp");
            dis.forward(request, response);
        }
    }
}
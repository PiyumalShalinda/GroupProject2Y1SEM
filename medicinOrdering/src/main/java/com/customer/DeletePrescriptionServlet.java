package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeletePrescription")
public class DeletePrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get prescription ID from the request
        int prescriptionId = Integer.parseInt(request.getParameter("prescriptionId"));
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");

        // Delete prescription from the database
        boolean isDeleted = cusDBUtile.deletePrescription(prescriptionId);

        if (isDeleted) {
            // After deletion, fetch updated prescriptions list
            List<Prescription> prescriptions = cusDBUtile.getPrescriptionsByUserId(userId);

            // Set the updated prescriptions to the session
            session.setAttribute("prescriptions", prescriptions);
            session.setAttribute("message", "Prescription successfully cancelled.");

            // Redirect back to userProfile.jsp with updated prescriptions
            response.sendRedirect("userProfile.jsp");
        } else {
            // If deletion fails, set an error message
            session.setAttribute("message", "Failed to cancel the prescription. Please try again.");
            response.sendRedirect("userProfile.jsp");
        }
    }
}
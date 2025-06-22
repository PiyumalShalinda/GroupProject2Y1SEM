package com.pharmacist;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_UpdateMedicineServlet")
public class P_UpdateMedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Check pharmacist login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Get form data
        int medID = Integer.parseInt(request.getParameter("medID"));
        String medName = request.getParameter("medName");
        String medDesc = request.getParameter("medDesc");
        String medBenefits = request.getParameter("medBenefits");
        String medIng = request.getParameter("medIng");
        int medQty = Integer.parseInt(request.getParameter("medQty"));
        double medPrice = Double.parseDouble(request.getParameter("medPrice"));
        String medImage = request.getParameter("medImage");

        // Call DBUtil method
        boolean updated = P_DButil.updateMedicine(medID, medName, medDesc, medBenefits, medIng, medQty, medPrice, medImage);

        if (updated) {
            request.setAttribute("success", "Product updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update product.");
        }

        // Reload medicine list
        List<medicine> medList = P_DButil.getAllMedicines();
        request.setAttribute("medList", medList);

        // Forward to display page
        RequestDispatcher rd = request.getRequestDispatcher("P_mediDisplay.jsp");
        rd.forward(request, response);
    }
}



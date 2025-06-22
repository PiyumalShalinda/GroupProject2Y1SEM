package com.pharmacist;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_DeleteMedicineServlet")
public class P_DeleteMedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            int medID = Integer.parseInt(request.getParameter("medID"));
            boolean deleted = P_DButil.deleteMedicine(medID);

            if (deleted) {
                request.setAttribute("success", "Product deleted successfully!");
            } else {
                request.setAttribute("error", "Failed to delete product.");
            }

            request.setAttribute("medList", P_DButil.getAllMedicines());
            RequestDispatcher rd = request.getRequestDispatcher("P_mediDisplay.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp");
        }
    }
}



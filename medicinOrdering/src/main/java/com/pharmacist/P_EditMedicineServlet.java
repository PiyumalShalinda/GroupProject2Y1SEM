package com.pharmacist;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_EditMedicineServlet")
public class P_EditMedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            int medID = Integer.parseInt(request.getParameter("medID"));
            medicine med = P_DButil.getMedicineById(medID);

            request.setAttribute("medicine", med);
            RequestDispatcher rd = request.getRequestDispatcher("P_EditMedicine.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp");
        }
    }
}

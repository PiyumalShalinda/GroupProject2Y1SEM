package com.pharmacist;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_inventoryServlet")
public class P_inventoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check session and login status
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        List<medicine> medList = P_DButil.getAllMedicines();
        request.setAttribute("medList", medList);

        RequestDispatcher rd = request.getRequestDispatcher("P_inventory.jsp");
        rd.forward(request, response);
    }
}

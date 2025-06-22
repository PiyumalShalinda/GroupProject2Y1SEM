package com.pharmacist;

import java.io.*;

import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_mediDisplayServlet")
public class P_mediDisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
        // Check session login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pharmacistId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        
        //Get pharmacist ID (if you want to filter by who added the medicines)
        String pharmacistId = (String) session.getAttribute("pharmacistId");

        //Fetch all medicines
        List<medicine> medList = P_DButil.getAllMedicines();
        request.setAttribute("medList", medList);

        //Forward to JSP page
        RequestDispatcher rd = request.getRequestDispatcher("P_mediDisplay.jsp");
        rd.forward(request, response);
    }
}





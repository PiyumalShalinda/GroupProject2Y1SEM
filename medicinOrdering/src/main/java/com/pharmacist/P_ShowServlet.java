package com.pharmacist;

import java.io.IOException;


import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;



@WebServlet("/P_ShowServlet")
public class P_ShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	List<medicine> medList = P_DButil.getAllMedicines();  // fetch from pharmacist's DB util
        request.setAttribute("medList", medList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("show.jsp");
        dispatcher.forward(request, response);
    }
}

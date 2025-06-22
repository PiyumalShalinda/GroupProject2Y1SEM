package com.pharmacist;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/P_loginServlet")
public class P_loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String userid = request.getParameter("uid");
        String password = request.getParameter("pass");

        boolean isTrue = P_DButil.validate(userid, password);

        if (isTrue) {
            List<pharmacist> pDetails = P_DButil.getPharmacistDetails(userid);

            HttpSession session = request.getSession();
            pharmacist p = pDetails.get(0);

            session.setAttribute("pharmacistId", p.getId());
            session.setAttribute("name", p.getName());
            session.setAttribute("email", p.getEmail());
            session.setAttribute("phone", p.getPhone());
            session.setAttribute("password", p.getPassword());

            session.setAttribute("pDetails", pDetails); // ✅ FIXED: store in session, not request

            RequestDispatcher dis = request.getRequestDispatcher("P_account.jsp");
            dis.forward(request, response);
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Your username or password is incorrect');");
            out.println("location='Login.jsp';");
            out.println("</script>");
        }
    }
}



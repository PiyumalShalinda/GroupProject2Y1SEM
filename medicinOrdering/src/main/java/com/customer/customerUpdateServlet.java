package com.customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/customerUpdateServlet")
public class customerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
	    String password = request.getParameter("password");
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
	    
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    try {
	        // Validate phone number format
	        if (phone != null && !phone.isEmpty()) {
	            try {
	                Long.parseLong(phone); // Try to parse as a number
	            } catch (NumberFormatException e) {
	                throw new CustomNumberFormatException("Contact number must contain only digits");
	            }
	        }
	        
	        if (password == null || password.trim().isEmpty()) {
	            password = ""; // Leave blank to avoid updating
	        }
	        
	        boolean isUpdated = cusDBUtile.updateUserDetails(id, name, email, phone, password, address);
	        
	        if (isUpdated) {
	            session.setAttribute("name", name);
	            session.setAttribute("email", email);
	            session.setAttribute("phone", phone);
	            session.setAttribute("address", address);
	            out.println("<script type='text/javascript'>");
	            out.println("alert('Profile updated successfully.');");
	            out.println("window.location.href = 'userProfile.jsp';");
	            out.println("</script>");
	        } else {
	            out.println("<script type='text/javascript'>");
	            out.println("alert('Failed to update your information.');");
	            out.println("window.location.href = 'userProfile.jsp';");
	            out.println("</script>");
	        }
	    } catch (CustomNumberFormatException e) {
	        out.println("<script type='text/javascript'>");
	        out.println("alert('" + e.getMessage() + "');");
	        out.println("window.location.href = 'userProfile.jsp';");
	        out.println("</script>");
	    }
	}
}
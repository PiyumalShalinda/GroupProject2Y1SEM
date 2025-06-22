package com.customer;

import java.io.IOException;

import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pharmacist.medicine;
import com.pharmacist.P_DButil;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 String loggedInUsername = (String) request.getSession().getAttribute("username");

         if (loggedInUsername == null) {
             response.sendRedirect("Login.jsp"); 
             return;
         }

        int medID = Integer.parseInt(request.getParameter("medID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<medicine> allMedicines = P_DButil.getAllMedicines();
        medicine selectedMedicine = null;

        for (medicine m : allMedicines) {
            if (m.getMedID() == medID) {
                selectedMedicine = m;
                break;
            }
        }

        if (selectedMedicine != null) {
            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            Map<String, Object> item = new HashMap<>();
            item.put("medID", selectedMedicine.getMedID());
            item.put("medName", selectedMedicine.getMedName());
            item.put("quantity", quantity);
            item.put("price", selectedMedicine.getMedPrice());
            item.put("image", selectedMedicine.getMedImage());

            cart.add(item);
            session.setAttribute("cart", cart);
            session.setAttribute("message", "✅ Item added to cart successfully!");
        }

        response.sendRedirect("P_ShowServlet");
    }
}

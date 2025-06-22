package com.pharmacist;


import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/P_DisplayServlet")
@MultipartConfig
public class P_DisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	String pharmacistId = (session != null) ? (String) session.getAttribute("pharmacistId") : null;

    	if (pharmacistId == null) {
    	    response.sendRedirect("Login.jsp"); 
    	    return;
    	}



        // Get product details from the form
        String medName = request.getParameter("medName");
        String medDesc = request.getParameter("medDesc");
        String medBenefits = request.getParameter("medBenefits");
        String medIng = request.getParameter("medIng");
        int medQty = Integer.parseInt(request.getParameter("medQty"));
        double medPrice = Double.parseDouble(request.getParameter("medPrice"));
        Part file = request.getPart("image");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("/images/") + "/" + imageFileName;

        // Check if product already exists
        if (P_DButil.isMedicineNameExists(medName)) {
            request.setAttribute("error", "This product already exists in the inventory.");
            RequestDispatcher rd = request.getRequestDispatcher("P_account.jsp");
            rd.forward(request, response);
            return;
        }

        // Save image to folder
        try (FileOutputStream fos = new FileOutputStream(uploadPath);
             InputStream is = file.getInputStream()) {
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
        }

        // Insert medicine via DButil
        boolean inserted = P_DButil.addMedicine(medName, medDesc, medBenefits, medIng, medQty, medPrice, imageFileName, pharmacistId);

        if (inserted) {
            request.setAttribute("success", "Successfully added product!");
        } else {
            request.setAttribute("error", "Failed to add product.");
        }

        // Refresh product list
        List<medicine> medList = P_DButil.getAllMedicines();
        request.setAttribute("medList", medList);

        RequestDispatcher rd = request.getRequestDispatcher("P_mediDisplay.jsp");
        rd.forward(request, response);
    }
}






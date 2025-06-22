package com.customer;

import java.io.File;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UploadPrescription")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class UploadPrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String userId = (String) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String paymentMethod = request.getParameter("paymentMethod");
        String address = request.getParameter("address");

        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part filePart = request.getPart("prescriptionFile");
        String fileName = filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;
        String imagePath = "images/" + fileName;

        // ✅ Check if same prescription already exists for this user
        boolean alreadyExists = cusDBUtile.prescriptionExists(userId, imagePath);

        if (!alreadyExists) {
            filePart.write(filePath); // Save file only if new

            boolean isUploaded = cusDBUtile.insertPrescription(
                userId, name, email, phone, fileName,
                imagePath, paymentMethod, address
            );

            if (!isUploaded) {
                response.sendRedirect("uploadPrescription.jsp");
                return;
            }
        }

        List<Prescription> prescriptions = cusDBUtile.getPrescriptionsByUserId(userId);
        session.setAttribute("prescriptions", prescriptions);
        request.setAttribute("prescriptions", prescriptions);
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}




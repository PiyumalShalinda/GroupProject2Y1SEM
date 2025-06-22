<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.pharmacist.medicine" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Inventory Overview - Medico 360</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Tailwind Config -->
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#0A2540',
            secondary: '#38BDF8',
            accent: '#38BDF8',
            background: '#f0f9ff',
            text: '#1F2937'
          }
        }
      }
    }
  </script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-background text-text min-h-screen">

  <section class="max-w-7xl mx-auto px-6 py-10">

    <h1 class="text-3xl font-bold text-primary mb-8 flex items-center gap-3">
      <i class="fas fa-boxes text-secondary"></i> Inventory Overview
    </h1>

    <div class="overflow-x-auto">
      <table class="min-w-full bg-white rounded-lg shadow-lg border border-gray-300">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left font-semibold">Product ID</th>
            <th class="py-3 px-6 text-left font-semibold">Product Name</th>
            <th class="py-3 px-6 text-right font-semibold">Quantity Available</th>
            <th class="py-3 px-6 text-right font-semibold">Unit Price (Rs.)</th>
            <th class="py-3 px-6 text-right font-semibold">Total Stock Value (Rs.)</th>
          </tr>
        </thead>
        <tbody>
          <%
            List<medicine> medList = (List<medicine>) request.getAttribute("medList");
            if (medList != null && !medList.isEmpty()) {
                for (medicine m : medList) {
                    int qty = m.getMedQty();
                    double unitPrice = m.getMedPrice();
                    double totalValue = qty * unitPrice;
          %>
          <tr class="border-b border-gray-200 hover:bg-gray-50">
            <td class="py-3 px-6"><%= m.getMedID() %></td>
            <td class="py-3 px-6"><%= m.getMedName() %></td>
            <td class="py-3 px-6 text-right"><%= qty %></td>
            <td class="py-3 px-6 text-right"><%= String.format("%.2f", unitPrice) %></td>
            <td class="py-3 px-6 text-right font-semibold"><%= String.format("%.2f", totalValue) %></td>
          </tr>
          <%
                }
            } else {
          %>
          <tr>
            <td colspan="5" class="text-center py-6 text-gray-500 italic">No inventory items available.</td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>

    <!-- Back to Account Button -->
    <div class="mt-8 text-center">
      <button onclick="window.location.href='P_account.jsp'"
              class="bg-secondary hover:bg-blue-700 text-white px-6 py-3 rounded shadow font-semibold transition duration-300">
        <i class="fas fa-arrow-left mr-2"></i> Back to Account
      </button>
    </div>

  </section>

</body>
</html>

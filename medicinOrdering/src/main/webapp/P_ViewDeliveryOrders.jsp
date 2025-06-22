<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, javax.servlet.http.HttpSession" %>

<%

    List<Map<String, String>> deliveryOrders = (List<Map<String, String>>) session.getAttribute("deliveryOrders");
    List<Map<String, String>> prescriptionDeliveries = (List<Map<String, String>>) session.getAttribute("prescriptionDeliveries");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Orders for Delivery - Medico 360</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Tailwind Custom Theme -->
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#0A2540',
            secondary: '#38BDF8',
            accent: '#38BDF8',
            background: '#f0f9ff',
            text: '#1F2937',
          }
        }
      }
    }
  </script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-[#e0f7fa] text-black min-h-screen relative">

  <section class="max-w-7xl mx-auto p-6">

    <h1 class="text-3xl font-extrabold text-primary mb-8 flex items-center gap-3">
      <i class="fas fa-truck-fast text-secondary"></i> Delivery Orders
    </h1>

    <% if (deliveryOrders != null && !deliveryOrders.isEmpty()) { %>
    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-300">
      <table class="min-w-full bg-white rounded-lg">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left font-semibold">Order ID</th>
            <th class="py-3 px-6 text-left font-semibold">User ID</th>
            <th class="py-3 px-6 text-left font-semibold">Name</th>
            <th class="py-3 px-6 text-left font-semibold">Email</th>
            <th class="py-3 px-6 text-left font-semibold">Address</th>
            <th class="py-3 px-6 text-left font-semibold">Phone</th>
            <th class="py-3 px-6 text-right font-semibold">Amount</th>
            <th class="py-3 px-6 text-left font-semibold">Status</th>
            <th class="py-3 px-6 text-left font-semibold">Payment</th>
          </tr>
        </thead>
        <tbody>
          <% for (Map<String, String> order : deliveryOrders) { %>
          <tr class="border-b border-gray-200 hover:bg-gray-50">
            <td class="py-3 px-6"><%= order.get("orderid") %></td>
            <td class="py-3 px-6"><%= order.get("userid") %></td>
            <td class="py-3 px-6"><%= order.get("name") %></td>
            <td class="py-3 px-6"><%= order.get("email") %></td>
            <td class="py-3 px-6"><%= order.get("address") %></td>
            <td class="py-3 px-6"><%= order.get("phone") %></td>
            <td class="py-3 px-6 text-right font-semibold">Rs. <%= order.get("amount") %></td>
            <td class="py-3 px-6"><%= order.get("deliverStatus") %></td>
            <td class="py-3 px-6"><%= order.get("paymentmethod") %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
    <% } else { %>
      <p class="text-center text-gray-500 italic mt-6">No order records found.</p>
    <% } %>

    <hr class="my-12 border-gray-300" />

    <h2 class="text-3xl font-extrabold text-primary mb-8 flex items-center gap-3">
      <i class="fas fa-pills text-secondary"></i> Prescription Deliveries
    </h2>

    <% if (prescriptionDeliveries != null && !prescriptionDeliveries.isEmpty()) { %>
    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-300">
      <table class="min-w-full bg-white rounded-lg">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left font-semibold">Delivery ID</th>
            <th class="py-3 px-6 text-left font-semibold">Customer ID</th>
            <th class="py-3 px-6 text-left font-semibold">Name</th>
            <th class="py-3 px-6 text-left font-semibold">Email</th>
            <th class="py-3 px-6 text-left font-semibold">Phone</th>
            <th class="py-3 px-6 text-left font-semibold">Address</th>
            <th class="py-3 px-6 text-left font-semibold">Prescription ID</th>
            <th class="py-3 px-6 text-right font-semibold">Amount</th>
            <th class="py-3 px-6 text-left font-semibold">Payment Method</th>
            <th class="py-3 px-6 text-left font-semibold">Status</th>
          </tr>
        </thead>
        <tbody>
          <% for (Map<String, String> pd : prescriptionDeliveries) { %>
          <tr class="border-b border-gray-200 hover:bg-gray-50">
            <td class="py-3 px-6"><%= pd.get("pDeliveryID") %></td>
            <td class="py-3 px-6"><%= pd.get("cusID") %></td>
            <td class="py-3 px-6"><%= pd.get("cusname") %></td>
            <td class="py-3 px-6"><%= pd.get("email") %></td>
            <td class="py-3 px-6"><%= pd.get("phone") %></td>
            <td class="py-3 px-6"><%= pd.get("address") %></td>
            <td class="py-3 px-6"><%= pd.get("presID") %></td>
            <td class="py-3 px-6 text-right font-semibold">Rs. <%= pd.get("amount") %></td>
            <td class="py-3 px-6"><%= pd.get("paymentmethod") %></td>
            <td class="py-3 px-6"><%= pd.get("dstatus") %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
    <% } else { %>
      <p class="text-center text-gray-500 italic mt-6">No prescription delivery records found.</p>
    <% } %>

    <div class="mt-10 text-center">
      <form action="P_ViewOrdersServlet" method="post">
        <button type="submit" class="bg-secondary hover:bg-blue-700 text-white px-6 py-3 rounded shadow font-semibold transition duration-300">
          <i class="fas fa-arrow-left mr-2"></i> Back to Orders
        </button>
      </form>
    </div>

  </section>

</body>
</html>

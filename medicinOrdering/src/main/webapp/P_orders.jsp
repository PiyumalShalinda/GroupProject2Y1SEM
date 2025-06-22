<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%

    List<Map<String, String>> allOrders = (List<Map<String, String>>) session.getAttribute("allOrders");
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Order Summary - Medico 360</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
</head>
<body class="bg-background text-text min-h-screen p-6">

  <div class="max-w-7xl mx-auto bg-white rounded-lg shadow-lg p-6">
    <h1 class="text-4xl font-extrabold text-primary mb-6 flex items-center gap-3">
      <i class="fas fa-box-open"></i> Order Summary
    </h1>

    <div class="flex gap-8 mb-6">
      <div class="bg-secondary text-white px-6 py-4 rounded shadow-md flex items-center gap-3">
        <i class="fas fa-hourglass-half text-xl"></i>
        <span class="text-lg font-semibold">Pending Orders: <%= session.getAttribute("pendingCount") %></span>
      </div>
      <div class="bg-accent text-white px-6 py-4 rounded shadow-md flex items-center gap-3">
        <i class="fas fa-check-circle text-xl"></i>
        <span class="text-lg font-semibold">Accepted Orders: <%= session.getAttribute("acceptedCount") %></span>
      </div>
    </div>

    <form action="P_ViewDeliveryOrdersServlet" method="post" class="mb-6">
      <button type="submit" 
              class="bg-primary hover:bg-primary-dark text-white px-5 py-2 rounded shadow font-semibold flex items-center gap-2 transition duration-300">
        <i class="fas fa-truck"></i> View Delivery Orders
      </button>
    </form>

    <hr class="mb-6 border-gray-300" />

    <h2 class="text-2xl font-bold mb-4 text-primary">All Orders</h2>

    <div class="overflow-x-auto">
      <table class="min-w-full table-auto border-collapse border border-gray-300 rounded-lg shadow-sm">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-4 text-left">Order ID</th>
            <th class="py-3 px-4 text-left">User ID</th>
            <th class="py-3 px-4 text-left">Name</th>
            <th class="py-3 px-4 text-left">Status</th>
            <th class="py-3 px-4 text-left">Prescription</th>
            <th class="py-3 px-4 text-left">Amount</th>
            <th class="py-3 px-4 text-left">Reject</th>
          </tr>
        </thead>
        <tbody>
        <%
          if (allOrders != null) {
              for (Map<String, String> order : allOrders) {
                  String status = order.get("status");
        %>
          <tr class="border-b border-gray-200 hover:bg-gray-50">
            <td class="py-3 px-4"><%= order.get("id") %></td>
            <td class="py-3 px-4"><%= order.get("userid") %></td>
            <td class="py-3 px-4"><%= order.get("name") %></td>
            <td class="py-3 px-4 font-semibold <%= "Accepted".equalsIgnoreCase(status) ? "text-green-600" : ("Pending".equalsIgnoreCase(status) ? "text-yellow-600" : "text-red-600") %>">
              <%= status %>
            </td>
            <td class="py-3 px-4">
              <a href="<%= order.get("filepath") %>" target="_blank" 
                 class="text-secondary hover:text-green-600 flex items-center gap-2 font-medium">
                <i class="fas fa-file-prescription"></i> View Prescription
              </a>
            </td>

            <td class="py-3 px-4">
              <% if ("Pending".equalsIgnoreCase(status)) { %>
                <form action="P_AcceptOrderServlet" method="post" class="flex items-center gap-2">
                  <input type="number" name="amount" step="0.01" required placeholder="Rs" 
                         class="w-20 p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
                  <input type="hidden" name="orderId" value="<%= order.get("id") %>" />
                  <button type="submit" 
                          class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded transition duration-300">
                    Accept
                  </button>
                </form>
              <% } else if ("Accepted".equalsIgnoreCase(status)) { %>
                Rs. <%= order.get("amount") != null ? order.get("amount") : "0.00" %>
              <% } else { %>
                -
              <% } %>
            </td>

            <td class="py-3 px-4">
              <% if ("Pending".equalsIgnoreCase(status)) { %>
                <form action="P_RejectOrderServlet" method="post">
                  <input type="hidden" name="orderId" value="<%= order.get("id") %>" />
                  <button type="submit" 
                          onclick="return confirm('Are you sure you want to reject this order?')" 
                          class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded transition duration-300">
                    <i class="fas fa-times"></i> Reject
                  </button>
                </form>
              <% } else { %>
                <span class="text-gray-400">-</span>
              <% } %>
            </td>
          </tr>
        <%
              }
          } else {
        %>
          <tr>
            <td colspan="7" class="text-center py-6 text-gray-500 italic">No orders available.</td>
          </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>

    <div class="mt-8">
      <button onclick="window.location.href='P_account.jsp'"
              class="bg-secondary hover:bg-blue-700 text-white px-6 py-2 rounded shadow font-semibold transition duration-300">
        <i class="fas fa-arrow-left mr-2"></i> Back to Account
      </button>
    </div>
  </div>

</body>
</html>


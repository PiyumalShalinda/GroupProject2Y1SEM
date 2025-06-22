<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.ACustomer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    List<ACustomer> customerList = (List<ACustomer>) request.getAttribute("customerList");
    if (customerList == null) {
        response.sendRedirect("ACustomerListServlet");
        return;
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Dashboard - Medico 360</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome CDN -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />

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

<body class="bg-background text-text min-h-screen font-sans">

  <!-- Navbar -->
  <nav class="bg-white shadow-md sticky top-0 z-50">
    <div
      class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-center text-primary font-bold text-xl"
    >
      <!-- Navbar empty as per your request -->
    </div>
  </nav>

  <div class="max-w-7xl mx-auto p-6">

    <!-- Header -->
    <div class="mb-8 flex justify-center">
      <h1 class="text-4xl font-extrabold text-primary flex items-center gap-3 whitespace-nowrap">
        <i class="fas fa-users text-secondary"></i> Customer Management Dashboard
      </h1>
    </div>

    <!-- Customer Table -->
    <div class="overflow-x-auto bg-white rounded-lg shadow-lg">
      <table class="min-w-full border-collapse border border-gray-300">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left font-semibold">Customer ID</th>
            <th class="py-3 px-6 text-left font-semibold">Name</th>
            <th class="py-3 px-6 text-left font-semibold">Email</th>
            <th class="py-3 px-6 text-left font-semibold">Phone</th>
            <th class="py-3 px-6 text-left font-semibold">Username</th>
            <th class="py-3 px-6 text-left font-semibold">Address</th>
            <th class="py-3 px-6 text-center font-semibold">Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="customer" items="${customerList}">
            <tr class="border-b border-gray-200 hover:bg-gray-50">
              <td class="py-3 px-6">${customer.id}</td>
              <td class="py-3 px-6">${customer.name}</td>
              <td class="py-3 px-6">${customer.email}</td>
              <td class="py-3 px-6">${customer.phone}</td>
              <td class="py-3 px-6">${customer.username}</td>
              <td class="py-3 px-6">${customer.address}</td>
              <td class="py-3 px-6 text-center space-x-2">

                <!-- Edit Button triggers modal -->
                <button 
                  class="inline-block bg-secondary hover:bg-blue-700 text-white px-3 py-1 rounded shadow transition font-semibold"
                  title="Edit Customer"
                  onclick='openEditModal("${customer.id}", "${customer.name}", "${customer.email}", "${customer.phone}", "${customer.username}", "${customer.address}")'>
                  <i class="fas fa-edit"></i>
                </button>

                <a
                  href="ACustomerDeleteServlet?id=${customer.id}"
                  onclick="return confirm('Are you sure you want to delete this customer?')"
                  class="inline-block bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded shadow transition font-semibold"
                  title="Delete Customer"
                >
                  <i class="fas fa-trash"></i>
                </a>

              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- Back to Account button aligned center and lower -->
    <div class="mt-12 flex justify-center">
      <form action="adminDashboard.jsp" method="get" class="w-full max-w-xs">
        <button
          type="submit"
          class="w-full bg-secondary hover:bg-blue-700 text-white px-6 py-3 rounded shadow font-semibold transition duration-300 flex items-center justify-center gap-2"
        >
          <i class="fas fa-arrow-left"></i> Back to Account
        </button>
      </form>
    </div>

  </div>

  <!-- Edit Customer Modal -->
  <div id="editModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6 relative">

      <!-- Close Button -->
      <button id="closeEditModalBtn" class="absolute top-3 right-3 text-gray-600 hover:text-gray-900 text-3xl font-bold">&times;</button>

      <h2 class="text-2xl font-bold text-primary mb-6 text-center flex items-center gap-3">
        <i class="fas fa-user-edit text-secondary"></i> Edit Customer
      </h2>

      <form action="ACustomerUpdateServlet" method="post" class="space-y-4">
        <input type="hidden" id="editId" name="id" />

        <div>
          <label for="editName" class="block mb-1 font-semibold">Name</label>
          <input type="text" id="editName" name="name" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>

        <div>
          <label for="editEmail" class="block mb-1 font-semibold">Email</label>
          <input type="email" id="editEmail" name="email" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>

        <div>
          <label for="editPhone" class="block mb-1 font-semibold">Phone</label>
          <input type="text" id="editPhone" name="phone" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>

        <div>
          <label for="editUsername" class="block mb-1 font-semibold">Username</label>
          <input type="text" id="editUsername" name="username" readonly
                 class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed" />
        </div>

        <div>
          <label for="editAddress" class="block mb-1 font-semibold">Address</label>
          <input type="text" id="editAddress" name="address" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>

        <button type="submit" class="w-full bg-accent hover:bg-green-600 text-white p-3 rounded font-semibold transition duration-300">
          Update Customer
        </button>
      </form>

    </div>
  </div>

  <script>
    // Open modal & populate fields
    function openEditModal(id, name, email, phone, username, address) {
      document.getElementById('editId').value = id;
      document.getElementById('editName').value = name;
      document.getElementById('editEmail').value = email;
      document.getElementById('editPhone').value = phone;
      document.getElementById('editUsername').value = username;
      document.getElementById('editAddress').value = address;

      const modal = document.getElementById('editModal');
      modal.classList.remove('hidden');
      modal.classList.add('flex');
    }

    // Close modal
    document.getElementById('closeEditModalBtn').addEventListener('click', function() {
      const modal = document.getElementById('editModal');
      modal.classList.add('hidden');
      modal.classList.remove('flex');
    });

    // Close modal if clicked outside content
    document.getElementById('editModal').addEventListener('click', function(e) {
      if (e.target === this) {
        this.classList.add('hidden');
        this.classList.remove('flex');
      }
    });
  </script>

</body>
</html>

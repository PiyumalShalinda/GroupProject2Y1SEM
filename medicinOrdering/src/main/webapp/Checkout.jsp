<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Checkout - Medico 360</title>

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
            background: '#F3F4F6',
            text: '#1F2937'
          }
        }
      }
    }
  </script>
</head>
<body class="bg-background text-text min-h-screen flex flex-col">

  <header class="bg-white shadow-md sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">
      <div class="text-2xl font-extrabold text-primary flex items-center space-x-2">
        <i class="fas fa-heart-pulse text-secondary"></i>
        <span>Medico 360</span>
      </div>
      <nav class="hidden md:flex space-x-6 text-base font-medium">
        <a href="home.jsp" class="text-text hover:text-secondary transition">Home</a>
        <a href="#shop" class="text-text hover:text-secondary transition">Shop</a>
        <a href="#about" class="text-text hover:text-secondary transition">About</a>
        <a href="#contact" class="text-text hover:text-secondary transition">Contact</a>
        <a href="Login.jsp" class="text-text hover:text-secondary transition flex items-center gap-1">
          <i class="fas fa-user"></i> Login / Register
        </a>
      </nav>
    </div>
  </header>

  <main class="flex-grow max-w-4xl mx-auto p-6">

    <h2 class="text-3xl font-bold text-primary mb-6 flex items-center gap-3">
      <i class="fas fa-shopping-cart"></i> Checkout
    </h2>

    <!-- Order Confirmation / Error Message -->
    <c:if test="${not empty sessionScope.orderMessage}">
      <div
        class="mb-6 p-4 rounded-md text-lg font-semibold"
        style="color: ${sessionScope.orderMessage.contains('successfully') ? '#15803d' : '#dc2626'}; background-color: ${sessionScope.orderMessage.contains('successfully') ? '#d1fae5' : '#fee2e2'}"
      >
        ${sessionScope.orderMessage}
      </div>
      <c:remove var="orderMessage" scope="session" />
    </c:if>

    <!-- User not logged in -->
    <c:if test="${empty sessionScope.username}">
      <div class="bg-yellow-100 border-l-4 border-yellow-400 text-yellow-700 p-4 rounded-md">
        <p class="mb-2">⚠️ You must be logged in to proceed with checkout.</p>
        <a href="login.jsp" class="text-accent hover:text-green-600 font-semibold underline">Go to Login</a>
      </div>
    </c:if>

    <!-- User logged in -->
    <c:if test="${not empty sessionScope.username}">

      <!-- User Details -->
      <section class="bg-white rounded-lg shadow p-6 mb-8">
        <h3 class="text-xl font-semibold mb-4 text-primary flex items-center gap-2">
          <i class="fas fa-user-circle"></i> Your Details
        </h3>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-text">
          <p><strong>User ID:</strong> ${sessionScope.id}</p>
          <p><strong>Name:</strong> ${sessionScope.name}</p>
          <p><strong>Email:</strong> ${sessionScope.email}</p>
          <p><strong>Phone:</strong> ${sessionScope.phone}</p>
          <p class="sm:col-span-2"><strong>Address:</strong> ${sessionScope.address}</p>
        </div>
      </section>

      <!-- Cart Summary -->
      <c:set var="cart" value="${sessionScope.cart}" />
      <c:if test="${not empty cart}">
        <section class="bg-white rounded-lg shadow p-6 mb-8">
          <h3 class="text-xl font-semibold mb-4 text-primary flex items-center gap-2">
            <i class="fas fa-boxes"></i> Cart Summary
          </h3>
          <table class="min-w-full border border-gray-300 rounded-md overflow-hidden">
            <thead class="bg-primary text-white">
              <tr>
                <th class="py-3 px-4 text-left">Product</th>
                <th class="py-3 px-4 text-center">Quantity</th>
                <th class="py-3 px-4 text-right">Price (LKR)</th>
              </tr>
            </thead>
            <tbody>
              <c:set var="totalAmount" value="0" />
              <c:forEach var="item" items="${cart}">
                <tr class="border-b border-gray-200 hover:bg-gray-50">
                  <td class="py-2 px-4">${item.medName}</td>
                  <td class="py-2 px-4 text-center">${item.quantity}</td>
                  <td class="py-2 px-4 text-right">${item.price * item.quantity}</td>
                </tr>
                <c:set var="totalAmount" value="${totalAmount + (item.price * item.quantity)}" />
              </c:forEach>
            </tbody>
          </table>
          <p class="text-right mt-4 text-lg font-semibold text-secondary">Total Amount: Rs. ${totalAmount}</p>
        </section>

        <!-- Payment Method -->
        <section class="bg-white rounded-lg shadow p-6 mb-8">
          <h3 class="text-xl font-semibold mb-4 text-primary flex items-center gap-2">
            <i class="fas fa-credit-card"></i> Payment Method
          </h3>
          <div>
            <label for="paymentMethod" class="block mb-2 font-semibold">Select Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" disabled
              class="w-full max-w-xs p-2 border border-gray-300 rounded-md bg-gray-100 cursor-not-allowed text-text">
              <option value="cash" selected>Cash on Delivery</option>
            </select>
            <p class="mt-2 italic text-gray-600">Only Cash on Delivery (COD) is available.</p>
          </div>
        </section>

        <!-- Confirm Order Form -->
        <form action="ConfirmOrderServlet" method="post" class="text-right mb-12">
          <input type="hidden" name="totalAmount" value="${totalAmount}" />
          <input type="hidden" name="paymentMethod" value="cash" />
          <button type="submit"
            class="inline-flex items-center gap-2 bg-accent hover:bg-green-600 text-white font-semibold px-6 py-3 rounded shadow transition duration-300">
            <i class="fas fa-check-circle"></i> Confirm Order
          </button>
        </form>
      </c:if>

      <c:if test="${empty cart}">
        <p class="text-center text-lg text-gray-600 italic mt-12">Your cart is empty!</p>
      </c:if>
    </c:if>
  </main>

  <!-- Footer -->
  <footer class="bg-primary text-white py-8 px-6 mt-auto">
    <div class="max-w-6xl mx-auto text-center text-sm">
      &copy; 2025 Medico 360. All rights reserved.
    </div>
  </footer>

</body>
</html>

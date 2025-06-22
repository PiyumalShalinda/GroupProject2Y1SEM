<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>


<html>
<head>
    <title>My Cart</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome CDN -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
</head>
<body class="bg-[#e0f7fa] p-6 font-sans flex justify-center">

<div class="max-w-4xl w-full">

  <!-- Cart Title -->
  <h2 class="text-3xl font-bold mb-2 text-[#0A2540] flex items-center gap-2 justify-center">
    <i class="fas fa-shopping-cart text-[#38BDF8]"></i> Your Shopping Cart
  </h2>

  <!-- Back to Account Button -->


  <!-- If the cart is not empty -->
  <c:if test="${not empty cart}">
      <div class="overflow-x-auto bg-white rounded-lg shadow p-4">
        <table class="min-w-full border-collapse border border-[#0A2540] rounded-lg text-sm">
            <thead class="bg-[#0A2540] text-[#38BDF8]">
                <tr>
                    <th class="py-2 px-3 text-center">Image</th>
                    <th class="py-2 px-3 text-left">Product</th>
                    <th class="py-2 px-3 text-center">Qty</th>
                    <th class="py-2 px-3 text-right">Price (LKR)</th>
                    <th class="py-2 px-3 text-center">Action</th>
                </tr>
            </thead>
            <tbody>
    <c:forEach var="item" items="${cart}" varStatus="status">
      <tr class="border-b border-[#0A2540] hover:bg-white">
        <td class="py-2 px-3 text-center">
            <img src="images/${item.image}" alt="${item.medName}" class="h-16 w-16 object-cover rounded" />
        </td>
        <td class="py-2 px-3 text-[#0A2540]">${item.medName}</td>
        <td class="py-2 px-3 text-center">${item.quantity}</td>
        <td class="py-2 px-3 text-right">${item.price}</td>
        <td class="py-2 px-3 text-center">
            <form action="RemoveFromCartServlet" method="post" class="inline-block">
                <input type="hidden" name="index" value="${status.index}" />
                <button
                  type="submit"
                  class="bg-[#DC2626] hover:bg-[#B91C1C] text-white px-3 py-1 rounded flex items-center gap-2 transition duration-300"
                  title="Remove from cart"
                >
                  <i class="fas fa-trash-alt"></i> Remove
                </button>
            </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
        </table>
      </div>

      <!-- Buttons on same line -->
      <div class="mt-6 flex justify-between items-center gap-4">
        <a href="P_ShowServlet"
           class="bg-[#38BDF8] hover:bg-[#0ea5e9] text-white px-6 py-3 rounded shadow font-semibold flex items-center gap-2 transition duration-300"
           title="Continue Shopping"
        >
          <i class="fas fa-arrow-left"></i> Continue Shopping
        </a>
        
          <a href="userProfile.jsp"
          class="bg-gray-200 hover:bg-gray-300 text-[#0A2540] px-6 py-3 rounded shadow font-semibold flex items-center gap-2 transition duration-300"
          title="Back to Account">
          <i class="fas fa-user-circle"></i> Back to Account
          </a>

        <form action="ConfirmOrderServlet" method="post" class="inline">
            <input type="hidden" name="totalAmount" value="${totalAmount}" />
            <input type="hidden" name="paymentMethod" value="cash" />
            <button
              type="submit"
              class="bg-[#0A2540] hover:bg-[#071d2f] text-[#38BDF8] font-semibold px-6 py-3 rounded shadow flex items-center gap-2 transition duration-300"
              title="Checkout All"
            >
              <i class="fas fa-check-circle"></i> Checkout All
            </button>
        </form>
      </div>
  </c:if>

  <!-- If the cart is empty -->
  <c:if test="${empty cart}">
      <p class="text-center text-gray-600 italic text-lg mt-10">Your cart is empty.</p>
      <div class="text-center mt-6">
        <a href="P_ShowServlet"
           class="bg-[#38BDF8] hover:bg-[#0ea5e9] text-white px-6 py-3 rounded shadow font-semibold flex items-center gap-2 transition duration-300 inline-block"
           title="Continue Shopping"
        >
          <i class="fas fa-arrow-left"></i> Continue Shopping
        </a>
      </div>
  </c:if>

</div>
</body>
</html>

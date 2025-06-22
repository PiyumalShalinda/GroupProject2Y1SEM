<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Delivery Agent Account - Medico 360</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Tailwind config to add custom colors -->
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
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />
</head>
<body class="bg-[#e0f7fa] text-black min-h-screen relative">

  <!-- Agent Details -->
  <div class="max-w-4xl mx-auto bg-white rounded-lg shadow p-6 mb-10">
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-bold text-primary flex items-center gap-3">
        <i class="fas fa-user-shield text-secondary"></i> Delivery Agent Profile
      </h2>
      
      <form action="logout" method="post">
        <button type="submit"
                class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded font-semibold transition flex items-center gap-2">
          <i class="fas fa-sign-out-alt"></i> Logout
        </button>
      </form>
    </div>

    <table class="min-w-full border border-gray-300 rounded-lg">
      <tbody>
        <c:forEach var="D" items="${DDetails}">
          <c:set var="agentID" value="${D.agentID}" />
          <c:set var="username" value="${D.username}" />
          <c:set var="name" value="${D.name}" />
          <c:set var="email" value="${D.email}" />
          <c:set var="phone" value="${D.phone}" />
          <c:set var="password" value="${D.password}" />

          <tr class="border-b border-gray-200">
            <td class="px-4 py-2 font-semibold bg-gray-100 w-40">Agent ID</td>
            <td class="px-4 py-2">${D.agentID}</td>
          </tr>
          <tr class="border-b border-gray-200">
            <td class="px-4 py-2 font-semibold bg-gray-100">Username</td>
            <td class="px-4 py-2">${D.username}</td>
          </tr>
          <tr class="border-b border-gray-200">
            <td class="px-4 py-2 font-semibold bg-gray-100">Name</td>
            <td class="px-4 py-2">${D.name}</td>
          </tr>
          <tr class="border-b border-gray-200">
            <td class="px-4 py-2 font-semibold bg-gray-100">Email</td>
            <td class="px-4 py-2">${D.email}</td>
          </tr>
          <tr class="border-b border-gray-200">
            <td class="px-4 py-2 font-semibold bg-gray-100">Phone</td>
            <td class="px-4 py-2">${D.phone}</td>
          </tr>
          <tr>
            <td class="px-4 py-2 font-semibold bg-gray-100">Password</td>
            <td class="px-4 py-2">${D.password}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Buttons -->
    <div class="mt-6 flex space-x-4">
      <button
        id="openUpdateModalBtn"
        class="inline-flex items-center gap-2 bg-accent hover:bg-green-600 text-white px-5 py-2 rounded shadow font-semibold transition duration-300"
        title="Update My Data"
      >
        <i class="fas fa-pen"></i> Update My Data
      </button>

      <c:url value="Ddeleteagent.jsp" var="Ddelete">
        <c:param name="agentID" value="${agentID}" />
        <c:param name="username" value="${username}" />
        <c:param name="name" value="${name}" />
        <c:param name="email" value="${email}" />
        <c:param name="phone" value="${phone}" />
        <c:param name="password" value="${password}" />
      </c:url>
      <a
        href="${Ddelete}"
        onclick="return confirm('Are you sure you want to delete your account?')"
        class="inline-flex items-center gap-2 bg-red-600 hover:bg-red-700 text-white px-5 py-2 rounded shadow font-semibold transition duration-300"
        title="Delete My Account"
      >
        <i class="fas fa-trash"></i> Delete My Account
      </a>
    </div>
  </div>

  <!-- Order Details Section -->
  <div class="max-w-7xl mx-auto bg-white rounded-lg shadow p-6 mb-10">
    <h3 class="text-xl font-semibold text-primary mb-4 flex items-center gap-3">
      <i class="fas fa-boxes"></i> Order Details
    </h3>
    <div class="overflow-x-auto">
      <table class="min-w-full border-collapse border border-gray-300 rounded-lg">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left">Order ID</th>
            <th class="py-3 px-6 text-left">Customer Name</th>
            <th class="py-3 px-6 text-left">Customer Email</th>
            <th class="py-3 px-6 text-left">Customer Address</th>
            <th class="py-3 px-6 text-left">Customer Phone</th>
            <th class="py-3 px-6 text-left">Amount</th>
            <th class="py-3 px-6 text-left">Payment method</th>
            <th class="py-3 px-6 text-left">Status</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="o" items="${orderList}">
            <tr class="border-b border-gray-200 hover:bg-gray-50">
              <td class="py-3 px-6">${o.orderid}</td>
              <td class="py-3 px-6">${o.name}</td>
              <td class="py-3 px-6">${o.email}</td>
              <td class="py-3 px-6">${o.address}</td>
              <td class="py-3 px-6">${o.phone}</td>
              <td class="py-3 px-6">${o.amount}</td>
              <td class="py-3 px-6">${o.paymentmethod}</td>
              <td class="py-3 px-6">
                <c:choose>
                  <c:when test="${o.deliverStatus == 'pending'}">
                    <form action="DupdateOrderStatusServlet" method="post" class="inline-block mr-2">
                      <input type="hidden" name="orderid" value="${o.orderid}" />
                      <input type="hidden" name="status" value="accepted" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        Accept to Deliver
                      </button>
                    </form>
                  </c:when>
                  <c:when test="${o.deliverStatus == 'accepted'}">
                    <form action="DupdateOrderStatusServlet" method="post" class="inline-block mr-2">
                      <input type="hidden" name="orderid" value="${o.orderid}" />
                      <input type="hidden" name="status" value="in delivery" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        In Delivery
                      </button>
                    </form>
                  </c:when>
                  <c:when test="${o.deliverStatus == 'in delivery'}">
                    <form action="DupdateOrderStatusServlet" method="post" class="inline-block mr-2">
                      <input type="hidden" name="orderid" value="${o.orderid}" />
                      <input type="hidden" name="status" value="delivered" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        Delivered
                      </button>
                    </form>

                    <form action="DupdateOrderStatusServlet" method="post" class="inline-block">
                      <input type="hidden" name="orderid" value="${o.orderid}" />
                      <input type="hidden" name="status" value="failed" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        Fail to Deliver
                      </button>
                    </form>
                  </c:when>

                  <c:when test="${o.deliverStatus == 'delivered'}">
                    Delivered
                  </c:when>

                  <c:when test="${o.deliverStatus == 'failed'}">
                    Failed to Deliver
                  </c:when>

                  <c:otherwise>
                    ${o.deliverStatus}
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Prescription Deliveries -->
  <div class="max-w-7xl mx-auto bg-white rounded-lg shadow p-6">
    <h3 class="text-xl font-semibold text-primary mb-4 flex items-center gap-3">
      <i class="fas fa-file-prescription"></i> Prescription Deliveries
    </h3>
    <div class="overflow-x-auto">
      <table class="min-w-full border-collapse border border-gray-300 rounded-lg">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left">Delivery ID</th>
            <th class="py-3 px-6 text-left">Customer ID</th>
            <th class="py-3 px-6 text-left">Customer Name</th>
            <th class="py-3 px-6 text-left">Email</th>
            <th class="py-3 px-6 text-left">Phone</th>
            <th class="py-3 px-6 text-left">Address</th>
            <th class="py-3 px-6 text-left">Prescription ID</th>
            <th class="py-3 px-6 text-left">Amount</th>
            <th class="py-3 px-6 text-left">Payment Method</th>
            <th class="py-3 px-6 text-left">Status</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="pd" items="${deliveryList}">
            <tr class="border-b border-gray-200 hover:bg-gray-50">
              <td class="py-3 px-6">${pd.pDeliveryID}</td>
              <td class="py-3 px-6">${pd.cusID}</td>
              <td class="py-3 px-6">${pd.cusname}</td>
              <td class="py-3 px-6">${pd.email}</td>
              <td class="py-3 px-6">${pd.phone}</td>
              <td class="py-3 px-6">${pd.address}</td>
              <td class="py-3 px-6">${pd.presID}</td>
              <td class="py-3 px-6">${pd.amount}</td>
              <td class="py-3 px-6">${pd.paymentmethod}</td>
              <td class="py-3 px-6">
                <c:choose>
                  <c:when test="${pd.dstatus == 'pending'}">
                    <form action="DUpdatePrescriptionDeliveryServlet" method="post" class="inline-block mr-2">
                      <input type="hidden" name="deliveryId" value="${pd.pDeliveryID}" />
                      <input type="hidden" name="status" value="accepted" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        Accept
                      </button>
                    </form>
                  </c:when>
                  <c:when test="${pd.dstatus == 'accepted'}">
                    <form action="DUpdatePrescriptionDeliveryServlet" method="post" class="inline-block mr-2">
                      <input type="hidden" name="deliveryId" value="${pd.pDeliveryID}" />
                      <input type="hidden" name="status" value="in delivery" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        In Delivery
                      </button>
                    </form>
                  </c:when>
                  <c:when test="${pd.dstatus == 'in delivery'}">
                    <form action="DUpdatePrescriptionDeliveryServlet" method="post" class="inline-block mr-2">
                      <input type="hidden" name="deliveryId" value="${pd.pDeliveryID}" />
                      <input type="hidden" name="status" value="delivered" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        Delivered
                      </button>
                    </form>

                    <form action="DUpdatePrescriptionDeliveryServlet" method="post" class="inline-block">
                      <input type="hidden" name="deliveryId" value="${pd.pDeliveryID}" />
                      <input type="hidden" name="status" value="failed" />
                      <input type="hidden" name="agentID" value="${agentID}" />
                      <button
                        type="submit"
                        class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded shadow font-semibold transition"
                      >
                        Fail
                      </button>
                    </form>
                  </c:when>
                  <c:when test="${pd.dstatus == 'delivered'}">
                    Delivered
                  </c:when>
                  <c:when test="${pd.dstatus == 'failed'}">
                    Failed
                  </c:when>
                  <c:otherwise>
                    ${pd.dstatus}
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

  <!-- Update Modal -->
  <div id="updateModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6 relative">
      <button id="closeUpdateModalBtn" class="absolute top-3 right-3 text-gray-500 hover:text-gray-900" title="Close">
        <i class="fas fa-times text-2xl"></i>
      </button>
      <h3 class="text-xl font-bold text-primary mb-4 flex items-center gap-2">
        <i class="fas fa-pen"></i> Update Agent Information
      </h3>
      <form action="DupdateagentServlet" method="post" class="space-y-4">
        <div>
          <label for="agentID" class="block font-semibold mb-1">Agent ID</label>
          <input type="text" name="agentID" id="agentID" value="${agentID}" readonly
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="username" class="block font-semibold mb-1">User Name</label>
          <input type="text" name="username" id="username" value="${username}" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="name" class="block font-semibold mb-1">Name</label>
          <input type="text" name="name" id="name" value="${name}" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="email" class="block font-semibold mb-1">Email</label>
          <input type="email" name="email" id="email" value="${email}" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="phone" class="block font-semibold mb-1">Contact Number</label>
          <input type="text" name="phone" id="phone" value="${phone}" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="password" class="block font-semibold mb-1">Password</label>
          <input type="password" name="password" id="password" value="${password}" required
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <button type="submit" class="w-full bg-accent hover:bg-green-600 text-white p-3 rounded font-semibold transition duration-300">
          Update my Data
        </button>
      </form>
    </div>
  </div>

  <script>
    // Modal open/close handlers
    const openBtn = document.getElementById('openUpdateModalBtn');
    const closeBtn = document.getElementById('closeUpdateModalBtn');
    const modal = document.getElementById('updateModal');

    openBtn.addEventListener('click', () => {
      modal.classList.remove('hidden');
      modal.classList.add('flex');
    });

    closeBtn.addEventListener('click', () => {
      modal.classList.add('hidden');
      modal.classList.remove('flex');
    });

    modal.addEventListener('click', (e) => {
      if (e.target === modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
      }
    });
  </script>
  
  <c:if test="${not empty error}">
  <script>
    alert('${error}');
  </script>
</c:if>
  

</body>
</html>

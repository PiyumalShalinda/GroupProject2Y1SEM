<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String pharmacistId = (String) session.getAttribute("pharmacistId");
    if (pharmacistId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String password = (String) session.getAttribute("password");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pharmacist Profile - Medico 360</title>

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
<body class="bg-[#e0f7fa] text-black min-h-screen relative">

<c:if test="${not empty error}">
  <script>
    alert('${error}');
  </script>
</c:if>

<section class="max-w-7xl mx-auto px-6 py-10 grid grid-cols-1 md:grid-cols-3 gap-10">

  <!-- Left Column: Profile Details -->
  <div class="bg-white rounded-lg shadow px-6 py-4 flex flex-col justify-start h-fit space-y-4">
    <!-- Profile Header -->
    <div class="flex items-center space-x-4">
      <div class="w-12 h-12 bg-secondary text-white rounded-full flex items-center justify-center text-2xl">
        <i class="fas fa-user-md"></i>
      </div>
      <div>
        <h1 class="text-xl font-extrabold text-primary">Welcome, <%= name %></h1>
        <p class="text-sm text-gray-600">Pharmacist ID: <strong><%= pharmacistId %></strong></p>
      </div>
    </div>

    <!-- Contact Info -->
    <div class="text-sm text-gray-700 space-y-1">
      <p><i class="fas fa-envelope mr-2 text-secondary"></i><strong>Email:</strong> <%= email %></p>
      <p><i class="fas fa-phone mr-2 text-secondary"></i><strong>Phone:</strong> <%= phone %></p>
    </div>

    <!-- Buttons: Slightly pushed down -->
    <div class="mt-6 flex flex-col gap-3">
      <button id="openUpdateModalBtn" 
              class="bg-sky-400 hover:bg-sky-700 text-white px-4 py-2 rounded font-semibold transition w-full flex items-center justify-center gap-2">
        <i class="fas fa-user-edit"></i> Update Profile
      </button>

      <form action="logout" method="post">
        <button type="submit" 
                class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded font-semibold transition w-full flex items-center justify-center gap-2">
          <i class="fas fa-sign-out-alt"></i> Logout
        </button>
      </form>
    </div>
  </div>

  <!-- Right Column: Add Medicine + Actions -->
  <div class="md:col-span-2 space-y-10">

    <!-- Add New Medicine Form -->
    <div class="bg-white rounded-lg shadow p-6">
      <h2 class="text-2xl font-semibold mb-6 text-primary flex items-center gap-2">
        <i class="fas fa-capsules text-secondary"></i> Add New Medicine
      </h2>
      <form action="P_DisplayServlet" method="post" enctype="multipart/form-data" class="space-y-4">
        <input type="text" name="medName" placeholder="Name" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <input type="text" name="medDesc" placeholder="Description" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <input type="text" name="medBenefits" placeholder="Benefits" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <input type="text" name="medIng" placeholder="Ingredients" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <input type="number" name="medQty" placeholder="Quantity" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <input type="number" name="medPrice" step="0.01" placeholder="Price" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <input type="file" name="image" required
          class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        <button type="submit" class="w-full bg-accent hover:bg-secondary text-white py-3 rounded font-semibold transition flex items-center justify-center gap-2">
          <i class="fas fa-plus-circle"></i> Add Product
        </button>
      </form>
    </div>

    <!-- Actions Buttons -->
    <div class="flex flex-col sm:flex-row justify-center gap-4 max-w-xl mx-auto">
      <form action="P_ViewOrdersServlet" method="post" class="flex-1">
        <button type="submit" class="w-full bg-sky-400 hover:bg-sky-700 text-white py-3 rounded font-semibold transition flex items-center justify-center gap-2">
          <i class="fas fa-box"></i> View Orders
        </button>
      </form>
      <form action="P_inventoryServlet" method="post" class="flex-1">
        <button type="submit" class="w-full bg-sky-400 hover:bg-sky-700 text-white py-3 rounded font-semibold transition flex items-center justify-center gap-2">
          <i class="fas fa-warehouse"></i> View Inventory
        </button>
      </form>
      <form action="P_mediDisplayServlet" method="post" class="flex-1">
        <button type="submit" class="w-full bg-sky-400 hover:bg-sky-700 text-white py-3 rounded font-semibold transition flex items-center justify-center gap-2">
          <i class="fas fa-pills"></i> View Products
        </button>
      </form>
    </div>

  </div>

</section>

<!-- Update Profile Modal -->
<div id="updateProfileModal" 
     class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6 relative">

    <!-- Close Button -->
    <button id="closeUpdateModalBtn" 
            class="absolute top-3 right-4 text-gray-600 hover:text-gray-900 text-3xl font-bold">&times;</button>

    <h2 class="text-2xl font-bold text-primary mb-6 text-center flex items-center justify-center gap-2">
      <i class="fas fa-user-edit"></i> Update Your Profile
    </h2>

    <form action="P_UpdateProfileServlet" method="post" class="space-y-4">

      <div class="flex flex-col">
        <label for="id" class="mb-2 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-id-badge text-secondary"></i> Pharmacist ID
        </label>
        <input type="text" id="id" name="id" value="<%= pharmacistId %>" readonly
               class="p-3 border border-gray-300 rounded-md bg-gray-100 cursor-not-allowed text-gray-700" />
      </div>

      <div class="flex flex-col">
        <label for="name" class="mb-2 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-user text-secondary"></i> Name
        </label>
        <input type="text" id="name" name="name" value="<%= name %>" required
               class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col">
        <label for="email" class="mb-2 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-envelope text-secondary"></i> Email
        </label>
        <input type="email" id="email" name="email" value="<%= email %>" required
               class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col">
        <label for="phone" class="mb-2 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-phone text-secondary"></i> Phone
        </label>
        <input type="tel" id="phone" name="phone" value="<%= phone %>" required
               class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col">
        <label for="password" class="mb-2 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-key text-secondary"></i> Password
        </label>
        <input type="password" id="password" name="password" value="<%= password %>" required
               class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div>
        <button type="submit"
                class="w-full bg-accent hover:bg-secondary text-white p-3 rounded-md font-semibold transition duration-300 cursor-pointer flex items-center justify-center gap-2">
          <i class="fas fa-save"></i> Update My Data
        </button>
      </div>

    </form>
  </div>
</div>

<script>
  // Show modal on clicking Update Profile button
  const openBtn = document.getElementById('openUpdateModalBtn');
  const modal = document.getElementById('updateProfileModal');
  const closeBtn = document.getElementById('closeUpdateModalBtn');

  openBtn.addEventListener('click', () => {
    modal.classList.remove('hidden');
    modal.classList.add('flex');
  });

  closeBtn.addEventListener('click', () => {
    modal.classList.add('hidden');
    modal.classList.remove('flex');
  });

  // Close modal if click outside modal content
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

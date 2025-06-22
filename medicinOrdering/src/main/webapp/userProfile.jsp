<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>User Profile - Medico 360</title>

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

<style>
  /* Fade-in-down animation */
  @keyframes fadeInDown {
    from {
      opacity: 0;
      transform: translateY(-20px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
  .fade-in-down {
    animation: fadeInDown 0.8s ease forwards;
  }

  /* Staggered animation delays */
  .delay-100 { animation-delay: 0.1s; }
  .delay-300 { animation-delay: 0.3s; }
  .delay-500 { animation-delay: 0.5s; }
  .delay-700 { animation-delay: 0.7s; }

  /* Profile dropdown */
  .profile-menu {
    display: none;
  }
  .profile-menu.show {
    display: block;
  }

  /* Hover scale effect for mobile menu button */
  #menu-btn:hover {
    transform: scale(1.1);
    transition: transform 0.3s ease;
  }
  
</style>

</head>
<body class="bg-[#e0f7fa] text-black min-h-screen relative">


<!-- Navbar -->
<nav class="bg-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">

    <!-- Left: Logo -->
    <div class="flex-1 fade-in-down delay-100">
      <a href="home.jsp" class="text-2xl font-extrabold text-primary flex items-center space-x-2 hover:text-secondary transition-colors duration-300">
        <i class="fas fa-heart-pulse text-secondary"></i>
        <span>Medico 360</span>
      </a>
    </div>

    <!-- Center: Menu -->
    <div class="hidden md:flex flex-1 justify-center space-x-8 text-base font-medium fade-in-down delay-300">
      <a href="home.jsp" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-home"></i> Home
      </a>
      <a href="#About Us" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="P_ShowServlet" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-store"></i> Shop
      </a>
      <a href="#contact" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-envelope"></i> Contact
      </a>
    </div>

    <!-- Right: Profile Icon -->
    <div class="hidden md:flex flex-1 justify-end items-center fade-in-down delay-500 relative">
      <button id="profileBtn" class="flex items-center gap-2 text-text hover:text-secondary focus:outline-none" aria-haspopup="true" aria-expanded="false" aria-label="User menu">
        <i class="fas fa-user-circle fa-2x"></i>
        <span class="hidden md:inline font-semibold">${sessionScope.name}</span>
        <i class="fas fa-caret-down"></i>
      </button>

     
    </div>

    <!-- Mobile Menu Button -->
    <div class="md:hidden fade-in-down delay-700 relative flex items-center gap-4">
      <button id="menu-btn" class="text-2xl text-secondary focus:outline-none" aria-label="Toggle menu" aria-expanded="false">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Mobile profile dropdown toggle -->
      <button id="mobileProfileBtn" class="text-2xl text-secondary focus:outline-none" aria-label="Toggle profile menu">
        <i class="fas fa-user-circle"></i>
      </button>

      <div id="mobileProfileMenu" class="profile-menu absolute right-0 mt-10 w-40 bg-white rounded-md shadow-lg py-2 ring-1 ring-black ring-opacity-5 z-50 top-full">
        <a href="profile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-secondary/20 hover:text-secondary transition flex items-center gap-2">
          <i class="fas fa-user"></i> Profile
        </a>
        <form action="logout" method="post" class="m-0">
          <button type="submit" class="w-full text-left px-4 py-2 text-gray-700 hover:bg-red-600 hover:text-white transition flex items-center gap-2">
            <i class="fas fa-sign-out-alt"></i> Logout
          </button>
        </form>
      </div>
    </div>

  </div>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="hidden md:hidden px-4 pb-4 space-y-2 bg-white shadow-sm mt-2">
    <a href="index.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-home"></i> Home
    </a>
    <a href="#about" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-info-circle"></i> About Us
    </a>
    <a href="P_ShowServlet" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-store"></i> Shop
    </a>
    <a href="#contact" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-envelope"></i> Contact
    </a>
  </div>
</nav>

<!-- Main Content -->
<section class="max-w-6xl mx-auto px-4 py-10 relative grid md:grid-cols-3 gap-10">

  <!-- Profile Info: spans 2 columns -->
  <div class="md:col-span-2 bg-white shadow rounded-lg p-6 max-w-full">
    <div class="flex items-center space-x-4 mb-6">
      <!-- Dummy Profile Icon -->
      <div class="w-16 h-16 rounded-full bg-secondary flex items-center justify-center text-white text-3xl font-bold uppercase">
        <i class="fas fa-user"></i>
      </div>
      <h1 class="text-3xl font-extrabold text-primary">Welcome, ${sessionScope.name}</h1>
    </div>

    <h2 class="text-xl font-semibold mb-4">Your Profile Information</h2>

    <table class="w-full text-left table-auto border-collapse border border-gray-200 mb-6">
      <tbody>
        <tr class="border-b border-gray-200">
          <th class="py-2 px-4 font-semibold w-1/3">ID</th>
          <td class="py-2 px-4">${sessionScope.id}</td>
        </tr>
        <tr class="border-b border-gray-200">
          <th class="py-2 px-4 font-semibold">Name</th>
          <td class="py-2 px-4">${sessionScope.name}</td>
        </tr>
        <tr class="border-b border-gray-200">
          <th class="py-2 px-4 font-semibold">Email</th>
          <td class="py-2 px-4">${sessionScope.email}</td>
        </tr>
        <tr class="border-b border-gray-200">
          <th class="py-2 px-4 font-semibold">Address</th>
          <td class="py-2 px-4">${sessionScope.address}</td>
        </tr>
        <tr>
          <th class="py-2 px-4 font-semibold">Phone</th>
          <td class="py-2 px-4">${sessionScope.phone}</td>
        </tr>
      </tbody>
    </table>

    <!-- Buttons under profile info -->
    <div class="mt-6 flex flex-col gap-4 max-w-xs">
      <button id="openUpdateModalBtn" 
              class="bg-secondary hover:bg-blue-700 text-white px-6 py-2 rounded shadow text-center font-semibold flex items-center justify-center gap-2">
        <i class="fas fa-user-edit"></i> Update Profile
      </button>
      <a href="viewDelivery.jsp" class="bg-primary hover:bg-primary-dark text-white px-6 py-2 rounded shadow text-center flex items-center justify-center gap-2">
        <i class="fas fa-truck"></i> View Delivery
      </a>
    </div>
  </div>

  <!-- Right promo column with buttons -->
  <div class="bg-white shadow rounded-lg p-6 flex flex-col items-center justify-center max-w-full space-y-4">

    <button
      id="openUploadModalBtn"
      class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded shadow font-semibold flex items-center gap-2 w-full justify-center"
    >
      <i class="fas fa-file-upload"></i> Upload Prescription
    </button>

    <form action="logout" method="post" class="w-full">
      <button
        type="submit"
        class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded shadow font-semibold flex items-center gap-2 w-full justify-center"
      >
        <i class="fas fa-sign-out-alt"></i> Logout
      </button>
    </form>

   <img
  src="images/s2.jpeg"
  alt="Featured Product"
  class="w-35 h-48 object-contain rounded-lg shadow-md transition-transform duration-300 ease-in-out hover:scale-105 hover:shadow-lg"
/>


    <a
      href="P_ShowServlet"
      class="bg-accent hover:bg-green-600 text-white px-10 py-4 rounded-full font-semibold shadow-lg text-lg w-full text-center transition duration-300 flex items-center justify-center gap-2"
    >
      <i class="fas fa-shopping-cart"></i> Shop Now
    </a>

  </div>

  <h2 class="text-xl font-semibold mb-4 md:col-span-3 mt-10">Your Prescriptions</h2>

  <div class="overflow-x-auto md:col-span-3">
    <table class="min-w-full bg-white rounded-lg shadow overflow-hidden">
      <thead class="bg-primary text-white">
        <tr>
          <th class="py-3 px-6 text-left">Prescription ID</th>
          <th class="py-3 px-6 text-left">Image</th>
          <th class="py-3 px-6 text-left">Status</th>
          <th class="py-3 px-6 text-left">Amount</th>
          <th class="py-3 px-6 text-left">Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="prescription" items="${prescriptions}">
          <tr class="border-b border-gray-200 hover:bg-gray-50">
            <td class="py-3 px-6">${prescription.id}</td>
            <td class="py-3 px-6">
              <c:choose>
                <c:when test="${not empty prescription.fileName}">
                  <img src="${pageContext.request.contextPath}/images/${prescription.fileName}" alt="Prescription Image" class="h-24 w-24 object-cover rounded" />
                </c:when>
                <c:otherwise>
                  <span class="text-gray-500 italic">No Image Available</span>
                </c:otherwise>
              </c:choose>
            </td>
            <td class="py-3 px-6">${prescription.status}</td>
            <td class="py-3 px-6">${prescription.amount}</td>
            <td class="py-3 px-6 space-x-2">
              <c:choose>
                <c:when test="${prescription.status eq 'Accepted' and prescription.deliverStatus eq 'pending'}">
                  <form action="ConfirmPrescriptionServlet" method="post" class="inline">
                    <input type="hidden" name="prescriptionId" value="${prescription.id}" />
                    <button type="submit" onclick="return confirm('Are you sure you want to place the order?')" class="bg-accent hover:bg-green-600 text-white px-3 py-1 rounded flex items-center gap-2">
                      <i class="fas fa-check-circle"></i> Confirm Order
                    </button>
                  </form>
                  <form action="DeletePrescription" method="post" class="inline">
                    <input type="hidden" name="prescriptionId" value="${prescription.id}" />
                    <button type="submit" onclick="return confirmCancel()" class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded flex items-center gap-2">
                      <i class="fas fa-times-circle"></i> Cancel Order
                    </button>
                  </form>
                </c:when>
                <c:when test="${prescription.status eq 'Accepted' and prescription.deliverStatus eq 'Processing'}">
                  <span class="text-green-600 font-semibold flex items-center gap-2">
                    <i class="fas fa-check-double"></i> Confirmed
                  </span>
                </c:when>
                <c:otherwise>
                  <span class="text-gray-700">${prescription.deliverStatus}</span>
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty prescriptions}">
          <tr>
            <td colspan="5" class="text-center py-4 text-gray-500 italic">No prescriptions available.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>

</section>

<!-- Modal for Upload Prescription -->
<div id="uploadModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-60">
  <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-4 relative">
    <button id="closeUploadModalBtn" class="absolute top-3 right-3 text-gray-500 hover:text-gray-900">
      <i class="fas fa-times text-2xl"></i>
    </button>
    <h2 class="text-2xl font-bold text-primary mb-6 text-center flex items-center gap-2">
      <i class="fas fa-file-upload text-secondary"></i> Upload Your Prescription
    </h2>

    <form action="UploadPrescription" method="post" enctype="multipart/form-data" class="space-y-4">

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="username" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-user"></i> Username:</label>
        <input type="text" id="username" name="username" value="${sessionScope.username}" readonly
          class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="name" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-id-card"></i> Name:</label>
        <input type="text" id="name" name="name" value="${sessionScope.name}" readonly
          class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="email" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-envelope"></i> Email:</label>
        <input type="email" id="email" name="email" value="${sessionScope.email}" readonly
          class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="phone" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-phone"></i> Phone:</label>
        <input type="tel" id="phone" name="phone" value="${sessionScope.phone}" readonly
          class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="address" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-map-marker-alt"></i> Address:</label>
        <input type="text" id="address" name="address" value="${sessionScope.address}" required
          class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="prescriptionFile" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-file-prescription"></i> Prescription File (Image/PDF):</label>
        <input type="file" id="prescriptionFile" name="prescriptionFile" accept="image/*,application/pdf" required
          class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="paymentMethod" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-credit-card"></i> Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent">
          <option value="cashOnDelivery">Cash on Delivery</option>
        </select>
      </div>

      <div class="pt-4">
        <input type="submit" value="Upload Prescription"
          class="w-full bg-accent hover:bg-green-600 text-white p-3 rounded-md cursor-pointer transition duration-300 font-semibold" />
      </div>
    </form>
  </div>
</div>

<!-- Modal for Update Profile -->
<div id="updateModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-60">
  <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6 relative">
    <button id="closeUpdateModalBtn" class="absolute top-3 right-3 text-gray-500 hover:text-gray-900">
      <i class="fas fa-times text-2xl"></i>
    </button>
    <h2 class="text-2xl font-bold text-primary mb-6 text-center flex items-center gap-2">
      <i class="fas fa-user-edit text-secondary"></i> Update Your Profile
    </h2>

    <form action="updateServlet" method="post" class="space-y-4">

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="id" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-hashtag"></i> User ID:</label>
        <input type="text" id="id" name="id" value="${sessionScope.id}" readonly
               class="flex-1 p-2 border border-gray-300 rounded-md bg-gray-100 cursor-not-allowed text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="username" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-user"></i> Username:</label>
        <input type="text" id="username" name="username" value="${sessionScope.username}" readonly
               class="flex-1 p-2 border border-gray-300 rounded-md bg-gray-100 cursor-not-allowed text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="name" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-id-card"></i> Name:</label>
        <input type="text" id="name" name="name" value="${sessionScope.name}" required
               class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="email" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-envelope"></i> Email:</label>
        <input type="email" id="email" name="email" value="${sessionScope.email}" required
               class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="address" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-map-marker-alt"></i> Address:</label>
        <input type="text" id="address" name="address" value="${sessionScope.address}" required
               class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="phone" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-phone"></i> Phone Number:</label>
        <input type="tel" id="phone" name="phone" value="${sessionScope.phone}" required
               class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex flex-col md:flex-row items-center md:items-start gap-2 md:gap-4">
        <label for="password" class="w-full md:w-40 text-text font-medium flex items-center gap-2"><i class="fas fa-lock"></i> Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter new password"
               class="flex-1 p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="pt-4">
        <input type="submit" value="Update"
               class="w-full bg-accent hover:bg-green-600 text-white p-3 rounded-md cursor-pointer transition duration-300 font-semibold flex items-center justify-center gap-2" />
      </div>
    </form>
  </div>
</div>

<script>
  // Navbar mobile menu toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  menuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
    const expanded = menuBtn.getAttribute('aria-expanded') === 'true';
    menuBtn.setAttribute('aria-expanded', !expanded);
  });

  // Profile menu toggle
  const profileBtn = document.getElementById('profileBtn');
  const profileMenu = document.getElementById('profileMenu');

  profileBtn.addEventListener('click', (e) => {
    e.stopPropagation();
    profileMenu.classList.toggle('show');
    const expanded = profileBtn.getAttribute('aria-expanded') === 'true';
    profileBtn.setAttribute('aria-expanded', !expanded);
  });

  // Mobile profile menu toggle
  const mobileProfileBtn = document.getElementById('mobileProfileBtn');
  const mobileProfileMenu = document.getElementById('mobileProfileMenu');

  mobileProfileBtn.addEventListener('click', (e) => {
    e.stopPropagation();
    mobileProfileMenu.classList.toggle('show');
  });

  // Close dropdowns when clicking outside
  window.addEventListener('click', () => {
    profileMenu.classList.remove('show');
    profileBtn.setAttribute('aria-expanded', 'false');
    mobileProfileMenu.classList.remove('show');
  });

  // Modal functionality: Upload Prescription
  const openUploadModalBtn = document.getElementById('openUploadModalBtn');
  const closeUploadModalBtn = document.getElementById('closeUploadModalBtn');
  const uploadModal = document.getElementById('uploadModal');

  openUploadModalBtn.addEventListener('click', () => {
    uploadModal.classList.remove('hidden');
    uploadModal.classList.add('flex');
  });

  closeUploadModalBtn.addEventListener('click', () => {
    uploadModal.classList.add('hidden');
    uploadModal.classList.remove('flex');
  });

  // Modal functionality: Update Profile
  const openUpdateModalBtn = document.getElementById('openUpdateModalBtn');
  const closeUpdateModalBtn = document.getElementById('closeUpdateModalBtn');
  const updateModal = document.getElementById('updateModal');

  openUpdateModalBtn.addEventListener('click', () => {
    updateModal.classList.remove('hidden');
    updateModal.classList.add('flex');
  });

  closeUpdateModalBtn.addEventListener('click', () => {
    updateModal.classList.add('hidden');
    updateModal.classList.remove('flex');
  });

  // Close modals if clicked outside content
  window.addEventListener('click', (e) => {
    if (e.target === uploadModal) {
      uploadModal.classList.add('hidden');
      uploadModal.classList.remove('flex');
    }
    if (e.target === updateModal) {
      updateModal.classList.add('hidden');
      updateModal.classList.remove('flex');
    }
  });

  // Confirm cancel order
  function confirmCancel() {
    return confirm('Are you sure you want to cancel the order?');
  }
</script>

</body>
</html>

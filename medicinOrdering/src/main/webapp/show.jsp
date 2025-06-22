<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Medico 360 | Shop</title>

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Tailwind Theme -->
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

  <style>
    /* Fade In Up Animation */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translate3d(0, 20px, 0);
      }
      to {
        opacity: 1;
        transform: translate3d(0, 0, 0);
      }
    }
    .fade-in-up {
      animation: fadeInUp 1s ease forwards;
    }
  </style>
</head>
<body class="bg-[#e0f7fa] text-black min-h-screen relative">

<!-- Navbar -->
<nav class="bg-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">

    <!-- Left: Logo -->
    <div class="flex-1 fade-in-up" style="animation-delay: 0.2s;">
      <a href="home.jsp" class="text-2xl font-extrabold text-primary flex items-center space-x-2 hover:text-secondary transition-colors duration-300">
        <i class="fas fa-heart-pulse text-secondary"></i>
        <span>Medico 360</span>
      </a>
    </div>

    <!-- Center: Menu -->
    <div class="hidden md:flex flex-1 justify-center space-x-8 text-base font-medium">
      <a href="home.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline fade-in-up" style="animation-delay: 0.3s;">
        <i class="fas fa-home"></i> Home
      </a>
      <a href="about.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline fade-in-up" style="animation-delay: 0.4s;">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="shop.jsp" class="flex items-center gap-1 text-secondary font-semibold fade-in-up" style="animation-delay: 0.5s;">
        <i class="fas fa-store"></i> Shop
      </a>
      <a href="contact.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline fade-in-up" style="animation-delay: 0.6s;">
        <i class="fas fa-envelope"></i> Contact
      </a>
    </div>

    <!-- Right: Login -->
  <!-- Right: Profile Navigation -->
<div class="hidden md:flex flex-1 justify-end items-center fade-in-down delay-500 relative">
  <a href="userProfile.jsp" class="flex items-center gap-2 text-text hover:text-secondary transition duration-300">
    <i class="fas fa-user-circle fa-2x"></i>
    <span class="hidden md:inline font-semibold">${sessionScope.name}</span>
    <i class="fas fa-caret-down"></i>
  </a>
</div>


     
    </div>

    <!-- Mobile Menu Button -->
    <div class="md:hidden fade-in-up" style="animation-delay: 0.8s;">
      <button id="menu-btn" class="text-2xl text-secondary focus:outline-none">
        <i class="fas fa-bars"></i>
      </button>
    </div>

  </div>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="hidden md:hidden px-4 pb-4 space-y-2 bg-white shadow-sm">
    <a href="home.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-home"></i> Home
    </a>
    <a href="about.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-info-circle"></i> About Us
    </a>
    <a href="shop.jsp" class="block text-secondary font-semibold flex items-center gap-2">
      <i class="fas fa-store"></i> Shop
    </a>
    <a href="contact.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-envelope"></i> Contact
    </a>
    <a href="login.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-user"></i> Login
    </a>
  </div>
</nav>

<!-- Page Content -->
<section class="max-w-7xl mx-auto px-4 py-10">
  <div class="flex justify-between items-center mb-6">
    <h2 class="text-3xl font-bold text-primary">Our Available Medicines</h2>
    <form action="ViewChart.jsp" method="get">
      <button type="submit" class="bg-primary text-white px-4 py-2 rounded hover:bg-secondary transition">
        🛒 View Cart
      </button>
    </form>
  </div>

  <!-- Show success message -->
  <c:if test="${not empty sessionScope.message}">
    <div class="bg-green-100 text-green-800 font-semibold py-2 px-4 rounded mb-6 text-center">
      ${sessionScope.message}
    </div>
    <c:remove var="message" scope="session" />
  </c:if>

  <div class="product-container grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
    <c:forEach var="medicine" items="${medList}">
      <div class="card bg-white rounded-lg shadow p-4 text-center">
        <img src="images/${medicine.medImage}" alt="${medicine.medName}" class="w-full h-40 object-cover rounded" />
        <h4 class="text-lg font-semibold mt-3">${medicine.medName}</h4>
        <p class="text-sm text-gray-600">${medicine.medDesc}</p>
        <div class="price text-accent text-lg font-bold mt-2">LKR ${medicine.medPrice}</div>
        <form action="AddToCartServlet" method="post" class="mt-4">
          <input type="hidden" name="medID" value="${medicine.medID}" />
          <input type="number" name="quantity" value="1" min="1" class="border border-gray-300 rounded px-2 py-1 w-20" required />
          <button type="submit" class="ml-2 mt-2 bg-accent text-white px-4 py-2 rounded hover:bg-green-600 transition">Add to Cart</button>
        </form>
      </div>
    </c:forEach>
  </div>
</section>

<!-- Footer -->
<footer class="bg-primary text-white py-10 mt-20">
  <div class="max-w-6xl mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left">
    <div>
      <h3 class="text-xl font-bold mb-2">Medico 360</h3>
      <p class="text-sm text-gray-300">Your trusted partner for fast and reliable medical delivery across Sri Lanka.</p>
    </div>
    <div>
      <h4 class="font-semibold mb-2">Quick Links</h4>
      <ul class="text-sm space-y-1">
        <li><a href="home.jsp" class="hover:text-secondary">Home</a></li>
        <li><a href="shop.jsp" class="hover:text-secondary">Shop</a></li>
        <li><a href="about.jsp" class="hover:text-secondary">About Us</a></li>
        <li><a href="contact.jsp" class="hover:text-secondary">Contact</a></li>
      </ul>
    </div>
    <div>
      <h4 class="font-semibold mb-2">Contact</h4>
      <p class="text-sm"><i class="fas fa-phone mr-1 text-secondary"></i> +94 77 123 4567</p>
      <p class="text-sm"><i class="fas fa-envelope mr-1 text-secondary"></i> support@medico360.lk</p>
    </div>
  </div>
  <div class="text-center text-xs text-gray-300 mt-6 border-t border-gray-600 pt-4">
    &copy; 2025 Medico 360. All rights reserved.
  </div>
</footer>

<script>
  // Navbar mobile menu toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  if(menuBtn){
    menuBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
  }
</script>

</body>
</html>

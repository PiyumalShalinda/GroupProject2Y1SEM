<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Medico 360 - Unified Login</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Tailwind Custom Config -->
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#0A2540',
            secondary: '#38BDF8',
            accent: '#38BDF8',
            background: '#e0f7fa',
            text: '#1F2937'
          }
        }
      }
    }
  </script>

  <style>
    @keyframes fadeInDown {
      0% {
        opacity: 0;
        transform: translateY(-20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    .fade-in-down {
      animation: fadeInDown 0.8s ease forwards;
    }
  </style>
</head>
<body class="text-text bg-cover bg-center min-h-screen" style="background-image: url('images/5.jpg');">

<!-- Show alert if errorMessage exists -->
<c:if test="${not empty errorMessage}">
  <script>
    alert('${errorMessage}');
  </script>
</c:if>

<!-- Navbar -->
<nav class="bg-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">

    <!-- Logo -->
    <div class="flex-1 fade-in-down" style="animation-delay: 0.1s;">
      <a href="home.jsp" class="text-2xl font-extrabold text-primary flex items-center space-x-2 hover:text-secondary transition-colors duration-300">
        <i class="fas fa-heart-pulse text-secondary"></i>
        <span>Medico 360</span>
      </a>
    </div>

    <!-- Navigation -->
    <div class="hidden md:flex flex-1 justify-center space-x-8 text-base font-medium fade-in-down" style="animation-delay: 0.3s;">
      <a href="home.jsp" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-home"></i> Home
      </a>
      <a href="#about" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="#shop" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-store"></i> Shop
      </a>
      <a href="#contact" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-envelope"></i> Contact
      </a>
    </div>

    <!-- Login -->
    <div class="hidden md:flex flex-1 justify-end space-x-6 text-base font-medium items-center fade-in-down" style="animation-delay: 0.5s;">
      <a href="Login.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300">
        <i class="fas fa-user"></i><span>Login / Register</span>
      </a>
    </div>

    <!-- Mobile Menu -->
    <div class="md:hidden fade-in-down" style="animation-delay: 0.7s;">
      <button id="menu-btn" class="text-2xl text-secondary focus:outline-none" aria-label="Toggle menu" aria-expanded="false">
        <i class="fas fa-bars"></i>
      </button>
    </div>
  </div>

  <!-- Mobile Menu Content -->
  <div id="mobile-menu" class="hidden md:hidden px-4 pb-4 space-y-2 bg-white shadow-sm">
    <a href="home.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-home"></i> Home
    </a>
    <a href="#about" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-info-circle"></i> About Us
    </a>
    <a href="#shop" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-store"></i> Shop
    </a>
    <a href="#contact" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-envelope"></i> Contact
    </a>
    <a href="Login.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-user"></i> Login / Register
    </a>
  </div>
</nav>

<!-- Login Form -->
<section class="min-h-screen flex items-center justify-center py-10 px-4">
  <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
    <h2 class="text-2xl font-bold text-primary mb-6 text-center">Login</h2>

    <form action="UniversalLoginServlet" method="post" class="space-y-5">
      <!-- Username -->
      <div>
        <label for="username" class="block text-sm font-medium text-text mb-1">Username/ID:</label>
        <input
          type="text"
          name="username"
          class="w-full px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-accent
            ${not empty errorMessage ? 'border border-red-500' : 'border border-gray-300'}"
        />
      </div>

      <!-- Password -->
      <div>
        <label for="password" class="block text-sm font-medium text-text mb-1">Password:</label>
        <div class="relative">
          <input
            type="password"
            name="password"
            id="password-field"
            class="w-full px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-accent
              ${not empty errorMessage ? 'border border-red-500' : 'border border-gray-300'}"
          />
          <button type="button" id="toggle-password" class="absolute inset-y-0 right-3 text-gray-400 hover:text-secondary" aria-label="Toggle password visibility">
            <i class="fas fa-eye"></i>
          </button>
        </div>
      </div>

      <!-- Role -->
      <div>
        <label for="role" class="block text-sm font-medium text-text mb-1">Login as:</label>
        <select name="role" required class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent">
          <option value="customer">Customer</option>
          <option value="admin">Admin</option>
          <option value="pharmacist">Pharmacist</option>
          <option value="delivery">Delivery Agent</option>
        </select>
      </div>

      <!-- Submit -->
      <div class="text-center">
        <input type="submit" value="Login" class="bg-accent hover:bg-green-600 text-white font-semibold px-6 py-2 rounded transition duration-300 cursor-pointer" />
      </div>

      <!-- Signup Link -->
      <div class="text-center mt-4 text-sm text-gray-700">
        Are you new?
        <a href="C_Signupform.jsp" class="text-secondary font-medium hover:underline">Sign up</a>
      </div>
    </form>
  </div>
</section>

<!-- JS Scripts -->
<script>
  // Mobile menu toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  menuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
    menuBtn.setAttribute('aria-expanded', !mobileMenu.classList.contains('hidden'));
  });

  // Toggle password visibility
  const togglePassword = document.getElementById('toggle-password');
  const passwordField = document.getElementById('password-field');
  togglePassword.addEventListener('click', () => {
    const isPassword = passwordField.type === 'password';
    passwordField.type = isPassword ? 'text' : 'password';
    togglePassword.innerHTML = `<i class="fas fa-eye${isPassword ? '-slash' : ''}"></i>`;
  });
</script>

<!-- Footer -->
<footer class="bg-primary text-white py-10 px-6 mt-20">
  <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left">
    <div>
      <h3 class="text-2xl font-bold mb-3">Medico 360</h3>
      <p class="text-sm text-gray-200">Your trusted partner for fast and reliable medical delivery across Sri Lanka.</p>
    </div>
    <div>
      <h4 class="font-semibold text-lg mb-3">Quick Links</h4>
      <ul class="space-y-2 text-sm">
        <li><a href="home.jsp" class="hover:text-secondary transition">Home</a></li>
        <li><a href="home.jsp#shop" class="hover:text-secondary transition">Shop</a></li>
        <li><a href="home.jsp#about" class="hover:text-secondary transition">About Us</a></li>
        <li><a href="home.jsp#contact" class="hover:text-secondary transition">Contact</a></li>
      </ul>
    </div>
    <div>
      <h4 class="font-semibold text-lg mb-3">Contact</h4>
      <p class="text-sm"><i class="fas fa-phone mr-2 text-secondary"></i>+94 77 123 4567</p>
      <p class="text-sm"><i class="fas fa-envelope mr-2 text-secondary"></i>support@medico360.lk</p>
      <div class="flex justify-center md:justify-start mt-4 gap-4 text-2xl">
        <a href="#" class="hover:text-blue-400"><i class="fab fa-facebook"></i></a>
        <a href="#" class="hover:text-green-400"><i class="fab fa-whatsapp"></i></a>
        <a href="#" class="hover:text-pink-400"><i class="fab fa-instagram"></i></a>
      </div>
    </div>
  </div>
  <div class="mt-10 text-center text-sm text-gray-300 border-t border-gray-600 pt-4">
    &copy; 2025 Medico 360. All rights reserved.
  </div>
</footer>

</body>
</html>

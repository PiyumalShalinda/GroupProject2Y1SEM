<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Delivery Agent Signup - Medico 360</title>

<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Tailwind config for your theme colors -->
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

<style>
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
<body class="text-text bg-cover bg-center min-h-screen" style="background-image: url('images/9.jpg');">

<!-- Navbar -->
<nav class="bg-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">

    <!-- Left: Logo -->
    <div class="text-2xl font-extrabold text-primary flex items-center space-x-2 fade-in-up" style="animation-delay: 0.2s;">
      <a href="home.jsp" class="flex items-center gap-2 hover:text-secondary transition-colors duration-300">
        <i class="fas fa-heart-pulse text-secondary"></i>
        <span>Medico 360</span>
      </a>
    </div>

    <!-- Center: Menu -->
    <div class="hidden md:flex space-x-8 text-base font-medium fade-in-up" style="animation-delay: 0.3s;">
      <a href="index.jsp" class="text-text hover:text-secondary transition-colors flex items-center gap-1">
        <i class="fas fa-home"></i> Home
      </a>
      <a href="#about" class="text-text hover:text-secondary transition-colors flex items-center gap-1">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="#shop" class="text-text hover:text-secondary transition-colors flex items-center gap-1">
        <i class="fas fa-store"></i> Shop
      </a>
      <a href="#contact" class="text-text hover:text-secondary transition-colors flex items-center gap-1">
        <i class="fas fa-envelope"></i> Contact
      </a>
    </div>

    <!-- Right: Login -->
    <div class="hidden md:flex space-x-6 items-center text-base font-medium fade-in-up" style="animation-delay: 0.4s;">
      <a href="Login.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors">
        <i class="fas fa-user"></i> Login / Register
      </a>
    </div>

    <!-- Mobile menu button -->
    <div class="md:hidden fade-in-up" style="animation-delay: 0.5s;">
      <button id="menu-btn" class="text-2xl text-secondary focus:outline-none">
        <i class="fas fa-bars"></i>
      </button>
    </div>

  </div>

  <!-- Mobile menu -->
  <div id="mobile-menu" class="hidden md:hidden px-4 pb-4 space-y-2 bg-white shadow-sm">
    <a href="index.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-home"></i> Home
    </a>
    <a href="#about" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-info-circle"></i> About Us
    </a>
    <a href="#shop" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-store"></i> Shop
    </a>
    <a href="#contact" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-envelope"></i> Contact
    </a>
    <a href="login.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
      <i class="fas fa-user"></i> Login / Register
    </a>
  </div>
</nav>

<!-- Signup Form Section -->
<main class="flex-grow max-w-lg mx-auto bg-white rounded-lg shadow p-8 mt-12 mb-12 fade-in-up" style="animation-delay: 0.6s;">
  <h1 class="text-3xl font-bold text-primary mb-8 flex items-center gap-3">
    <i class="fas fa-user-plus text-secondary"></i> Register As Delivery Agent
  </h1>

  <form action="Dinsertsevlet" method="post" class="space-y-6">
    <div>
      <label for="username" class="block text-sm font-semibold mb-1">User Name</label>
      <input
        type="text"
        name="username"
        id="username"
        required
        class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent"
        placeholder="Enter your username"
      />
    </div>

    <div>
      <label for="name" class="block text-sm font-semibold mb-1">Name</label>
      <input
        type="text"
        name="name"
        id="name"
        required
        class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent"
        placeholder="Enter your full name"
      />
    </div>

    <div>
      <label for="email" class="block text-sm font-semibold mb-1">Email</label>
      <input
        type="email"
        name="email"
        id="email"
        required
        class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent"
        placeholder="Enter your email address"
      />
    </div>

    <div>
      <label for="phone" class="block text-sm font-semibold mb-1">Contact Number</label>
      <input
        type="tel"
        name="phone"
        id="phone"
        required
        class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent"
        placeholder="Enter your contact number"
      />
    </div>

    <div>
      <label for="password" class="block text-sm font-semibold mb-1">Password</label>
      <input
        type="password"
        name="password"
        id="password"
        required
        class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent"
        placeholder="Create a password"
      />
    </div>

    <button
      type="submit"
      class="w-full bg-accent hover:bg-green-600 text-white py-3 rounded-md font-semibold transition duration-300 flex items-center justify-center gap-3"
    >
      <i class="fas fa-user-plus"></i> Create Account
    </button>
  </form>
</main>

<!-- Footer -->
<footer class="bg-primary text-white py-10 mt-auto">
  <div class="max-w-6xl mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left">
    <div>
      <h3 class="text-2xl font-bold mb-3">Medico 360</h3>
      <p class="text-sm text-gray-200">Your trusted partner for fast and reliable medical delivery across Sri Lanka.</p>
    </div>
    <div>
      <h4 class="font-semibold text-lg mb-3">Quick Links</h4>
      <ul class="space-y-2 text-sm">
        <li><a href="index.jsp" class="hover:text-secondary transition">Home</a></li>
        <li><a href="#shop" class="hover:text-secondary transition">Shop</a></li>
        <li><a href="#about" class="hover:text-secondary transition">About Us</a></li>
        <li><a href="#contact" class="hover:text-secondary transition">Contact</a></li>
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

<script>
  // Navbar mobile menu toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  menuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
  });
</script>

</body>
</html>

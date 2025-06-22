<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Medico 360 - Sign Up</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Tailwind Custom Theme -->
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

    /* Hover scale effect for mobile menu button */
    #menu-btn:hover {
      transform: scale(1.1);
      transition: transform 0.3s ease;
    }
  </style>
</head>
<body class="text-text bg-cover bg-center min-h-screen" style="background-image: url('images/5.jpg');">

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
      <a href="home.jsp" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="#shop" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-store"></i> Shop
      </a>
      <a href="home.jsp" class="text-text hover:text-secondary transition-colors duration-300 hover:underline flex items-center gap-1">
        <i class="fas fa-envelope"></i> Contact
      </a>
    </div>

    <!-- Right: Login only -->
    <div class="hidden md:flex flex-1 justify-end space-x-6 text-base font-medium items-center fade-in-down delay-500">
      <a href="Login.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300">
        <i class="fas fa-user"></i><span>Login / Register</span>
      </a>
    </div>

    <!-- Mobile Menu Button -->
    <div class="md:hidden fade-in-down delay-700">
      <button id="menu-btn" class="text-2xl text-secondary focus:outline-none" aria-label="Toggle menu" aria-expanded="false">
        <i class="fas fa-bars"></i>
      </button>
    </div>
  </div>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="hidden md:hidden px-4 pb-4 space-y-2 bg-white shadow-sm">
    <a href="home.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-home"></i> Home
    </a>
    <a href="home.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-info-circle"></i> About Us
    </a>
    <a href="#shop" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-store"></i> Shop
    </a>
    <a href="home.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-envelope"></i> Contact
    </a>
    <a href="Login.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-user"></i> Login / Register
    </a>
  </div>
</nav>

<!-- Sign Up Form -->
<section class="flex justify-center py-12 px-4">
  <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
    <h2 class="text-2xl font-bold text-primary mb-6 text-center">Create an Account</h2>

    <form action="insert" method="post" class="space-y-5">
      <!-- Full Name -->
      <div class="flex items-center border-b-2 border-gray-300 py-2">
        <i class="fas fa-user text-gray-500 mr-3"></i>
        <input type="text" id="name" name="name" placeholder="Full Name" class="w-full focus:outline-none text-gray-700" required />
      </div>

      <!-- Email -->
      <div class="flex items-center border-b-2 border-gray-300 py-2">
        <i class="fas fa-envelope text-gray-500 mr-3"></i>
        <input type="email" id="email" name="email" placeholder="Email Address" class="w-full focus:outline-none text-gray-700" required />
      </div>

      <!-- Address -->
      <div class="flex items-center border-b-2 border-gray-300 py-2">
        <i class="fas fa-map-marker-alt text-gray-500 mr-3"></i>
        <input type="text" id="address" name="address" placeholder="Address" class="w-full focus:outline-none text-gray-700" required />
      </div>

      <!-- Phone -->
      <div class="flex items-center border-b-2 border-gray-300 py-2">
        <i class="fas fa-phone text-gray-500 mr-3"></i>
        <input type="tel" id="phone" name="phone" placeholder="Phone Number" class="w-full focus:outline-none text-gray-700" required />
      </div>

      <!-- Username -->
      <div class="flex items-center border-b-2 border-gray-300 py-2">
        <i class="fas fa-user-circle text-gray-500 mr-3"></i>
        <input type="text" id="username" name="username" placeholder="Username" class="w-full focus:outline-none text-gray-700" required />
      </div>

      <!-- Password -->
      <div class="relative flex items-center border-b-2 border-gray-300 py-2">
        <i class="fas fa-lock text-gray-500 mr-3"></i>
        <input type="password" id="password" name="password" placeholder="Password" class="w-full focus:outline-none text-gray-700" required />
        <button type="button" id="toggle-password" class="absolute right-0 mr-3 text-gray-400 hover:text-secondary" aria-label="Toggle password visibility">
          <i class="fas fa-eye"></i>
        </button>
      </div>
      <!-- Confirm Password -->
     <div class="relative flex items-center border-b-2 border-gray-300 py-2">
     <i class="fas fa-lock text-gray-500 mr-3"></i>
      <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="w-full focus:outline-none text-gray-700" required />
    </div>

     <!-- Password Match Message -->
   <div id="matchMessage" class="text-sm text-center font-medium mt-1"></div>
      

      <!-- Error Message -->
      <c:if test="${not empty usernameError}">
        <div class="text-red-500 text-center text-sm">${usernameError}</div>
      </c:if>

      <!-- Submit -->
      <div class="text-center pt-4">
        <input type="submit" name="submit" value="Register" class="bg-accent hover:bg-green-600 text-white font-semibold px-6 py-2 rounded transition duration-300 cursor-pointer" />
      </div>
    </form>
  </div>
</section>

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

<!-- Scripts -->
<script>
  // Mobile menu toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  menuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
  });

  // Password visibility toggle
  const togglePassword = document.getElementById('toggle-password');
  const passwordField = document.getElementById('password');
  togglePassword.addEventListener('click', () => {
    const isPassword = passwordField.type === 'password';
    passwordField.type = isPassword ? 'text' : 'password';
    togglePassword.innerHTML = `<i class="fas fa-eye${isPassword ? '-slash' : ''}"></i>`;
  });
//Password match check
  const confirmPassword = document.getElementById("confirmPassword");
  const matchMessage = document.getElementById("matchMessage");

  confirmPassword.addEventListener("input", () => {
    if (confirmPassword.value === "") {
      matchMessage.textContent = "";
    } else if (passwordField.value === confirmPassword.value) {
      matchMessage.textContent = "✓ Passwords match.";
      matchMessage.classList.remove("text-red-600");
      matchMessage.classList.add("text-green-600");
    } else {
      matchMessage.textContent = "✗ Passwords do not match.";
      matchMessage.classList.remove("text-green-600");
      matchMessage.classList.add("text-red-600");
    }
  });

</script>

</body>
</html>

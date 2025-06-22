<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Medico 360</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Custom Tailwind Config -->
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
    /* Custom animation for fadeInUp */
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
<body class="bg-background text-text">

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
        <a href="home.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline">
          <i class="fas fa-home"></i> Home
        </a>
        <a href="#about" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline">
          <i class="fas fa-info-circle"></i> About Us
        </a>
        <a href="#shop" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline">
          <i class="fas fa-store"></i> Shop
        </a>
        <a href="#contact" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300 hover:underline">
          <i class="fas fa-envelope"></i> Contact
        </a>
      </div>

      <!-- Right: Login only -->
      <div class="hidden md:flex flex-1 justify-end space-x-6 text-base font-medium items-center fade-in-up" style="animation-delay: 0.4s;">
        <a href="Login.jsp" class="flex items-center gap-1 text-text hover:text-secondary transition-colors duration-300">
          <i class="fas fa-user"></i> Login / Register
        </a>
      </div>

      <!-- Mobile Menu Button -->
      <div class="md:hidden">
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
      <a href="#about" class="block text-text hover:text-secondary flex items-center gap-2">
        <i class="fas fa-info-circle"></i> About Us
      </a>
      <a href="#shop" class="block text-text hover:text-secondary flex items-center gap-2">
        <i class="fas fa-store"></i> Shop
      </a>
      <a href="#contact" class="block text-text hover:text-secondary flex items-center gap-2">
        <i class="fas fa-envelope"></i> Contact
      </a>
      <a href="Login.jsp" class="block text-text hover:text-secondary flex items-center gap-2">
        <i class="fas fa-user"></i> Login / Register
      </a>
    </div>
  </nav>

  <!-- Hero Slideshow Section -->
  <section id="hero" class="relative h-[85vh] overflow-hidden">
    <!-- Slideshow Images -->
    <div id="slides" class="absolute inset-0 z-0">
      <div class="slide h-full w-full bg-cover bg-center absolute transition-opacity duration-1000 opacity-100" style="background-image: url('images/1.jpeg');"></div>
      <div class="slide h-full w-full bg-cover bg-center absolute transition-opacity duration-1000 opacity-0" style="background-image: url('images/2.jpg');"></div>
      <div class="slide h-full w-full bg-cover bg-center absolute transition-opacity duration-1000 opacity-0" style="background-image: url('images/home.jpeg');"></div>
    </div>

    <!-- Overlay Content -->
    <div class="absolute inset-0 bg-black bg-opacity-50 z-10 flex items-center justify-center">
      <div class="text-center text-white px-4 max-w-2xl fade-in-up" style="animation-delay: 0.6s;">
        <h1 class="text-4xl md:text-5xl font-extrabold mb-4"> Medico 360 Online</h1>
        <p class="text-lg md:text-xl mb-6">Trusted pharmacy. Fast delivery. Easy access to prescriptions from anywhere.</p>
        <div class="flex justify-center gap-4 flex-wrap">
          <a href="#shop" class="bg-accent hover:bg-green-600 text-white font-semibold py-3 px-6 rounded-lg transition duration-300 hover:scale-105 transform">
            Shop Now
          </a>
          <a href="Login.jsp" class="bg-secondary hover:bg-blue-500 text-white font-semibold py-3 px-6 rounded-lg transition duration-300 hover:scale-105 transform">
             Upload Prescriptions
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- Banner for New Delivery Agent Registration (Below hero) -->
<section class="bg-primary text-white py-6 px-6 text-center shadow-md max-w-7xl mx-auto rounded-b-lg flex flex-col md:flex-row items-center justify-between gap-4 mt-8 fade-in-up" style="animation-delay: 0.8s;">
  <div class="text-lg md:text-xl font-semibold flex items-center justify-center md:justify-start gap-3">
    <i class="fas fa-truck-fast animate-bounce"></i>
    Looking to become a delivery agent? Join Medico 360 today!
  </div>
  <a href="Dinsert.jsp" 
     class="inline-block bg-accent hover:bg-green-600 text-white font-semibold py-3 px-6 rounded shadow transition duration-300 flex items-center gap-2 hover:scale-105 transform">
    <i class="fas fa-user-plus"></i> Register Now
  </a>
</section>

  <!-- How It Works Section -->
  <section id="how-it-works" class="bg-white py-16 px-4 text-center fade-in-up" style="animation-delay: 1s;">
    <h2 class="text-3xl md:text-4xl font-extrabold text-primary mb-4">How Medico 360 Works</h2>
    <p class="text-lg text-gray-600 mb-12 max-w-2xl mx-auto">
      A simple and secure process to get your medicines delivered to your doorstep.
    </p>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-10 max-w-6xl mx-auto">

      <!-- Step 1 -->
      <div class="flex flex-col items-center hover:scale-105 transform transition duration-300">
        <div class="w-20 h-20 flex items-center justify-center rounded-full bg-secondary text-white text-3xl mb-4 animate-pulse">
          <i class="fas fa-search"></i>
        </div>
        <h3 class="text-xl font-semibold mb-2">Browse Medicines</h3>
        <p class="text-sm text-gray-600">Search or explore from a wide range of verified medical products.</p>
      </div>

      <!-- Step 2 -->
      <div class="flex flex-col items-center hover:scale-105 transform transition duration-300">
        <div class="w-20 h-20 flex items-center justify-center rounded-full bg-secondary text-white text-3xl mb-4 animate-pulse">
          <i class="fas fa-file-medical"></i>
        </div>
        <h3 class="text-xl font-semibold mb-2">Upload Prescription</h3>
        <p class="text-sm text-gray-600">Easily upload your doctor's prescription through our secure system.</p>
      </div>

      <!-- Step 3 -->
      <div class="flex flex-col items-center hover:scale-105 transform transition duration-300">
        <div class="w-20 h-20 flex items-center justify-center rounded-full bg-secondary text-white text-3xl mb-4 animate-pulse">
          <i class="fas fa-cart-plus"></i>
        </div>
        <h3 class="text-xl font-semibold mb-2">Place Order</h3>
        <p class="text-sm text-gray-600">Add medicines to your cart and place an order in just a few clicks.</p>
      </div>

      <!-- Step 4 -->
      <div class="flex flex-col items-center hover:scale-105 transform transition duration-300">
        <div class="w-20 h-20 flex items-center justify-center rounded-full bg-secondary text-white text-3xl mb-4 animate-pulse">
          <i class="fas fa-truck-fast"></i>
        </div>
        <h3 class="text-xl font-semibold mb-2">Get Delivery</h3>
        <p class="text-sm text-gray-600">Relax while we deliver your medicines safely and quickly.</p>
      </div>

    </div>
  </section>

  <!-- Islandwide Delivery Banner Section -->
  <section class="bg-accent text-white py-10 px-6">
    <div class="max-w-5xl mx-auto flex flex-col md:flex-row items-center justify-center gap-6 text-center md:text-left">

      <!-- Image -->
      <div class="flex-shrink-0">
        <img src="https://cdn-icons-png.flaticon.com/512/808/808484.png" alt="Delivery Van" class="w-24 h-24 mx-auto md:mx-0" />
      </div>

      <!-- Text -->
      <div>
        <h3 class="text-2xl font-bold mb-2">Islandwide Delivery Across Sri Lanka</h3>
        <p class="text-sm md:text-base text-white/90">No matter where you are in Sri Lanka, Medico 360 delivers your medications right to your doorstep — fast, safe, and reliable.</p>
      </div>
    </div>
  </section>
  
  <!-- Shop / Featured Products Section -->
  <section id="shop" class="bg-background py-20 px-6 text-center fade-in-up" style="animation-delay: 1.2s;">
  <div class="max-w-6xl mx-auto">
    <h2 class="text-3xl md:text-4xl font-extrabold text-primary mb-6">Featured Products</h2>
    <p class="text-base md:text-lg text-gray-700 mb-12">
      Browse our top-quality medicines, health essentials, and wellness products.
    </p>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8">
      <!-- Product 1 -->
      <div class="bg-white shadow-md rounded-lg p-4 hover:scale-105 transform transition duration-300">
        <img src="images/panadol.jpg" alt="Paracetamol" class="h-40 mx-auto mb-4" />
        <h3 class="text-lg font-semibold mb-2 text-text">Paracetamol 500mg</h3>
        <p class="text-accent font-bold mb-3">Rs. 150</p>
        <a href="Login.jsp" 
           class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded transition duration-300 inline-block">
          Shop
        </a>
      </div>

      <!-- Product 2 -->
      <div class="bg-white shadow-md rounded-lg p-4 hover:scale-105 transform transition duration-300">
        <img src="images/HC007.webp" alt="Vitamin C" class="h-40 mx-auto mb-4" />
        <h3 class="text-lg font-semibold mb-2 text-text">Vitamin C Tablets</h3>
        <p class="text-accent font-bold mb-3">Rs. 890</p>
        <a href="Login.jsp" 
           class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded transition duration-300 inline-block">
          Shop
        </a>
      </div>

      <!-- Product 3 -->
      <div class="bg-white shadow-md rounded-lg p-4 hover:scale-105 transform transition duration-300">
        <img src="images/inhelar.webp" alt="Inhaler" class="h-40 mx-auto mb-4" />
        <h3 class="text-lg font-semibold mb-2 text-text">Asthma Inhaler</h3>
        <p class="text-accent font-bold mb-3">Rs. 1,250</p>
        <a href="Login.jsp" 
           class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded transition duration-300 inline-block">
          Shop
        </a>
      </div>

      <!-- Product 4 -->
      <div class="bg-white shadow-md rounded-lg p-4 hover:scale-105 transform transition duration-300">
        <img src="images/sanitizer.jpg" alt="Hand Sanitizer" class="h-40 mx-auto mb-4" />
        <h3 class="text-lg font-semibold mb-2 text-text">Hand Sanitizer 100ml</h3>
        <p class="text-accent font-bold mb-3">Rs. 320</p>
        <a href="Login.jsp" 
           class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded transition duration-300 inline-block">
          Shop
        </a>
      </div>

      <!-- Product 5 -->
      <div class="bg-white shadow-md rounded-lg p-4 hover:scale-105 transform transition duration-300">
        <img src="images/Thermometer.webp" alt="Thermometer" class="h-40 mx-auto mb-4" />
        <h3 class="text-lg font-semibold mb-2 text-text">Digital Thermometer</h3>
        <p class="text-accent font-bold mb-3">Rs. 980</p>
        <a href="Login.jsp" 
           class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded transition duration-300 inline-block">
          Shop
        </a>
      </div>

      <!-- Product 6 -->
      <div class="bg-white shadow-md rounded-lg p-4 hover:scale-105 transform transition duration-300">
        <img src="images/mask.jpg" alt="Face Mask" class="h-40 mx-auto mb-4" />
        <h3 class="text-lg font-semibold mb-2 text-text">Surgical Face Mask (50 pcs)</h3>
        <p class="text-accent font-bold mb-3">Rs. 750</p>
        <a href="Login.jsp" 
           class="bg-accent hover:bg-green-600 text-white px-4 py-2 rounded transition duration-300 inline-block">
          Shop
        </a>
      </div>
    </div>
  </div>
</section>


  <!-- About Us Section -->
  <section id="about" class="bg-background py-20 px-6 text-center fade-in-up" style="animation-delay: 1.4s;">
    <div class="max-w-6xl mx-auto">
      <h2 class="text-3xl md:text-4xl font-extrabold text-primary mb-6">About Medico 360</h2>

      <p class="text-base md:text-lg text-gray-700 mb-8 leading-relaxed">
        Medico 360 is Sri Lanka’s modern and reliable medical ordering platform, designed to make healthcare simpler, safer, and more accessible. Whether you're in a busy city or a remote village, we deliver quality medicines and health products right to your doorstep — with speed and care.
      </p>

      <p class="text-base md:text-lg text-gray-700 mb-14 leading-relaxed">
        Our mission is to remove barriers to medical access by offering an easy-to-use digital solution that connects people with certified pharmacies. With 24/7 order tracking, pharmacist-approved products, and end-to-end delivery coverage, Medico 360 is your trusted partner in personal health.
      </p>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-left">
        <!-- Highlight 1 -->
        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300">
          <h3 class="text-xl font-semibold text-accent mb-2"><i class="fas fa-clinic-medical mr-2"></i>Certified Pharmacies</h3>
          <p class="text-sm text-gray-600">
            All medicines on our platform are sourced only from licensed, regulated, and certified Sri Lankan pharmacies for maximum safety.
          </p>
        </div>

        <!-- Highlight 2 -->
        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300">
          <h3 class="text-xl font-semibold text-accent mb-2"><i class="fas fa-truck-moving mr-2"></i>Islandwide Coverage</h3>
          <p class="text-sm text-gray-600">
            Medico 360 delivers to all 25 districts in Sri Lanka, from Jaffna to Matara. We believe geography should never be a barrier to health.
          </p>
        </div>

        <!-- Highlight 3 -->
        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300">
          <h3 class="text-xl font-semibold text-accent mb-2"><i class="fas fa-phone-volume mr-2"></i>24/7 Customer Support</h3>
          <p class="text-sm text-gray-600">
            Have a question or concern? Our support team is here around the clock via phone, email, or live chat to assist you instantly.
          </p>
        </div>

        <!-- Highlight 4 -->
        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300">
          <h3 class="text-xl font-semibold text-accent mb-2"><i class="fas fa-capsules mr-2"></i>Genuine Medicines</h3>
          <p class="text-sm text-gray-600">
            We only stock 100% genuine and approved medications. No counterfeit products — ever.
          </p>
        </div>

        <!-- Highlight 5 -->
        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300">
          <h3 class="text-xl font-semibold text-accent mb-2"><i class="fas fa-file-medical mr-2"></i>Easy Prescription Upload</h3>
          <p class="text-sm text-gray-600">
            Simply take a photo of your doctor's prescription and upload it during checkout. We'll handle the rest securely.
          </p>
        </div>

        <!-- Highlight 6 -->
        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300">
          <h3 class="text-xl font-semibold text-accent mb-2"><i class="fas fa-lock mr-2"></i>Secure Payments</h3>
          <p class="text-sm text-gray-600">
            Pay confidently through credit/debit cards, mobile wallets, or cash on delivery. All transactions are encrypted and secure.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- Contact Us Section -->
  <section id="contact" class="bg-white py-20 px-6 text-center fade-in-up" style="animation-delay: 1.6s;">
    <div class="max-w-5xl mx-auto">
      <h2 class="text-3xl md:text-4xl font-extrabold text-primary mb-6">Contact Us</h2>
      <p class="text-base md:text-lg text-gray-700 mb-12">
        Have a question? Need help with your order? We’re here 24/7 to support you.
      </p>

      <!-- Contact Info -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-left text-sm md:text-base text-gray-700">

        <!-- Phone -->
        <div class="flex items-start gap-4">
          <i class="fas fa-phone text-secondary text-xl mt-1"></i>
          <div>
            <p class="font-semibold text-text">Call Us</p>
            <p>+94 77 123 4567</p>
          </div>
        </div>

        <!-- Email -->
        <div class="flex items-start gap-4">
          <i class="fas fa-envelope text-secondary text-xl mt-1"></i>
          <div>
            <p class="font-semibold text-text">Email</p>
            <p>support@medico360.lk</p>
          </div>
        </div>

        <!-- Location -->
        <div class="flex items-start gap-4">
          <i class="fas fa-map-marker-alt text-secondary text-xl mt-1"></i>
          <div>
            <p class="font-semibold text-text">Office Address</p>
            <p>123 Medico Lane, Colombo 01, Sri Lanka</p>
          </div>
        </div>
      </div>

      <!-- Social Icons -->
      <div class="mt-10 flex justify-center gap-6 text-2xl text-secondary">
        <a href="#" class="hover:text-blue-600"><i class="fab fa-facebook"></i></a>
        <a href="#" class="hover:text-green-500"><i class="fab fa-whatsapp"></i></a>
        <a href="#" class="hover:text-pink-500"><i class="fab fa-instagram"></i></a>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-primary text-white py-10 px-6">
    <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left">

      <!-- Brand -->
      <div>
        <h3 class="text-2xl font-bold mb-3">Medico 360</h3>
        <p class="text-sm text-gray-200">Your trusted partner for fast and reliable medical delivery across Sri Lanka.</p>
      </div>

      <!-- Quick Links -->
      <div>
        <h4 class="font-semibold text-lg mb-3">Quick Links</h4>
        <ul class="space-y-2 text-sm">
          <li><a href="home.jsp" class="hover:text-secondary transition">Home</a></li>
          <li><a href="#shop" class="hover:text-secondary transition">Shop</a></li>
          <li><a href="#about" class="hover:text-secondary transition">About Us</a></li>
          <li><a href="#contact" class="hover:text-secondary transition">Contact</a></li>
        </ul>
      </div>

      <!-- Contact Info -->
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

  <!-- Slideshow Script -->
  <script>
    const slides = document.querySelectorAll(".slide");
    let currentSlide = 0;

    setInterval(() => {
      slides[currentSlide].classList.remove("opacity-100");
      slides[currentSlide].classList.add("opacity-0");

      currentSlide = (currentSlide + 1) % slides.length;

      slides[currentSlide].classList.remove("opacity-0");
      slides[currentSlide].classList.add("opacity-100");
    }, 5000);

    const menuBtn = document.getElementById('menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');
    menuBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
  </script>

</body>
</html>

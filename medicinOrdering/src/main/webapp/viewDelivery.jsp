<%@ page import="java.util.*, com.customer.cusDBUtile, com.customer.Order" %>
<%


    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        userId = (String) session.getAttribute("id");
    }
    
    if (userId == null) {
        out.println("Please login first.");
        return;
    }

    List<Order> userOrders = cusDBUtile.getUserOrders(userId);
    List<Map<String, Object>> deliveries = cusDBUtile.getPrescriptionDeliveriesByUserId(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Deliveries - Medico 360</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

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
<body class="bg-background text-text min-h-screen">

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

    <!-- Right: Profile Icon -->
    <div class="hidden md:flex flex-1 justify-end items-center fade-in-down delay-500 relative">
      <button id="profileBtn" class="flex items-center gap-2 text-text hover:text-secondary focus:outline-none" aria-haspopup="true" aria-expanded="false" aria-label="User menu">
        <i class="fas fa-user-circle fa-2x"></i>
        <span class="hidden md:inline font-semibold">${sessionScope.name}</span>
        <i class="fas fa-caret-down"></i>
      </button>

      <div id="profileMenu" class="profile-menu absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-2 ring-1 ring-black ring-opacity-5 z-50">
        <a href="userProfile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-secondary/20 hover:text-secondary transition flex items-center gap-2">
          <i class="fas fa-user"></i> Profile
        </a>
        <form action="logout" method="post" class="m-0">
          <button type="submit" class="w-full text-left px-4 py-2 text-gray-700 hover:bg-red-600 hover:text-white transition flex items-center gap-2">
            <i class="fas fa-sign-out-alt"></i> Logout
          </button>
        </form>
      </div>
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
        <a href="userProfile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-secondary/20 hover:text-secondary transition flex items-center gap-2">
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
    <a href="home.jsp" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-home"></i> Home
    </a>
    <a href="home.jsp#about" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-info-circle"></i> About Us
    </a>
    <a href="#shop" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-store"></i> Shop
    </a>
    <a href="#contact" class="block text-text hover:text-secondary flex items-center gap-2 px-2 py-1 rounded hover:bg-secondary/20">
      <i class="fas fa-envelope"></i> Contact
    </a>
  </div>
</nav>

<section class="max-w-5xl mx-auto px-4 py-10">

  <h2 class="text-3xl font-extrabold text-primary mb-6 text-center flex items-center justify-center gap-3">
    <i class="fas fa-box-open text-secondary"></i> Your Orders
  </h2>

  <c:choose>
    <c:when test="${not empty userOrders}">
      <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-300">
        <table class="min-w-full bg-white rounded-lg">
          <thead class="bg-primary text-white">
            <tr>
              <th class="py-3 px-6 text-left font-semibold"><i class="fas fa-hashtag mr-2"></i> Order ID</th>
              <th class="py-3 px-6 text-left font-semibold"><i class="fas fa-money-bill-wave mr-2"></i> Amount</th>
              <th class="py-3 px-6 text-left font-semibold"><i class="fas fa-truck mr-2"></i> Delivery Status</th>
            </tr>
          </thead>
          <tbody>
            <% for (Order order : userOrders) { %>
              <tr class="border-b border-gray-200 hover:bg-gray-50">
                <td class="py-3 px-6"><i class="fas fa-receipt mr-1 text-secondary"></i> <%= order.getOrderId() %></td>
                <td class="py-3 px-6">Rs. <%= order.getAmount() %></td>
                <td class="py-3 px-6"><%= order.getDeliverStatus() %></td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </c:when>
    
  </c:choose>

  <h2 class="text-3xl font-extrabold text-primary mt-14 mb-6 text-center flex items-center justify-center gap-3">
    <i class="fas fa-prescription-bottle-alt text-secondary"></i> Prescription Delivery Details
  </h2>

  <c:choose>
    <c:when test="${not empty deliveries}">
      <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-300">
        <table class="min-w-full bg-white rounded-lg">
          <thead class="bg-primary text-white">
            <tr>
              <th class="py-3 px-6 text-left font-semibold"><i class="fas fa-prescription-bottle mr-2"></i> Prescription ID</th>
              <th class="py-3 px-6 text-left font-semibold"><i class="fas fa-money-check-alt mr-2"></i> Amount</th>
              <th class="py-3 px-6 text-left font-semibold"><i class="fas fa-shipping-fast mr-2"></i> Delivery Status</th>
            </tr>
          </thead>
          <tbody>
            <% for (Map<String, Object> delivery : deliveries) { %>
              <tr class="border-b border-gray-200 hover:bg-gray-50">
                <td class="py-3 px-6"><%= delivery.get("presID") %></td>
                <td class="py-3 px-6">Rs. <%= delivery.get("amount") %></td>
                <td class="py-3 px-6"><%= delivery.get("Dstatus") %></td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </c:when>
    
  </c:choose>

  <!-- Back to Profile Button -->
  <div class="mt-12 text-center">
    <a href="userProfile.jsp" 
       class="inline-block bg-secondary hover:bg-blue-700 text-white px-8 py-3 rounded shadow font-semibold transition duration-300 flex items-center justify-center gap-2">
      <i class="fas fa-arrow-left"></i> Back to Profile
    </a>
  </div>

</section>

<script>
  // Navbar mobile menu toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  if(menuBtn){
    menuBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
  }

  // Profile menu toggle
  const profileBtn = document.getElementById('profileBtn');
  const profileMenu = document.getElementById('profileMenu');

  if(profileBtn){
    profileBtn.addEventListener('click', (e) => {
      e.stopPropagation();
      profileMenu.classList.toggle('show');
      const expanded = profileBtn.getAttribute('aria-expanded') === 'true';
      profileBtn.setAttribute('aria-expanded', !expanded);
    });
  }

  // Mobile profile menu toggle
  const mobileProfileBtn = document.getElementById('mobileProfileBtn');
  const mobileProfileMenu = document.getElementById('mobileProfileMenu');

  if(mobileProfileBtn){
    mobileProfileBtn.addEventListener('click', (e) => {
      e.stopPropagation();
      mobileProfileMenu.classList.toggle('show');
    });
  }

  // Close dropdowns when clicking outside
  window.addEventListener('click', () => {
    if(profileMenu) profileMenu.classList.remove('show');
    if(profileBtn) profileBtn.setAttribute('aria-expanded', 'false');
    if(mobileProfileMenu) mobileProfileMenu.classList.remove('show');
  });
</script>

</body>
</html>

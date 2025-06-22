<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.Auser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

		
    if (request.getAttribute("userList") == null) {
        response.sendRedirect("UserListServlet");
        return;
    }
    int maxEmployees = 20; // example max total employees
    int totalEmployees = ((List<Auser>)request.getAttribute("userList")).size();
    int activeStaff = 3; // example active staff number, replace with dynamic data if available

    int totalEmpPercent = (int) ((totalEmployees / (double) maxEmployees) * 100);
    totalEmpPercent = totalEmpPercent > 100 ? 100 : totalEmpPercent;

    int activeStaffPercent = (int) ((activeStaff / (double) maxEmployees) * 100);
    activeStaffPercent = activeStaffPercent > 100 ? 100 : activeStaffPercent;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Employee Management Dashboard - Medico 360</title>

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

  <div class="max-w-7xl mx-auto p-6">

    <!-- Header & Logout -->
    <div class="flex flex-col md:flex-row justify-between items-center mb-10 gap-6">
      <h1 class="text-4xl font-extrabold text-primary flex items-center gap-3 whitespace-nowrap">
        <i class="fas fa-users-cog text-secondary"></i>
        Employee Management Dashboard
      </h1>
      <form action="logout" method="post" class="w-full md:w-auto">
        <button type="submit" 
                class="w-full md:w-auto bg-red-600 hover:bg-red-700 text-white px-6 py-3 rounded shadow font-semibold transition duration-300 flex items-center justify-center gap-2">
          <i class="fas fa-sign-out-alt"></i> Log Out
        </button>
      </form>
    </div>

    <!-- Actions -->
    <div class="flex flex-wrap gap-4 mb-10 justify-center md:justify-start">
      <form action="Auserinsert.jsp" method="get" class="flex-1 min-w-[220px] md:min-w-[auto]">
        <button id="openAddUserModalBtn" type="button"
                class="w-full bg-accent hover:bg-green-600 text-white px-6 py-3 rounded shadow font-semibold transition duration-300 flex items-center justify-center gap-3">
          <i class="fas fa-user-plus"></i> Add Employee
        </button>
      </form>
      <form action="ACustomerListServlet" method="post" class="flex-1 min-w-[220px] md:min-w-[auto]">
        <button type="submit" 
                class="w-full bg-secondary hover:bg-blue-700 text-white px-6 py-3 rounded shadow font-semibold transition duration-300 flex items-center justify-center gap-3">
          <i class="fas fa-users"></i> Customer Management
        </button>
      </form>
    </div>

    <!-- Summary with progress bars -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 mb-12">

      <!-- Total Employees -->
      <div class="bg-white rounded-lg shadow-lg p-8 flex flex-col items-center">
        <p class="text-gray-600 mb-3 text-lg font-semibold tracking-wide">Total Employees</p>
        <p class="text-4xl font-extrabold text-primary mb-6"><%= totalEmployees %></p>
        <div class="w-full bg-gray-200 rounded-full h-5 shadow-inner" title="<%= totalEmpPercent %>%">
          <div 
            class="bg-accent h-5 rounded-full transition-all duration-700 shadow-md" 
            style="width: <%= totalEmpPercent %>%;"></div>
        </div>
      </div>

      <!-- Active Staff -->
      <div class="bg-white rounded-lg shadow-lg p-8 flex flex-col items-center">
        <p class="text-gray-600 mb-3 text-lg font-semibold tracking-wide">Active Staff</p>
        <p class="text-4xl font-extrabold text-primary mb-6"><%= activeStaff %></p>
        <div class="w-full bg-gray-200 rounded-full h-5 shadow-inner" title="<%= activeStaffPercent %>%">
          <div 
            class="bg-secondary h-5 rounded-full transition-all duration-700 shadow-md" 
            style="width: <%= activeStaffPercent %>%;"></div>
        </div>
      </div>

    </div>

    <!-- Employee Table -->
    <div class="overflow-x-auto bg-white rounded-lg shadow-lg">
      <table class="min-w-full border-collapse border border-gray-300">
        <thead class="bg-primary text-white">
          <tr>
            <th class="py-3 px-6 text-left font-semibold">Employee ID</th>
            <th class="py-3 px-6 text-left font-semibold">Name</th>
            <th class="py-3 px-6 text-left font-semibold">Email</th>
            <th class="py-3 px-6 text-left font-semibold">Contact Number</th>
            <th class="py-3 px-6 text-center font-semibold">Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="user" items="${userList}">
            <tr class="border-b border-gray-200 hover:bg-gray-50">
              <td class="py-3 px-6">${user.pharmacistID}</td>
              <td class="py-3 px-6">${user.name}</td>
              <td class="py-3 px-6">${user.email}</td>
              <td class="py-3 px-6">${user.contactnumber}</td>
              <td class="py-3 px-6 text-center space-x-2">
                <button type="button"
                  class="inline-block bg-secondary hover:bg-blue-700 text-white px-3 py-1 rounded shadow transition font-semibold"
                  title="Edit Employee"
                  onclick="openEditModal('${user.pharmacistID}', '${user.password}', '${user.name}', '${user.email}', '${user.contactnumber}')">
                  <i class="fas fa-edit"></i>
                </button>
                <form action="ADeleteuserServlet" method="post" class="inline" onsubmit="return confirm('Are you sure you want to delete this employee?');">
                  <input type="hidden" name="pharmacistID" value="${user.pharmacistID}" />
                  <button type="submit" 
                          class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded shadow transition font-semibold" 
                          title="Delete Employee">
                    <i class="fas fa-trash"></i>
                  </button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

  </div>

  <!-- Add Employee Modal -->
  <div id="addUserModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6 relative">

      <!-- Close Button -->
      <button id="closeAddUserModalBtn" class="absolute top-3 right-3 text-gray-600 hover:text-gray-900 text-3xl font-bold">&times;</button>

      <h2 class="text-2xl font-bold text-primary mb-6 text-center flex items-center gap-3">
        <i class="fas fa-user-plus text-secondary"></i> Create Employee
      </h2>

      <!-- Error Message Display -->
      <c:if test="${not empty errorMsg}">
        <div class="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded">
          <i class="fas fa-exclamation-triangle"></i> ${errorMsg}
        </div>
      </c:if>

      <form action="Auserinsert" method="post" class="space-y-4">
        <div>
          <label for="pharmacistID" class="block mb-1 font-semibold">Pharmacist ID</label>
          <input type="text" id="pharmacistID" name="pharmacistID" required
                 value="${pharmacistID != null ? pharmacistID : ''}"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="password" class="block mb-1 font-semibold">Password</label>
          <input type="password" id="password" name="password" required
                 value="${password != null ? password : ''}"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="name" class="block mb-1 font-semibold">Name</label>
          <input type="text" id="name" name="name" required
                 value="${name != null ? name : ''}"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="email" class="block mb-1 font-semibold">Email</label>
          <input type="email" id="email" name="email" required
                 value="${email != null ? email : ''}"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="contactnumber" class="block mb-1 font-semibold">Phone Number</label>
          <input type="text" id="contactnumber" name="contactnumber" required
                 value="${contactnumber != null ? contactnumber : ''}"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>

        <button type="submit" class="w-full bg-accent hover:bg-green-600 text-white p-3 rounded font-semibold transition duration-300">
          Create User
        </button>
      </form>

    </div>
  </div>

  <!-- Edit Employee Modal -->
  <div id="editUserModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6 relative">

      <!-- Close Button -->
      <button id="closeEditUserModalBtn" class="absolute top-3 right-3 text-gray-600 hover:text-gray-900 text-3xl font-bold">&times;</button>

      <h2 class="text-2xl font-bold text-primary mb-6 text-center flex items-center gap-3">
        <i class="fas fa-user-edit text-secondary"></i> Edit Employee
      </h2>

      <form action="AUpdateUserServlet" method="post" class="space-y-4" id="editUserForm">
        <div>
          <label for="editPharmacistID" class="block mb-1 font-semibold">Pharmacist ID</label>
          <input type="text" id="editPharmacistID" name="pharmacistID" readonly
                 class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed" />
        </div>
        <div>
          <label for="editPassword" class="block mb-1 font-semibold">Password</label>
          <input type="password" id="editPassword" name="password"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="editName" class="block mb-1 font-semibold">Name</label>
          <input type="text" id="editName" name="name"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="editEmail" class="block mb-1 font-semibold">Email</label>
          <input type="email" id="editEmail" name="email"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>
        <div>
          <label for="editContactnumber" class="block mb-1 font-semibold">Phone Number</label>
          <input type="text" id="editContactnumber" name="contactnumber"
                 class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-accent" />
        </div>

        <button type="submit" class="w-full bg-secondary hover:bg-blue-700 text-white p-3 rounded font-semibold transition duration-300">
          Update Employee
        </button>
      </form>

    </div>
  </div>

  <script>
    // Open Add User Modal
    const openAddUserModalBtn = document.getElementById('openAddUserModalBtn');
    const addUserModal = document.getElementById('addUserModal');
    const closeAddUserModalBtn = document.getElementById('closeAddUserModalBtn');

    openAddUserModalBtn.addEventListener('click', () => {
      addUserModal.classList.remove('hidden');
      addUserModal.classList.add('flex');
    });
    closeAddUserModalBtn.addEventListener('click', () => {
      addUserModal.classList.add('hidden');
      addUserModal.classList.remove('flex');
    });
    addUserModal.addEventListener('click', (e) => {
      if (e.target === addUserModal) {
        addUserModal.classList.add('hidden');
        addUserModal.classList.remove('flex');
      }
    });

    // Open Edit User Modal with data filled
    const editUserModal = document.getElementById('editUserModal');
    const closeEditUserModalBtn = document.getElementById('closeEditUserModalBtn');

    function openEditModal(pharmacistID, password, name, email, contactnumber) {
      document.getElementById('editPharmacistID').value = pharmacistID;
      document.getElementById('editPassword').value = password;
      document.getElementById('editName').value = name;
      document.getElementById('editEmail').value = email;
      document.getElementById('editContactnumber').value = contactnumber;

      editUserModal.classList.remove('hidden');
      editUserModal.classList.add('flex');
    }

    closeEditUserModalBtn.addEventListener('click', () => {
      editUserModal.classList.add('hidden');
      editUserModal.classList.remove('flex');
    });

    editUserModal.addEventListener('click', (e) => {
      if (e.target === editUserModal) {
        editUserModal.classList.add('hidden');
        editUserModal.classList.remove('flex');
      }
    });

    // Check if there's an error message and open the modal
    <c:if test="${not empty errorMsg}">
      document.addEventListener('DOMContentLoaded', function() {
        addUserModal.classList.remove('hidden');
        addUserModal.classList.add('flex');
      });
    </c:if>
  </script>

</body>
</html>
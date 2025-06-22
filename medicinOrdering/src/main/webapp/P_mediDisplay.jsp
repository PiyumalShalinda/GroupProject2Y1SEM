<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.pharmacist.medicine" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>View Product Details - Medico 360</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-background text-text min-h-screen">

<section class="max-w-7xl mx-auto p-6">

  <h1 class="text-3xl font-extrabold text-primary mb-6 flex items-center gap-3">
    <i class="fas fa-pills text-secondary"></i> All Medicine Details
  </h1>

  <% String success = (String) request.getAttribute("success"); %>
  <c:if test="${not empty success}">
    <p class="text-green-600 font-semibold mb-6 text-lg">${success}</p>
  </c:if>

  <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-300">
    <table class="min-w-full bg-white rounded-lg">
      <thead class="bg-primary text-white">
        <tr>
          <th class="py-3 px-4 text-left font-semibold">ID</th>
          <th class="py-3 px-4 text-left font-semibold">Name</th>
          <th class="py-3 px-4 text-left font-semibold">Description</th>
          <th class="py-3 px-4 text-left font-semibold">Benefits</th>
          <th class="py-3 px-4 text-left font-semibold">Ingredients</th>
          <th class="py-3 px-4 text-center font-semibold">Quantity</th>
          <th class="py-3 px-4 text-right font-semibold">Price</th>
          <th class="py-3 px-4 text-center font-semibold">Image</th>
          <th class="py-3 px-4 text-left font-semibold">Pharmacist ID</th>
          <th class="py-3 px-4 text-center font-semibold">Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<medicine> medList = (List<medicine>) request.getAttribute("medList");
          if (medList != null) {
            for (medicine m : medList) {
        %>
        <tr class="border-b border-gray-200 hover:bg-gray-50">
          <td class="py-2 px-4"><%= m.getMedID() %></td>
          <td class="py-2 px-4"><%= m.getMedName() %></td>
          <td class="py-2 px-4"><%= m.getMedDesc() %></td>
          <td class="py-2 px-4"><%= m.getMedBenefits() %></td>
          <td class="py-2 px-4"><%= m.getMedIng() %></td>
          <td class="py-2 px-4 text-center"><%= m.getMedQty() %></td>
          <td class="py-2 px-4 text-right">Rs. <%= String.format("%.2f", m.getMedPrice()) %></td>
          <td class="py-2 px-4 text-center">
            <img src="images/<%= m.getMedImage() %>" alt="Medicine Image" class="mx-auto w-20 h-20 object-cover rounded-md shadow" />
          </td>
          <td class="py-2 px-4"><%= m.getPharmacistId() %></td>
          <td class="py-2 px-4 text-center space-x-2">
            <!-- Edit button triggers modal -->
            <button
              class="bg-secondary hover:bg-blue-700 text-white px-3 py-1 rounded shadow transition font-semibold inline-flex items-center gap-1"
              onclick="openEditModal('<%= m.getMedID() %>', '<%= m.getMedName().replace("'", "\\'") %>', '<%= m.getMedDesc().replace("'", "\\'") %>', '<%= m.getMedBenefits().replace("'", "\\'") %>', '<%= m.getMedIng().replace("'", "\\'") %>', '<%= m.getMedQty() %>', '<%= m.getMedPrice() %>', '<%= m.getMedImage() %>')">
              <i class="fas fa-edit"></i> Edit
            </button>
            <form action="P_DeleteMedicineServlet" method="post" class="inline" 
              onsubmit="return confirm('Are you sure you want to delete this product?');">
              <input type="hidden" name="medID" value="<%= m.getMedID() %>" />
              <button type="submit" 
                class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded shadow transition font-semibold inline-flex items-center gap-1">
                <i class="fas fa-trash"></i> Delete
              </button>
            </form>
          </td>
        </tr>
        <%
            }
          } else {
        %>
        <tr>
          <td colspan="10" class="py-6 text-center text-gray-500 italic">No medicine records found.</td>
        </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>

  <div class="mt-8 text-center">
    <button onclick="window.location.href='P_account.jsp'" 
      class="bg-secondary hover:bg-blue-700 text-white px-6 py-3 rounded shadow font-semibold transition duration-300 inline-flex items-center justify-center gap-2">
      <i class="fas fa-arrow-left"></i> Back to Account
    </button>
  </div>

</section>

<!-- Edit Medicine Modal -->
<div id="editMedicineModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg max-w-3xl w-full p-8 relative">

    <!-- Close Button -->
    <button id="closeEditModalBtn" 
            class="absolute top-3 right-4 text-gray-600 hover:text-gray-900 text-3xl font-bold">&times;</button>

    <h2 class="text-3xl font-extrabold text-primary mb-6 flex items-center gap-3">
      <i class="fas fa-edit text-secondary"></i> Edit Medicine Details
    </h2>

    <form id="editMedicineForm" action="P_UpdateMedicineServlet" method="post" class="space-y-6">

      <input type="hidden" id="medID" name="medID" />

      <div class="flex items-center gap-6">
        <label for="medName" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-capsules text-secondary"></i> Name
        </label>
        <input type="text" id="medName" name="medName" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex items-center gap-6">
        <label for="medDesc" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-file-alt text-secondary"></i> Description
        </label>
        <input type="text" id="medDesc" name="medDesc" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex items-center gap-6">
        <label for="medBenefits" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-heartbeat text-secondary"></i> Benefits
        </label>
        <input type="text" id="medBenefits" name="medBenefits" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex items-center gap-6">
        <label for="medIng" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-flask text-secondary"></i> Ingredients
        </label>
        <input type="text" id="medIng" name="medIng" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex items-center gap-6">
        <label for="medQty" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-boxes text-secondary"></i> Quantity
        </label>
        <input type="number" id="medQty" name="medQty" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex items-center gap-6">
        <label for="medPrice" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-dollar-sign text-secondary"></i> Price
        </label>
        <input type="number" step="0.01" id="medPrice" name="medPrice" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="flex items-center gap-6">
        <label for="medImage" class="w-40 font-semibold text-text flex items-center gap-2">
          <i class="fas fa-image text-secondary"></i> Image Filename
        </label>
        <input type="text" id="medImage" name="medImage" required
               class="flex-1 p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-accent text-gray-700" />
      </div>

      <div class="pt-6">
        <button type="submit"
                class="w-full bg-accent hover:bg-green-600 text-white p-4 rounded-md font-semibold transition duration-300 cursor-pointer flex items-center justify-center gap-3">
          <i class="fas fa-check"></i> Update Product
        </button>
      </div>

    </form>
  </div>
</div>

<script>
  // Get modal and close button
  const editModal = document.getElementById('editMedicineModal');
  const closeEditBtn = document.getElementById('closeEditModalBtn');

  // Open modal and populate form with data
  function openEditModal(id, name, desc, benefits, ing, qty, price, image) {
    document.getElementById('medID').value = id;
    document.getElementById('medName').value = name;
    document.getElementById('medDesc').value = desc;
    document.getElementById('medBenefits').value = benefits;
    document.getElementById('medIng').value = ing;
    document.getElementById('medQty').value = qty;
    document.getElementById('medPrice').value = price;
    document.getElementById('medImage').value = image;

    editModal.classList.remove('hidden');
    editModal.classList.add('flex');
  }

  // Close modal
  closeEditBtn.addEventListener('click', () => {
    editModal.classList.add('hidden');
    editModal.classList.remove('flex');
  });

  // Close modal when clicking outside modal content
  editModal.addEventListener('click', (e) => {
    if (e.target === editModal) {
      editModal.classList.add('hidden');
      editModal.classList.remove('flex');
    }
  });
</script>

</body>
</html>

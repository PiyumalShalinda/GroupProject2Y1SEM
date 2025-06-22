<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Delete Agent Account - Medico 360</title>

<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Tailwind config to add custom colors -->
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

</head>
<body class="bg-background text-text min-h-screen flex items-center justify-center p-6 font-sans">

<%
    String agentID = request.getParameter("agentID");
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
%>

<div class="bg-white rounded-lg shadow-lg max-w-md w-full p-8">
  <h1 class="text-3xl font-bold text-primary mb-6 flex items-center gap-3">
    <i class="fas fa-user-slash text-red-600"></i> Delete Agent Account
  </h1>

  <form action="Ddeleteagentservlet" method="post" class="space-y-5">

    <div>
      <label for="agentID" class="block text-sm font-semibold mb-1">Agent ID</label>
      <input type="text" name="agentID" id="agentID" value="<%= agentID %>" readonly
        class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed text-gray-700" />
    </div>

    <div>
      <label for="username" class="block text-sm font-semibold mb-1">Username</label>
      <input type="text" name="username" id="username" value="<%= username %>" readonly
        class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed text-gray-700" />
    </div>

    <div>
      <label for="name" class="block text-sm font-semibold mb-1">Name</label>
      <input type="text" name="name" id="name" value="<%= name %>" readonly
        class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed text-gray-700" />
    </div>

    <div>
      <label for="email" class="block text-sm font-semibold mb-1">Email</label>
      <input type="email" name="email" id="email" value="<%= email %>" readonly
        class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed text-gray-700" />
    </div>

    <div>
      <label for="phone" class="block text-sm font-semibold mb-1">Contact Number</label>
      <input type="text" name="phone" id="phone" value="<%= phone %>" readonly
        class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed text-gray-700" />
    </div>

    <div>
      <label for="password" class="block text-sm font-semibold mb-1">Password</label>
      <input type="password" name="password" id="password" value="<%= password %>" readonly
        class="w-full p-2 border border-gray-300 rounded bg-gray-100 cursor-not-allowed text-gray-700" />
    </div>

    <button type="submit"
      class="w-full flex justify-center items-center gap-3 bg-red-600 hover:bg-red-700 text-white py-3 rounded font-semibold transition duration-300">
      <i class="fas fa-trash-alt"></i> Delete My Account
    </button>

  </form>
</div>

</body>
</html>

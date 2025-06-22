<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Customer Account Delete</h1>

	<%
	
		String pharmacistID= request.getParameter("pharmacistID");
	    String password= request.getParameter("password");
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String contactnumber= request.getParameter("contactnumber");
		
	%>
	
	<form action="ADeleteuserServlet" method ="post">
		Employee ID <input type ="text" name = "pharmacistID" value="<%=pharmacistID%>"readonly><br>
		Name <input type ="text" name = "name" value="<%=name%>"readonly><br>
		Email <input type ="text" name = "email" value="<%=email%>"readonly><br>
		Phone Number <input type ="text" name = "contactnumber" value="<%=contactnumber%>"readonly><br>
		
	
		<input type="submit" name ="submit" value="Delete Account"><br>
	
	</form>

</body>
</html>
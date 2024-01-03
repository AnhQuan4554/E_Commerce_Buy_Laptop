<%@page import="DAO.UserDao"%>
<%@page import="Model.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        UserDao ud = new UserDao();
        String currentEmail = auth.getEmail();
        User currentUser = ud.getUser(currentEmail);
        request.setAttribute("currentUser", currentUser);
    } else {
        response.sendRedirect("login_require.jsp");
    }
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Update User Information</title>
    <style>
      /* CSS styles */
      /* body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
      } */

      body {
        font-family: "Roboto",sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 400px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #1e88e5;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #1565c0;
        }
    </style>
    <script>
      function validateForm() {
        var name = document.getElementById('name').value;
        var email = document.getElementById('email').value;
        var phone = document.getElementById('phone').value;
        var birthday = document.getElementById('birthday').value;
        var address = document.getElementById('address').value;

        // Basic non-empty validation
        if (!name || !email || !phone || !birthday || !address) {
          alert('Please fill in all fields.');
          return false;
        }

        // Email format validation
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
          alert('Please enter a valid email address.');
          return false;
        }

        // Birthday format validation (YYYY-MM-DD)
        var birthdayRegex = /^\d{4}-\d{2}-\d{2}$/;
        if (!birthdayRegex.test(birthday)) {
          alert('Please enter a valid birthday in the format YYYY-MM-DD.');
          return false;
        }

        // Additional custom validations can be added here...

        // If all validations pass, confirm the update
        return confirm('Are you sure you want to update your information?');
      }
    </script>
  </head>
  <body>

    <%@include file="/includes/navbar.jsp"%>

    <form action="/updateUser" method="POST" onsubmit="return validateForm()">
      <h1>USER INFORMATION</h1>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${currentUser.getName()}" />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" value="${currentUser.getEmail()}" />
      
      <label for="phone">Phone:</label>
      <input type="text" id="phone" name="phone" value="${currentUser.getPhone()}" />
      
      <label for="birthday">Birthday:</label>
      <input type="text" id="birthday" name="birthday" value="${currentUser.getBirthday()}" />
      
      <label for="address">Address:</label>
      <input type="text" id="address" name="address" value="${currentUser.getAddress()}" />

      <input type="submit" value="Update" />
    </form>
  </body>
  <%@include file="/includes/footer.jsp"%>
</html>

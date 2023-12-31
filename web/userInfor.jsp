<%@page import="DAO.UserDao"%>
<%@page import="Model.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
      }

      form {
        width: 300px;
        padding: 20px;
        border: 2px solid #333;
        border-radius: 5px;
        background-color: #f2f2f2;
      }

      input[type="text"],
      input[type="email"] {
        width: calc(100% - 20px);
        margin-bottom: 10px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }

      input[type="submit"] {
        width: 100%;
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: all 0.3s ease;
      }

      input[type="submit"]:hover {
        background-color: #45a049;
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
    <form action="/updateUser" method="POST" onsubmit="return validateForm()">
      <h1>User Information</h1>
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
</html>

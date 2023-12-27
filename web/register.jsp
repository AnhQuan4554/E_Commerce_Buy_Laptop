<%-- 
    Document   : register
    Created on : Dec 4, 2023, 1:15:08 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h2>Registration Form</h2>
            <form action="user-register" method="post">
                 <div class="input-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= (request.getParameter("name") != null) ? request.getParameter("name") : "" %>" required>
                </div>
                <div class="input-group">
                    <label for="birthday">Birthday:</label>
                    <input type="text" id="birthday" name="birthday" value="<%= (request.getParameter("birthday") != null) ? request.getParameter("birthday") : "" %>" required>
                </div>
                <div class="input-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= (request.getParameter("email") != null) ? request.getParameter("email") : "" %>" required>
                </div>
                <div class="input-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="<%= (request.getParameter("address") != null) ? request.getParameter("address") : "" %>" required>
                </div>
                <div class="input-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="<%= (request.getParameter("password") != null) ? request.getParameter("password") : "" %>" required>
                </div>
                <div class="input-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" value="<%= (request.getParameter("confirmPassword") != null) ? request.getParameter("confirmPassword") : "" %>" required>
                </div>
                 <!-- Thêm code sau form để hiển thị thông báo lỗi -->
                <% String errorMessage1 = (String) request.getAttribute("errorMessage1"); %>
                <% if (errorMessage1 != null) { %>
                <p style="color: red;"><%= errorMessage1 %></p>
                <% } %>
                <div class="input-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= (request.getParameter("phone") != null) ? request.getParameter("phone") : "" %>" required>
                </div>
               
                <!-- Thêm code sau form để hiển thị thông báo lỗi -->
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                <p style="color: red;"><%= errorMessage %></p>
                <% } %>

                <div class="input-group">
                    <button type="submit">Register</button>
                    <a href="login.jsp" class="btn btn-primary">Login</a>
                </div>
            </form>
        </div>
    </body>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 10px);
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        a {
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</html>

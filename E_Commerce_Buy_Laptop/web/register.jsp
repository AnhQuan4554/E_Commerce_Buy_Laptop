<%@page import="Model.*"%> <%@page import="java.util.*"%> <%@ page
language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>JSP Page</title>
    <style>
      body {
        font-family: "Roboto", sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
      }

      .container-regis {
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
      }

      h2 {
        text-align: center;
        color: #333;
      }

      .input-group2 {
        margin-bottom: 15px;
      }
      .input-group21 {
        margin-top: 15px;
        display: flex;
        justify-content: center;
      }
      label {
        display: block;
        margin-bottom: 5px;
        color: #666;
      }

      input[type="text"],
      input[type="email"],
      input[type="password"] {
        width: calc(100% - 20px);
        padding: 10px;
        border-radius: 3px;
        border: 1px solid #ccc;
      }
      input:focus {
        color: #495057;
        background-color: #fff;
        border-color: #80bdff;
        outline: 0;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
      }
      button {
        padding: 10px 20px;
        background-color: #3498db;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 18px;
      }
      .login-button {
        padding: 10px 20px;
        background-color: #3498db;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        text-decoration: none;
        font-size: 18px;
      }
      /* a {
                padding: 10px 20px;
                background-color: #3498db;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                text-decoration: none;
            } */

      button:hover {
        background-color: #2980b9;
      }
      .login-button:hover {
        background-color: #2980b9;
        text-decoration: none;
        color: #fff;
      }
    </style>
  </head>
  <body>
    <div class="container-regis">
      <h2>REGISTRATION FORM</h2>
      <form action="user-register" method="post">
        <div class="input-group2">
          <label for="name">Full Name:</label>
          <input type="text" id="name" name="name" value="<%=
          (request.getParameter("name") != null) ? request.getParameter("name")
          : "" %>" required>
        </div>
        <div class="input-group2">
          <label for="address">Address:</label>
          <input type="text" id="address" name="address" value="<%=
          (request.getParameter("address") != null) ?
          request.getParameter("address") : "" %>" required>
        </div>
        <div class="input-group2">
          <label for="phone">Phone Number:</label>
          <input type="text" id="phone" name="phone" value="<%=
          (request.getParameter("phone") != null) ?
          request.getParameter("phone") : "" %>" required>
        </div>
        <div class="input-group2">
          <label for="birthday">Birthday:</label>
          <input type="text" id="birthday" name="birthday" value="<%=
          (request.getParameter("birthday") != null) ?
          request.getParameter("birthday") : "" %>" required>
        </div>
        <div class="input-group2">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" value="<%=
          (request.getParameter("email") != null) ?
          request.getParameter("email") : "" %>" required>
        </div>

        <div class="input-group2">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" value="<%=
          (request.getParameter("password") != null) ?
          request.getParameter("password") : "" %>" required>
        </div>
        <div class="input-group2">
          <label for="confirmPassword">Confirm Password:</label>
          <input type="password" id="confirmPassword" name="confirmPassword"
          value="<%= (request.getParameter("confirmPassword") != null) ?
          request.getParameter("confirmPassword") : "" %>" required>
        </div>
        <!-- Thêm code sau form để hiển thị thông báo lỗi -->
        <% String errorMessage1 = (String)
        request.getAttribute("errorMessage1"); %> <% if (errorMessage1 != null)
        { %>
        <p style="color: red"><%= errorMessage1 %></p>
        <% } %>

        <!-- Thêm code sau form để hiển thị thông báo lỗi -->
        <% String errorMessage = (String) request.getAttribute("errorMessage");
        %> <% if (errorMessage != null) { %>
        <p style="color: red"><%= errorMessage %></p>
        <% } %>

        <div class="input-group21">
          <button type="submit">Register</button>&nbsp;
          <a href="login.jsp" class="login-button">Login</a>
        </div>
      </form>
    </div>
    <%@include file="/includes/footer.jsp"%>
  </body>
</html>

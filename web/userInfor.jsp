<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

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
  </head>
  <body>
    <form action="/update-user" method="post">
      <h1>User Information</h1>
      <label for="name">name:</label>
      <input type="text" id="name" name="name" value="JohnDoe" readonly />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" value="johndoe@example.com" />
      <label for="phone">phone:</label>
      <input type="text" id="phone" name="phone" value="johndoe@example.com" />
      <label for="birthday">birthday:</label>
      <input
        type="text"
        id="birthday"
        name="birthday"
        value="johndoe@example.com"
      />
      <label for="address">address:</label>
      <input
        type="text"
        id="address"
        name="address"
        value="johndoe@example.com"
      />

      <input type="submit" value="Update" />
    </form>
  </body>
</html>

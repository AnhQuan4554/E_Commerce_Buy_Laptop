<%-- 
    Document   : admin_add_product
    Created on : Dec 5, 2023, 7:46:45 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Add Product</title>
          <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        
        input[type="text"],
        input[type="number"],
        input[type="file"] {
            width: calc(100% - 10px);
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
    </head>
  <body>
    <h2>Add Product</h2>
    <form action="admin-add-product" method="post" enctype="multipart/form-data">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required><br>
        
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required><br>
        
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" required><br>
        
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" required><br>
        
        <input type="submit" value="Add Product">
    </form>
</body>
</html>

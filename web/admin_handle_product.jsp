<%-- 
    Document   : admin_handle_product
    Created on : Dec 12, 2023, 12:35:38 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css"/>
          <style>
            .form-select-input {
                padding: 4px 8px;
                margin-left: 8px;
                flex-grow: 1;
                font-family: inherit;
                font-size: 16px;
                padding: 4px 8px;
                outline: none;
                border: 1px solid #141E46;
                margin-left: 8px;
            }
        </style>
    </head>
    
    <body>
        <h1>${title}</h1>
        <form action="/${action}" method="POST" class="form" enctype="multipart/form-data">
            <div class="form-control">
                <label for="productID" class="form-label">Id:</label>
                <input type="number" name="idProduct" id="Masv" class="form-input"  required="true"  value="${product.getId()}" >
            </div>
            <div class="form-control">
                <label for="firstName" class="form-label">Name Product:</label>
                <input type="text" name="nameProduct" id="HoTen" class="form-input" required="true" value="${product.getName()}">
            </div>
            <div class="form-control">
                <label for="lastName" class="form-label">Price: </label>
                <input type="text" name="priceProduct" id="NgaySinh" class="form-input"  required="true" value="${product.getPrice()}" >
            </div>

            <div class="form-control">
                <label for="lastName" class="form-label">Category: </label>
                <input type="text" name="category" id="NgaySinh" class="form-input"  required="true" value="${product.getCategory()}">
            </div>

            <div class="form-control">
                <label for="image" class="form-label">Image: </label>
                <input type="file" name="imageProduct" id="image" class="form-input"  required="true" >
            </div>


            <button type="submit" class="form-btn submit-btn">${title}</button>
        </form>

    </body>
</html>

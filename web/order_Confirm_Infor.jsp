<%-- 
    Document   : Order_Confirm_Infor
    Created on : May 31, 2024, 7:22:45 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DbCon"%>
<%@page import="DAO.OrderDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <a href="cart.jsp"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <style>
        .product-img-des {
            display: flex;
            align-items: flex-start;
            align-items: center;
        }
        .product-img-des img {
            max-width: 150px; /* Adjust the size as needed */
            margin-right: 20px;
        }
        .order-info-textarea {
            flex: 1;
        }
    </style>
    </head>
    <body>
      <div class="container">
        <h2 class="mt-4">Order Form</h2>
      <div class="container">
<form action="order-now" method="post">
  <div class="form-group" style="display: none">
    <input
      value=${productDetail.id}
      type="text"
      class="form-control"
      id="productId"
      name="productId"
      style="display: none"
     
    />
  </div>

  <div class="form-group">
    <label for="recipientName">Recipient Name</label>
    <input
      type="text"
      class="form-control"
      id="recipientName"
      name="recipientName"
      placeholder="Enter recipient's name"
    />
  </div>
  <div class="form-group">
    <label for="phoneNumber">Phone Number</label>
    <input
      type="tel"
      class="form-control"
      id="phoneNumber"
      name="phoneNumber"
      placeholder="Enter phone number"
    />
  </div>
  <div class="form-group">
    <label for="address">Address</label>
    <textarea
      class="form-control"
      id="address"
      name="address"
      rows="3"
      placeholder="Enter address"
    ></textarea>
  </div>
    <div class="form-group" >
                <label for="orderInfo">Order Information</label>
                <div class="product-img-des">
                    <img src="product-image/${productDetail.image}" alt="${productDetail.name}" />
                    <textarea class="form-control order-info-textarea" id="orderInfo" name="orderInfo" rows="3" readonly>
                        Product Name: ${productDetail.name}
                        Product Price: ${productDetail.price}
                    </textarea>
                </div>
            </div>
  <div class="form-group">
    <label for="quantity">Quantity</label>
    <input
      type="number"
      class="form-control"
      id="quantity"
      name="quantity"
      value =1
      placeholder="Enter quantity"
    />
  </div>
  <button type="submit" class="btn btn-primary">Submit Order</button>
</form>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

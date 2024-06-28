<%@page import="Model.*"%> 
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link rel="stylesheet" href="./css/style.css" />
    <style>
      .form-control {
        margin: 0 auto;
      }
      .form-label {
        text-align: left;
      }
      .form-input {
        margin-left: 50px;
        width: 200px;
      }
      .form-control input {
      }
      .form-btn {
        background-color: #2b80dd;
        color: #fff;
        border: none;
        padding: 10px 15px;
        text-decoration: none;
        border-radius: 5px;
        cursor: pointer;
      }
      h1 {
        color: rgba(0, 0, 0, 0.7);
      }
    </style>
  </head>

  <body>
    <%@include file="/includes/navbar.jsp"%>

    <center>
      <h1>${title}</h1>
      <form
        action="/${action}"
        method="POST"
        class="form"
        enctype="multipart/form-data"
      >
           <div class="form-control">
          <label for="idProduct" class="form-label">Id Product:</label>
          <input
            type="text"
            name="idProduct"
            id="idProduct"
            class="form-input"
            required="true"
          />
        </div>
        <div class="form-control">
          <label for="nameProduct" class="form-label">Name Product:</label>
          <input
            type="text"
            name="nameProduct"
            id="nameProduct"
            class="form-input"
            required="true"
          />
        </div>
        <div class="form-control">
          <label for="lastName" class="form-label">Price: </label>
          <input
            type="text"
            name="priceProduct"
            id="priceProduct"
            class="form-input"
            required="true"
          />
        </div>

        <div class="form-control">
          <label for="lastName" class="form-label">Category: </label>
          <input
            type="text"
            name="category"
            id="category"
            class="form-input"
            required="true"
            
          />
        </div>
          <div class="form-control">
          <label for="manufacturerID" class="form-label">Manufacturer ID </label>
          <input
            type="text"
            name="manufacturerID"
            id="manufacturerID"
            class="form-input"
            required="true"
            
          />
        </div>

        <div class="form-control">
          <label for="image" class="form-label">Image: </label>
          <input
            type="file"
            name="imageProduct"
            id="image"
            class="form-input"
            required="true"
          />
        </div>
        <div class="form-control">
          <label for="image">Voucher Code</label
          >
          <input
            class="form-input"
            type="text"
            id="voucherCode"
            name="voucherCode"
            required
          />
        </div>
        <div class="form-control">
          <label for="image">Quantity In Stock</label
          >
          <input
            class="form-input"
            type="text"
            id="quantityInStock"
            name="quantityInStock"
            required
          />
        </div>
        <div class="form-control">
          <label for="image">Description</label
          >
          <input
            class="form-input"
            type="text"
            id="description"
            name="description"
            required
          />
        </div>
        <button type="submit" class="form-btn submit-btn">${title}</button>
      </form>
      <br />
      <br />
    </center>

    <%@include file="/includes/footer.jsp"%>
  </body>
</html>

<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link rel="stylesheet" href="./css/style.css" />
    <style>
      /* .form-select-input {
        padding: 4px 8px;
        margin-left: 8px;
        flex-grow: 1;
        font-family: inherit;
        font-size: 16px;
        padding: 4px 8px;
        outline: none;
        border: 1px solid #141e46;
        margin-left: 8px;
      } */
      .form-control {
        margin: 0 auto;
      }
      .form-label {
        text-align:left;
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
        color: rgba(0,0,0,0.7);
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
        <label for="idProduct" class="form-label">id Product:</label>
        <input
          type="text"
          name="idProduct"
          id="idProduct"
          class="form-input"
          required="true"
          value="${product.getId()}"
        />
      </div>
      <div class="form-control">
        <label for="firstName" class="form-label">Name Product:</label>
        <input
          type="text"
          name="nameProduct"
          id="HoTen"
          class="form-input"
          required="true"
          value="${product.getName()}"
        />
      </div>
      <div class="form-control">
        <label for="lastName" class="form-label">Price: </label>
        <input
          type="text"
          name="priceProduct"
          id="NgaySinh"
          class="form-input"
          required="true"
          value="${product.getPrice()}"
        />
      </div>

      <div class="form-control">
        <label for="lastName" class="form-label">Category: </label>
        <input
          type="text"
          name="category"
          id="NgaySinh"
          class="form-input"
          required="true"
          value="${product.getCategory()}"
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
        <label for="image">Status</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          class="form-input"
          type="text"
          id="status"
          name="status"
          required
        />
      </div>
      <div class="form-control">
        <label for="image">Guarantee</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          class="form-input"
          type="text"
          id="guarantee"
          name="guarantee"
          required
        />
      </div>
      <div class="form-control">
        <label for="image">Description</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          class="form-input"
          type="text"
          id="description"
          name="description"
          required
        />
      </div>
        <div class="form-control">
        <label for="gpu">Gpu</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          class="form-input"
          type="text"
          id="gpu"
          name="gpu"
        />
      </div>

      <button type="submit" class="form-btn submit-btn">${title}</button>
    </form>
    <br>
    <br>
    </center>

    <%@include file="/includes/footer.jsp"%>

  </body>
</html>

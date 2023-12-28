<%-- Document : detailProduct Created on : Dec 27, 2023, 8:25:23 PM Author :
welcome --%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <style>
      /* CSS inline styles here or link to your CSS file */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 80%;
        margin: 0 auto;
        text-align: center;
        padding: 20px;
      }
      .product {
        margin-bottom: 30px;
        border: 1px solid #ddd;
        padding: 20px;
      }
      .product img {
        max-width: 100%;
        height: auto;
      }
      .comments {
        text-align: left;
        margin-top: 50px;
      }
      .comments .comment {
        border-bottom: 1px solid #ddd;
        padding: 10px;
      }
    </style>
  </head>
  <body>
     <div class="container">
    <div class="product">
        <h2>${productDetail.name}</h2>
        <img src="product-image/${productDetail.image}" alt="${productDetail.name}" />
        <p>Category: <c:if test="${not empty productDetail.category}">${productDetail.category}</c:if></p>
        <p>Price: <c:if test="${not empty productDetail.price}">${productDetail.price}</c:if></p>
        <p>Status: <c:if test="${not empty productDetail.status}">${productDetail.status}</c:if></p>
        <p>Guarantee: <c:if test="${not empty productDetail.guarantee}">${productDetail.guarantee}</c:if></p>
        <p>Description: <c:if test="${not empty productDetail.description}">${productDetail.description}</c:if></p>
        <div class="specs">
            <h4>GPU</h4>
            <ul>
                <c:if test="${not empty gpu}">
                    <c:forEach var="gpu" items="${gpu}">
                        <li> ${gpu}</li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
        <div class="buttons">
            <button onclick="buyProduct(${productDetail.id})">
                <a class="btn btn-dark" href="/add-to-cart?id=${productDetail.id}&name=${productDetail.name}&price=${productDetail.price}&category=${productDetail.category}&image=${productDetail.image}">Add to Cart</a>
            </button>
            <button onclick="addToCart(${productDetail.id})">Add to Cart</button>
        </div>
    </div>
    <div class="comments">
        <h3>Comments</h3>
        <div class="comment">
            <p>quan</p>
            <p>ok</p>
        </div>
    </div>
</div>

  </body>
</html>

<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
//     System.out.println("authauth++++"+auth.getEmail());
    request.setAttribute("person", auth);
}else{
//     System.out.println("authauth++++"+auth.getEmail());
    }

 String sortType = request.getParameter("sort");
  String category = request.getParameter("category");
  
if(sortType==null&&category==null){

ProductDao pd = new ProductDao();
    List<Product> products = pd.getAllProducts();
 request.getSession().setAttribute("products", products);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
        <title>E-Commerce Cart</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #fff;
                color: #333;
            }

            .container-index {
                max-width: 1200px;
                margin: 0 auto;
            }

            .card-header {
                font-size: 16px;
                font-weight: bold;
                width: 1200px;
                height:50px;
                background-color: #e0e0e0;
                margin: 0 auto;
                border-radius: 5px;
                margin-top: 10px;
                /* display: flex;
                align-items: center; */
                /* padding-left: 15px; */
                display: flex;
                align-items: center;
            }
            .row {
                display: flex;
                flex-wrap: wrap;
                margin-left: -8px;
                margin-right: -8px;
            }
            .col-md-3 {
                flex: 0 0 23.65%;
                max-width: 23.65%;
                padding-right: 5px;
                padding-left: 5px;
            }
            .col {
                padding-left: 8px;
                padding-right: 8px;
            }

            .card {
                width: 100%;
                height: 450px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05),
                    0 -2px 4px rgba(0, 0, 0, 0.05),
                    2px 0 4px rgba(0, 0, 0, 0.05),
                    -2px 0 4px rgba(0, 0, 0, 0.05);

                transition: box-shadow 0.3s ease-in-out;
                position: relative;
                margin-top: 20px;
                border-radius: 5px;
                padding-top: 5px;
            }

            .card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: cover;
                margin-top:20px;

            }

            .card-body {
                padding:  0 20px;
            }
            .card-body:hover {
                text-decoration: none;
            }

            .card-title {
                font-size: 16px;
                text-decoration: none;
                text-align: center;
                height: 65px;
            }

            .price {
                color: #ec1c24;
                margin-top: 10px;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                font-weight: 600;
            }

            .category {
                color: #28a745;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
            }
            .item-product:hover  {
                text-decoration: none;
            }
            .btn {
                display: inline-block;
                padding: 8px 16px;
                font-size: 14px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                border: 1px solid #007bff;
                color: #fff;
                background-color: #007bff;
                transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
                border-radius:5px;
            }
            .mt-3 {
                position: absolute;
                bottom: 5%;
                margin-left: 9px;
            }
            .btn-primary {
                border: 1px solid #28a745;
                color: #fff;
                background-color: #28a745;
                margin-left: 20px;
            }

            .btn:hover,
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .footer {
                background-color: #e0e0e0;
                padding: 20px 0;
                color: #666;
                font-size: 12px;
                text-align: center;
                margin-top: 20px;
            }
            .item-product {
                text-decoration: none;
                color: #000;
            }

            /* Add your own styles for other elements as needed */

        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <%@include file="/includes/sorting_product.jsp"%>

        <div class="container-index">
            <div class="card-header my-3">
                &nbsp;&nbsp;&nbsp;&nbsp;<h3 class="text-h3">ALL PRODUCTS</h3>
            </div>
            <div class="row">
                <c:if test="${not empty products}">
                    <c:forEach var="p" items="${products}">
                        <div class="col-md-3 my-3 col">
                            <a class="item-product" href="/products?id=${p.id}">
                                <div class="card w-100">
                                    <img class="card-img-top" src="product-image/${p.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <p class="card-title">${p.name}</p>
                                        <p class="price">Price: $${p.price}</p>
                                        <p class="category">Category: ${p.category}</p>
                                        <div class="mt-3">
                                            <a class="btn btn-dark" 
                                               href="/add-to-cart?id=${p.id}&name=${p.name}&price=${p.price}&category=${p.category}&image=${p.image}">Add to Cart</a>
                                            <a class="btn btn-primary" href="order-now?quantity=1&id=${p.id}">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty products}">
                    There is no products
                </c:if>
            </div>

        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
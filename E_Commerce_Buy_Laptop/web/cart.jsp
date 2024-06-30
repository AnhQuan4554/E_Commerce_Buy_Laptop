<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

%>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Cart</title>
    <style type="text/css">
        body {
            font-family: "Roboto",sans-serif;
            margin: 0;
            padding: 0;
        }

        .container-cart {

            width: 65%;

            margin: 0 auto;
        }

        .d-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h3 {
            font-size: 1.5rem;
        }

        .btn-primary {
            background-color: #007bff;
            display: block;
            width: 140px !important;
            color: #fff;
            border: none;
            padding: 7px 15px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            text-align: center !important;

        }

        .form-inline {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-group {
            margin: 0 10px;
            display: flex;
            align-items: center;
        }

        .form-group a{
            display: block;
        }

        .btn-incre, .btn-decre {
            background-color: #28a745;
            color: #fff;
            border: none;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
        
       
            margin: 0 10px;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 3px;
        }
        .btn-primary:hover {
    background-color: #0056b3;
}

.btn-decre:hover {
    background-color: #218838;
}

.btn-incre:hover {
    background-color: #28a745;
}

.btn-danger:hover {
    background-color: #c82333;
}
    </style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container-cart my-3">
        <div class="d-flex py-3">

            <h3>YOUR CART </h3>

            <!-- <a class="mx-3 btn btn-primary" href="/cart-check-out">Check Out</a> -->
        </div>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Buy Now</th>
                    <th>Cancel</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${cartList}">
                    <tr>
                        <td>${c.productName}</td>
                        <td>${dcf.format(c.price)}</td>
                        <td>
                            <form action="/order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="${c.cartID}" class="form-input">
                                <div class="form-group">
                                    <a class="btn btn-incre" href="/quantity-inc-dec?action=inc&id=${c.cartID}">+</a>
                                    <input style="text-align: center;" type="text" name="quantity" class="form-control" value="${c.quantity}" readonly>
                                    <a class="btn btn-decre" href="/quantity-inc-dec?action=dec&id=${c.cartID}">-</a>
                                </div>
                            </form>
                        </td>
                        <td>
                            <a class="btn btn-primary" href="/order-now?quantity=${c.quantity}&productID=${c.productID}">Buy Now</a>
                        </td>
                        <td><a href="/remove-from-cart?id=${c.cartID}" class="btn btn-danger">Remove</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>

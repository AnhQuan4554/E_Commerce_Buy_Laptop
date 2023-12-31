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
//request.setAttribute("dcf", dcf);
//User auth = (User) request.getSession().getAttribute("auth");
//if (auth != null) {
//    request.setAttribute("person", auth);
//}
%>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Cart</title>
    <style type="text/css">

        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container-cart {
            margin: 20px;
            width: 80%;
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
            color: #fff;
            border: none;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .form-inline {
            display: flex;
            align-items: center;
        }

        .form-group {
            margin: 0 10px;
            display: flex;
            align-items: center;
        }

        .btn-incre, .btn-decre {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 3px;
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

    </style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container-cart my-3">
        <div class="d-flex py-3">
            <h3>Total Price: $ ${total > 0 ? dcf.format(total) : 0} </h3>
            <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Buy Now</th>
                    <th>Cancel</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${cartList}">
                    <tr>
                        <td>${c.name}</td>
                        <td>${c.category}</td>
                        <td>${dcf.format(c.price)}</td>
                        <td>
                            <form action="order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="${c.id}" class="form-input">
                                <div class="form-group">
                                    <a class="btn btn-incre" href="quantity-inc-dec?action=inc&id=${c.id}"><i class="fas fa-plus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control" value="${c.quantity}" readonly>
                                    <a class="btn btn-decre" href="quantity-inc-dec?action=dec&id=${c.id}"><i class="fas fa-minus-square"></i></a>
                                </div>
                                <a class="btn btn-primary" href="order-now?quantity=${c.quantity}&id=${c.id}">Buy Now</a>
                            </form>
                        </td>
                        <td><a href="remove-from-cart?id=${c.id}" class="btn btn-danger">Remove</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>

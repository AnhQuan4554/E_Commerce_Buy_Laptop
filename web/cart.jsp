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
            width: 80px;
            height: 20px;
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

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
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

        .btn-incre, .btn-decre {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 3px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 3px;
            width: 20px;
            height: 20px;
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
            <h3>ALL CART </h3>
            <a class="mx-3 btn btn-primary" href="/cart-check-out">Check Out</a>
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
                            <form action="/order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="${c.id}" class="form-input">
                                <div class="form-group">
                                    <a class="btn btn-incre" href="/quantity-inc-dec?action=inc&id=${c.id}"><svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#fff" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg></a>
                                    <input type="text" name="quantity" class="form-control" value="${c.quantity}" readonly>
                                    <a class="btn btn-decre" href="/quantity-inc-dec?action=dec&id=${c.id}"><svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#fff" d="M432 256c0 17.7-14.3 32-32 32L48 288c-17.7 0-32-14.3-32-32s14.3-32 32-32l352 0c17.7 0 32 14.3 32 32z"/></svg></i></a>
                                </div>
                                <a class="btn btn-primary" href="/order-now?quantity=${c.quantity}&id=${c.p_id}&order_id=${c.id}">Buy Now</a>
                            </form>
                        </td>
                        <td><a href="/remove-from-cart?id=${c.id}" class="btn btn-danger">Remove</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>

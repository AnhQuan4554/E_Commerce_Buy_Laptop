<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.OrderDao"%>
<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
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
                box-sizing: border-box;
            }

            .container-order {

                width: 70%;

                margin: 0 auto;
            }

            .card-header {
                background-color: #f8f9fa;
                padding: 10px;
                font-weight: bold;
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

            .btn-danger {
                background-color: #dc3545;
                color: #fff;
                border: none;

                padding: 7px 10px;
                /* width: 80px; */

                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
                border-radius: 3px;
            }

            .btn-danger:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <div class="container-order">

            <div class="card-header my-3">ALL ORDERS</div>

            <table>
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Date</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty orders}">
                        <c:forEach var="o" items="${orders}">
                            <tr>
                                <td>${o.orderID}</td>
                                <td>${o.productID}</td>
                                <td>${o.quantity}</td>
                                <td>${o.priceEach}</td>
                                <td>${o.subTotal}</td>
                                <td><a class="btn btn-sm btn-danger" href="cancel-order?id=${o.orderID}">Cancel Order</a></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>

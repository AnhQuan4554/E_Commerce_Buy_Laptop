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
        <%@include file="/includes/head.jsp"%>
        <title>E-Commerce Cart</title>
        <style type="text/css">

            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <div class="container my-3">
            <div class="d-flex py-3">
                <h3>Total Price: $ ${total > 0 ? dcf.format(total) : 0} </h3>
                <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
            </div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Buy Now</th>
                        <th scope="col">Cancel</th>
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
                                    <div class="form-group d-flex justify-content-between">
                                        <a class="btn bnt-sm btn-incre" href="/quantity-inc-dec?action=inc&id=${c.id}"><i class="fas fa-plus-square"></i></a>
                                        <input type="text" name="quantity" class="form-control" value="${c.quantity}" readonly>
                                        <a class="btn btn-sm btn-decre" href="/quantity-inc-dec?action=dec&id=${c.id}"><i class="fas fa-minus-square"></i></a>
                                    </div>
                                    <a class="btn btn-primary" href="/order-now?quantity=${c.quantity}&id=${c.p_id}">Buy Now</a>
                                   
                                </form>
                            </td>
                            <td><a href="/remove-from-cart?id=${c.id}" class="btn btn-sm btn-danger">Remove</a></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>


        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
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
	User auth = (User) request.getSession().getAttribute("auth");
//         System.out.println("Ordersssss+++auth"+auth.getId());
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao();
		orders = orderDao.userOrders(auth.getId());
               
                   request.setAttribute("orders", orders);
	}else{
		response.sendRedirect("login.jsp");
	}

	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Cancel</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty orders}">
                <c:forEach var="o" items="${orders}">
                    <tr>
                        <td>111</td>
                        <td>${o.id}</td>
                        <td>${o.category}</td>
                                                <td>1000$</td>

                        <td>${o.quantity}</td>
                        <td><a class="btn btn-sm btn-danger" href="cancel-order?id=${o.id}">Cancel Order</a></td>
                    </tr>
                </c:forEach>
            </c:if>
        </tbody>
    </table>
</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>
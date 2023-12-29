<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="/index.jsp">E-Commerce Cart</a>
        <c:choose>
            <c:when test="${not empty sessionScope.auth && sessionScope.auth.role eq 1}">
                <a class="navbar-brand" href="/admin/admin.jsp">Admin</a>
            </c:when>
        </c:choose>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/get-all-carts">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
                    <c:choose>
                        <c:when test="${2 > 1}">
                        <li class="nav-item"><a class="nav-link" href="/get-all-orders">Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="/log-out">Logout</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="/login.jsp">Login</a></li>
                        </c:otherwise>
                    </c:choose>
            </ul>
        </div>
    </div>
</nav>

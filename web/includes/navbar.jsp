<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Cart</title>
    <script src="https://kit.fontawesome.com/30d0976aea.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        .container2 {
            /* width: 100%; */
            height: 100px;
            padding: 0 370px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f5f5f5;
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: #007bff;
        }

        .navbar-link-to  {
            color: #007bff;
            margin-left: 15px;
            text-decoration: none;
            font-size: 18px;
        }
        .navbar-link-to1  {
            color: #ec1c24;
            margin-left: 15px;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .navbar-link-to1 p{
            color: #000;
        }
        .navbar-link-to .active {
            color: #000;
        }
        .navbar-link-to:hover {
            text-decoration: none;
        }
        .navbar-link-to1:hover {
            text-decoration: none;
        }
        .badge {
            background-color: #dc3545;
        }

        .navbar-collaps {
            display: flex;
            align-items: center;
           
        }
        .navbar-link-to1:hover {
            color:#2b80dd;
        }
        /* Search Bar Styles */
        .search-bar {
            display: flex;
            align-items: center;
            margin-left: 100px;
        }

        .search-input {
            width: 400px;
            height: 30px;
            margin-right: 10px;
            padding: 5px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        .search-button {
            background-color: #2b80dd;
            color: #fff;
            border: none;
            padding: 14px 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .logo-navbar {
            display: flex;
            align-items: center;
        }
        .logo-img {
            width: 150px;
        }
        .container3 {
            background-color: #2b80dd;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .item-container3 {
            display: flex;
            width: 280px;
            height: 100%;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 600;
            font-size: 14px;
        }
        .item-container3:hover {
            background-color: #115fb4;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="container2">
        <div class="logo-navbar">
            <a class="navbar-brand" href="/index.jsp">
                <img class="logo-img" src="../image/az.jpg" alt="E-Commerce Cart Logo">
            </a>
            <c:choose>
                <c:when test="${not empty sessionScope.auth && sessionScope.auth.role eq 1}">
                    <a class="navbar-link-to " href="/admin/admin.jsp">
                        <i class="fa-solid fa-user"></i>&nbsp;
                        Admin 
                    </a>
                   <a class="navbar-brand" href="/manageClient.jsp">Client</a
                </c:when>
            </c:choose> 
        </div>               
                <!-- Search Bar -->
            <div class="search-bar">
                <input class="search-input" type="text" placeholder=" Enter to search...">
                <button class="search-button">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
                
                
        <div class="navbar-collaps">
            <a class="navbar-link-to1 " href="/index.jsp">
                <i class="fa-solid fa-house"></i>
                <p>Home</p>
            </a>
            <a class="navbar-link-to1 " href="/get-all-carts">
                <i class="fa-solid fa-bag-shopping"></i>
                <p>Cart </p>
                <span class="badge badge-danger">${cart_list.size()}</span> 
            </a>
            <c:choose>
                <c:when test="${2 > 1}">
                    <a class="navbar-link-to1 " href="/orders.jsp">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <p>Orders</p>
                    </a>
                    <a class="navbar-link-to1 " href="/log-out">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <p>Logout</p>
                    </a>
                </c:when>
                <c:otherwise>
                    <a class="navbar-link-to1 " href="/login.jsp">Login</a>
                </c:otherwise>
            </c:choose>            
        </div>
    </div>
    <div class="container3">
        <div class="item-container3">
            <i class="fa-solid fa-laptop"></i>&nbsp;
            <span>LAPTOP CATEGORY</span>
        </div>
        <div class="item-container3">
            <i class="fa-solid fa-percent"></i>&nbsp;
            <span>PROMOTION</span>
        </div>
        <div class="item-container3">
            <i class="fa-solid fa-credit-card"></i>&nbsp;
            <span>PAYMENT</span>
        </div>
        <div class="item-container3">
            <i class="fa-brands fa-instalod"></i>&nbsp;
            <span>INSTALLMENT</span>
        </div>
    </div>

</body>
</html>


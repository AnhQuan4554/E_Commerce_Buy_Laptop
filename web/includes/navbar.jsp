<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Cart</title>
    <!-- <script src="https://kit.fontawesome.com/30d0976aea.js" crossorigin="anonymous"></script> -->
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
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .navbar-link-to:hover svg path  {
            fill: #115fb4;

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
        .navbar-link-to1:hover svg path  {
            fill: #115fb4;

        }
        .navbar-link-to1 p{
            color: #000;
        }
        .navbar-link-to .active {
            color: #000;
        }
        .navbar-link-to:hover {
            text-decoration: none;
            color: #115fb4;

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
            margin-left: 30px;
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
        .search-button svg {
            color: #fff;
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
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#007bff" d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                        Admin 
                    </a>
                    
                      <a class="navbar-link-to " href="/manageClient.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#007bff" d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                        Client 
                    </a>
                 
                </c:when>
            </c:choose> 
        </div>               
                <!-- Search Bar -->
            <div class="search-bar">
                <input class="search-input" type="text" placeholder=" Enter to search...">
                <button class="search-button">
                    <!-- <i class="fa-solid fa-magnifying-glass"></i> -->
                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path opacity="1" fill="#fff" d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                </button>
            </div>
                
                
        <div class="navbar-collaps">
            <a class="navbar-link-to1 " href="/index.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#ec1c24" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg>
                <p>Home</p>
            </a>
            <a class="navbar-link-to1 " href="/get-all-carts">
                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#ec1c24" d="M160 112c0-35.3 28.7-64 64-64s64 28.7 64 64v48H160V112zm-48 48H48c-26.5 0-48 21.5-48 48V416c0 53 43 96 96 96H352c53 0 96-43 96-96V208c0-26.5-21.5-48-48-48H336V112C336 50.1 285.9 0 224 0S112 50.1 112 112v48zm24 48a24 24 0 1 1 0 48 24 24 0 1 1 0-48zm152 24a24 24 0 1 1 48 0 24 24 0 1 1 -48 0z"/></svg>
                <p>Cart </p>
                <span class="badge badge-danger">${cart_list.size()}</span> 
            </a>
            <c:choose>
                <c:when test="${2 > 1}">
                    <a class="navbar-link-to1 " href="/get-all-orders">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#ec1c24" d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                        <p>Orders</p>
                    </a>
                    <a class="navbar-link-to1 " href="/log-out">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#ec1c24" d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
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
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="20" viewBox="0 0 640 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#fff" d="M128 32C92.7 32 64 60.7 64 96V352h64V96H512V352h64V96c0-35.3-28.7-64-64-64H128zM19.2 384C8.6 384 0 392.6 0 403.2C0 445.6 34.4 480 76.8 480H563.2c42.4 0 76.8-34.4 76.8-76.8c0-10.6-8.6-19.2-19.2-19.2H19.2z"/></svg>&nbsp;
            <span>LAPTOP CATEGORY</span>
        </div>
        <div class="item-container3">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#fff" d="M374.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-320 320c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l320-320zM128 128A64 64 0 1 0 0 128a64 64 0 1 0 128 0zM384 384a64 64 0 1 0 -128 0 64 64 0 1 0 128 0z"/></svg>&nbsp;
            <span>PROMOTION</span>
        </div>
        <div class="item-container3">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#fff" d="M64 32C28.7 32 0 60.7 0 96v32H576V96c0-35.3-28.7-64-64-64H64zM576 224H0V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V224zM112 352h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm112 16c0-8.8 7.2-16 16-16H368c8.8 0 16 7.2 16 16s-7.2 16-16 16H240c-8.8 0-16-7.2-16-16z"/></svg></i>&nbsp;
            <span>PAYMENT</span>
        </div>
        <div class="item-container3">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#fff" d="M153.4 480H387.1L502.6 275.8 204.2 333.2zM504.7 240.1 387.1 32H155.7L360.2 267.9zM124.4 48.8 7.3 256 123.2 461.2 225.6 165.6z"/></svg>&nbsp;
            <span>INSTALLMENT</span>
        </div>
    </div>

</body>
</html>

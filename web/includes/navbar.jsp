<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>E-Commerce Cart</title>
    <!-- <script src="https://kit.fontawesome.com/30d0976aea.js" crossorigin="anonymous"></script> -->
    <style>
        body {
            font-family: "Roboto",sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        
        }

        .container2 {
            height: 100px;
            padding: 50px;
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
            text-decoration: none;
            font-size: 18px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 40px;
        }
        .navbar-link-to1 svg  {
           margin-right: 10px;
        font-size: 30px;
        }
        .navbar-link-to1 i  {
           margin-right: 10px  !important;
        }
        .navbar-link-to1:hover svg path  {
            fill: #115fb4;

        }
        .navbar-link-to1 p{
            color: #000;
            display: block;
            margin: 0 !important;
            font-size: 20px;
            font-weight: 600;
           
        }
        .navbar-link-to .active {
            color: #000;
        }
        .navbar-link-to:hover {
            text-decoration: none;
            color: #115fb4;

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
            text-decoration: none;

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
            width: 170px;
            margin-right: 10px;
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
        .admin_controller{
            display: flex;
            align-items: center;
            margin-right: 30px;
        }
        .admin_controller i{
            font-size: 20px;
        }
        .admin_controller a{
            margin-left: 6px !important;
        }
    </style>
</head>
<body>
    <div class="container2">
        <div  class="logo-navbar">
            <a class="navbar-brand" href="/index.jsp">
                <img class="logo-img" src="../image/logolaptopok.png" alt="E-Commerce Cart Logo">
            </a>
    
            <div style="display: flex;align-items: center; margin-left: 30px;">
                <c:if test="${not empty sessionScope.auth && sessionScope.auth.role == 1}">
                    <div class="admin_controller">
                        <i class="bi bi-shop"></i>
                        <a class="navbar-link-to" href="/admin/admin.jsp">
                            Products 
                        </a>
                    </div>    
                </c:if>
                
                <c:if test="${not empty sessionScope.auth}">
                    <div class="admin_controller">
                        <i class="bi bi-people"></i>
                        <a class="navbar-link-to" href="/manageClient.jsp">
                            Users 
                        </a>
                    </div>
                </c:if>
                
           </div>
        </div>               
               
                
        <div class="navbar-collaps">
            <a class="navbar-link-to1" href="#">
             <i class="bi bi-file-person-fill"></i>
                <p>About</p>
                <span class="badge badge-danger">${cart_list.size()}</span> 
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
                </c:when>
                
                <c:otherwise>
                    <a class="navbar-link-to1 " href="/login.jsp">Login</a>
                </c:otherwise>
            </c:choose>     
                      <a class="navbar-link-to1 " href="/userInfor.jsp">
                        <i class="bi bi-pencil-square"></i>
                        <p>Edit Infor</p>
            </a>
        </div>
        <div>
             <c:choose>
                <c:when test="${not empty sessionScope.auth  }">
                   <a class="navbar-link-to1 " href="/log-out">
                         <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#ec1c24" d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
                        <p>Logout</p>
                    </a>
                </c:when>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>

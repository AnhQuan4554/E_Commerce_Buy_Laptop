<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>JSP Page</title>
        <style>
            /* CSS inline styles here or link to your CSS file */
            body {
                font-family: Roboto, sans-serif;
                margin: 0;
                padding: 0;
            }
            .container-detail {
                width: 60%;
                margin: 0 auto;
                text-align: center;
                padding: 20px;
            }
            .product {

                margin-bottom: 30px;
                border: 1px solid #ddd;
                border-radius: 5px;
                /* padding: 0 20px; */
                display: flex;
                padding-bottom: 20px;
            }
            .product-img{
                width: 36%;
                height: auto;
            }
            .comments {
                text-align: left;
                margin-top: 50px;
            }
            .comments .comment {
                border-bottom: 1px solid #ddd;
                padding: 10px;
            }
            .product-name {
                font-size: 12px;
                height: 40px;
                /* background-color: aqua; */
                display: flex;
                align-items: center;
                border: 1px solid rgba(0,0,0,0.1);
                border-radius:5px;
            }
            .product-contact {
                width: 36%;
                /* padding-left: 20px; */
            }
            .product-policy {
                max-width: 300px;
                margin-top: 20px;
                margin-bottom: 10px;
            }
            .policy-contact , .policy-map{
                border-radius: 5px;
                border: 1px solid rgba(0,0,0,0.1);
                padding-bottom: 20px;
                padding-right: 10px;
            }
            .policy-map {
                margin-top: 20px;
                padding: 20px 10px;
            }
            .policy-contact h4{
                margin-top:10px;
                color: #ef1200;
            }
            .policy-content {
                display: flex;
                align-items:center;
                height: 30px;
                font-size: 15px;
                margin-left: 10px;
            }
            .policy-content i {
                color: #f5d423;
                margin-right: 10px;
            }
            .policy-content1 {
                display: flex;
                align-items:center;
                height: 30px;
                font-size: 15px;
                margin-left: 10px;
            }
            .policy-content1 i {
                color: #2b80dd;
                margin-right: 10px;
            }
            .product-img img {
                width: 90%;
            }
            .product-price {
                font-size:30px;
                color: #ef1200;
                font-weight: 600;
                text-align: left;
                margin-left: 40px;
                height: 20px;
            }
            .product-category {
                text-align: left;
                margin-left: 40px;

            }
            .product-status {
                text-align: left;
                margin-left: 40px;

            }
            .product-gua {
                text-align: left;
                margin-left: 40px;

            }
            .specs h4 {
                text-align: left;
                margin-left: 40px;

            }
            .specs ul {
                width: 80%;
                height: 50px;
                border: 1px solid rgba(0,0,0,0.1);
                padding-inline-start: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-left: 40px;
                background-color: #f7f7f7;
                border-radius:5px;
                padding: 0 10px;
            }
            .specs ul:hover {
                cursor: pointer;
                background-color: #2b80dd;
                color: #fff;
            }
            .gpu-name {
                list-style: none;
                text-align: center;
            }
            .product-present{
                width: 80%;
                padding: 10px;
                border: 1px solid rgba(0,0,0,0.1);
                border-radius: 5px;
                margin-left: 40px;

            }
            .product-present h4 {
                border: 1px solid rgba(0,0,0,0.1);
                border-radius: 5px;
                background-color: #16c60c;
                height: 30px;
                padding-top: 14px;
                margin-top: 0;
                color: #fff;
            }
            .present-content {
                display: flex;
                align-items: center;
                /* justify-content: center; */
                margin-left: 10px;
            }
            .present-content p {
                line-height: 100%;
                font-size: 15px;
                margin-left: 5px;
            }
            .present-content i {
                color:#16c60c;

            }
            .buttons {
                margin-left: 50px;
                margin-top: 20px;
                width: 80%;
            }
            .btn-cart {
                width: 100%;
                height: 50px;
                margin-top: 10px;
                border: 1px solid #28a745;
                color: #fff;
                background-color: #28a745;
                border-radius: 5px;
                font-size: 16px;
            }
            .btn-cart a {
                text-decoration: none;
                color: #fff;
                font-size: 16px;

            }
            .btn-cart:hover {
                background-color: #2b80dd;
                border-color: #2b80dd;
                cursor: pointer;
            }
            .product-des {
                padding: 20px;
                border: 1px solid rgba(0,0,0,0.1);
                border-radius: 5px;
            }
            .product-des h2 {
                margin-top:10px;
            }
            .text-des {
                font-size: 18px;
                text-align: justify;
            }
            .comments {
                border: 1px solid rgba(0,0,0,0.1);
                border-radius: 5px;
                padding: 0 20px 20px 20px;
            }
            .comment {
                border: 1px solid rgba(0,0,0,0.1);
                margin-bottom: 10px;
            }
            .user-infor {
                display: flex;
                align-items: center;
            }
            .star-user {
                color:#f5d423;
                margin-left: 650px;
            }
            .comment-user {
                margin-left:20px;
            }
            .form-comment {
                width: 99.5%;
                height:80px;
                border: 1px solid rgba(0,0,0,0.1);
                margin-top: 30px;
            }
        </style>
    </head>
    <body>

        <%@include file="/includes/navbar.jsp"%>
        <div class="container-detail">
            <div class="product-name">
                &nbsp;&nbsp;&nbsp;&nbsp;<h2>${productDetail.name}</h2>
            </div>
            <div class="product">
                <div class="product-img">
                    <img src="product-image/${productDetail.image}" alt="${productDetail.name}" />
                </div>
                <div class="product-contact">
                    <p class="product-price">Price: <c:if test="${not empty productDetail.price}">${productDetail.price}</c:if></p>
                    <p class="product-category">Category: <c:if test="${not empty productDetail.category}">${productDetail.category}</c:if></p>
                    <p class="product-status">Status: <c:if test="${not empty productDetail.status}">${productDetail.status}</c:if></p>
                    <p class="product-gua">Guarantee: <c:if test="${not empty productDetail.guarantee}">${productDetail.guarantee}</c:if></p>
                        <div class="specs">
                            <h4>Configuration:</h4>
                            <ul>
                            <c:if test="${not empty gpu}">
                                <c:forEach var="gpu" items="${gpu}">
                                    <li class="gpu-name"> ${gpu}</li>
                                    </c:forEach>
                                </c:if>
                        </ul>
                    </div>
                    <div class="product-present">
                        <h4>Gifts/Promotions</h4>
                        <div class="present-content">
                            <i class="fa-solid fa-check-to-slot"></i>
                            <p>Free installation of Windows 11</p>
                        </div>
                        <div class="present-content">
                            <i class="fa-solid fa-check-to-slot"></i>
                            <p>Free high-tech screen color calibration</p>
                        </div>
                        <div class="present-content">
                            <i class="fa-solid fa-check-to-slot"></i>
                            <p>Give away fashion backpacks</p>
                        </div>
                        <div class="present-content">
                            <i class="fa-solid fa-check-to-slot"></i>
                            <p>Wireless mouse + High quality touchpad</p>
                        </div>
                        <div class="present-content">
                            <i class="fa-solid fa-check-to-slot"></i>
                            <p>Free installation and maintenance package</p>
                        </div>
                    </div>
                    <div class="buttons">
                        <button class="btn-cart" onclick="buyProduct(${productDetail.id})">
                            <a  href="/add-to-cart?id=${productDetail.id}&name=${productDetail.name}&price=${productDetail.price}&category=${productDetail.category}&image=${productDetail.image}">Add to Cart</a>
                        </button>
                        <br>
                        <button class="btn-cart" onclick="addToCart(${productDetail.id})">Buy now</button>
                    </div>
                </div>
                <div class="product-policy">
                    <div class="policy-contact">
                        <h4>SHOPPING IN PEACE OF TRUST</h4>
                        <div class="policy-content">
                            <i class="fa-solid fa-star"></i>
                            <p>Product quality is top</p>
                        </div>
                        <div class="policy-content">
                            <i class="fa-solid fa-star"></i>
                            <p>Try it out for 15 days</p>
                        </div>
                        <div class="policy-content">
                            <i class="fa-solid fa-star"></i>
                            <p>Best after-sales support and service</p>
                        </div>
                        <div class="policy-content">
                            <i class="fa-solid fa-star"></i>
                            <p>Pay 0% interest via visa card</p>
                        </div>
                        <div class="policy-content">
                            <i class="fa-solid fa-star"></i>
                            <p>Fastest free shipping nationwide</p>
                        </div>
                    </div>
                    <div class="policy-map">
                        <div class="policy-content1">
                            <i class="fa-solid fa-location-dot"></i>
                            <p>120 Thai Ha, Q. Dong Da</p>
                        </div>
                        <div class="policy-content1">
                            <i class="fa-solid fa-location-dot"></i>
                            <p>123 Tran Quang Khai, Q.1</p>
                        </div>
                        <div class="policy-content1">
                            <i class="fa-solid fa-phone"></i>
                            <p>0969.120.120</p>
                        </div>
                        <div class="policy-content1">
                            <i class="fa-solid fa-envelope"></i>
                            <p>KQLemail@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-des">
                <h2>Description </h2>
                <div class="product-name" style="justify-content: center;margin-bottom:20px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;<h2>${productDetail.name}</h2>
                </div>
                <div class="product-img-des">
                    <img src="product-image/${productDetail.image}" alt="${productDetail.name}" />
                </div>
                <p class="text-des">
                    <c:if test="${not empty productDetail.description}">${productDetail.description}</c:if>
                    </p>

                </div>


                <div class="comments">
                    <h3 style="margin-left: 20px;">Comments</h3>
                    <div class="comment">
                        <div class="user-infor">
                            &nbsp;&nbsp;&nbsp;&nbsp;<h4>Tran Trung Kien</h4>&nbsp;&nbsp;
                            <p>07764991xx</p>
                            <div class="star-user">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <div class="comment-user">
                            Very good product, the store provides enthusiastic advice and support. Next time will continue to support.
                        </div>
                    </div>
                    <div class="comment">
                        <div class="user-infor">
                            &nbsp;&nbsp;&nbsp;&nbsp;<h4>Nguyen Anh Quan</h4>&nbsp;&nbsp;
                            <p>0786867xx</p>
                            <div class="star-user">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <div class="comment-user">
                            I am very satisfied with the product.
                        </div>
                    </div>
                    <div class="comment">
                        <div class="user-infor">
                            &nbsp;&nbsp;&nbsp;&nbsp;<h4>Phung Duy Luan</h4>&nbsp;&nbsp;
                            <p>08869869xx</p>
                            <div class="star-user">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <div class="comment-user">
                            Does the store have many new laptops?
                        </div>
                    </div>
                    <div class="comment">
                        <div class="user-infor">
                            &nbsp;&nbsp;&nbsp;&nbsp;<h4>Trinh Xuan Thang</h4>&nbsp;&nbsp;
                            <p>08698896xx</p>
                            <div class="star-user">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <div class="comment-user">
                            When will the Acer Nitro 5 be available in stores?
                        </div>
                    </div>
                    <input type="text" name="cmt" class="form-comment" placeholder="Enter comment" required="">
                </div>
            </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>

<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>E-Commerce Cart</title>
        <link rel="stylesheet" href="./css/style.css">
        <script>
            function clearErrorMessage() {
                // Get the error message element and set its innerHTML to an empty string
                document.getElementById("error-message").innerHTML = "";
            }

            // Add an event listener to clear the error message when the email input is focused
            document.addEventListener("DOMContentLoaded", function () {
                var emailInput = document.getElementsByName("login-email")[0];
                if (emailInput) {
                    emailInput.addEventListener("focus", clearErrorMessage);
                }
            });
        </script>
        <style>
            .color-btn{
                padding: 10px 20px;
                background-color: #3498db;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                font-size: 18px;

            }
            .color-btn:hover {
                background-color: #2980b9;
            }
            .register-btn {
                padding: 10px 20px;
                background-color: #3498db;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                margin-left: 10px;
                font-size: 18px;
            }
            .register-btn:hover {
                background-color: #2980b9;
                text-decoration:none;
                color: #fff;
            }
            .container {
                width: 96%;
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }
            .card {
                width: 500px;
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, 0.125);
                border-radius: 0.25rem;
            }

            .w-50 {
                width: 40% !important;
            }

            .mx-auto {
                margin-right: auto !important;
                margin-left: auto !important;
            }

            .my-5 {
                margin-top: 3rem !important;
                margin-bottom: 3rem !important;
            }
            /* Card Header */
            .card-header {
                padding: 0.75rem 1.25rem;
                margin-bottom: 0;
                background-color: rgba(0, 123, 255, 0.03);
                border-bottom: 1px solid rgba(0, 123, 255, 0.125);
                text-align: center;
                font-weight: 600;
            }

            /* Text Center */
            .text-center {
                text-align: center !important;
            }

            /* Card Body */
            .card-body {
                flex: 1 1 auto;
                padding: 1.25rem;
            }

            /* Form Group */
            .form-group {
                margin-top: 20px;
            }
            /* Form Control */
            .form-control {
                display: block;
                width: 96%;
                margin-top: 10px;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            /* Optional: Style for focus state */
            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #80bdff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }
            .btn-center{
                margin-top:20px;
                display: flex;
                justify-content: center;
            }

        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center">USER LOGIN</div>
                <div class="card-body">
                    <form action="user-login" method="post">
                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" name="login-email" class="form-control" placeholder="Enter email" required="">
                        </div>
                        <div class="form-group">
                            <label>Password</label> 
                            <input type="password" name="login-password" class="form-control" placeholder="Password" required="">
                        </div>

                        <%-- Add the following to display the error message --%>
                        <div id="error-message">
                            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                            <% if (errorMessage != null) { %>
                            <p style="color: red;"><%= errorMessage %></p>
                            <% } %>
                        </div>

                        <div class="btn-center">
                            <button type="submit" class=" color-btn">Login</button>
                            <a href="register.jsp" class="register-btn">Register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>

<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>E-Commerce Cart</title>
    <link rel="stylesheet" href="./css/style.css">
    <script>
        function clearErrorMessage() {
            // Get the error message element and set its innerHTML to an empty string
            document.getElementById("error-message").innerHTML = "";
        }

        // Add an event listener to clear the error message when the email input is focused
        document.addEventListener("DOMContentLoaded", function() {
            var emailInput = document.getElementsByName("login-email")[0];
            if (emailInput) {
                emailInput.addEventListener("focus", clearErrorMessage);
            }
        });
    </script>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Login</div>
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
                    
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                        <a href="register.jsp" class="btn btn-primary">Register</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>

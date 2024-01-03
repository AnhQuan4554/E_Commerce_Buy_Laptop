<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Success</title>
        <style>
            body {
                font-family: "Roboto",sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                justify-content: center;
                /*            align-items: center;*/
            }

            .card {
                text-align: center;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                width: 800px;
                margin-top: 30px;
            }

            .success-icon img {
                width: 80px; /* ?i?u ch?nh k�ch th??c c?a ?nh */
                height: auto;
                margin-bottom: 20px;
            }

            h1 {
                color: #28a745;
                margin-bottom: 10px;
            }

            p {
                color: #555;
                margin-bottom: 20px;
            }

            a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <div class="container">
            <div class="card">
                <div class="success-icon">
                    <img src="./image/success.png" alt="Success Image">
                </div>
                <h1>Registration Successful</h1>
                <p>Congratulations! Your registration was successful.</p>
                <p>You can now <a href="login.jsp">LOGIN</a> to your account.</p>
            </div>
        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>

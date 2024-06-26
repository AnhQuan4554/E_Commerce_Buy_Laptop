<%@page import="DAO.DbCon"%>
<%@page import="DAO.UserDao"%> 
<%@page import="Model.*"%>
<%@page import="java.util.*"%> 
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% User auth = (User) request.getSession().getAttribute("auth"); 
if (auth != null) {
request.setAttribute("person", auth); } 
UserDao ud = new UserDao(); 
List<User> clients = ud.getAllClients(); request.getSession().setAttribute("clients", clients);
  
%>
  <!DOCTYPE html>
  <html>
    <head>
      <title>JSP Page</title>
      <style>
        body {
          font-family: "Roboto", sans-serif;

          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        .container-client {
          width: 70%;
          margin: 0 auto;
        }

        .card-header {
          margin-bottom: 20px;
          display: flex;
          justify-content: space-between;
        }

        table {
          width: 100%;
          border-collapse: collapse;
          margin-top: 20px;
        }

        th,
        td {
          border: 1px solid #ddd;
          padding: 8px;
          text-align: center;
          border-width: 1px !important;
        }

        th {
          background-color: #f2f2f2;
        }

        a {
          color: #007bff;
          text-decoration: none;
        }

        a:hover {
          color: #0056b3;
        }
        /* Thêm vào phần style của bạn */
        .delete-button {
          background-color: #dc3545;
          color: #fff;
          border: none;
          padding: 5px 10px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 14px;
          cursor: pointer;
          border-radius: 3px;
        }

        .delete-button:hover {
          background-color: #c82333;
          color: #fff;
        }
        tbody,
        td,
        tfoot,
        th,
        thead,
        tr {
          border-width: 1px !important;
        }
      </style>
    </head>
    <body>
      <%@include file="/includes/navbar.jsp"%>

      <div class="container-client">
        <div class="card-header my-3">
          <p>CUSTOMER LIST</p>
        </div>
        <table>
          <thead>
            <tr>
              <th>Number</th>
              <th>Name</th>
              <th>Status</th>
              <th>Address</th>
              <th>Phone number</th>
              <th>Email</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <% if (!clients.isEmpty()) { int stt = 1; for (User c : clients) {
            %>
            <tr>
              <td><%= stt++ %></td>
              <td><%=c.getUsername() %></td>
              <td><%=c.getIsActive() %></td>
              <td><%=c.getAddress() %></td>
              <td><%=c.getPhone() %></td>
              <td><%=c.getEmail() %></td>
              <td>
                <a
                  class="delete-button"
                  href="/deleteClient?clientId=<%=c.getUserID()%>"
                  >Delete</a
                >
              </td>
            </tr>
            <%} } %>
          </tbody>
        </table>
      </div>

      <%@include file="/includes/footer.jsp"%>
    </body>
  </html>
</User>

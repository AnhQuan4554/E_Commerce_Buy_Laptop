<%-- Document : admin Created on : Dec 12, 2023, 12:32:45 PM Author : welcome
--%> <%@page import="DAO.DbCon"%> <%@page import="DAO.ProductDao"%> <%@page
import="Model.*"%> <%@page import="java.util.*"%> <%@page
import="java.text.DecimalFormat"%> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> <% User
auth = (User) request.getSession().getAttribute("auth"); if (auth != null) {
request.setAttribute("person", auth); } ProductDao pd = new ProductDao();
List<Product>
  products = pd.getAllProducts(); request.getSession().setAttribute("products",
  products); %>
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <style>
        body {
          font-family: Arial, sans-serif;
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        .container-admin {
          width: 80%;
          margin: auto;
        }

        .management-header {
          margin-top: 20px;
          margin-bottom: 20px;
          display: flex;
          justify-content: space-between;
          align-items: center;
          background-color: #2b80dd;
          color: #fff;
          padding: 10px;
          border-radius: 5px;
        }

        .management-header p {
          margin: 0;
        }

        .add-product-btn {
          text-decoration: none;
          color: #2b80dd;
          background-color: #f5f5f5;
          border: 1px solid #2b80dd;
          padding: 8px 16px;
          border-radius: 5px;
          transition: background-color 0.3s, color 0.3s;
        }

        .add-product-btn:hover {
          background-color: #0056b3;
          color: #fff;
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

        .update-btn,
        .delete-btn {
          text-decoration: none;
          padding: 5px 10px;
          border-radius: 5px;
          margin-right: 5px;
        }

        .update-btn {
          background-color: #007bff;
          color: #fff;
        }

        .delete-btn {
          background-color: #dc3545;
          color: #fff;
        }
      </style>
    </head>
    <body>
      <%@include file="/includes/navbar.jsp"%>

      <div class="container-admin">
        <header class="management-header">
          <p>Management Page</p>
          <a
            class="add-product-btn"
            href="/add-product?title=Add+Product&action=add-product"
            >Add New Product</a
          >
        </header>

        <table>
          <thead>
            <tr style="background-color: #dc3545">
              <th>ID</th>
              <th>Name</th>
              <th>Category</th>
              <th>Price</th>
              <th>Image</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <% if (!products.isEmpty()) { for (Product p : products) { %>
            <tr>
              <td><%=p.getId() %></td>
              <td><%=p.getName() %></td>
              <td><%=p.getCategory() %></td>
              <td><%=p.getPrice() %></td>
              <td><%=p.getImage() %></td>
              <td>
                <a
                  class="update-btn"
                  href="/updateProduct?title=Edit+Product&action=updateProduct&productID=<%=p.getId()%>"
                  >Update</a
                >
                <a
                  class="delete-btn"
                  href="/deleteProduct?productID=<%=p.getId()%>"
                  >Delete</a
                >
              </td>
            </tr>
            <% } } %>
          </tbody>
        </table>
      </div>
      <%@include file="/includes/footer.jsp"%>
    </body>
  </html>
</Product>

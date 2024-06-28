<%@page import="java.util.*"%>
<%@page import="Model.*"%>
<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
     ProductDao pd = new ProductDao();
    List<Product> products = pd.getAllProducts();
  request.getSession().setAttribute("products",products); %>
  <!DOCTYPE html>
  <html>
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
              <td><%=p.getProductID()%></td>
              <td><%=p.getProductName() %></td>
              <td><%=p.getCategoryID() %></td>
              <td><%=p.getPrice() %></td>
              <td><%=p.getImage() %></td>
              <td>
                <a
                  class="update-btn"
                  href="/updateProduct?title=Edit+Product&action=updateProduct&productID=<%=p.getProductID()%>"
                  >Update</a
                >
                <a
                  class="delete-btn"
                  href="/deleteProduct?productID=<%=p.getProductID()%>"
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

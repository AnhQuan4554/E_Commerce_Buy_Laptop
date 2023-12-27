<%-- 
    Document   : admin
    Created on : Dec 12, 2023, 12:32:45 PM
    Author     : welcome
--%>
<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao();
    List<Product> products = pd.getAllProducts();
 request.getSession().setAttribute("products", products);
%>
<!DOCTYPE html>
<html>
    <head>
       <%@include file="/includes/head.jsp"%>
        <title>JSP Page</title>
    </head>
 <body>
<%@include file="/includes/navbar.jsp"%>

	<div class="container">
              <div class="card-header my-3 d-flex justify-content-between">
                  <p>
                      Management Page
                  </p>
                  <a class="btn btn-outline-primary" href="/add-product?title=Add+Product&action=add-product">Add New Product</a>
              </div>
   
                    <table class="table table-light">
			<thead>
                            <tr>	
                                <th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
                                <th scope="col">Image</th>
                                <th scope="col"></th>

                            </tr>
			</thead>
			<tbody>
                            <%
                            if (!products.isEmpty()) {
                                for (Product p : products) {
                            %>
                                <tr>
                                    <td><%=p.getId() %></td>
                                    <td><%=p.getName() %></td>
                                    <td><%=p.getCategory() %></td>
                                    <td><%=p.getPrice() %></td>
                                    <td><%=p.getImage() %></td>
                                    <td>
                                         <% 
                                           out.print("<a class='btn btn-outline-primary' href='updateProduct?title=Edit+Product&action=updateProduct&productID="+p.getId()+"'>Update</a>");
                                        %>
                                     
                                        <% 
                                           out.print("<a class='btn btn-outline-danger' href='deleteProduct?productID="+p.getId()+"'>Delete</a>");
                                        %>
                                       
                                    </td>
                                </tr>
                            <%}
                            }
                            %>
			</tbody>
                    </table>
                </div>		

	<%@include file="/includes/footer.jsp"%>
</body>
</html>

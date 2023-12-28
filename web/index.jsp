<%@page import="DAO.DbCon"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
//     System.out.println("authauth++++"+auth.getEmail());
    request.setAttribute("person", auth);
}else{
//     System.out.println("authauth++++"+auth.getEmail());
    }

 String sortType = request.getParameter("sort");
  String category = request.getParameter("category");
  
if(sortType==null&&category==null){

ProductDao pd = new ProductDao();
    List<Product> products = pd.getAllProducts();
 request.getSession().setAttribute("products", products);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>
        <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <%@include file="/includes/sorting_product.jsp"%>

        <div class="container">
            <div class="card-header my-3">All Products</div>
            <div class="row">
                <c:if test="${not empty products}">
                    <c:forEach var="p" items="${products}">
                        <div class="col-md-3 my-3">
                            <a href="/products?id=${p.id}">
                                <div class="card w-100">
                                    <img class="card-img-top" src="product-image/${p.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">${p.name}</h5>
                                        <h6 class="price">Price: $${p.price}</h6>
                                        <h6 class="category">Category: ${p.category}</h6>
                                        <div class="mt-3 d-flex justify-content-between">
                                            <a class="btn btn-dark" 
                                               href="/add-to-cart?id=${p.id}&name=${p.name}&price=${p.price}&category=${p.category}&image=${p.image}">Add to Cart</a>
                                            <a class="btn btn-primary" href="order-now?quantity=1&id=${p.id}">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty products}">
                    There is no products
                </c:if>
            </div>

        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
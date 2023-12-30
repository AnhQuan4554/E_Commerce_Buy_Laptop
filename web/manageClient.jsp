<%-- 
    Document   : manageClient
    Created on : Dec 29, 2023, 6:58:53 PM
    Author     : ASUS
--%>

<%@page import="DAO.DbCon"%>
<%@page import="DAO.UserDao"%>
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
UserDao ud = new UserDao();
    List<User> clients = ud.getAllClients();
 request.getSession().setAttribute("clients", clients);
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
                <p>Danh sách khách hàng</p>
            </div>
            <table class="table table-light">
                <thead>
                    <tr>	
                        <th scope="col">STT</th>
                        <th scope="col">Name</th>
                        <th scope="col">Birthday</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Email</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                    if (!clients.isEmpty()) {
                        int stt = 1;
                        for (User c : clients) {
                    %>
                        <tr>
                            <td><%= stt++ %></td>
                            <td><%=c.getName() %></td>
                            <td><%=c.getBirthday() %></td>
                            <td><%=c.getAddress() %></td>
                            <td><%=c.getPhone() %></td>
                            <td><%=c.getEmail() %></td>
                            <td>

                                <% 
                                   out.print("<a class='btn btn-outline-danger' href='/deleteClient?clientId="+c.getId()+"'>Delete</a>");
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
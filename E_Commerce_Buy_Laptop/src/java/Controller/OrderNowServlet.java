package Controller;

import DAO.CartDao;
import DAO.DbCon;
import DAO.OrderDao;
import DAO.ProductDao;
import Model.Cart;
import Model.Order;
import Model.Order_Detail;
import Model.User;
import Model.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
           

            User auth = (User) request.getSession().getAttribute("auth");

            if (auth != null) {
                String productId = request.getParameter("productID");
                int cartID = Integer.parseInt(request.getParameter("cartID")) ;
                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                if (productQuantity <= 0) {
                    productQuantity = 1;
                }
                // get all infor product name
                ProductDao productDao = new ProductDao();
                Product productDetail = productDao.findProduct(productId);
                System.out.println("productQuantity+++"+productQuantity);
                request.setAttribute("order_Quantity", productQuantity);
                request.setAttribute("productDetail", productDetail);
                 request.setAttribute("cartID", cartID);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/order_Confirm_Infor.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("login_require.jsp");
            }

        }
        // TODO Auto-generated catch block
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean result =false;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        OrderDao orderDao = new OrderDao();
    
        // get infor from form and create detail
        int productID = Integer.parseInt(request.getParameter("productID")) ;
         int cartID = Integer.parseInt(request.getParameter("cartID")) ;
        double priceEach = Double.parseDouble(request.getParameter("priceEach")) ;
        System.out.println("priceEach++++"+priceEach);
        int productQuantity = Integer.parseInt(request.getParameter("quantity"));
        if (productQuantity <= 0) {
            productQuantity = 1;
        }
        
        double subTotal = priceEach * productQuantity;
        User auth = (User) request.getSession().getAttribute("auth");
        Order_Detail order_Detail = new Order_Detail();
      
        order_Detail.setProductID(productID);
        order_Detail.setQuantity(productQuantity);
        order_Detail.setPriceEach(priceEach);
        order_Detail.setSubTotal(subTotal);
        Order_Detail newOrderDetail = orderDao.createOrderDetail(order_Detail);
        if(newOrderDetail != null){
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        String currentDate = formatter.format(currentTime);
         Order order  = new Order(newOrderDetail.getOrderID(), auth.getUserID(), currentDate, "note ok", "created success order");
            System.out.println("order sap duoc tao++"+order);
         orderDao.createOrder(order);
        }
      
       CartDao cartDao = new CartDao();
       cartDao.deleteCartById(cartID);
      result = true;
        // delete laptop when order
 
        if (result) {
            response.sendRedirect("/notify/addSuccess.jsp");
        }
        // response.sendRedirect("order_Confirm_Infor.jsp");
    }

}

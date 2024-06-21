package Controller;

import DAO.CartDao;
import DAO.DbCon;
import DAO.OrderDao;
import DAO.ProductDao;
import Model.Cart;
import Model.Order;
import Model.User;
import Model.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
            Date date = new Date();

            User auth = (User) request.getSession().getAttribute("auth");

            if (auth != null) {
                String productId = request.getParameter("id");
                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                if (productQuantity <= 0) {
                    productQuantity = 1;
                }
                // get all infor product name
                ProductDao productDao = new ProductDao();
                Product productDetail = productDao.findProduct(productId);
                request.setAttribute("productDetail", productDetail);

                // Order orderModel = new Order();
                // orderModel.setId(Integer.parseInt(productId));
                // orderModel.setUid(auth.getId());
                // orderModel.setQuantity(productQuantity);
                // orderModel.setDate(formatter.format(date));
                // System.out.println("orderModel+++++"+orderModel);
                // OrderDao orderDao = new OrderDao();
                // boolean result = orderDao.insertOrder(orderModel);
                // if(result){
                // response.sendRedirect("order_Confirm_Infor.jsp");
                // }
                // response.sendRedirect("order_Confirm_Infor.jsp");
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
        System.out.println("xxxx chay vao dassssy");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();

        // get infor from form
        String productID = request.getParameter("productID");
        String recipientName = request.getParameter("recipientName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        int productQuantity = Integer.parseInt(request.getParameter("quantity"));
        if (productQuantity <= 0) {
            productQuantity = 1;
        }

        User auth = (User) request.getSession().getAttribute("auth");
        Order orderModel = new Order();
        orderModel.setId(Integer.parseInt(productID));
        orderModel.setUid(auth.getId());
        orderModel.setQuantity(productQuantity);
        orderModel.setDate(formatter.format(date));
        orderModel.setRecipientName(recipientName);
        orderModel.setPhoneNumber(phoneNumber);
        orderModel.setAddress(address);
        System.out.println("orderModel+++++" + orderModel);
        OrderDao orderDao = new OrderDao();
        boolean result = orderDao.insertOrder(orderModel);
        // delete laptop when order
        ProductDao productDao = new ProductDao();
        Product product = productDao.findProduct(productID);
        CartDao cartDao = new CartDao();
        int cartId = cartDao.findCartByNameAndCategory(product.getName(), product.getCategory());

        System.out.println("when order will delete id +" + (String.valueOf(cartId)));
        cartDao.deleteCartById(String.valueOf(cartId));
        if (result) {
            response.sendRedirect("/notify/addSuccess.jsp");
        }
        // response.sendRedirect("order_Confirm_Infor.jsp");
    }

}

package Controller;

import DAO.CartDao;
import Model.Cart;
import Model.Cart_Item;
import Model.Shopping_Cart;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User auth = (User) request.getSession().getAttribute("auth");
        if (auth == null) {

            response.sendRedirect("login_require.jsp");
            return;
        }
        try (PrintWriter out = response.getWriter()) {

            int p_id = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name");

            String category = request.getParameter("category");

            Double price = Double.parseDouble(request.getParameter("price"));

            String image = request.getParameter("image");
            if (auth.getEmail() == "" || auth.getEmail() == null) {
                response.sendRedirect("/login_require.jsp");
            } else { 
                CartDao cartDao = new CartDao();
                Cart_Item cart_Item  =new Cart_Item(p_id, name, 1, price);
                 Cart_Item newCart_Item =  cartDao.createCartItem(cart_Item);
               
                  Shopping_Cart shopping_Cart = new Shopping_Cart(newCart_Item.getCartID(), auth.getUserID());
                
                  Shopping_Cart newShoppingCart = cartDao.createShoppingCart(shopping_Cart);
             
                if (newCart_Item != null  && newShoppingCart != null) {
                    response.sendRedirect("/notify/addCartSuccess.jsp");
                }
            }

         
        }
    }

}

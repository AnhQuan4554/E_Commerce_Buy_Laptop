package Controller;

import DAO.CartDao;
import Model.Cart;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String prodcutID = request.getParameter("id");
            if (prodcutID != null) {
                CartDao cartDAO = new CartDao();
                cartDAO.removeFromCart(Integer.parseInt(prodcutID));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/notify/deleteCartSuccess.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                    // Xử lý nếu có lỗi khi chuyển hướng trang
                }
            }

        }
    }

}

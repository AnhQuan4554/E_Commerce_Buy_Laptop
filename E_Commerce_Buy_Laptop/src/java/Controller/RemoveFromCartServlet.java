package Controller;

import Model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import DAO.CartDao;
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

		try (PrintWriter out = response.getWriter()) {
			int bookId =Integer.parseInt(request.getParameter("id")) ;

			if (request.getParameter("id") != null && request.getParameter("id") != "") {
				CartDao cartDao = new CartDao();
				boolean isDeleted = cartDao.deleteCartById(bookId);
				System.out.println("delete card success" + bookId);
				response.sendRedirect("/notify/deleteCartSuccess.jsp");

			} else {
				response.sendRedirect("/notify/deleteCartSuccess.jsp");
			}

		}
	}

}

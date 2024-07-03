package Controller;

import DAO.ProductDao;
import DAO.UserDao;
import Model.Product;
import Model.User;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            UserDao udao = new UserDao();
            User user = udao.userLogin(email, password);
            if (user != null) {
                System.out.println("auth login is : "+ user);
                request.getSession().setAttribute("auth", user);
                    ProductDao pd = new ProductDao();
                List<Product> products = pd.getAllProducts();
                System.out.println("prodcut when go to index.jsp"+products);
                 request.getSession().setAttribute("products", products);
                response.sendRedirect("index.jsp");
            } else {
                // Set an error message attribute
                request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                // Forward the request to a login page or display error directly
             
               
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle exceptions appropriately
            System.out.println("ERR WHEN LOGIN: " + e);
        }
    }
}

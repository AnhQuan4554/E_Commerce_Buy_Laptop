/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin_Controller;

import DAO.ProductDao;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Path;

@MultipartConfig
/**
 *
 * @author welcome
 */
@WebServlet("/add-product")
public class AddProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("title", request.getParameter("title"));
        request.setAttribute("action", request.getParameter("action"));
        request.getRequestDispatcher("admin/admin_handle_product.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int productID = Integer.parseInt(request.getParameter("idProduct")) ;
            String productName = (String) request.getParameter("nameProduct");
            Double price = Double.parseDouble(request.getParameter("priceProduct"));
            int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));
            String description = (String) request.getParameter("description");
            String category = request.getParameter("category");
            int manufacturerID = Integer.parseInt(request.getParameter("manufacturerID"));
            int voucherCode = Integer.parseInt(request.getParameter("voucherCode"));
            Part part = request.getPart("imageProduct");
            String realPath = request.getServletContext().getRealPath("/product-image");
            String image = Path.of(part.getSubmittedFileName()).getFileName().toString();

            part.write(realPath + "/" + image);
            ProductDao pd = new ProductDao();
            Product product = new Product(productID,productName,price,quantityInStock,description,image,1,1,1);
            if (pd.addProduct(product)) {
                System.out.println("Add successfully!");
                response.sendRedirect("admin/admin.jsp");
            } else {
                System.out.println("Add unsucessfully!");
            }

        } catch (Error ex) {
            System.out.println("Erro when add new product" + ex.getMessage());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
